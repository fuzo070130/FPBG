<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/readboardMain.css">
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="bigbody">
		<div class="content">
			<div class="container">
				<div class="container-header">
					<div class="row">
						<div class="col-md-4">
							<img src="resources/images/TOP100.3.png">
						</div>
						<form>
							<div class="col-md-2">
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle select-toggle1" type="button" data-toggle="dropdown">2017-Pre1<span class="caret"></span></button>
									<ul class="dropdown-menu select-menu1" style="border-radius: 0px;">
										<li><a href="#">2017-Pre1</a></li>
										<li><a href="#">2017-Pre2</a></li>
										<li><a href="#">2017-Pre3</a></li>
										<li><a href="#">2017-Pre4</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-2">
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle select-toggle2" type="button" data-toggle="dropdown">Asia<span class="caret"></span></button>
									<ul class="dropdown-menu select-menu2" style="border-radius: 0px;">
										<li><a href="#">NA</a></li>
										<li><a href="#">EU</a></li>
										<li><a href="#">Asia</a></li>
										<li><a href="#">OC</a></li>
										<li><a href="#">SA</a></li>
										<li><a href="#">SEA</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-2">
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle select-toggle3" type="button" data-toggle="dropdown"">Solo<span class="caret"></span></button>
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
								<button class="submit-button" type="submit">검색</button>
							</div>
							<script type="text/javascript">
								$(document).ready(function(){
									$(".select-menu1 > li > a").click(function(){
										var value = $(this).text();
										value += "<span class='caret'></span>";
										$(".select-toggle1").html(value);
									});
									$(".select-menu2 > li > a").click(function(){
										var value = $(this).text();
										value += "<span class='caret'></span>";
										$(".select-toggle2").html(value);
									});
									$(".select-menu3 > li > a").click(function(){
										var value = $(this).text();
										value += "<span class='caret'></span>";
										$(".select-toggle3").html(value);
									});
								});
							</script>
						</form>
					</div>
				</div>
				<div class="container-body">
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>