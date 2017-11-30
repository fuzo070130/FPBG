<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
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
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">닉네임</label> <input type="text"
									name='memNickName' class="form-control" value="${sessionScope.vo.memNickName}"
									readonly="readonly" id="memNickName">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">아이디</label> <input
									type="text" class="form-control"
									value="${sessionScope.vo.memID}" name="memID" id="modify-memID">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">이메일</label> <input
									type="text" name="memEmail" class="form-control"
									value="${sessionScope.vo.memEmail}" readonly="readonly" id="memEmail">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">디스코드</label> <input
									type="text" class="form-control"
									value="${sessionScope.vo.memDiscord}" id="modify-memDiscord">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">가입날짜</label> <input
									type="text" name="memReg" class="form-control"
									
									value="${sessionScope.vo.memReg}" readonly="readonly" id="memReg">
							</div>
							<input type="hidden" value=${sessionScope.vo.memNumber } name="memNumber" id="modify-memNumber">
						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<button type="button" class="btn btn-primary gomodifyMainBtn">회원수정</button>
							<button type="button" class="btn btn-primary godeleteBtn">회원탈퇴</button>
							<button type="button" class="btn btn-primary goListBtn">메인으로</button>
						</div>

<script>
$(document).ready(function(){
	
	$(".goListBtn").on("click", function(){
		location.href = "/FPBG";
	});
	
	$(".gomodifyMainBtn").on("click", function(){
		var memID = $("#modify-memID").val();
		var memDiscord = $("#modify-memDiscord").val();
		var memNumber = $("#modify-memNumber").val();
	 	$.ajax({
			type : 'patch',
			url : '/FPBG/Member/modify',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PATCH"
			},
			dataType : 'text',
			data : JSON.stringify({
				memID : memID,
				memDiscord : memDiscord,
				memNumber : memNumber
			}),
			success : function(result){
				if(result == 'succ') {
					alert('성공했습니다 재로그인 해주세요');
					location.href = "/FPBG";
				} else if(result == 'fail') {
					alert('수정에 실패했습니다');
					location.href = "/FPBG";
				}
			}
		});
	});
	
	$(".godeleteBtn").on("click", function(){
		var memNumber = $("#modify-memNumber").val();
	 	$.ajax({
			type : 'delete',
			url : '/FPBG/Member/delete/' + memNumber,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result){
				if(result == 'succ') {
					alert('탈퇴에 성공했습니다 이용해주셔서 감사합니다');
					location.href = "/FPBG";
				} else if(result == 'fail') {
					alert('탈퇴에 실패했습니다');
					location.href = "/FPBG";
				}
			}
		});
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
		<!-- /.content-wrapper -->

	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>