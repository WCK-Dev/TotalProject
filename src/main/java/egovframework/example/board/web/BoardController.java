package egovframework.example.board.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.CommentVO;
import egovframework.example.board.service.HistoryVO;
import egovframework.example.board.service.UserVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {
	
	/** EgovSampleService */
	@Resource(name = "boardService")
	private BoardService boardService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value="boardMain.do")
	public String boardMain(BoardVO boardVO, ModelMap model) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		return "board/boardMain";
	}
	
	@RequestMapping(value="boardList.do")
	public String boardList(@ModelAttribute("board")BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		UserVO user = (UserVO)request.getSession().getAttribute("user");
		boardVO.setLoginId(user.getUser_id());
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		/** boardKinds setting (선택된 게시판정보를 VO에 추가) */
		BoardVO bk = new BoardVO();
		bk.setBk_bseq(boardVO.getB_bseq());
		bk = boardService.selectBoardKinds(bk);
		boardVO.setBk_type(bk.getBk_type());
		boardVO.setBk_order(bk.getBk_order());
		boardVO.setBk_bname(bk.getBk_bname());
		boardVO.setBk_breply_YN(bk.getBk_breply_YN());
		boardVO.setBk_bcomment_YN(bk.getBk_bcomment_YN());
		boardVO.setBk_bsecret_YN(bk.getBk_bsecret_YN());
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> boardList = boardService.selectBoardList(boardVO);
		model.addAttribute("boardList", boardList);
		model.addAttribute("board", boardVO);
		
		List<?> noticeList = boardService.selectNoticeList(boardVO);
		model.addAttribute("noticeList", noticeList);

		int totCnt = boardService.selectBoardListTotCnt(boardVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		int alarmtotCnt = boardService.selectAlarmListTotCnt(boardVO);
		model.addAttribute("alarmtotCnt" , alarmtotCnt);

		return "board/boardList";
	}
	
	@RequestMapping(value="alarmList.do")
	public String alarmList(BoardVO boardVO, ModelMap model) throws Exception{
		
		BoardVO bk = new BoardVO();
		bk.setBk_bseq(boardVO.getB_bseq());
		bk = boardService.selectBoardKinds(bk);
		boardVO.setBk_type(bk.getBk_type());
		boardVO.setBk_order(bk.getBk_order());
		boardVO.setBk_bname(bk.getBk_bname());
		boardVO.setBk_breply_YN(bk.getBk_breply_YN());
		boardVO.setBk_bcomment_YN(bk.getBk_bcomment_YN());
		boardVO.setBk_bsecret_YN(bk.getBk_bsecret_YN());
		
		List<?> boardList = boardService.selectAlarmList(boardVO);
		model.addAttribute("boardList", boardList);
		
		int alarmtotCnt = boardService.selectAlarmListTotCnt(boardVO);
		model.addAttribute("alarmtotCnt" , alarmtotCnt);
		
		
		return "board/alarmList";
	}
	
	@RequestMapping(value="writeBoard.do" , method = RequestMethod.GET)
	public String writeBoard(BoardVO boardVO, Model model) throws Exception {
		
		BoardVO bk = new BoardVO();
		bk.setBk_bseq(boardVO.getB_bseq());
		bk = boardService.selectBoardKinds(bk);
		boardVO.setBk_type(bk.getBk_type());
		boardVO.setBk_order(bk.getBk_order());
		boardVO.setBk_bname(bk.getBk_bname());
		boardVO.setBk_breply_YN(bk.getBk_breply_YN());
		boardVO.setBk_bcomment_YN(bk.getBk_bcomment_YN());
		boardVO.setBk_bsecret_YN(bk.getBk_bsecret_YN());
		model.addAttribute("board", boardVO);
		
		return "board/writeBoard";
	}
	
	@RequestMapping(value="writeNotice.do" , method = RequestMethod.GET)
	public String writeNotice(BoardVO boardVO, Model model) throws Exception {
		
		
		model.addAttribute("board", boardVO);
		
		return "board/writeNotice";
	}

	@ResponseBody
	@RequestMapping(value="writeBoard.do" , method = RequestMethod.POST)
	public void writeBoard(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		
		int b_no = boardService.selectMaxBno() + 1;
		boardVO.setB_no(b_no);
		boardVO.setB_origin(b_no);
		
		System.err.println(boardVO.getB_bseq());
		
		boardService.insertBoard(boardVO);
	}

	@RequestMapping(value="readBoard.do")
	public String readBoard(@ModelAttribute("board")BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		boardVO =  boardService.selectBoard(boardVO);
		
		/** 게시판 유형정보 저장  */ 
		BoardVO bk = new BoardVO();
		bk.setBk_bseq(boardVO.getB_bseq());
		bk = boardService.selectBoardKinds(bk);
		boardVO.setBk_type(bk.getBk_type());
		boardVO.setBk_order(bk.getBk_order());
		boardVO.setBk_bname(bk.getBk_bname());
		boardVO.setBk_breply_YN(bk.getBk_breply_YN());
		boardVO.setBk_bcomment_YN(bk.getBk_bcomment_YN());
		boardVO.setBk_bsecret_YN(bk.getBk_bsecret_YN());
		
		/** 유저의 게시글 읽은 내역 저장 */
		HistoryVO historyVO = new HistoryVO();
		String loginId = ((UserVO)request.getSession().getAttribute("user")).getUser_id();
		historyVO.setUser_id(loginId);
		historyVO.setB_no(boardVO.getB_no());
		
		if(boardService.checkHistory(historyVO) != 1) {
			boardService.insertHistory(historyVO);
		}
		
		boardService.updateReadCnt(boardVO);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("commentList", boardService.selectCommentList(boardVO));
		
		return "board/readBoard";
	}
	
	@RequestMapping(value="updateBoard.do", method = RequestMethod.GET)
	public String updateBoard(int b_no, ModelMap model, HttpServletRequest request) throws Exception {
		
		BoardVO boardVO = new BoardVO();
		boardVO.setB_no(b_no);
		
		model.addAttribute("boardVO", boardService.selectBoard(boardVO));
		
		return "board/updateBoard";
	}
	
	@RequestMapping(value="updateBoard.do", method = RequestMethod.POST)
	public String updateBoard(@ModelAttribute("board")BoardVO boardVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		boardVO.setB_writer((String)request.getSession().getAttribute("user_id"));

		boardService.updateBoard(boardVO);
		return "redirect:/readBoard.do?b_no=" + boardVO.getB_no();
	}

	@RequestMapping(value="deleteBoard.do")
	@ResponseBody
	public String deleteBoard(BoardVO boardVO) throws Exception{
		
		return boardService.deleteBoard(boardVO) + "";
	}
	
	@RequestMapping(value="writeReply.do", method =RequestMethod.GET)
	public String writeReply(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		model.addAttribute("boardVO", boardService.selectBoard(boardVO));
		
		return "board/writeReply";
	}
	
	@ResponseBody
	@RequestMapping(value="insertReply.do", method = RequestMethod.POST)
	public void insertReply(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		int b_no = boardService.selectMaxBno() + 1;
		boardVO.setB_no(b_no);
		
		boardService.insertReply(boardVO);
	}
	
	@RequestMapping(value="signUp.do", method = RequestMethod.GET)
	public String signUp() throws Exception{
		
		return "board/signUp";
	}
	
	@RequestMapping(value="signUp.do", method = RequestMethod.POST)
	public String signUp(UserVO userVO, RedirectAttributes ra) throws Exception{
		
		if(boardService.insertUser(userVO) == 1) {
			ra.addFlashAttribute("joinSuccessMsg", "회원가입이 완료되었습니다.");
		} else {
			ra.addFlashAttribute("joinErrorMsg", "회원가입에 오류가 발생했습니다.");
		};
		
		return "redirect:/login.do";
	}
	
	@RequestMapping(value="idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam String user_id) throws Exception {
		return boardService.userIdCheck(user_id);
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request) throws Exception {
		
		return "board/login";
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String login(UserVO user, String isPopUp, RedirectAttributes ra, HttpServletRequest request) throws Exception {
		UserVO userVO = boardService.loginCheck(user);

		request.getSession().setAttribute("user", userVO);
		
		if( userVO != null ) {
			ra.addFlashAttribute("loginSuccess", "Y");
			return "redirect:/boardMain.do";
		} else {
			ra.addFlashAttribute("loginErrorMsg", "사용자 정보를 확인해주십시오.");
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpServletRequest request) throws Exception {
		
		request.getSession().removeAttribute("user");
		
		return "redirect:/login.do";
	}
	
	@RequestMapping(value="adminMain.do")
	public String adminMain() {
		
		return "board/adminMain";
	}

	@RequestMapping(value="managementUser.do")
	public String managementUser(UserVO userVO, ModelMap model)  throws Exception {
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
		paginationInfo.setPageSize(userVO.getPageSize());

		userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		userVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("userList", boardService.selectUserList(userVO));
		model.addAttribute("user", userVO);
		
		int totCnt = boardService.selectUserListTotCnt(userVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "board/managementUser";
	}
	
	@RequestMapping(value="updateUser.do", method=RequestMethod.GET)
	public String updateUser(UserVO userVO, ModelMap model)  throws Exception {
		
		model.addAttribute("userInfo", boardService.selectUser(userVO));
		
		return "board/updateUser";
	}
	
	@RequestMapping(value="updateUser.do", method=RequestMethod.POST)
	@ResponseBody
	public String updateUser(UserVO userVO) throws Exception {
		
		return boardService.updateUser(userVO) + "";
	}
	
	@RequestMapping(value="managementBoard.do")
	public String managementBoard(ModelMap model) throws Exception {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		return "board/managementBoard";
	}
	
	@RequestMapping(value="newBoardKinds.do")
	public String newBoardKinds() {
		
		return "board/newBoardKinds";
	}
	
	@RequestMapping(value="insertBoardKinds.do", method=RequestMethod.POST)
	@ResponseBody
	public String insertBoardKinds(BoardVO boardVO) throws Exception {
		
		boardVO.setBk_bseq(boardService.selectMaxBseq() + 1);
		boardVO.setBk_order(boardService.selectMaxBkOrder() + 1);
		
		return boardService.insertBoardKinds(boardVO) + "";
	}

	@RequestMapping(value="updateBoardKinds", method=RequestMethod.POST)
	@ResponseBody
	public String updateBoardKinds(BoardVO boardVO) throws Exception{
		
		return boardService.updateBoardKinds(boardVO) + "";
	}
	
	@RequestMapping(value="reOrderBoardKinds.do", method=RequestMethod.POST)
	@ResponseBody
	public String reOrderBoardKinds(BoardVO boardVO) throws Exception{
		
		return boardService.reOrderBoardKinds(boardVO) + "";
	}
	
	@RequestMapping(value="deleteBoardKinds", method=RequestMethod.POST)
	@ResponseBody
	public String deleteBoardKinds(BoardVO boardVO) throws Exception{
		
		return boardService.deleteBoardKinds(boardVO) + "";
	}
	
	
	@RequestMapping(value="managementBoardKinds.do")
	public String managementBoardKinds(BoardVO boardVO, ModelMap model) throws Exception {
		
		model.addAttribute("boardKinds", boardService.selectBoardKinds(boardVO));
		
		return "board/managementBoardKinds";
	}
	
	
	@RequestMapping(value="insertComment.do", method=RequestMethod.POST)
	@ResponseBody
	public String insertComment(CommentVO commentVO) throws Exception {
		
		commentVO.setC_no(boardService.selectMaxCno() + 1);
		
		return boardService.insertComment(commentVO) + "";
	}
	
	@RequestMapping(value="insertRecomment.do", method=RequestMethod.POST)
	@ResponseBody
	public String insertRecomment(CommentVO commentVO) throws Exception {
		
		commentVO.setC_no(boardService.selectMaxCno() + 1);
		
		return boardService.insertRecomment(commentVO) + "";
	}
	
	@RequestMapping(value="deleteComment.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteComment(CommentVO commentVO) throws Exception {
		
		return boardService.deleteComment(commentVO) + "";
	}
	
	@RequestMapping(value="boardPwdCheck.do")
	public String boardPwdCheck(BoardVO boardVO, ModelMap model) {
		
		model.addAttribute("board", boardVO);
		
		return "board/boardPwdCheck";
	}
}
