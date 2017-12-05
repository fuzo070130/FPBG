<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/formcompare.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="container">
		<form action="/FPBG/compare" id="search-form" method="get">
		
		<div class="box">
			<div class="input-group search-box">
				<div class="box-letf form-box">
					<input type="text" class="form-control" placeholder="SearchNickName" name="search1" id="search box1">
				</div>
				<div class="input-group-btn">
					<button class="btn btn-default search-btn" type="submit">
						VS
					</button>
				</div>
				<div class="box-right form-box">
					<input type="text" class="form-control" placeholder="SearchNickName" name="search2" id="search box2">
				</div>
			</div>
		</div>
		</form>
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
	<script>
		$(".search-btn").click(function(){
			$("#search-form").submit();
		});
	</script>
</body>
</html>