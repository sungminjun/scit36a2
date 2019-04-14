<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>글 자세히 보기</title>
  
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  
  
  <link href="https://use.fontawesome.com/releases/v5.6.0/css/all.css" rel="stylesheet">
  
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- boardDetail -->
  <link href="./assets/css/board/boardDetail.css" rel="stylesheet" />

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="resources/jquery-3.3.1.min.js"></script>


  <script>
	$(function()   {
	  
	  selectComment();
	   $("#comButton").on("click",function()   {
	      inputComment();
	   }) 
	   
	});
  
  
	function boardDelete() {
	  location.href = "boardDelete?board_seq=${board.board_seq}";
	}
	
	function boardUpdate() {
	  location.href = "boardUpdate?board_seq=${board.board_seq}";
	}
	  
	
	function inputComment()   {
	   var board_comments_content = $("#board_comments_content").val();
	   var board_seq = ${board.board_seq};      
	   if (board_comments_content.trim().length==0) {
	     alert("댓글입력할것");
	     return;
	  }
	 
	  var da = {"board_comments_content" : board_comments_content, "board_seq" : board_seq};
	  
	   $.ajax({
	      url : "inputComment",
	      method : "POST",
	      data : da,
	      success : function(resp)   {
	         selectComment(resp);
	         $("#board_comments_content").val("");
	      }
	      });
	}/* inputComment */
	    
	function selectComment()   {
	   var board_seq = ${board.board_seq};   
	   var d = {"board_seq" : board_seq};
	   $.ajax({
	      url : "selectComment",
	       method : "POST",
	       data : d,
	       success : output
	   });
	  }/* selectComment() */
	
	
	function output(resp) {
	
	     var a = "";
	
	      $.each(resp, function(index, item) {
	       	       
	  	   a += '<div class="comments_box "id="'+item.board_comments_seq+'">';
	  	   
	       a += 	'<div class="comments_writer">' + item.board_comments_writer + '</div>';
	       a += 	'<div class="comments_content" id="'+item.board_comments_content+'">' + item.board_comments_content + '</div>';
	       a += 	'<div class="comments_regdate">' + item.board_comments_regdate + '</div>';
	       
	       a +=		'<div class="comments_delete" data-value="'+ item.board_comments_seq +'">'
	       a +=				'<i class="far fa-trash-alt"></i>'
	       a +=		'</div>'
	       
		   a +=		'<div class="comments_update" d-value="'+ item.board_comments_seq +'">'
	       a +=			'<i class="fas fa-tools"></i>'
	       a +=		'</div>'
	       
	       a += '</div>' 
	     });
	     $("#comment_box").html(a);
	    $('.comments_delete').on('click',deleteComment);
	   $('.comments_update').on('click',updateComment);
	}/* output */
	    
	
	    function deleteComment()   {		
	       alert("삭제");
	       var board_comments_seq = $(this).attr("data-value");
	      
	       $.ajax({
	          url : "deleteComment",
	          method : "POST",
	          data : {board_comments_seq : board_comments_seq},
	          success : selectComment
	             
	       });
	    } 
	    
	
	 
	     function updateComment()   {     
	       var board_comments_seq = $(this).attr("d-value");
	       var board_seq = ${board.board_seq};
	       
	       $.ajax({
	          method : 'post'
	          , url : 'selectComment'
	          , data : {"board_seq" : board_seq}
	          , success : function(resp){
	             var a = '';

	               $.each(resp, function(index, item) {
	                  if (item.board_comments_seq == board_comments_seq) {	 
	                	  
	                       a += '<div class="comments_box "id="'+item.board_comments_seq+'">';
	                       a += 	'<div class="comments_writer">' + item.board_comments_writer + '</div>';
	                       a += 	'<div class="comments_content"><input class="update_insert_bar" type="text" value="' + item.board_comments_content + '" id="newComment"></div>';
	                       a += 	'<div class="comments_regdate">' + item.board_comments_regdate + '</div>';
	                       a += 	'<div class="comments_update2"><input type="button" d-value="' + item.board_comments_seq + '" class="comments_update_button" value="댓글수정"></div>';
	                       a += '</div>';
	  
	                } else {
	                  	   a += '<div class="comments_box" id="'+item.board_comments_seq+'">';
	                       a += 	'<div class="comments_writer">' + item.board_comments_writer + '</div>';
	                       a += 	'<div class="comments_content" id="'+item.board_comments_content+'">' + item.board_comments_content + '</div>';
	                       a += 	'<div class="comments_regdate">' + item.board_comments_regdate + '</div>';
	                       a += '</div>';
	                }
	               })
	               
	               $('#comment_box').html(a);
	               $('.comments_update_button').on('click', upComment);
	          }
	       });
	    }
	      
	     
	     function upComment(){
	        var board_comments_seq = $(this).attr("d-value");
	        var board_comments_content = $('#newComment').val();
	       
	        var d = {"board_comments_seq" : board_comments_seq
	              ,"board_comments_content" : board_comments_content
	              };
	        
	        $.ajax({
	           url : "updateComment"
	           ,method : "POST"
	           ,data : d
	           ,success : function(resp){
	              if (resp == 1) {
	            alert('성공');
	             $('#comment_box').empty();
	            selectComment();
	         } else {
	            alert('실패');
	            return;
	         }
	           }
	           
	        });
	     }

    
    

  </script>
</head>

<body class="white-content">
  <div id="wrapper">
		<div class="sidebar" data="blue">
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="${pageContext.request.contextPath}"
						class="simple-text logo-normal"> MP </a>
				</div>
				<ul class="nav">
					<li><a href="pos"> <i class="tim-icons icon-money-coins"
							title="포스기능 / Enter POS"></i>
					</a> <br>
					<br></li>
					<li><a href="mgr"> <i
							class="tim-icons icon-settings-gear-63" title="설정 / settings"></i>
					</a> <br>
					<br></li>
					<li><a href="board"> <i class="tim-icons icon-chat-33"
							title="커뮤니티 / community"></i>
					</a> <br>
					<br></li>
					<li><a href="report"> <i
							class="tim-icons icon-chart-pie-36" title="보고서 / report"></i>
					</a> <br>
					<br> <br>
					<br>
					<br></li>
					<li><a href="logout"> <i
							class="tim-icons icon-button-power" title="로그아웃 / logout"
							aria-label="logout"></i>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel" data="blue">
			<div class="content">
				<div class="row">
					<div class="col-xl-10 ml-auto mr-auto">
						<div class="card">
						<div class="card-header">
							<div class="board_category_name">
								<h1>
									<span>${board.board_category} 게시판 </span>
								</h1><br>
							</div>
						</div>
						<hr>
						<div class="card-body" style="height:520px">
							<div class="">
								<div class="board_title">
									<h3 style="margin:0px;">
										<span>${board.board_title}</span>
									</h3><br>
										<span>${id}</span>
										<span> | </span>
										<span>${board.board_regdate}</span>
										<span> | </span>
										<span>조회수 ${board.board_hitcount}</span>
								</div>
							</div>
							<hr>
							
						
						<div class="board_content">
							
							${board.board_content}
						</div>
						
						</div><!-- card-body 끝-->
						<hr>
						<div class="card-footer" style="float:right;" >
							<%-- <c:if test="${sessionScope.emp_seq }  "> --%>
								<input id="board_update" value="글수정"onclick="boardUpdate();"/>
								<input id="board_delete" value="글삭제"onclick="boardDelete();"/>
						<%-- 	</c:if> --%>
							<a id="returnBoard" href="board">목록으로</a>
							
						</div>

							<hr>
							<div >
							<!-- 댓글 등록 -->
							<div id="comment_box">
							
							</div>
							
							<!-- 댓글 입력 -->
							<div id="comment_regist_form">
								<input type="text" id="board_comments_content" name="board_comments_content" placeholder="댓글입력" style="width:200px;">
								<input type="button" id="comButton" value="등록">
							</div>
							
							</div>
	

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>