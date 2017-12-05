<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="/FPBG/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
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

						<form role="form" action="AdminmodifyPage" method="post" id="frm">

							<input type='hidden' name='page' value="${cri.page}"> 
							<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
							<input type='hidden' name='searchType' value="${cri.searchType}">
							<input type='hidden' name='keyword' value="${cri.keyword}">

							<div class="box-body">

								<div class="form-group">
									<label for="exampleInputEmail1">BNO</label> <input type="text"
										name='adminboardNumber' class="form-control" value="${AdminBoardVO.adminboardNumber}" readonly="readonly">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Title</label> <input
										type="text" name='adminboardTitle' class="form-control" value="${AdminBoardVO.adminboardTitle}" id="board-Title">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Content</label>
									<%-- <textarea class="form-control" name="adminboardContent" rows="3">${AdminBoardVO.adminboardContent}</textarea> --%>
									<textarea class="form-control" name="adminboardContent" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;">${AdminBoardVO.adminboardContent}</textarea>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Writer</label> <input
										type="text" name="memNickName" class="form-control"
										value="${AdminBoardVO.memNickName}" readonly="readonly">
								</div>
							</div>
							<!-- /.box-body -->
						</form>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary" id="smartSubmit">SAVE</button>
							<button type="button" class="btn btn-warning" id="listBtn">CANCEL</button>
						</div>

<script>
 	$(document).ready(function() {
	 
	/* var formObj = $("form[role='form']");
	
	console.log(formObj);
	 */
	$(".btn-warning").on("click",function() {
	self.location = "/FPBG/patch/AdminlistPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
			+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
	/* $(".btn-primary").on("click",function() {
	formObj.submit(); 
	}); */
	var editor_object = [];

	nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/FPBG/resources/smarteditor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
	        }
    });
	
	$("#smartSubmit").click(function(event){
		editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var board_Title = $("#board-Title").val();
		var smarteditor = $("#smarteditor").val();
		
		if(isEmpty(board_Title)){
			alert('제목을 확인해주세요');
		}else if(isEmpty(smarteditor)){
			alert('내용을 확인해주세요');
		}else{ 
			$("#frm").submit();
		} 
	});
	
		$('#listBtn').on("click",function(event) {
		location.href ="/FPBG/patch/Adminlist";
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