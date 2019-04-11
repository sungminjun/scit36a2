package com.scit36a2.minnano.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;

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

   @RequestMapping(value = "/board", method = RequestMethod.GET)
   public String boardList(@RequestParam(value = "searchItem", defaultValue = "title") String searchItem,
                     @RequestParam(value = "searchWord", defaultValue = "") String searchWord,
                     @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model, HttpSession session)      {
                     
      // DB 접속 코드
      int totalRecoundCount = repo.totalBoardCount(searchItem, searchWord); // search한것의 전체 게시글 수
      PageNavigator navi = new PageNavigator(currentPage, totalRecoundCount);
      Employee employee = new Employee();
      List<HashMap<String, Object>> boardList = repo.boardList(searchItem, searchWord, navi.getStartRecord(), navi.getCountPerPage());
      
      //String emp_id = (String)session.getAttribute("emp_id");
      // emp_seq를 repo보내서 member매퍼에서 select emp_id 또는 emp_name 또는 comp_seq로 comp_name을 불러와서 넣어줄수도있죠...
      model.addAttribute("boardList", boardList);
      model.addAttribute("navi", navi);
      model.addAttribute("searchWord", searchWord);
      model.addAttribute("searchItem", searchItem);
      //model.addAttribute("emp_id",emp_id);
       
      return "board/board";
   }

   /**
    * 게시글쓰기 화면 요청
    * 
    * @return
    */
   @RequestMapping(value = "/boardRegist", method = RequestMethod.GET)
   public String boardRegist() {
      return "board/boardRegist";
   }

   /**
    * 게시글쓰기 처리
    * 
    * @param board
    * @param session
    * @return
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
    * 글 자세히 보기 *
    * 
    */
   @RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
   public String boardDetail(@RequestParam(value = "searchItem", defaultValue = "title") String searchItem,
         @RequestParam(value = "searchWord", defaultValue = "") String searchWord,
         @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, int board_seq, Model model) {

      Board board = repo.boardDetail(board_seq);
      System.out.println(board);

      //
      String mime = null;
      if (board.getBoard_orgname() != null) {
         String fullPath = uploadPath + "/" + board.getBoard_savname();

         try {
            mime = Files.probeContentType(Paths.get(fullPath));
            if (mime.contains("image"))
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

/*   @RequestMapping(value = "/download", method = RequestMethod.GET)
   public String download(int board_seq, HttpServletResponse response) {
      // board_seq에 해당하는 글 추출
      Board board = repo.seletOne(board_seq);
      // 파일명을 추출
      String originalfile = board.getBoard_orgname();
      String savedfile = board.getBoard_savname();
      String fullpath = uploadPath + "/" + savedfile;
      System.out.println(originalfile + ", " + savedfile);
      System.out.println(fullpath);

      try {
         response.setHeader("Content-Disposition",
               "attatchment;filename=" + URLEncoder.encode(originalfile, "UTF-8"));
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
   }*/

   @RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
   public String boardDelete(int board_seq, HttpSession session,Board board) {
      Board oldBoard = repo.seletOne(board_seq);
      int emp_seq = (Integer)session.getAttribute("emp_seq");
      board.setEmp_seq(emp_seq);
      String savedfile = oldBoard.getBoard_savname();
      // HDD에 저장된 파일 삭제
      if (savedfile != null) {
         String fullPath = uploadPath + "/" + savedfile;
         boolean result = FileService.deleteFile(fullPath);
      }
      // String loginId = (String) session.getAttribute("loginId");
      // if(loginId != null && loginId.equals(oldBoard.getUserid()))

      // DB에 저장된 글 삭제
      repo.boardDelete(board);

      return "redirect:/board";
   }

   @RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
   public String boardUpdate(int board_seq, HttpSession session, Model model) {
      // String loginId = (String) session.getAttribute("loginId");

      // if(loginId != null) {
      Board board = repo.seletOne(board_seq);

      model.addAttribute("board", board);
      return "board/boardUpdate";

      // }
      // return "redirect:/boardList";
   }

   /**
    * 게시글 수정 처리 요청
    * 
    * @param board
    * @param upload
    * @param session
    * @return
    */
   @RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
   public String boardUpdate(Board board, MultipartFile upload, HttpSession session) {
      // 파일이 수정된 파일(), 원래파일, 원래부터 파일이 없던 경우
      int emp_seq = (int) session.getAttribute("emp_seq");
      board.setEmp_seq(emp_seq);

      Board oldBoard = repo.seletOne(board.getBoard_seq());

      /*String ofile = oldBoard.getBoard_orgname();
      String sfile = oldBoard.getBoard_savname();

      long size = upload.getSize();

      if (size != 0) { // 파일이 새롭게 첨부됐다는 의미
         if (sfile != null) { // DB의 데이터에 파일있으므로 HDD에서 삭제
            String fullPath = uploadPath + "/" + sfile;
            FileService.deleteFile(fullPath);
         }

         String board_orgname = upload.getOriginalFilename();
         String board_savname = FileService.saveFile(upload, uploadPath);

         board.setBoard_orgname(board_orgname);
         board.setBoard_savname(board_savname);
      }*/

      //System.out.println("수정 board : " + board);
      // DB에 수정 요청
      repo.boardUpdate(board);

      return "redirect:/board";

   }

/*   @RequestMapping(value = "/deleteFile", method = RequestMethod.GET)
   public String deleteFile(int board_seq) {
      Board oldBoard = repo.seletOne(board_seq);

      String savedfile = oldBoard.getBoard_savname();
      String fullPath = uploadPath + "/" + savedfile;
      boolean result = FileService.deleteFile(fullPath);
      if (result) {
         System.out.println("파일 삭제 완료");
      } else {
         System.out.println("파일 삭제 못함!!!!");
      }
      repo.deleteFile(board_seq);

      return "redirect:/boardUpdate?board_seq=" + board_seq;
   }*/



   @RequestMapping(value="inputComment", method=RequestMethod.POST)
   @ResponseBody
   public String inputComment(Board_comments board_comments, HttpSession session,String board_comments_writer, String board_comments_content)   {
      //board_comments.setBoard_comments_writer(board_comments_writer);
      String emp_id = (String)session.getAttribute("emp_id");
      board_comments.setBoard_comments_content(board_comments_content);
      
      Employee writer = new Employee();
      writer.setEmp_id(emp_id);
      writer = membrepo.selectOne(writer);
      board_comments.setBoard_comments_writer(writer.getEmp_name());
      
      //System.out.println("board_comments : " + board_comments);
      int result = repo.inputComment(board_comments);
      
      return "success";
   }
   
   @RequestMapping(value="selectComment",method=RequestMethod.POST)
   @ResponseBody
   public List<Board_comments> selectComment(Board_comments board_comments,int board_seq)   {
      
      board_comments.setBoard_seq(board_seq);
      
      List<Board_comments> result = repo.selectComment(board_comments);
      
      return result;
   }
   
   
   
   
   
   @RequestMapping(value="deleteComment",method=RequestMethod.POST)
   @ResponseBody
   public String deleteComment(Board_comments board_comments,HttpSession session,int board_comments_seq)   {
      //String emp_id = (String)session.getAttribute("emp_id");
      
      //board_comments.setBoard_comments_writer(emp_id);
      board_comments.setBoard_comments_seq(board_comments_seq);
      
      /*Employee writer = new Employee();
      writer.setEmp_id(emp_id);
      writer = membrepo.selectOne(writer);
      board_comments.setBoard_comments_writer(writer.getEmp_name());*/
      
      System.out.println("컨트롤러 삭제 board_comments : " + board_comments);
      
      int result = repo.deleteComment(board_comments);
      return "success";
   }
   
   @RequestMapping(value="updateComment" ,method=RequestMethod.POST)
   @ResponseBody
   public int updateComment(HttpSession session,Board_comments board_comments)   {
      
      int result = repo.updateComment(board_comments);
      System.out.println("댓글 수정 result : " + result);
      return result;
   }
   
}