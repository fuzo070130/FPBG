<%@page import="com.FPBG.domain.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
<title>Insert title here</title>
	<link rel="stylesheet" href="/FPBG/resources/css/header.css">
	<link rel="stylesheet" href="/FPBG/resources/css/headerMain.css">
	<link rel="stylesheet" href="/FPBG/resources/css/bootstrap.css">
	<link rel="stylesheet" href="/FPBG/resources/css/Nwagon.css">
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/FPBG/resources/js/bootstrap.js"></script>
	<script src="/FPBG/resources/js/Nwagon.js"></script>
	<script src="/FPBG/resources/js/Nwagon_no_vml.js"></script>
	
</head>
<body>
	<nav class="navbar navbar-default">
	    <div class="container-fluid">
		    <div class="navbar-header">
	    		<button type="button" class="navbar-toggle" data-toggle="collapse"
	    			data-target="#bs-example-navbar-collapse-1">
	    			<span class="sr-only"></span>
	    			<span class="icon-bar"></span>
	    			<span class="icon-bar"></span>
	    			<span class="icon-bar"></span>
	    		</button>
	    		<a class="navbar-brand" href="/FPBG" style="padding: 0;"><img alt="" src="/FPBG/resources/images/left-logo2.png"/></a>
		    </div>
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			    <ul class="nav navbar-nav">
				    <li class="dropdown">
				    	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">리더보드<span class="caret"></span></a>
				    	<ul class="dropdown-menu">
				    		<li><a href="/FPBG/readboard/as/solo">솔로</a></li>
				    		<li><a href="/FPBG/readboard/as/duo">듀오</a></li>
				    		<li><a href="/FPBG/readboard/as/squad">스쿼드</a></li>
				    		<li><a href="/FPBG/readboard/as/solo-fpp">FFP 솔로</a></li>
				    		<li><a href="/FPBG/readboard/as/duo-fpp">FFP 듀오</a></li>
				    		<li><a href="/FPBG/readboard/as/squad-fpp">FFP 스쿼드</a></li>
				    	</ul>
				    </li>
				    <li><a href="/FPBG/formcompare">유저 비교</a></li>
				    <li><a href="/FPBG/patch/Adminlist">패치내역</a></li>
				    <li><a href="https://himap.me/">지도</a></li>
				    <li><a href="/FPBG/sboard/list">게시판</a></li>
			    </ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty sessionScope.vo}">
					    	<li><button type="button" class="btn btn-info btn register" data-toggle="modal" data-target="#register" ><span class="glyphicon glyphicon-user"></span> 회원 가입</button></li>
					    	<li><button type="button" class="btn btn-info btn login" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로&nbsp;그&nbsp;인&nbsp;</button></li>
						</c:when>
						<c:when test="${!empty sessionScope.vo}">
							<li>
								<div class="member-info">
									<a href="/FPBG/Member/select">${vo.memNickName }</a>님 환영합니다
									<input type="hidden" id="session-memNickName" value="${vo.memNickName }">
						    	</div>
					    	<li>
					    	<li><button type="button" class="btn btn-info btn" onclick="logout();"><span class="glyphicon glyphicon-log-out"></span>&nbsp;로&nbsp;그&nbsp;아&nbsp;웃</button></li>
					    	<script>
					    		function logout() {
					    			location.href = '/FPBG/Member/logout';
					    		}
					    	</script>
						</c:when>
				    </c:choose>
	 			</ul>
		    </div>
	    </div>
	</nav>
	
	<!-- modal -->
	<div class="modal fade" id="register" role="dialog">
    	<div class="modal-dialog">
      		<!-- Modal content-->
      		<div class="modal-content">
	        	<div class="modal-header">
	            	<button type="button" class="close" data-dismiss="modal">&times;</button>
	            	<h4 class="modal-title">회원 가입</h4>
	        	</div>
		        <div class="modal-body">
		        	<div class="input-span div-input-span-1">
		        		<span class="glyphicon glyphicon-user"></span>
						<input type="text" name="memID" placeholder="Your ID" class="input-span-1" id="memID">
		        		<span class="glyphicon glyphicon-remove"></span>
		        		<span class="glyphicon glyphicon-ok"></span>
		        		<div class="text-hide-1">
		        		6-21자의 영문소문자와 숫자 사용
		        		</div>
					</div>
					<div class="input-span div-input-span-2">
		        		<span class="glyphicon glyphicon-eye-open"></span>
						<input type="text" name="memNickName" placeholder="Your NickName" class="input-span-2" id="memNickName">
		        		<span class="glyphicon glyphicon-remove"></span>
		        		<span class="glyphicon glyphicon-ok"></span>
		        		<div class="text-hide-2">
		        		1-21자 이내 영문대소문자,한글,숫자가능
		        		</div>
					</div>
					<div class="input-span div-input-span-3">
		        		<span class="glyphicon glyphicon-lock"></span>
						<input type="password" name="memPassword" placeholder="Your Password" class="input-span-3" id="memPassword">
		        		<span class="glyphicon glyphicon-remove"></span>
		        		<span class="glyphicon glyphicon-ok"></span>
		        		<div class="text-hide-3">
		        		8-21자의 영문대소문자,숫자
		        		</div>
					</div>
					<div class="input-span div-input-span-4">
		        		<span class="glyphicon glyphicon-envelope"></span>
						<input type="text" name="memEmail" placeholder="Your Email" class="input-span-4" id="memEmail">
		        		<span class="glyphicon glyphicon-remove"></span>
		        		<span class="glyphicon glyphicon-ok"></span>
		        		<div class="text-hide-4">
		        		Email 형식을 제대로 기입해주세요 (example@naver.com)
		        		</div>
					</div>
					<div class="input-span div-input-span-5">
		        		<span class="glyphicon glyphicon-send"></span>
			            <button type="button" class="btn btn-default input-span-5">Email Check Send</button>
		        		<span class="glyphicon glyphicon-remove"></span>
		        		<span class="glyphicon glyphicon-ok"></span>
		        		<div class="text-hide-5">
		        		버튼을 누르면 이메일로 코드가 발송됩니다
		        		</div>
					</div>
					<div class="input-span div-input-span-6">
		        		<span class="glyphicon glyphicon-edit"></span>
						<input type="text" name="code" placeholder="Email Send Code" class="input-span-6"  id="code">
		        		<span class="glyphicon glyphicon-remove"></span>
		        		<span class="glyphicon glyphicon-ok"></span>
		        		<div class="text-hide-6">
		        		이메일로 온 코드를 기입해주시길 바랍니다
		        		</div>
					</div>
					<div class="input-span div-input-span-7">
		        		<span class="glyphicon glyphicon-check"></span>
			            <button type="button" class="btn btn-default input-span-7">Email Check</button>
		        		<span class="glyphicon glyphicon-remove"></span>
		        		<span class="glyphicon glyphicon-ok"></span>
		        		<div class="text-hide-7">
		        		최종 코드 확인 가입을 환영합니다
		        		</div>
					</div>
					<script>
						var isEmpty = function(value){ 
							if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
								return true 
							}else{ 
								return false 
							} 
						};
						
						$(document).ready(function(){
							/* 인풋 호버 이벤트 */
							$(".input-span-1").focus(function(){
								$(".div-input-span-1").css('height','75px');
								$(".text-hide-1").css('display','block');
							});
							$(".input-span-2").focus(function(){
								$(".div-input-span-2").css('height','75px');
								$(".text-hide-2").css('display','block');
							});
							$(".input-span-3").focus(function(){
								$(".div-input-span-3").css('height','75px');
								$(".text-hide-3").css('display','block');
							});
							$(".input-span-4").focus(function(){
								$(".div-input-span-4").css('height','75px');
								$(".text-hide-4").css('display','block');
							});
							$(".input-span-5").hover(function(){
								$(".div-input-span-5").css('height','75px');
								$(".text-hide-5").css('display','block');
							});
							$(".input-span-6").focus(function(){
								$(".div-input-span-6").css('height','75px');
								$(".text-hide-6").css('display','block');
							});
							$(".input-span-7").hover(function(){
								$(".div-input-span-7").css('height','75px');
								$(".text-hide-7").css('display','block');
							});
							/* 인풋값 정규식 확인 */
							/* id 확인 */
							var idcheck=function() {
								var obj = $("#memID").val();
								var pattern = /^[a-z0-9]{6,21}$/g;
								var bool = pattern.test(obj);
								return bool;
							}
							/* nickname 확인 */
							var nickcheck=function() {
								var obj = $("#memNickName").val();
								var pattern = /^[A-za-z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,21}$/g;
								var bool = pattern.test(obj);
								return bool;
							}
							/* password 확인 */
							var passcheck=function() {
								var obj = $("#memPassword").val();
								var pattern = /^[A-za-z0-9]{8,21}$/g;
								var bool = pattern.test(obj);
								return bool;
							}
							/* Email 확인 */
							var mailcheck=function() {
								var obj = $("#memEmail").val();
								var pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
								var bool = pattern.test(obj);
								return bool;
							}
							/* 정규식 검사 이벤트 */
							$(".input-span-1").focusout(function(){
								if(idcheck() == true) {
									$(".div-input-span-1 .glyphicon-remove").css('visibility','hidden').css('color', 'red');
									$(".div-input-span-1 .glyphicon-ok").css('visibility','visible').css('color', 'green');
								} else {
									$(".div-input-span-1 .glyphicon-ok").css('visibility','hidden').css('color', 'green');
									$(".div-input-span-1 .glyphicon-remove").css('visibility','visible').css('color', 'red');
								}
							});
							$(".input-span-2").focusout(function(){
								if(nickcheck() == true) {
									$(".div-input-span-2 .glyphicon-remove").css('visibility','hidden').css('color', 'red');
									$(".div-input-span-2 .glyphicon-ok").css('visibility','visible').css('color', 'green');
								} else {
									$(".div-input-span-2 .glyphicon-ok").css('visibility','hidden').css('color', 'green');
									$(".div-input-span-2 .glyphicon-remove").css('visibility','visible').css('color', 'red');
								}
							});
							$(".input-span-3").focusout(function(){
								if(passcheck() == true) {
									$(".div-input-span-3 .glyphicon-remove").css('visibility','hidden').css('color', 'red');
									$(".div-input-span-3 .glyphicon-ok").css('visibility','visible').css('color', 'green');
								} else {
									$(".div-input-span-3 .glyphicon-ok").css('visibility','hidden').css('color', 'green');
									$(".div-input-span-3 .glyphicon-remove").css('visibility','visible').css('color', 'red');
								}
							});
							$(".input-span-4").focusout(function(){
								if(mailcheck() == true) {
									$(".div-input-span-4 .glyphicon-remove").css('visibility','hidden').css('color', 'red');
									$(".div-input-span-4 .glyphicon-ok").css('visibility','visible').css('color', 'green');
								} else {
									$(".div-input-span-4 .glyphicon-ok").css('visibility','hidden').css('color', 'green');
									$(".div-input-span-4 .glyphicon-remove").css('visibility','visible').css('color', 'red');
								}
							});
							/* 이메일 발송 */
							$(".input-span-5").click(function(event){
								if(idcheck() == true && nickcheck() == true && passcheck() == true && mailcheck() == true){
									/* 아작스 처리 */
									var memID = $("#memID").val();
									var memNickName = $("#memNickName").val();
									var memPassword = $("#memPassword").val();
									var memEmail = $("#memEmail").val();
									$.ajax({
										type : 'post',
										url : '/FPBG/Member/mailCheck',
										headers : {
											"Content-Type" : "application/json",
											"X-HTTP-Method-Override" : "POST"
										},
										dataType : 'text',
										data : JSON.stringify({
											memID : memID,
											memNickName : memNickName,
											memPassword : memPassword,
											memEmail : memEmail
										}),
										success : function(result){
											if(result == 'succ'){
												$(".text-hide-5").text('성공적으로 발송했습니다 이메일을 확인해주세요');
												$("#memID").attr('readonly','true');
												$("#memNickName").attr('readonly','true');
												$("#memPassword").attr('readonly','true');
												$("#memEmail").attr('readonly','true');
												$(".div-input-span-5 .glyphicon-remove").css('visibility','hidden').css('color', 'red');
												$(".div-input-span-5 .glyphicon-ok").css('visibility','visible').css('color', 'green');
											} else if(result == 'fail'){
												$(".text-hide-5").text('닉네임 또는 이메일이 중복됩니다');
												$(".div-input-span-5 .glyphicon-ok").css('visibility','hidden').css('color', 'green');
												$(".div-input-span-5 .glyphicon-remove").css('visibility','visible').css('color', 'red');
											}
										}
									});
								} else {
									$(".text-hide-5").text('위에 기입값을 다시한번 확인해주세요');
									$(".div-input-span-5 .glyphicon-ok").css('visibility','hidden').css('color', 'green');
									$(".div-input-span-5 .glyphicon-remove").css('visibility','visible').css('color', 'red');
									return false;
								}
							});
							/* 코드 확인 */
							$(".input-span-7").click(function(event){
								if(!$("#code").val()){
									$(".text-hide-7").text('빈칸입니다 확인해주세요');
									$(".div-input-span-7 .glyphicon-ok").css('visibility','hidden').css('color', 'green');
									$(".div-input-span-7 .glyphicon-remove").css('visibility','visible').css('color', 'red');
								} else {
									/* 아작스 처리 */
									var code = $("#code").val();
									$.ajax({
										type : 'get',
										url : '/FPBG/Member/codeCheck',
										headers : {
											"Content-Type" : "application/json",
											"X-HTTP-Method-Override" : "GET"
										},
										dataType : 'text',
										data : {
											"code" : code
										},
										success : function(result){
											if(result == 'succ') {
												$("#code").attr('readonly','true');
												$(".text-hide-7").text('성공적으로 확인했습니다');
												$(".div-input-span-7 .glyphicon-remove").css('visibility','hidden').css('color', 'red');
												$(".div-input-span-7 .glyphicon-ok").css('visibility','visible').css('color', 'green');
												$(".input-span-5").prop("disabled", true);
												$(".input-span-7").prop("disabled", true);
											} else {
												$(".text-hide-7").text('코드가 일치하지않습니다');
												$(".div-input-span-7 .glyphicon-ok").css('visibility','hidden').css('color', 'green');
												$(".div-input-span-7 .glyphicon-remove").css('visibility','visible').css('color', 'red');
											}
										}
									});
								}
							});
							/* 회원 가입 */
							$(".join-button").click(function(event){
								/* 이메일 인증 여부 */
								if($(".input-span-7").is(":disabled")) {
									/* 성공 */
									var memID = $("#memID").val();
									var memNickName = $("#memNickName").val();
									var memPassword = $("#memPassword").val();
									var memEmail = $("#memEmail").val();
									$.ajax({
										type : 'post',
										url : '/FPBG/Member/insert',
										headers : {
											"Content-Type" : "application/json",
											"X-HTTP-Method-Override" : "POST"
										},
										dataType : 'text',
										data : JSON.stringify({
											memID : memID,
											memNickName : memNickName,
											memPassword : memPassword,
											memEmail : memEmail
										}),
										success : function(result){
											if(result == 'succ') {
												alert('성공적으로 가입했습니다');
												location.href = "/FPBG";
											} else if(result == 'fail') {
												alert('가입에 실패하셨습니다');
												location.href = "/FPBG";
											}
										}
									});
								} else {
									/* 실패 */
									alert('값을 확인하시고 재시도해주세요');
								}
							});
							/* 로그인 */
							$(".login-button").click(function(event){
								var memID = $("#login-memID").val();
								var memPassword = $("#login-memPassword").val();
								$.ajax({
									type : 'post',
									url : '/FPBG/Member/login',
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override" : "POST"
									},
									dataType : 'text',
									data : JSON.stringify({
										memID : memID,
										memPassword : memPassword
									}),
									success : function(result){
										if(result == 'succ') {
											alert('로그인에 성공했습니다');
											location.href = "/FPBG";
										} else if(result == 'fail') {
											alert('로그인에 실패하셨습니다');
											location.href = "/FPBG";
										}
									}
								});
							});
						});
					</script>
		        </div>
		        <div class="modal-footer">
		            <button type="button" class="btn btn-default join-button">Join</button>
		        </div>
      		</div>
    	</div>
    </div>
  
    <div class="modal fade" id="login" role="dialog">
    	<div class="modal-dialog">
      		<!-- Modal content-->
      		<div class="modal-content">
	        	<div class="modal-header">
	            	<button type="button" class="close" data-dismiss="modal">&times;</button>
	            	<h4 class="modal-title">로그인</h4>
	        	</div>
		        <div class="modal-body">
		        	<div class="input-span">
		        		<span class="glyphicon glyphicon-user"></span>
						<input type="text" name="memID" placeholder="Your ID" id="login-memID"><br>
					</div>
					<div class="input-span">
		        		<span class="glyphicon glyphicon-lock"></span>
						<input type="password" name="memPassword" placeholder="Your Password" id="login-memPassword">
					</div>
		        </div>
		        <div class="modal-footer">
		            <button type="button" class="btn btn-default login-button">Log in</button>
		        </div>
      		</div>
    	</div>
    </div>
	<!-- modal -->
	
</body>
</html>