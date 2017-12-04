<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/FPBG/resources/css/player.css">
	<link rel="stylesheet" href="resources/css/readboardMain.css">
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="bigbody">
		<div class="content">	
			<div class="container">
				<div class="container-header">
					<div class="row">
							<div class="col-md-4">
								<div class="left-box">	
									<img src="${dto.photo }" width="100x;" height="100px;" style="margin-top: 0px">
									<div class="box-text">
										${dto.nickName }
									</div>
								</div>
							</div>
							<form>
								<div class="col-md-2">
									<div class="dropdown">
										<button class="btn btn-primary dropdown-toggle select-toggle1" type="button" data-toggle="dropdown">
											<c:choose>
												<c:when test="${empty param.season}">
													2017-Pre6
													<script>
														$(".select-toggle1").attr('data-season', 'pre6-2017');
													</script>
												</c:when>
												<c:when test="${!empty param.season}">
													<script>
														$(".select-toggle1").attr('data-season', '${param.season}');
													</script>
													<c:choose>
														<c:when test="${param.season eq 'pre1-2017' }">2017-Pre1</c:when>
														<c:when test="${param.season eq 'pre2-2017' }">2017-Pre2</c:when>
														<c:when test="${param.season eq 'pre3-2017' }">2017-Pre3</c:when>
														<c:when test="${param.season eq 'pre4-2017' }">2017-Pre4</c:when>
														<c:when test="${param.season eq 'pre5-2017' }">2017-Pre5</c:when>
														<c:when test="${param.season eq 'pre6-2017' }">2017-Pre6</c:when>
													</c:choose>
												</c:when>
										    </c:choose>
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu select-menu1" style="border-radius: 0px;">
											<li><a href="#">2017-Pre1</a></li>
											<li><a href="#">2017-Pre2</a></li>
											<li><a href="#">2017-Pre3</a></li>
											<li><a href="#">2017-Pre4</a></li>
											<li><a href="#">2017-Pre5</a></li>
											<li><a href="#">2017-Pre6</a></li>
										</ul>
									</div>
								</div>
								<div class="col-md-2">
									<div class="dropdown">
										<button class="btn btn-primary dropdown-toggle select-toggle2" type="button" data-toggle="dropdown">
											<c:choose>
												<c:when test="${empty param.Region}">
													Asia
													<script>
														$(".select-toggle2").attr('data-server', 'Asia');
													</script>
												</c:when>
												<c:when test="${!empty param.Region}">
													<script>
														$(".select-toggle2").attr('data-server', '${param.Region}');
													</script>
													<c:choose>
														<c:when test="${param.Region eq 'as' }">Asia</c:when>
														<c:when test="${param.Region eq 'na' }">NA</c:when>
														<c:when test="${param.Region eq 'eu' }">EU</c:when>
														<c:when test="${param.Region eq 'krjp' }">KR/JP</c:when>
														<c:when test="${param.Region eq 'oc' }">OC</c:when>
														<c:when test="${param.Region eq 'sa' }">SA</c:when>
														<c:when test="${param.Region eq 'sea' }">SEA</c:when>
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
								<div class="col-md-2">
									<div class="dropdown">
										<button class="btn btn-primary dropdown-toggle select-toggle3" type="button" data-toggle="dropdown"">
											<c:choose>
												<c:when test="${empty param.mode}">
													Solo
													<script>
														$(".select-toggle3").attr('data-mode', 'Solo');
													</script>
												</c:when>
												<c:when test="${!empty param.mode}">
													<script>
														$(".select-toggle3").attr('data-mode', '${param.mode}');
													</script>
													<c:choose>
														<c:when test="${param.mode eq 'solo' }">Solo</c:when>
														<c:when test="${param.mode eq 'duo' }">Duo</c:when>
														<c:when test="${param.mode eq 'squad' }">Squad</c:when>
														<c:when test="${param.mode eq 'solo-fpp' }">FPP-Solo</c:when>
														<c:when test="${param.mode eq 'duo-fpp' }">FPP-Duo</c:when>
														<c:when test="${param.mode eq 'squad-fpp' }">FPP-Squad</c:when>
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
									<button class="submit-button" type="submit" id="search-solo">검색</button>
								</div>
								<script type="text/javascript">
									$(document).ready(function(){
										$(".select-menu1 > li > a").click(function(){
											var value = $(this).text();
											$(".select-toggle1").attr('data-season', value);
											value += "<span class='caret'></span>";
											$(".select-toggle1").html(value);
										});
										$(".select-menu2 > li > a").click(function(){
											var value = $(this).text();
											$(".select-toggle2").attr('data-server', value);
											value += "<span class='caret'></span>";
											$(".select-toggle2").html(value);
										});
										$(".select-menu3 > li > a").click(function(){
											var value = $(this).text();
											$(".select-toggle3").attr('data-mode', value);
											value += "<span class='caret'></span>";
											$(".select-toggle3").html(value);
										});
										
										$('#search-solo').click(function(event){
											
											event.preventDefault();
											
											var season = $(".select-toggle1").attr('data-season');
											var server = $(".select-toggle2").attr('data-server');
											var mode = $(".select-toggle3").attr('data-mode');
											var search = '${param.search}';
											
											if(season == '2017-Pre1') {
												season = 'pre1-2017';
											}else if(season == '2017-Pre2') {
												season = 'pre2-2017';
											}else if(season == '2017-Pre3') {
												season = 'pre3-2017';
											}else if(season == '2017-Pre4') {
												season = 'pre4-2017';
											}else if(season == '2017-Pre5') {
												season = 'pre5-2017';
											}else if(season == '2017-Pre6') {
												season = 'pre6-2017';
											}
											
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
											
											location.href = "/FPBG/search?search=" + search + "&Region=" + server + "&mode=" + mode + "&season=" + season;
											
										});
									});
								</script>
							</form>
						</div>
					</div>
				<div class="row">
					<div class="col-md-12">
						<table class="table table-bordered" style="text-align: center;">
							<tr>
								<th>닉네임</th>
								<th>점수</th>
								<th>순위</th>
								<th>승리</th>
								<th>TOP10</th>
								<th>패배</th>
							</tr>
							<tr>
								<td>${dto.nickName }</td>
								<td>${dto.rating }점 (${dto.ratingper })</td>
								<td>${dto.rank }</td>
								<td>${dto.win }</td>
								<td>${dto.top10 }</td>
								<td>${dto.lose }</td>
							</tr>
						</table>
						
						<table class="table table-bordered" style="text-align: center;">
							<tr>
								<th>K/D</th>
								<th>K/D/A</th>
								<th>평균딜량</th>
								<th>헤드샷</th>
								<th>최다킬</th>
								<th>게임수</th>
							</tr>
							<tr>
								<td>${dto.kd }</td>
								<td>${dto.kda }</td>
								<td>${dto.avgdmg }</td>
								<td>${dto.head }</td>
								<td>${dto.mostkill }</td>
								<td>${dto.match }</td>
							</tr>
						</table>
						
						<table class="table table-bordered" style="text-align: center;">
							<tr>
								<th>최고점</th>
								<th>1경기 최대 킬수</th>
								<th>최대 연속 킬</th>
								<th>최대생존시간</th>
							</tr>
							<tr>
								<td>${dto.bestrating }</td>
								<td>${dto.bestkill }</td>
								<td>${dto.bestkills }</td>
								<td>${dto.besttime }</td>
							</tr>
						</table>
						
					</div>
				</div>
			</div>		
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	
</body>
</html>