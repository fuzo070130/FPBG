<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Home</title>
	<link rel="stylesheet" href="resources/css/home.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="bigbody">
		<div class="content">
			<div class="container">
				<div class="body">
					<div class="logo">
						<div class="logo-img">
							<img alt="" src="/FPBG/resources/images/logo4.png">
						</div>
					</div>
					<div class="search">
						<form action="/FPBG/search" id="search-form" method="get">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search"
									name="search" id="search">
								<div class="input-group-btn">
									<button class="btn btn-default search-btn" type="submit">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
								<script>
									$(".search-btn").click(function(){
										$("#search-form").submit();
									});
								</script>
							</div>
						</form>
					</div>
				</div>

				<div class="board">
					<div class="row">
						<div class="col-md-4">
							<div class="textboard">
								<span class="glyphicon glyphicon-user"></span> <span>TOP10(Asia)</span>
								<div class="readboard">
									<table class="table table-bordered" style="text-align: center;">
										<tr>
											<th>순위</th>
											<th>닉네임</th>
										</tr>
										<c:forEach var="solo" items="${solo }">
											<tr>
												<td>${solo.rank }</td>
												<td><a href="/FPBG/search?search=${solo.memNickName }&Region=as&mode=solo&season=pre6-2017">${solo.memNickName }</a></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="textboard">
								<span class="glyphicon glyphicon-user"></span> <span
									class="glyphicon glyphicon-user"></span> <span>TOP10(Asia)</span>
								<div class="readboard">
									<table class="table table-bordered" style="text-align: center;">
										<tr>
											<th>순위</th>
											<th>닉네임</th>
										</tr>
										<c:forEach var="duo" items="${duo }">
											<tr>
												<td>${duo.rank }</td>
												<td><a href="/FPBG/search?search=${duo.memNickName }&Region=as&mode=duo&season=pre6-2017">${duo.memNickName }</a></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="textboard">
								<span class="glyphicon glyphicon-user"></span> <span
									class="glyphicon glyphicon-user"></span> <span
									class="glyphicon glyphicon-user"></span> <span
									class="glyphicon glyphicon-user"></span> <span>TOP10(Asia)</span>
								<div class="readboard">
									<table class="table table-bordered" style="text-align: center;">
										<tr> 
											<th>순위</th>
											<th>닉네임</th>
										</tr>
										<c:forEach var="squad" items="${squad }">
											<tr>
												<td>${squad.rank }</td>
												<td><a href="/FPBG/search?search=${squad.memNickName }&Region=as&mode=squad&season=pre6-2017">${squad.memNickName }</a></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
