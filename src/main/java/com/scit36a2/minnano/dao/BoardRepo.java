package com.scit36a2.minnano.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit36a2.minnano.vo.Board;
import com.scit36a2.minnano.vo.Board_comments;

@Repository
public class BoardRepo {
	@Autowired
	SqlSession session;

	public int totalBoardCount(String searchItem, String searchWord) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		Map<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		int boardCount = dao.boardCount(map);
		return boardCount;
	}

	// DB에서 제공하는 RowBounds를 이용한 페이징 기법
	public List<HashMap<String, Object>> boardList(String searchItem, String searchWord, int startRecord,
			int countPerPage) {
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		BoardDAO dao = session.getMapper(BoardDAO.class);
		Map<String, Object> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		List<HashMap<String, Object>> list = dao.boardList(map, rb);

		return list;
	}

	public int insertBoard(Board board) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		int result = dao.insertBoard(board);
		return result;
	}

	public Board boardDetail(int board_seq) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		dao.incrementHitcount(board_seq); // 조회수를 1회 늘림
		Board board = dao.selectOne(board_seq);
		return board;
	}

	public String getEmpId(int board_seq) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		String result = dao.getEmpId(board_seq);
		return result;
	}

	public List<Board_comments> selectComment(Board_comments board_comments) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		List<Board_comments> result = dao.selectComment(board_comments);
		return result;
	}

	public Board selectOne(int board_seq) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		Board board = dao.selectOne(board_seq);
		return board;
	}

	public int boardDelete(Board board) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		int result = dao.boardDelete(board);
		return result;
	}

	public int boardUpdate(Board board) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		int result = dao.boardUpdate(board);
		return result;
	}

	public int inputComment(Board_comments board_comments) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		int result = dao.inputComment(board_comments);

		return result;
	}

	public int deleteComment(Board_comments board_comments) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		int result = dao.deleteComment(board_comments);
		return result;
	}

	public int updateComment(Board_comments board_comments) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		int result = dao.updateComment(board_comments);
		return result;
	}

	public ArrayList<Object> insertReport(HashMap<String, Object> map) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		ArrayList<Object> list = dao.insertReport(map);
		return list;
	}

	public ArrayList<Object> insertMenuReport(HashMap<String, Object> map) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		ArrayList<Object> list = dao.nsertMenuReport(map);
		return list;
	}

	public ArrayList<Object> insertGuestReport(HashMap<String, Object> map) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		ArrayList<Object> list = dao.insertGuestReport(map);
		return list;
	}

	
	public ArrayList<HashMap<String, Object>> selectMonthPayment(HashMap<String, Object> map) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectMonthPayment(map);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectMonthExpense(HashMap<String, Object> map) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectMonthExpense(map);
		return list;
	}
	

	public ArrayList<Object> insertCardReport(HashMap<String, Object> map) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		ArrayList<Object> list = dao.insertCardReportt(map);
		return list;
	}

	public int selectCompseq(int emp_seq) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		int result = dao.selectCompseq(emp_seq);
		return result;
	}

	

	

//	public int deleteFile(int board_seq) {
//		BoardDAO dao = session.getMapper(BoardDAO.class);
//		int result = dao.deleteFile(board_seq);
//		return result;
//	}

}