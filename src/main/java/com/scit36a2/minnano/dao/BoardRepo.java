package com.scit36a2.minnano.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit36a2.minnano.vo.Board;
import com.scit36a2.minnano.vo.Employee;

@Repository
public class BoardRepo {
	@Autowired
	SqlSession session;

	// DB에서 제공하는 RowBounds를 이용한 페이징 기법
	public List<Board> boardList(String searchItem, String searchWord, int startRecord, int countPerPage) {
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		BoardDAO dao = session.getMapper(BoardDAO.class);

		Map<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		
		List<Board> list = dao.boardList(map, rb);

		return list;
	}

	public int insertBoard(Board board) {
		BoardDAO dao = session.getMapper(BoardDAO.class);

		int result = dao.insertBoard(board);

		return result;
	}

	public Board boardDetail(int board_seq) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		Board board = dao.selectOne(board_seq);

		dao.incrementHitcount(board_seq); // 조회수를 1회 늘림

		return board;
	}

	public int boardDelete(int board_seq) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		int result = dao.delete(board_seq);

		return result;

	}

	public Board seletOne(int board_seq) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		Board board = dao.selectOne(board_seq);

		return board;
	}

	public int update(Board board) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		int result = dao.update(board);

		return result;
	}

	public int totalBoardCount(String searchItem, String searchWord) {
		BoardDAO dao = session.getMapper(BoardDAO.class);

		Map<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);

		int boardCount = dao.boardCount(map);

		return boardCount;
	}

	public int deleteFile(int board_seq) {
		BoardDAO dao = session.getMapper(BoardDAO.class);
		int result = dao.deleteFile(board_seq);

		return result;

	}
}
