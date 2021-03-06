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

					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">LIST ALL PAGE</h3>
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


								<c:forEach items="${list}" var="boardVO">

									<tr>
										<td>${boardVO.boardNumber}</td>
										<td><a href='/FPBG/board/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&boardNumber=${boardVO.boardNumber}'>
										${boardVO.boardTitle}</a></td>
										<td>${boardVO.memNickName }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${boardVO.boardDate}" /></td>
										<td><span class="badge bg-red">${boardVO.boardViewCount }</span></td>
									</tr>

								</c:forEach>

							</table>

						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<a href="/FPBG/board/register"><button
									class="btn btn-primary btn">글쓰기</button></a>
						</div>
						<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
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
</body>
</html>