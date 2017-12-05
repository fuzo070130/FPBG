<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/compare.css">
	<link rel="stylesheet" href="resources/css/readboardMain.css">
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="bigbody">
		<div class="content">	
			<div class="container">
				<div class="container-header">
					<div class="row">
							<form>
								<div class="col-md-3">
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
								<div class="col-md-3">
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
								<div class="col-md-3">
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
								<div class="col-md-3">
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
				<c:choose>
				    <c:when test="${empty dto1.rating}">
				    	<p style="font-size: 56px;">비교할 대상끼리의 시즌 기록이 없습니다.</p>
				    </c:when>
				
				    <c:when test="${!empty dto1.rating}">
					<div class="row row-title">
						<div class="col-md-5 row-box box-title">
							${dto1.nickName }
						</div>
						<div class="col-md-2 row-box box-title box-middle">
							닉네임
						</div>
						<div class="col-md-5 row-box box-title">
							${dto2.nickName }
						</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.rating }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								점수
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.rating }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.rank }위
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								순위
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.rank }위
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.win }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								승리
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.win }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.top10 }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								TOP10
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.top10 }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.lose }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								패배
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.lose }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.kd}
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								K/D
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.kd }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.kda }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								K/D/A
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.kda }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.avgdmg }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								평균딜량
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.avgdmg }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.head }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								헤드샷
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.head }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.mostkill }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								최다킬
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.mostkill }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.match }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								게임수
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.match }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.bestrating }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								최고점
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.bestrating }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.bestkill }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								1경기 최대 킬수
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.bestkill }
							</div>
						</div>
						<div class="row row-body">
							<div class="col-md-5 row-box box-body">
								${dto1.bestkills }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								최대 연속 킬
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.bestkills }
							</div>
						</div>
						<div class="row row-body row-footer">
							<div class="col-md-5 row-box box-body">
								${dto1.besttime }
							</div>
							<div class="col-md-2 row-box box-body box-middle">
								최대생존시간
							</div>
							<div class="col-md-5 row-box box-body">
								${dto2.besttime }
							</div>
						</div>
				    </c:when>
				</c:choose>

				
				<script>
					$(document).ready(function(){
						function Upcompare(x,y){
							if(x > y){
								return x;
							}else if(x < y){
								return y;
							}else if(x == y){
								return "같음";
							}
						}
						function Downcompare(x,y){
							if(x > y){
								return y;
							}else if(x < y){
								return x;
							}else if(x == y){
								return "같음";
							}
						}
						var win = '#3498db';
						var lose = '#bdc3c7';
						var mo = '#bdc3c7';
						//비교 이후 CSS//
						if(Upcompare(${dto1.rating},${dto2.rating}) == ${dto1.rating}){
							$("div.content > div > div:nth-child(3) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(3) > div:nth-child(3)").css('background-color', lose);
							
							$("div.content > div > div:nth-child(4) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(4) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.rating},${dto2.rating}) == ${dto2.rating}){
							$("div.content > div > div:nth-child(3) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(3) > div:nth-child(3)").css('background-color', win);
							
							$("div.content > div > div:nth-child(4) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(4) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(3) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(3) > div:nth-child(3)").css('background-color', mo);
							
							$("div.content > div > div:nth-child(4) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(4) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Upcompare(${dto1.win},${dto2.win}) == ${dto1.win}){
							$("div.content > div > div:nth-child(5) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(5) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.win},${dto2.win}) == ${dto2.win}){
							$("div.content > div > div:nth-child(5) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(5) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(5) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(5) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Upcompare(${dto1.top10},${dto2.top10}) == ${dto1.top10}){
							$("div.content > div > div:nth-child(6) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(6) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.top10},${dto2.top10}) == ${dto2.top10}){
							$("div.content > div > div:nth-child(6) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(6) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(6) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(6) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Upcompare(${dto1.lose},${dto2.lose}) == ${dto1.lose}){
							$("div.content > div > div:nth-child(7) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(7) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.lose},${dto2.lose}) == ${dto2.lose}){
							$("div.content > div > div:nth-child(7) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(7) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(7) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(7) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Upcompare(${dto1.kd},${dto2.kd}) == ${dto1.kd}){
							$("div.content > div > div:nth-child(8) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(8) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.kd},${dto2.kd}) == ${dto2.kd}){
							$("div.content > div > div:nth-child(8) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(8) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(8) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(8) > div:nth-child(3)").css('background-color', mo);
						}
						
						$("div.content > div > div:nth-child(9) > div:nth-child(1)").css('background-color', mo);
						$("div.content > div > div:nth-child(9) > div:nth-child(3)").css('background-color', mo);
						
						if(Upcompare(${dto1.avgdmg},${dto2.avgdmg}) == ${dto1.avgdmg}){
							$("div.content > div > div:nth-child(10) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(10) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.avgdmg},${dto2.avgdmg}) == ${dto2.avgdmg}){
							$("div.content > div > div:nth-child(10) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(10) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(10) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(10) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Upcompare(${dto1.head},${dto2.head}) == ${dto1.head}){
							$("div.content > div > div:nth-child(11) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(11) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.head},${dto2.head}) == ${dto2.head}){
							$("div.content > div > div:nth-child(11) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(11) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(11) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(11) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Upcompare(${dto1.mostkill},${dto2.mostkill}) == ${dto1.mostkill}){
							$("div.content > div > div:nth-child(12) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(12) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.mostkill},${dto2.mostkill}) == ${dto2.mostkill}){
							$("div.content > div > div:nth-child(12) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(12) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(12) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(12) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Downcompare(${dto1.match},${dto2.match}) == ${dto1.match}){
							$("div.content > div > div:nth-child(13) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(13) > div:nth-child(3)").css('background-color', lose);
						}else if(Downcompare(${dto1.match},${dto2.match}) == ${dto2.match}){
							$("div.content > div > div:nth-child(13) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(13) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(13) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(13) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Upcompare(${dto1.bestrating},${dto2.bestrating}) == ${dto1.bestrating}){
							$("div.content > div > div:nth-child(14) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(14) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.bestrating},${dto2.bestrating}) == ${dto2.bestrating}){
							$("div.content > div > div:nth-child(14) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(14) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(14) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(14) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Upcompare(${dto1.bestkill},${dto2.bestkill}) == ${dto1.bestkill}){
							$("div.content > div > div:nth-child(15) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(15) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.bestkill},${dto2.bestkill}) == ${dto2.bestkill}){
							$("div.content > div > div:nth-child(15) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(15) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(15) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(15) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Upcompare(${dto1.bestkills},${dto2.bestkills}) == ${dto1.bestkills}){
							$("div.content > div > div:nth-child(16) > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div:nth-child(16) > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.bestkills},${dto2.bestkills}) == ${dto2.bestkills}){
							$("div.content > div > div:nth-child(16) > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div:nth-child(16) > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div:nth-child(16) > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div:nth-child(16) > div:nth-child(3)").css('background-color', mo);
						}
						
						if(Upcompare(${dto1.besttime},${dto2.besttime}) == ${dto1.besttime}){
							$("div.content > div > div.row.row-body.row-footer > div:nth-child(1)").css('background-color', win);
							$("div.content > div > div.row.row-body.row-footer > div:nth-child(3)").css('background-color', lose);
						}else if(Upcompare(${dto1.besttime},${dto2.besttime}) == ${dto2.besttime}){
							$("div.content > div > div.row.row-body.row-footer > div:nth-child(1)").css('background-color', lose);
							$("div.content > div > div.row.row-body.row-footer > div:nth-child(3)").css('background-color', win);
						}else{
							$("div.content > div > div.row.row-body.row-footer > div:nth-child(1)").css('background-color', mo);
							$("div.content > div > div.row.row-body.row-footer > div:nth-child(3)").css('background-color', mo);
						}
						
					});
				</script>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	
</body>
</html>