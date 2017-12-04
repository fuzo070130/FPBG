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
	
	<div class="search">
		<form action="/FPBG/compare" id="search-form" method="get">
		
		<div class="box">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search" name="search1" id="search1">
				<input type="text" class="form-control" placeholder="Search" name="search2" id="search2">
					<div class="input-group-btn">
						<button class="btn btn-default search-btn" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
			</div>
		</div>
		</form>
	</div>
	<script>
		$(".search-btn").click(function(){
			$("#search-form").submit();
		});
	</script>
</body>
</html>