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

						<form role="form" action="modifyPage" method="post">

							<input type='hidden' name='boardNumber' value="${boardVO.boardNumber}" id="boardNumber">
							<input type='hidden' name='page' value="${cri.page}">
							<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
							<input type='hidden' name='searchType' value="${cri.searchType}">
							<input type='hidden' name='keyword' value="${cri.keyword}">

						</form>

						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">Title</label> <input type="text"
									name='boardTitle' class="form-control" value="${boardVO.boardTitle}"
									readonly="readonly">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Content</label>
								<textarea class="form-control" name="boardContent" rows="3"
									readonly="readonly">${boardVO.boardContent}</textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Writer</label> <input
									type="text" name="memNickName" class="form-control"
									value="${boardVO.memNickName}" readonly="readonly">
							</div>
						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<c:if test="${boardVO.memNickName ne sessionScope.vo.memNickName or empty sessionScope.vo}">
								<button type="submit" class="btn btn-primary goListBtn">메인으로</button>
							</c:if>
							<c:if test="${boardVO.memNickName eq sessionScope.vo.memNickName and !empty sessionScope.vo}">
								<button type="submit" class="btn btn-warning updateBtn">글수정</button>
								<button type="submit" class="btn btn-danger deleteBtn">글삭제</button>
								<button type="submit" class="btn btn-primary goListBtn">메인으로</button>
							</c:if>
						</div>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	$(".updateBtn").on("click", function(){
		formObj.attr("action", "/FPBG/sboard/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$(".deleteBtn").on("click", function(){
		formObj.attr("action", "/FPBG/sboard/removePage");
		formObj.submit();
	});
	
	$(".goListBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/FPBG/sboard/list");
		formObj.submit();
	});
	
});
</script>


					</div>
					<!-- /.box -->
				</div>
				<!--/.col (left) -->

			</div>
			<!-- /.row --> </section>
			<div class="reply">
				<div class="reply-body">
					<div class="reply-insert">
						<input type="hidden" name='memNickName' id='memNickName' value="${sessionScope.vo.memNickName }">
						<input type="hidden" name='memNumber' id='memNumber' value="${sessionScope.vo.memNumber }">
						<input type="text" name="replyContent" id='replyContent'>
					</div>
					<button id="replyAddBtn">댓글 쓰기</button>
				</div>
				<ul id="replies">
				
				</ul>
			</div>
			<script>
				boardNumber = $("#boardNumber").val();
				function getAllList() {
					$.getJSON("/FPBG/Reply/all/" + boardNumber, function(data) {
						var str = "";
						
						$(data).each(
							function() {
								str += "<li data-replyNumber='" + this.replyNumber + "' class='replyLi'>"
									+ this.memNickName + " : " + this.replyContent
									+ "<button data-replyNumber='" + this.replyNumber + "' data-memNickName='" + this.memNickName + "'>X</button></li>";
							});
						$("#replies").html(str);
					});
				}
				
				$("#replyAddBtn").on("click",function() {
					var memNickName = $("#session-memNickName").val();
					var memNumber = $("#memNumber").val();
					var replyContent = $("#replyContent").val();
					if(memNickName == null || memNumber == null) {
						alert("로그인을 해주세요");
					} else if (replyContent == '') {
						alert("댓글내용을 확인해주세요");
					} else if (boardNumber == null) {
						alert("잘못된 접근입니다");
					} else {
						$.ajax({
							type : 'post',
							url : '/FPBG/Reply/insert',
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							dataType : 'text',
							data : JSON.stringify({
								memNickName : memNickName,
								memNumber : memNumber,
								replyContent : replyContent,
								boardNumber : boardNumber
							}),
							success : function(result) {
								if(result == "SUCCESS") {
									alert("등록 되었습니다");
									getAllList();
									history.go(0);
								}
							}
						});
					}
				});
				
				$("#replies").on("click" , ".replyLi button", function() {
					var replyNumber = $(this).attr('data-replyNumber');
					var smemNickName = $("#session-memNickName").val();
					var memNickName = $(this).attr('data-memNickName');
					if(smemNickName == null) {
						alert("로그인을 해주세요");
					} else if(smemNickName != memNickName) {
						alert("권한이 없습니다");
					} else {
						$.ajax({
							type : 'delete',
							url : '/FPBG/Reply/' + replyNumber,
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "DELETE"
							},
							dataType : 'text',
							success : function(result) {
								if(result == "SUCCESS") {
									alert("삭제 되었습니다");
									getAllList();
								}
							}
						});
					}
				});
				
				$(document).ready(function(){
					getAllList();
				});
			</script>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

	</div>
	

	<jsp:include page="../footer.jsp" />
</body>
</html>