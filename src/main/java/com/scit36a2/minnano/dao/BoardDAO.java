package com.scit36a2.minnano.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.scit36a2.minnano.vo.Board;
import com.scit36a2.minnano.vo.Board_comments;

public interface BoardDAO {

	// 전체 게시물 수
	public int boardCount(Map<String, String> map);

	public List<HashMap<String, Object>> boardList(Map<String, Object> map, RowBounds rb);

	public int insertBoard(Board board);

	// add hitcount when read one article
	public int incrementHitcount(int board_seq);

	// read one article
	public Board selectOne(int board_seq);

	public String getEmpId(int board_seq);

	public List<Board_comments> selectComment(Board_comments board_comments);

	public int boardDelete(Board board);

	public int boardUpdate(Board board);

	public int inputComment(Board_comments board_comments);

	public int deleteComment(Board_comments board_comments);

	public int updateComment(Board_comments board_comments);

	public Board_comments selectCmtOne(Board_comments board_comments);

//	public int deleteFile(int board_seq);
}