<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								<span class="glyphicon glyphicon-user"></span> <span>TOP10</span>
								<div class="readboard"></div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="textboard">
								<span class="glyphicon glyphicon-user"></span> <span
									class="glyphicon glyphicon-user"></span> <span>TOP10</span>
								<div class="readboard"></div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="textboard">
								<span class="glyphicon glyphicon-user"></span> <span
									class="glyphicon glyphicon-user"></span> <span
									class="glyphicon glyphicon-user"></span> <span
									class="glyphicon glyphicon-user"></span> <span>TOP10</span>
								<div class="readboard"></div>
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
