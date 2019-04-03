package com.scit36a2.minnano.controllers;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.scit36a2.minnano.dao.BoardRepo;
import com.scit36a2.minnano.util.FileService;
import com.scit36a2.minnano.util.PageNavigator;
import com.scit36a2.minnano.vo.Board;



// 커뮤니티 기능
@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardRepo repo;
	// 파일이 저장될 경로
	final String uploadPath = "/boardfile";
	
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board() {
		logger.info("welcome board.");
		return "board/board";
	}

	
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList(
			@RequestParam(value="searchItem",  defaultValue="title" ) String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="" ) String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model) {

		// DB 접속 코드 
		int totalRecoundCount = repo.totalBoardCount(searchItem, searchWord);   // search한것의 전체 게시글 수  
		PageNavigator navi = new PageNavigator(currentPage, totalRecoundCount);
		List<Board> boardList = repo.boardList(searchItem, searchWord, navi.getStartRecord(), navi.getCountPerPage());

		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchItem", searchItem);

		return "board/boardList";
	}
	/** 게시글쓰기 화면 요청 
	 * 
	 * @return
	 */
	@RequestMapping(value="/boardRegist", method=RequestMethod.GET)
	public String boardRegist() {
		return "board/boardRegist";
	}

	/** 게시글쓰기 처리
	 * 
	 * @param board
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/boardRegist", method=RequestMethod.POST)
	public String boardRegist(
			Board board,
			MultipartFile upload,
			HttpSession session ) {

		int emp_seq = (int)session.getAttribute("emp_seq");
		board.setEmp_seq(emp_seq);
		
		String board_orgname = upload.getOriginalFilename();
		String board_savname = FileService.saveFile(upload, uploadPath);
		
		board.setBoard_orgname(board_orgname);
		board.setBoard_savname(board_savname);
		System.out.println("controller : " + board);
		int result = repo.boardRegist(board);
		return "redirect:/boardList";
	}

	/** 글 자세히 보기 *
	 *  
	 */
	@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
	public String boardDetail(
			@RequestParam(value="searchItem",  defaultValue="title" ) String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="" ) String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			int boardnum, 
			Model model) {
		
		Board board = repo.boardDetail(boardnum);
		System.out.println(board);
		
		// 
		String mime = null;
		if(board.getBoard_orgname() != null ) {
			String fullPath = uploadPath + "/" + board.getBoard_savname();
			
			try {
				mime = Files.probeContentType(Paths.get(fullPath));
				if(mime.contains("image"))
					model.addAttribute("mime", mime);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int totalRecordCount = repo.totalBoardCount(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		
		// 검색을 한 후 글 자세히보기로 왔을 때를 처리하기 위해
		model.addAttribute("board", board);
		model.addAttribute("navi", navi);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchItem", searchItem);
		
		return "board/boardDetail";
	}
	@RequestMapping(value="/download", method=RequestMethod.GET)
	public String download(int boardnum, HttpServletResponse response) {
		// boardnum에 해당하는 글 추출
		Board board = repo.seletOne(boardnum);
		// 파일명을 추출
		String originalfile = board.getBoard_orgname();
		String savedfile    = board.getBoard_savname();
		String fullpath     =  uploadPath + "/" + savedfile;
		System.out.println(originalfile + ", " + savedfile);
		System.out.println(fullpath);
		
		try {
			response.setHeader("Content-Disposition", "attatchment;filename="
			+ URLEncoder.encode(originalfile, "UTF-8") );
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullpath);
			fileout = response.getOutputStream();
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@RequestMapping(value="/boardDelete", method=RequestMethod.GET)
	public String boardDelete(int boardnum, HttpSession session) {
		Board oldBoard = repo.seletOne(boardnum);

		String savedfile = oldBoard.getBoard_savname();
		// HDD에 저장된 파일 삭제
		if(savedfile != null) {
			String fullPath = uploadPath + "/" + savedfile;
			boolean result = FileService.deleteFile(fullPath);
		}
		//String loginId = (String) session.getAttribute("loginId");
		//if(loginId != null && loginId.equals(oldBoard.getUserid())) 
		
		// DB에 저장된 글 삭제
		repo.boardDelete(boardnum);

		return "redirect:/boardList";
	}
	@RequestMapping(value="/boardUpdate", method=RequestMethod.GET)
	public String boardUpdate(int boardnum, HttpSession session, Model model) {
		//String loginId = (String) session.getAttribute("loginId");

		//if(loginId != null) {
		Board board = repo.seletOne(boardnum);

		model.addAttribute("board", board);
		return "board/boardUpdate";

		//}
		//return "redirect:/boardList";
	}
	/**
	 * 게시글 수정 처리 요청
	 * @param board
	 * @param upload
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(
			Board board, 
			MultipartFile upload,
			HttpSession session) {
		// 파일이 수정된 파일(), 원래파일, 원래부터 파일이 없던 경우
		int emp_seq = (int)session.getAttribute("emp_seq");
		board.setEmp_seq(emp_seq);
		
		Board oldBoard = repo.seletOne(board.getBoard_seq());
		
		String ofile = oldBoard.getBoard_orgname();
		String sfile = oldBoard.getBoard_savname();
			
		long size = upload.getSize();
		
		if(size != 0) { 			// 파일이 새롭게 첨부됐다는 의미
			if(sfile != null) {  	// DB의 데이터에 파일있으므로 HDD에서 삭제
				String fullPath = uploadPath + "/" + sfile;
				FileService.deleteFile(fullPath);
			}
			
			String board_orgname = upload.getOriginalFilename();
			String board_savname = FileService.saveFile(upload, uploadPath);
			
			board.setBoard_orgname(board_orgname);
			board.setBoard_savname(board_savname);
		}
		
		System.out.println("완성된 board : " + board);
		// DB에 수정 요청
		repo.update(board);

		return "redirect:/boardList";

	}
	
	@RequestMapping(value="/deleteFile", method=RequestMethod.GET)
	public String deleteFile(int boardnum) {
		Board oldBoard = repo.seletOne(boardnum);
		
		String savedfile = oldBoard.getBoard_savname();
		String fullPath = uploadPath +"/" + savedfile;
		boolean result = FileService.deleteFile(fullPath);
		if(result) {
			System.out.println("파일 삭제 완료");
		} else {
			System.out.println("파일 삭제 못함!!!!");
		}
		repo.deleteFile(boardnum);
		
		return "redirect:/boardUpdate?boardnum="+boardnum;
	}
}
