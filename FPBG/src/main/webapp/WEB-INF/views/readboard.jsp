<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/FPBG/resources/css/readboardMain.css">
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="bigbody">
		<div class="content">
			<div class="container">
				<div class="container-header">
					<div class="row">
						<div class="col-md-4">
							<img src="/FPBG/resources/images/TOP100.3.png">
						</div>
						<form>
							<div class="col-md-3">
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle select-toggle2" type="button" data-toggle="dropdown">
										<c:choose>
											<c:when test="${empty server}">
												Asia
												<script>
													$(".select-toggle2").attr('data-server', 'Asia');
												</script>
											</c:when>
											<c:when test="${!empty server}">
												<script>
													$(".select-toggle2").attr('data-server', '${server}');
												</script>
												<c:choose>
													<c:when test="${server eq 'as' }">Asia</c:when>
													<c:when test="${server eq 'na' }">NA</c:when>
													<c:when test="${server eq 'eu' }">EU</c:when>
													<c:when test="${server eq 'krjp' }">KR/JP</c:when>
													<c:when test="${server eq 'oc' }">OC</c:when>
													<c:when test="${server eq 'sa' }">SA</c:when>
													<c:when test="${server eq 'sea' }">SEA</c:when>
												</c:choose>
											</c:when>
									    </c:choose>
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu select-menu2" style="border-radius: 0px;">
										<li><a href="#">NA</a></li>
										<li><a href="#">EU</a></li>
										<li><a href="#">Asia</a></li>
										<li><a href="#">KR/JP</a></li>
										<li><a href="#">OC</a></li>
										<li><a href="#">SA</a></li>
										<li><a href="#">SEA</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-3">
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle select-toggle3" type="button" data-toggle="dropdown">
										<c:choose>
											<c:when test="${empty mode}">
												Solo
												<script>
													$(".select-toggle3").attr('data-mode', 'Solo');
												</script>
											</c:when>
											<c:when test="${!empty mode}">
												<script>
													$(".select-toggle3").attr('data-mode', '${mode}');
												</script>
												<c:choose>
													<c:when test="${mode eq 'solo' }">Solo</c:when>
													<c:when test="${mode eq 'duo' }">Duo</c:when>
													<c:when test="${mode eq 'squad' }">Squad</c:when>
													<c:when test="${mode eq 'solo-fpp' }">FPP-Solo</c:when>
													<c:when test="${mode eq 'duo-fpp' }">FPP-Duo</c:when>
													<c:when test="${mode eq 'squad-fpp' }">FPP-Squad</c:when>
												</c:choose>
											</c:when>
									    </c:choose>
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu select-menu3" style="border-radius: 0px;">
										<li><a href="#">Solo</a></li>
										<li><a href="#">Duo</a></li>
										<li><a href="#">Squad</a></li>
										<li><a href="#">FPP-Solo</a></li>
										<li><a href="#">FPP-Duo</a></li>
										<li><a href="#">FPP-Squad</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-2">
								<button class="submit-button" type="button" id="readboard-search">검색</button>
							</div>
							<script type="text/javascript">
								$(document).ready(function(){
									var searchlink = location.href;
									var reallink = searchlink.split('/');
									
									for(var i = 1; i <= 101; i++){
										var toolink = $("table > tbody > tr:nth-child("+i+") > td:nth-child(2) > a").attr('href');
										toolink += "&Region=" + reallink[5] +"&mode=" + reallink[6] +"&season=pre6-2017";
										$("table > tbody > tr:nth-child("+i+") > td:nth-child(2) > a").attr('href',toolink);
									}
									
									$(".select-menu2 > li > a").click(function(event){
										event.preventDefault();
										var value = $(this).text();
										$(".select-toggle2").attr('data-server', value);
										value += "<span class='caret'></span>";
										$(".select-toggle2").html(value);
									});
									$(".select-menu3 > li > a").click(function(event){
										event.preventDefault();
										var value = $(this).text();
										$(".select-toggle3").attr('data-mode', value);
										value += "<span class='caret'></span>";
										$(".select-toggle3").html(value);
									});
									
									$("#readboard-search").click(function(event){
										var server = $(".select-toggle2").attr('data-server');
										var mode = $(".select-toggle3").attr('data-mode');
										
										if(server == 'KR/JP') {
											server = 'krjp';
										}else if(server == 'Asia') {
											server = 'as';
										}else if(server == 'SA') {
											server = 'sa';
										}else if(server == 'NA') {
											server = 'na';
										}else if(server == 'OC') {
											server = 'oc';
										}else if(server == 'EU') {
											server = 'eu';
										}else if(server == 'SEA') {
											server = 'sea';
										}else{
											server = server;
										}
										
										if(mode == 'Solo') {
											mode = 'solo';
										}else if(mode == 'Duo') {
											mode = 'duo';
										}else if(mode == 'Squad') {
											mode = 'squad';
										}else if(mode == 'FPP-Solo') {
											mode = 'solo-fpp';
										}else if(mode == 'FPP-Duo') {
											mode = 'duo-fpp';
										}else if(mode == 'FPP-Squad') {
											mode = 'squad-fpp';
										}else{
											mode = mode;
										}
										
										location.href = "/FPBG/readboard/" + server + "/" + mode;
									}); 
								});
							</script>
						</form>
					</div>
				</div>
				<div class="container-body">
				
					<table class="table table-bordered" style="text-align: center;">
						<tr>
							<th>순위</th>
							<th>닉네임</th>
							<th>점수</th>
							<th>판수</th>
						</tr>
						<c:forEach var="topdto" items="${topdto }">
							<tr>
								<td>${topdto.rank }</td>
								<td><a href="/FPBG/search?search=${topdto.memNickName }">${topdto.memNickName }</a></td>
								<td>${topdto.rating }</td>
								<td>${topdto.match }</td>
							</tr>
						</c:forEach>
					</table>
					
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>