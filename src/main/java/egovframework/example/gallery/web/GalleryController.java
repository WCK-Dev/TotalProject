package egovframework.example.gallery.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.imgscalr.Scalr;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.UserVO;
import egovframework.example.gallery.service.FilesVO;
import egovframework.example.gallery.service.GalleryService;
import egovframework.example.gallery.service.GalleryVO;
import egovframework.example.gallery.service.TagVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class GalleryController {
	
	@Resource(name = "galleryService")
	private GalleryService galleryService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** FileUpload Path */
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="galleryMain.do")
	public String galleryMain(ModelMap model, GalleryVO gvo) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(gvo.getPageIndex());
		paginationInfo.setRecordCountPerPage(gvo.getPageUnit());
		paginationInfo.setPageSize(gvo.getPageSize());

		gvo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		gvo.setLastIndex(paginationInfo.getLastRecordIndex());
		gvo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("galleryList", galleryService.selectGalleryList(gvo));
		model.addAttribute("tagRank", galleryService.selectTagRank());
		model.addAttribute("gallery", gvo);

		int totCnt = galleryService.selectGalleryListTotCnt(gvo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "gallery/galleryMain";
	}
	
	@RequestMapping(value="writeGallery.do", method=RequestMethod.GET)
	public String writeGallery(ModelMap model) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		return "gallery/writeGallery";
	}
	
	@RequestMapping(value="writeGallery.do", method=RequestMethod.POST)
	public String writeGallery(MultipartHttpServletRequest mtfRequest, GalleryVO gvo) throws IllegalArgumentException, IOException {
		
		//갤러리 글 등록
		int g_seq = galleryService.selectMaxGseq();
		gvo.setG_seq(g_seq);
		galleryService.insertGallery(gvo);
		
		//파일 등록 & 태그 등록
		Date today = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dirPath = uploadPath + "/" + sdf.format(today);
		
        File dir = new File(dirPath);
        
        //파일 원본 이미지와 섬네일이 업로드될 디렉토리를 생성
        if (!dir.isDirectory()) dir.mkdirs();

        //선택된 파일의 숫자를 List로 받아 반복하면서, 업로드 진행
		List<MultipartFile> fileList = mtfRequest.getFiles("files");
		
		if(!(fileList.size() == 1 && fileList.get(0).getOriginalFilename().equals(""))) { // 파일이 존재하지않는지 검사 (있으면 if안에서 업로드를 수행)
			
			for (int i=0; i<fileList.size(); i++) {
				
				String originalFileName = fileList.get(i).getOriginalFilename();
				
				String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				
				String serverFileName = UUID.randomUUID().toString() + "." + extension;
				
				long fileSize = fileList.get(i).getSize();
				
				File images = new File(dir, serverFileName);
				
				fileList.get(i).transferTo(images);
				
				//섬네일 생성 및 저장
				String f_thumbname = makeThumbnail(images.getAbsolutePath(), serverFileName, extension, dirPath);
				
				FilesVO eachFile = new FilesVO();
				
				eachFile.setF_thumbname(f_thumbname);
				eachFile.setF_originname(originalFileName);
				eachFile.setF_uploadname(serverFileName);
				eachFile.setF_fsize(fileSize);
				eachFile.setG_seq(g_seq);
				
				galleryService.insertFile(eachFile);
			}
		}
		
		//태그내용 DB에 추가
		String[] tags = gvo.getG_tag().split(",");
		
		TagVO tag = new TagVO();
		tag.setG_seq(g_seq);
		
		for(String eachTag : tags) {
			tag.setT_name(eachTag);
			
			galleryService.insertTag(tag);
		}

		return "redirect:/galleryMain.do";
	}
	
	@RequestMapping(value="readGallery.do")
	public String readGallery(GalleryVO gvo, ModelMap model, RedirectAttributes ra) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		gvo = galleryService.selectGallery(gvo);
		
		if(gvo == null) {
			ra.addFlashAttribute("galleryErrorMsg", "true");
			return "redirect:/galleryMain.do";
		} else {
			model.addAttribute("gallery", gvo);
			model.addAttribute("fileList", galleryService.selectFileList(gvo));
			
			return "gallery/readGallery";
		}
	}
	
	@RequestMapping(value="updateGallery.do", method=RequestMethod.GET)
	public String updateGallery(GalleryVO gvo, ModelMap model, RedirectAttributes ra, HttpSession session) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		gvo = galleryService.selectGallery(gvo);
		
		if(gvo == null) {
			ra.addFlashAttribute("galleryErrorMsg", "true");
			return "redirect:/galleryMain.do";
		} else {
			
			if(!((UserVO)session.getAttribute("user")).getUser_id().equals(gvo.getG_writer())) {
				ra.addFlashAttribute("updateErrorMsg", "true");
				return "redirect:/galleryMain.do";
			} else {
				model.addAttribute("gallery", gvo);
				model.addAttribute("fileList", galleryService.selectFileList(gvo));
				return "gallery/updateGallery";
			}
		}
		
	}
	
	@RequestMapping(value="updateGallery.do", method=RequestMethod.POST)
	public String updateGallery(MultipartHttpServletRequest mtfRequest, GalleryVO gvo, String delFileList, String datePath, ModelMap model) throws IllegalArgumentException, IOException {
		
		//수정전 원글 정보 저장
		GalleryVO beforeGvo = galleryService.selectGallery(gvo);
		//갤러리 글 수정
		galleryService.updateGallery(gvo);
		
		
		//태그수정
		String beforeTags = beforeGvo.getG_tag();
		String newTags = gvo.getG_tag();
		
		TagVO tvo = new TagVO();
		tvo.setG_seq(gvo.getG_seq());
		
		for(String tag : newTags.split(",")) {
			//새로운 태그를 split하여 기존 태그에 존재하지않으면 새로운 태그로 추가
			if(!beforeTags.contains(tag)) {
				tvo.setT_name(tag);
				galleryService.insertTag(tvo);
			}	
		}
		
		for(String oldTag : beforeTags.split(",")) {
			//기존 태그를 split하여 새로운 태그에 존재하지 않으면, 해당 태그 DB데이터를 삭제
			if(!newTags.contains(oldTag)) {
				tvo.setT_name(oldTag);
				galleryService.deleteTag(tvo);
			}
		}
		
		//파일 DB수정
		//사용자가 제거한 첨부파일 DB에서 삭제
		String[] delFiles = delFileList.split(",");
		
		FilesVO fvo = new FilesVO();
		String deleteFileName = null;
		String deleteThumbName = null;
		
		for(String delFileSeq :delFiles) {
			if(delFileSeq.equals("") || delFileSeq == null) break;
			
			int f_seq = Integer.parseInt(delFileSeq);
			fvo.setF_seq(f_seq);
			
			//해당 파일을 서버에서 삭제하기위해, 서버내의 물리명으로 파일 객체 생성
			fvo = galleryService.selectFile(fvo);
			deleteFileName = fvo.getF_uploadname();
			deleteThumbName = fvo.getF_thumbname();
			File deleteFile = new File(uploadPath + datePath + "/" + deleteFileName);
			File thumbFile = new File(uploadPath + datePath + "/" + deleteThumbName);
			
			//서버에 존재하는 파일을 삭제
			if(deleteFile.exists()) { 
				deleteFile.delete();
			}
			if(thumbFile.exists()) { 
				thumbFile.delete();
			}
		
			//DB에서 해당 파일의 정보를 삭제
			galleryService.deleteFile(fvo);
		}
		
		//사용자가 새롭게 추가한 첨부파일 DB에 추가( + 파일업로드)
		String dirPath = uploadPath + "/" + datePath;
		File dir = new File(dirPath);

        //선택된 파일의 숫자를 List로 받아 반복하면서, 업로드 진행
		List<MultipartFile> fileList = mtfRequest.getFiles("files");
		
		if(!(fileList.size() == 1 && fileList.get(0).getOriginalFilename().equals(""))) {
			
			for (int i=0; i<fileList.size(); i++) {
				
				String originalFileName = fileList.get(i).getOriginalFilename();
				
				String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				
				String serverFileName = UUID.randomUUID().toString() + "." + extension;
				
				long fileSize = fileList.get(i).getSize();
				
				File images = new File(dir, serverFileName);
				
				fileList.get(i).transferTo(images);
				
				String f_thumbname = makeThumbnail(images.getAbsolutePath(), serverFileName, extension, dirPath);
				
				FilesVO eachFile = new FilesVO();
				
				eachFile.setF_thumbname(f_thumbname);
				eachFile.setF_originname(originalFileName);
				eachFile.setF_uploadname(serverFileName);
				eachFile.setF_fsize(fileSize);
				eachFile.setG_seq(gvo.getG_seq());
				
				galleryService.insertFile(eachFile);
			}
		}

		return "redirect:/readGallery.do?g_seq=" + gvo.getG_seq();
	}
	
	
	@RequestMapping(value="downloadFile.do", method=RequestMethod.GET)
	public void fileDownload (FilesVO fvo, String datePath, HttpServletRequest request, HttpServletResponse response) {
		//다운로드 요청된 파일의 정보를 DB로부터 획득
		fvo = galleryService.selectFile(fvo);
		
		String fileOriginName = fvo.getF_originname();
		String fileFullPath = uploadPath + datePath + "/" + fvo.getF_uploadname();
		String userBrowser = request.getHeader("User-Agent");
		String downName = null;
		
		File downloadFile = new File(fileFullPath);
		
		FileInputStream fileInputStream = null;
        ServletOutputStream servletOutputStream = null;
        
        try {
        	//다운로드 시 원본 파일명을 그대로 유지할 수 있게 원본 파일명을 인코딩하여 브라우저에 맞게 세팅함
           if(userBrowser.contains("MSIE") || userBrowser.contains("Trident") || userBrowser.contains("Chrome")){
        	   downName = URLEncoder.encode(fileOriginName,"UTF-8").replaceAll("\\+", "%20");
           }else {
               downName = new String(fileOriginName.getBytes("UTF-8"), "ISO-8859-1");
           }

           response.setHeader("Content-Disposition","attachment;filename=\"" + downName +"\"");
           response.setContentType("application/octer-stream");
           response.setHeader("Content-Transfer-Encoding", "binary;");

           fileInputStream = new FileInputStream(downloadFile);

           servletOutputStream = response.getOutputStream();

           byte b [] = new byte[1024];
           int data = 0;

           // 바이트를 더이상 읽을 수 없으면 -1 return
           while((data=(fileInputStream.read(b, 0, b.length))) != -1) {
                servletOutputStream.write(b, 0, data);
           }

           servletOutputStream.flush(); // 출력
           galleryService.updateFileDownCnt(fvo); // 다운로드 횟수 증가

       } catch (UnsupportedEncodingException e) {
           e.printStackTrace();
       } catch (IOException e) {
           e.printStackTrace();
       } finally {

		   if(servletOutputStream != null){
			   try{
				   servletOutputStream.close();
	           }catch (IOException e){
	               e.printStackTrace();
               }
	       }
		   if(fileInputStream != null){
		       try{
		           fileInputStream.close();
	           }catch (IOException e){
	               e.printStackTrace();
               }
	       }
	   }
		
	}
	
	@RequestMapping(value="deleteGallery.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteGallery(GalleryVO gvo, String regPath, HttpSession session) {
		
		String user_id = ((UserVO)session.getAttribute("user")).getUser_id();
		gvo.setG_writer(user_id);
		
		//삭제해야할 파일 리스트 확인
		List<FilesVO> delFiles = galleryService.selectFileList(gvo);
		String deleteFileName = null;
		String deleteThumbName = null;
		
		for(FilesVO delfvo : delFiles) {
			
			//각각의 삭제할 파일의 저장경로 내 물리파일명을 획득
			deleteFileName = delfvo.getF_uploadname();
			deleteThumbName = delfvo.getF_thumbname();
			//파일 객체 생성후, 삭제
			File deleteFile = new File(uploadPath + regPath + "/" + deleteFileName);
			File thumbFile = new File(uploadPath + regPath + "/" + deleteThumbName);
			
			if(deleteFile.exists()) { 
				deleteFile.delete();
			}
			
			if(thumbFile.exists()) { 
				thumbFile.delete();
			}
			
			//파일 삭제후, DB에서도 해당 파일 정보를 삭제
			galleryService.deleteFile(delfvo);
		}
		
		return galleryService.deleteGallery(gvo) + "";
		
	}
	
	@RequestMapping(value="tagStatusMenu.do")
	public String tagStatusMenu (ModelMap model) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		return "gallery/tagStatusMenu";
	}
	
	@RequestMapping(value="getTagStatus.do")
	@ResponseBody
	public List<TagVO> getTagStatus() {
		List<TagVO> tagRank = galleryService.selectTagRank();
		
		for(TagVO eachTag : tagRank) {
			eachTag.setT_downcnt(galleryService.selectTagDownCnt(eachTag));
		}
		
		return tagRank;
	}
	
	@RequestMapping(value="downExcelFile.do")
	public void downExcelFile(HttpServletResponse response) throws Exception {

	    List<TagVO> tagRank = galleryService.selectTagRank();
		
		for(TagVO eachTag : tagRank) {
			eachTag.setT_downcnt(galleryService.selectTagDownCnt(eachTag));
		}
		
	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("게시판");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;

	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선을 가집니다.
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 데이터는 가운데 정렬합니다.
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("태그명");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("사용수");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("조회수");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("다운수");

	    // 데이터 부분 생성
	    for(TagVO vo : tagRank) {
	        row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getT_name());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getT_usecnt());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getT_readcnt());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getT_downcnt());
	    }

	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=tagRank.xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();

	}
	
	//썸네일 생성 메서드
	private String makeThumbnail(String filePath, String serverFileName, String extension, String dirPath) throws IOException {
		BufferedImage srcImg = ImageIO.read(new File(filePath)); 
		
		int dw = 250, dh = 150; 
		
		int ow = srcImg.getWidth(); 
		int oh = srcImg.getHeight(); 
		
		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다. 
		int nw = ow; 
		int nh = (ow * dh) / dw; 
		
		// 계산된 높이가 원본보다 높다면 crop이 안되므로 
		// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다. 
		if(nh > oh) {
			nw = (oh * dw) / dh; 
			nh = oh; 
		} 
		
		BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh); 
		BufferedImage destImg = Scalr.resize(cropImg, dw, dh); 
		
		String thumbName = dirPath + "/THUMB_" + serverFileName; 
		
		File thumbFile = new File(thumbName);
		
		ImageIO.write(destImg, extension, thumbFile);
		
		return "THUMB_" + serverFileName;
		
	}
	
}
