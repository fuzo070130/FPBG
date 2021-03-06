<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="bigbody">
		<div class="container">

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">READ BOARD</h3>
						</div>
						<!-- /.box-header -->

						<form role="form" action="AdminmodifyPage" method="post">

							<input type='hidden' name='adminboardNumber' value="${AdminBoardVO.adminboardNumber}">
							<input type='hidden' name='page' value="${cri.page}">
							<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
							<input type='hidden' name='searchType' value="${cri.searchType}">
							<input type='hidden' name='keyword' value="${cri.keyword}">

						</form>

						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">Title</label> <input type="text"
									name='adminboardTitle' class="form-control" value="${AdminBoardVO.adminboardTitle}"
									readonly="readonly">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Content</label>
								<%-- <textarea class="form-control" name="adminboardContent" rows="3"
									readonly="readonly">${AdminBoardVO.adminboardContent}</textarea> --%>
								<div class="form-control" style="width: 100%; overflow: auto; height: 1600px;">
									${AdminBoardVO.adminboardContent}
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Writer</label> <input
									type="text" name="memNickName" class="form-control"
									value="${AdminBoardVO.memNickName}" readonly="readonly">
							</div>
						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<c:if test="${AdminBoardVO.memNickName ne sessionScope.vo.memNickName or empty sessionScope.vo}">
								<button type="submit" class="btn btn-primary goListBtn">메인으로</button>
							</c:if>
							<c:if test="${AdminBoardVO.memNickName eq sessionScope.vo.memNickName and !empty sessionScope.vo}">
								<button type="submit" class="btn btn-warning updateBtn">글수정</button>
								<button type="submit" class="btn btn-danger deleteBtn">글삭제</button>
								<button type="submit" class="btn btn-primary goListBtn">메인으로</button>
							</c:if>
						</div>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".updateBtn").on("click", function(){
		formObj.attr("action", "/FPBG/patch/AdminmodifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$(".deleteBtn").on("click", function(){
		formObj.attr("action", "/FPBG/patch/AdminremovePage");
		formObj.submit();
	});
	
	$(".goListBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/FPBG/patch/Adminlist");
		formObj.submit();
	});
	
	$("img").css('width','100%').css('hegiht','100%');
	
});
</script>


					</div>
					<!-- /.box -->
				</div>
				<!--/.col (left) -->

			</div>
			<!-- /.row --> </section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

	</div>
	

	<jsp:include page="../footer.jsp" />
</body>
</html>