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
							<h3 class="box-title">REGISTER BOARD</h3>
						</div>
						<!-- /.box-header -->

						<form role="form" method="post">
							<input type="hidden" value="${ sessionScope.vo.memNickName }" name='memNickName'>
							<input type="hidden" value="${ sessionScope.vo.memNumber }" name='memNumber'>
							<div class="box-body">
								<div class="form-group">
									<label for="exampleInputEmail1">Title</label> <input
										type="text" name='boardTitle' class="form-control"
										placeholder="Enter Title">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Content</label>
									<textarea class="form-control" name="boardContent" rows="5"
										placeholder="Enter ..."></textarea>
								</div>

							</div>
							<!-- /.box-body -->

							<div class="box-footer">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>


					</div>
					<!-- /.box -->
				</div>
				<!--/.col (left) -->

			</div>
			<!-- /.row --> 
			</section> <!-- Main content -->
		</div>
	</div>


	<jsp:include page="../footer.jsp" />
</body>
</html>