<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<h3 class="box-title">MODIFY BOARD</h3>
						</div>
						<!-- /.box-header -->

						<form role="form" action="modifyPage" method="post">

							<input type='hidden' name='page' value="${cri.page}"> 
							<input type='hidden' name='perPageNum' value="${cri.perPageNum}">

							<div class="box-body">

								<div class="form-group">
									<label for="exampleInputEmail1">BNO</label> <input type="text"
										name='boardNumber' class="form-control" value="${boardVO.boardNumber}" readonly="readonly">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Title</label> <input
										type="text" name='boardTitle' class="form-control" value="${boardVO.boardTitle}">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Content</label>
									<textarea class="form-control" name="boardContent" rows="3">${boardVO.boardContent}</textarea>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Writer</label> <input
										type="text" name="memNickName" class="form-control"
										value="${boardVO.memNickName}" readonly="readonly">
								</div>
							</div>
							<!-- /.box-body -->
						</form>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">SAVE</button>
							<button type="submit" class="btn btn-warning">CANCEL</button>
						</div>

<script>
 $(document).ready(function() {
	 
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-warning").on("click",function() {
	self.location = "/FPBG/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
	});
	
	$(".btn-primary").on("click",function() {
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
			<!-- /.content -->
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>