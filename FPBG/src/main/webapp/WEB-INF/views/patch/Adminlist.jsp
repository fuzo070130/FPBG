<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					
					<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">패치내역</h3>
				</div>


				<div class='box-body'>

					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Title</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							Content</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Writer</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							Title OR Content</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							Content OR Writer</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							Title OR Content OR Writer</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>Search</button>
					

				</div>
			</div>

					<div class="box">
						<div class="box-header with-border">
						</div>
						<div class="box-body">

							<table class="table table-bordered">
								<tr>
									<th style="width: 10px">BNO</th>
									<th>TITLE</th>
									<th>WRITER</th>
									<th>REGDATE</th>
									<th style="width: 40px">VIEWCNT</th>
								</tr>


								<c:forEach items="${list}" var="AdminBoardVO">

									<tr>
										<td>${AdminBoardVO.adminboardNumber}</td>
										<td><a href='/FPBG/patch/AdminreadPage${pageMaker.makeSearch(pageMaker.cri.page) }&adminboardNumber=${AdminBoardVO.adminboardNumber}'>
										${AdminBoardVO.adminboardTitle}</a></td>
										<td>${AdminBoardVO.memNickName }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${AdminBoardVO.adminboardDate}" /></td>
										<td><span class="badge bg-red">${AdminBoardVO.adminboardViewCount }</span></td>
									</tr>

								</c:forEach>

							</table>

						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<a href="/FPBG/patch/Adminregister"><button
									class="btn btn-primary btn">글쓰기</button></a>
						</div>
						<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="Adminlist${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="Adminlist${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="Adminlist${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
						
						<!-- /.box-footer-->
						
						
						
					</div>
				</div>
				<!--/.col (left) -->

			</div>
			<!-- /.row --> </section>
			<!-- /.content -->


		</div>

	</div>

	<jsp:include page="../footer.jsp" />

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
	</script>
	<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "Adminlist"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

			});
	</script>
</body>
</html>