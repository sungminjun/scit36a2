package com.scit36a2.minnano.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.scit36a2.minnano.vo.Board;

public interface BoardDAO {
	/** 게시글을 조회하는 메서드 
	 * @param map 
	 * @param rb */
	List<Board> select(Map<String, String> map, RowBounds rb);

	/** 게시글 한 개 등록하는 메서드 */
	public int insertBoard(Board board);

	/** 게시글 한 개 조회 */
	Board selectOne(int boardnum);
	
	/** 게시글 한 개 삭제 */
	int delete(int boardnum);

	int update(Board board);

	/** 전체 글 개수 조회 
	 * @param map 
	 **/
	int boardCount(Map<String, String> map);

	/**
	 * 조회수 올리기
	 * @param boardnum
	 * @return
	 */
	int incrementHitcount(int boardnum);

	/**
	 * 파일을 삭제하기 위해 DB에서 수정이 일어남
	 * @param boardnum
	 * @return
	 */
	int deleteFile(int boardnum);
}
