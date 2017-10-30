<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="body">
		<div class="container">
			<div class="logo">
				<img alt="" src="resources/images/logo4.png">
			</div>
			<div class="search">
				<form action="#">
				    <div class="input-group">
				        <input type="text" class="form-control" placeholder="Search" name="search" id="search" style="height: 50px; border-radius: 0px; background-color: #2E2E2E; border-color: #2E2E2E; color: white; opacity: 0.6;">
				        <div class="input-group-btn">
				            <button class="btn btn-default" type="submit" style="height: 50px; z-index: 3; background-color: #2E2E2E;border-color: #2E2E2E; color: white; border-radius: 0px;"><i class="glyphicon glyphicon-search"></i></button>
				        </div>
				    </div>
				</form>
			</div>
		</div>
	</div>
	<div class="board">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="textboard">
						<span class="glyphicon glyphicon-user"></span>
						<span>TOP10</span>
					</div>
				</div>
				<div class="col-md-4">
					<div class="textboard">
						<span class="glyphicon glyphicon-user"></span>
						<span class="glyphicon glyphicon-user"></span>
						<span>TOP10</span>
					</div>
				</div>
				<div class="col-md-4">
					<div class="textboard">
						<span class="glyphicon glyphicon-user"></span>
						<span class="glyphicon glyphicon-user"></span>
						<span class="glyphicon glyphicon-user"></span>
						<span class="glyphicon glyphicon-user"></span>
						<span>TOP10</span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="readboard">
					</div>
				</div>
				<div class="col-md-4">
					<div class="readboard">
					</div>
				</div>
				<div class="col-md-4">
					<div class="readboard">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>
