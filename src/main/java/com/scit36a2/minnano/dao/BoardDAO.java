package com.scit36a2.minnano.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.scit36a2.minnano.vo.Board;
import com.scit36a2.minnano.vo.Board_comments;

public interface BoardDAO {
   /**
    * 게시글을 조회하는 메서드
    * 
    * @param map
    * @param rb
    */                                        
   List<HashMap<String, Object>> boardList(Map<String, Object> map,RowBounds rb);

   /** 게시글 한 개 등록하는 메서드 */
   public int insertBoard(Board board);

   /** 게시글 한 개 조회 */
   Board selectOne(int board_seq);

   /** 게시글 한 개 삭제 */
   int boardDelete(Board board);

   int boardUpdate(Board board);

   /**
    * 전체 글 개수 조회
    * 
    * @param map
    **/
   int boardCount(Map<String, String> map);

   /**
    * 조회수 올리기
    * 
    * @param board_seq
    * @return
    */
   int incrementHitcount(int board_seq);

   /**
    * 파일을 삭제하기 위해 DB에서 수정이 일어남
    * 
    * @param board_seq
    * @return
    */
   int deleteFile(int board_seq);

   int inputComment(Board_comments board_comments);

   List<Board_comments> selectComment(Board_comments board_comments);

   int deleteComment(Board_comments board_comments);

   int updateComment(Board_comments board_comments);

   
}