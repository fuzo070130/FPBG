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
	<link rel="stylesheet" href="resources/css/compare.css">
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="bigbody">
		<div class="content">	
			<div class="container">
				<div class="container-header">
					<div class="row">
							<div class="col-md-4">
								<%-- <div class="left-box">	
									<img src="${dto.photo }" width="100x;" height="100px;" style="margin-top: 0px">
									<div class="box-text">
										${dto.nickName }
										${dto.rating }
									</div>
								</div> --%>
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
											var search1 = '${param.search1}';
											var search2 = '${param.search2}';
											
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
											
											location.href = "/FPBG/compare?search1=" + search1 + "&search2=" + search2 + "&Region=" + server + "&mode=" + mode + "&season=" + season;
											
										});
									});
								</script>
							</form>
						</div>
					</div>
				<div class="row">
					<div class="col-md-12">
						닉네임 : ${dto1.nickName } <br/>
						
						
						점수 : ${dto1.rating } <br/>
						순위 : ${dto1.rank } <br/>
						승리 : ${dto1.win } <br/>
						TOP10 : ${dto1.top10 } <br/>
						패배 : ${dto1.lose } <br/>
						
						K/D : ${dto1.kd } <br/>
						K/D/A : ${dto1.kda } <br/>
						평균딜량 : ${dto1.avgdmg } <br/>
						헤드샷 : ${dto1.head } <br/>
						최다킬 : ${dto1.mostkill } <br/>
						게임수 : ${dto1.match } <br/>
						
						최고점 : ${dto1.bestrating } <br/>
						1경기 최대 킬수 : ${dto1.bestkill } <br/>
						최대 연속 킬 : ${dto1.bestkills } <br/>
						최대생존시간 : ${dto1.besttime } <br/>
					</div>
					<div class="row">
					<div class="col-md-12">
						닉네임 : ${dto2.nickName } <br/>
						
						
						점수 : ${dto2.rating } <br/>
						순위 : ${dto2.rank } <br/>
						승리 : ${dto2.win } <br/>
						TOP10 : ${dto2.top10 } <br/>
						패배 : ${dto2.lose } <br/>
						
						K/D : ${dto2.kd } <br/>
						K/D/A : ${dto2.kda } <br/>
						평균딜량 : ${dto2.avgdmg } <br/>
						헤드샷 : ${dto2.head } <br/>
						최다킬 : ${dto2.mostkill } <br/>
						게임수 : ${dto2.match } <br/>
						
						최고점 : ${dto2.bestrating } <br/>
						1경기 최대 킬수 : ${dto2.bestkill } <br/>
						최대 연속 킬 : ${dto2.bestkills } <br/>
						최대생존시간 : ${dto2.besttime } <br/>
					</div>
				</div>
			</div>		
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	
</body>
</html>