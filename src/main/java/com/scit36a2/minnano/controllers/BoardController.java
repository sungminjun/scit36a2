package com.scit36a2.minnano.controllers;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scit36a2.minnano.dao.BoardRepo;
import com.scit36a2.minnano.dao.MemberRepo;
import com.scit36a2.minnano.util.FileService;
import com.scit36a2.minnano.util.PageNavigator;
import com.scit36a2.minnano.vo.Board;
import com.scit36a2.minnano.vo.Board_comments;
import com.scit36a2.minnano.vo.Employee;

// 커뮤니티 기능
@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardRepo repo;
	@Autowired
	MemberRepo membrepo;

	// 파일이 저장될 경로
	final String uploadPath = "/boardfile";

	/**
	 * 글목록 보기 및 글목록 내에서 이동 시 paging 처리와 search 처리
	 * 
	 * @author cck, lyc
	 */
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String boardList(@RequestParam(value = "searchItem", defaultValue = "title") String searchItem,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {

		// DB 접속 코드
		int totalRecoundCount = repo.totalBoardCount(searchItem, searchWord); // search한것의 전체 게시글 수
		PageNavigator navi = new PageNavigator(currentPage, totalRecoundCount);
		Employee employee = new Employee();
		List<HashMap<String, Object>> boardList = repo.boardList(searchItem, searchWord, navi.getStartRecord(),
				navi.getCountPerPage());

		// String emp_id = (String)session.getAttribute("emp_id");
		// emp_seq를 repo보내서 member매퍼에서 select emp_id 또는 emp_name 또는 comp_seq로 comp_name을
		// 불러와서 넣어줄수도있죠...
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchItem", searchItem);
		// model.addAttribute("emp_id",emp_id);
		return "board/board";
	}

	// 화면이동: 글쓰기
	@RequestMapping(value = "/boardRegist", method = RequestMethod.GET)
	public String boardRegist() {
		return "board/boardRegist";
	}

	/**
	 * 게시글쓰기 처리
	 * 
	 * @author cck, lyc
	 */
	@RequestMapping(value = "boardRegist", method = RequestMethod.POST)
	@ResponseBody
	public int insertBoard(Board board, HttpSession session) {
		int emp_seq = (Integer) session.getAttribute("emp_seq");
		board.setEmp_seq(emp_seq);
		board.setBoard_orgname("");
		board.setBoard_savname("");
		int result = repo.insertBoard(board);
		return result;
	}

	/**
	 * 글 자세히 보기
	 * 
	 * @author cck, lyc
	 */
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public String boardDetail(@RequestParam(value = "searchItem", defaultValue = "title") String searchItem,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, int board_seq, Model model) {
		Board board = repo.boardDetail(board_seq);
		String id = repo.getEmpId(board_seq);
//		String mime = null;
//		if (board.getBoard_orgname() != null) {
//			String fullPath = uploadPath + "/" + board.getBoard_savname();
//
//			try {
//				mime = Files.probeContentType(Paths.get(fullPath));
//				if (mime.contains("image"))
//					model.addAttribute("mime", mime);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		int totalRecordCount = repo.totalBoardCount(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		// 검색을 한 후 글 자세히보기로 왔을 때를 처리하기 위해
		model.addAttribute("board", board);
		model.addAttribute("navi", navi);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("id", id);
		return "board/boardDetail";
	}

	/**
	 * 리플 호출
	 * 
	 * @author cck, lyc
	 */
	@RequestMapping(value = "selectComment", method = RequestMethod.POST)
	@ResponseBody
	public List<Board_comments> selectComment(Board_comments board_comments, int board_seq) {
		board_comments.setBoard_seq(board_seq);
		List<Board_comments> result = repo.selectComment(board_comments);
		return result;
	}

	/**
	 * 글 삭제
	 * 
	 * @author cck, lyc
	 */

	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(int board_seq, HttpSession session, Board board) {
		Board oldBoard = repo.selectOne(board_seq);
		int emp_seq = (Integer) session.getAttribute("emp_seq");
		board.setEmp_seq(emp_seq);
		String savedfile = oldBoard.getBoard_savname();
		// HDD에 저장된 파일 삭제
		if (savedfile != null) {
			String fullPath = uploadPath + "/" + savedfile;
			boolean result = FileService.deleteFile(fullPath);
		}
		// DB에 저장된 글 삭제
		repo.boardDelete(board);

		return "redirect:/board";
	}

	// 수정페이지 이동
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public String boardUpdate(int board_seq, HttpSession session, Model model) {
		Board board = repo.selectOne(board_seq);
		model.addAttribute("board", board);
		return "board/boardUpdate";
	}

	/**
	 * 게시글 수정처리
	 * 
	 * 여기 oldBoard 사용 안하고 있는데 확인해보시기 바랍니다.
	 * 
	 * @author cck, lyc
	 */
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(Board board, MultipartFile upload, HttpSession session) {
		// 파일이 수정된 파일(), 원래파일, 원래부터 파일이 없던 경우
		int emp_seq = (int) session.getAttribute("emp_seq");
		board.setEmp_seq(emp_seq);
		Board oldBoard = repo.selectOne(board.getBoard_seq());
		// System.out.println("수정 board : " + board);
		repo.boardUpdate(board);
		return "redirect:/board";
	}

	/**
	 * 리플달기
	 * 
	 * @author cck, lyc
	 */
	@RequestMapping(value = "inputComment", method = RequestMethod.POST)
	@ResponseBody
	public String inputComment(Board_comments board_comments, HttpSession session, String board_comments_writer,
			String board_comments_content) {
		// board_comments.setBoard_comments_writer(board_comments_writer);
		String emp_id = (String) session.getAttribute("emp_id");
		board_comments.setBoard_comments_content(board_comments_content);

		Employee writer = new Employee();
		writer.setEmp_id(emp_id);
		writer = membrepo.selectOne(writer);
		board_comments.setBoard_comments_writer(writer.getEmp_name());
		// System.out.println("board_comments : " + board_comments);
		int result = repo.inputComment(board_comments);

		return "success";
	}

	/**
	 * 리플삭제
	 * 
	 * 보완점: 본인 글에 대해서만 수정/삭제 등 권한 부여할것
	 * 
	 * @author cck, lyc
	 */
	@RequestMapping(value = "deleteComment", method = RequestMethod.POST)
	@ResponseBody
	public String deleteComment(Board_comments board_comments, HttpSession session, int board_comments_seq) {
		// String emp_id = (String)session.getAttribute("emp_id");
		// board_comments.setBoard_comments_writer(emp_id);
		board_comments.setBoard_comments_seq(board_comments_seq);

		System.out.println("컨트롤러 삭제 board_comments : " + board_comments);

		int result = repo.deleteComment(board_comments);
		return "success";
	}

	/**
	 * 리플수정
	 * 
	 * 보완점: 본인 글에 대해서만 수정/삭제 등 권한 부여할것
	 * 
	 * @author cck, lyc
	 */
	@RequestMapping(value = "updateComment", method = RequestMethod.POST)
	@ResponseBody
	public int updateComment(HttpSession session, Board_comments board_comments) {
		int result = repo.updateComment(board_comments);
		System.out.println("댓글 수정 result : " + result);
		return result;
	}

	
	
	/**
	 * 보고서 삽입기능-매출 3개월치
	 * 
	 * @author kyk
	 */
	@RequestMapping(value="insertReport",method=RequestMethod.POST)
	public @ResponseBody ArrayList<Object> insertReport(HashMap<String, Object> map){
		// 맵 안에 내용물이 emp_seq, board_regdate
		// map.put("comp_seq", repo.getCompseq(emp_seq)) 
		// map.put("specificdate", repo.getDate(board_regdate));
		
		ArrayList<Object>insertReport=repo.insertReport(map);
		System.out.println(insertReport);
		
		
		
		// param[=controller단에서 필요한 재료] board_seq [emp_seq랑, regdate]가 필요
		// emp_seq 를 이용해서 sql을 param이 emp_seq고 result가 comp_seq 를 받는 sql문을 딸 수있죠\
		// select comp_seq from emplyee where emp_seq=emp_seq
		// 마찬가지로 regdate가 string으로 연월일롷 된 자료를
		// map에다가 string으로 그냥 그대로 넣을거에요
		// sysdate대신에 to_date(regdate의string, 'yyyy-mm-dd') 로 대체해서
		// 작업을 하면 되지않을까..
		
		return insertReport;
	}
	
	

	/**
	 * 보고서 삽입기능 - 메뉴 3개월치
	 *
	 * @author kyk
	 */
	@RequestMapping(value = "insertMenuReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> totalMenuReport(Board board) {

		HashMap<String, Object> map = new HashMap<>();
		int board_seq=board.getBoard_seq();
		int emp_seq=board.getEmp_seq();
		int result=repo.selectCompseq(emp_seq);
		String board_regdate=board.getBoard_regdate();
		map.put("board_seq", board_seq);
		map.put("emp_seq",emp_seq);
		map.put("board_regdate",board_regdate);
		ArrayList<Object> insertMenuReport = repo.insertMenuReport(map);
//		System.out.println("total_Menu_Report" + total_Menu_Report.toString());
		return insertMenuReport;
	}

	/**
	 * 보고서 삽입기능-손님 3개월치
	 *
	 * @author kyk
	 */
	@RequestMapping(value = "insertGuestReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> totalGuestReport(Board board) {

		HashMap<String, Object> map = new HashMap<>();
		int board_seq=board.getBoard_seq();
		int emp_seq=board.getEmp_seq();
		String board_regdate=board.getBoard_regdate();
		map.put("board_seq", board_seq);
		map.put("emp_seq",emp_seq);
		map.put("board_regdate",board_regdate);
		ArrayList<Object> insertGuestReport = repo.insertGuestReport(map);
//		System.out.println("total_Guest_expence" + total_Guest_expence.toString());
		return insertGuestReport;
	}

	/**
	 * 보고서 삽입기능 - 수지 3개월치
	 *
	 * @author kyk
	 */
	@RequestMapping(value = "insertIncomeReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> totalIncome(Board board) {
		HashMap<String, Object> map = new HashMap<>();
		int board_seq=board.getBoard_seq();
		int emp_seq=board.getEmp_seq();
		String board_regdate=board.getBoard_regdate();
		map.put("board_seq", board_seq);
		map.put("emp_seq",emp_seq);
		map.put("board_regdate",board_regdate);
		

		ArrayList<HashMap<String, Object>> month_Payment = repo.selectMonthPayment(map); // 한달
		ArrayList<HashMap<String, Object>> month_Expense = repo.selectMonthExpense(map); // 한달
		System.out.println(month_Expense);
		System.out.println(month_Payment);
		ArrayList<Object> result = new ArrayList<Object>();

		for (int i = 0; i < month_Payment.size(); i++) {
			for (int j = 0; j < month_Expense.size(); j++) {
				if (i == j) {
					HashMap<String, Object> weekHashMap = month_Expense.get(j);
					HashMap<String, Object> dateHashMap = month_Payment.get(i);
					weekHashMap.forEach((k, v) -> dateHashMap.put(k, v));
					result.add(dateHashMap);
				}
			}
		}
		System.out.println(result.toString());

		ArrayList<Object> result2 = new ArrayList<Object>();
		result2.add(result.get(0));
		int three = 0;
		int three2 = 0;
		for (int i = 0; i < 3; i++) {
			Map<String, Object> a = (Map<String, Object>) result.get(i);
			three += ((BigDecimal) (a.get("ALLPAYMENT"))).intValue();
			three2 += ((BigDecimal) (a.get("EXPENSE_AMOUNT"))).intValue();
		}
		HashMap<String, Object> result3 = new HashMap<String, Object>();
		result3.put("ALLPAYMENT", three);
		result3.put("EXPENSE_AMOUNT", three2);
		result2.add(result3);
		for (int i = 0; i < 6; i++) {
			Map<String, Object> a = (Map<String, Object>) result.get(i);
			three += ((BigDecimal) (a.get("ALLPAYMENT"))).intValue();
			three2 += ((BigDecimal) (a.get("EXPENSE_AMOUNT"))).intValue();
		}
		HashMap<String, Object> result4 = new HashMap<String, Object>();
		result4.put("ALLPAYMENT", three);
		result4.put("EXPENSE_AMOUNT", three2);
		result2.add(result4);
		System.out.println(result2);
		return result2;
	}

	/**
	 * 보고서 삽입기능-카드 3개월치
	 *
	 * @author kyk
	 */
	@RequestMapping(value = "insertCardReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> totalCardReport(Board board) {

		HashMap<String, Object> map = new HashMap<>();
		int board_seq=board.getBoard_seq();
		int emp_seq=board.getEmp_seq();
		String board_regdate=board.getBoard_regdate();
		map.put("board_seq", board_seq);
		map.put("emp_seq",emp_seq);
		map.put("board_regdate",board_regdate);
		ArrayList<Object> insertCardReport = repo.insertCardReport(map);
		System.out.println("insertCardReport" + insertCardReport.toString());
		return insertCardReport;
	}
	
}


