<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/Main.css">
	<link rel="stylesheet" href="resources/css/Nwagon.css">
</head>
<body>
	<div class="header">
		<nav class="navbar navbar-inverse navbar-fixed-top" style="border-radius: 0px; margin-left: 451px; margin-right: 451px;">
		    <div class="container-fluid">
			    <div class="navbar-header">
		    		<a class="navbar-brand" href="/FPBG"><img alt="" src="/FPBG/resources/images/left-logo2.png" style="position: absolute; top: 0;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
			    </div>
			    <ul class="nav navbar-nav">
				    <li class="dropdown">
				    	<a href="#" class="dropdown-toggle" data-toggle="dropdown">리더보드<span class="caret"></span></a>
				    	<ul class="dropdown-menu">
				    		<li><a href="readboard">솔로</a></li>
				    		<li><a href="readboard">듀오</a></li>
				    		<li><a href="readboard">스쿼드</a></li>
				    		<li><a href="readboard">FFP 솔로</a></li>
				    		<li><a href="readboard">FFP 듀오</a></li>
				    		<li><a href="readboard">FFP 스쿼드</a></li>
				    	</ul>
				    </li>
				    <li class="dropdown">
				    	<a href="#" class="dropdown-toggle" data-toggle="dropdown">정보<span class="caret"></span></a>
				    	<ul class="dropdown-menu">
				    		<li><a href="weapons">무기</a></li>
				    		<li><a href="items">아이템</a></li>
				    		<li><a href="attachments">부착물</a></li>
				    	</ul>
				    </li>
				    <li><a href="patch">패치내역</a></li>
				    <li><a href="https://himap.me/">지도</a></li>
				    <li><a href="board">게시판</a></li>
			    </ul>
				<ul class="nav navbar-nav navbar-right">
				    <li><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#register" style="background-color: #2E2E2E; border-color: #2E2E2E;"><span class="glyphicon glyphicon-user"></span> 회원 가입</button></li>
				    <li><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#login" style="background-color: #2E2E2E; border-color: #2E2E2E;"><span class="glyphicon glyphicon-log-in"></span> 로그인</button></li>
	 			</ul>
		    </div>
		</nav>
	</div>
	
	<!-- modal -->
	<div class="modal fade" id="register" role="dialog" style="color: white;">
    	<div class="modal-dialog">
      		<!-- Modal content-->
      		<div class="modal-content" style="background-color: #424242;">
	        	<div class="modal-header" style="border-color: #2E2E2E;">
	            	<button type="button" class="close" data-dismiss="modal">&times;</button>
	            	<h4 class="modal-title">회원 가입</h4>
	        	</div>
		        <div class="modal-body">
						아이디 : <input type="text" name="memID"><br>
						닉네임 : <input type="text" name="memNickName"><br>
						이메일 : <input type="text" name="memEmail">
			            <button type="button" class="btn btn-default" style="border-radius: 0px; background-color: #2E2E2E; border-color: #2E2E2E; color: white;">이메일 인증 발송</button>
			            <button type="button" class="btn btn-default" style="border-radius: 0px; background-color: #2E2E2E; border-color: #2E2E2E; color: white;">이메일 확인</button><br>
						비밀번호 : <input type="password" name="memPassword"><br>
		        </div>
		        <div class="modal-footer" style="border-color: #424242;">
		            <button type="button" class="btn btn-default" style="border-radius: 0px; background-color: #2E2E2E; border-color: #2E2E2E; color: white;">가입</button>
		            <button type="button" class="btn btn-default" data-dismiss="modal" style="border-radius: 0px; background-color: #2E2E2E; border-color: #2E2E2E; color: white;">취소</button>
		        </div>
      		</div>
    	</div>
    </div>
  
    <div class="modal fade" id="login" role="dialog">
    	<div class="modal-dialog">
      		<!-- Modal content-->
      		<div class="modal-content" style="background-color: #424242;">
	        	<div class="modal-header" style="border-color: #2E2E2E;">
	            	<button type="button" class="close" data-dismiss="modal">&times;</button>
	            	<h4 class="modal-title">로그인</h4>
	        	</div>
		        <div class="modal-body">
		            <p>Some text in the modal.</p>
		        </div>
		        <div class="modal-footer" style="border-color: #424242;">
		            <button type="button" class="btn btn-default" data-dismiss="modal" style="border-radius: 0px; background-color: #2E2E2E; border-color: #2E2E2E; color: white;">Close</button>
		        </div>
      		</div>
    	</div>
    </div>
	<!-- modal -->
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/Nwagon.js"></script>
	<script src="resources/js/Nwagon_no_vml.js"></script>
</body>
</html>