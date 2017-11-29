<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/FPBG/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
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

						<form role="form" method="post" id="frm">
							<input type="hidden" value="${ sessionScope.vo.memNickName }" name='memNickName'>
							<input type="hidden" value="${ sessionScope.vo.memNumber }" name='memNumber'>
							<div class="box-body">
								<div class="form-group">
									<label for="exampleInputEmail1">Title</label> <input
										type="text" name='boardTitle' class="form-control"
										placeholder="Enter Title" id="board-Title">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Content</label>
									<!-- <textarea class="form-control" name="boardContent" rows="5"
										placeholder="Enter ..."></textarea> -->
									<textarea class="form-control" name="boardContent" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
								</div>
							</div>
							<!-- /.box-body -->

							<div class="box-footer">
								<button type="button" class="btn btn-primary" id="smartSubmit">Submit</button>
								<button type="button" id='listBtn' class="btn btn-primary btn">목록보기</button>
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
	<script>
	
	$(function(){
    //전역변수선언
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
    		event.preventDefault();
    		editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
    		
    		var board_Title = $("#board-Title").val();
    		var smarteditor = $("#smarteditor").val();
    		
    		if(!board_Title){
    			alert('제목을 확인해주세요');
    		}else if(!smarteditor){
    			alert('내용을 확인해주세요');
    		}else{
	    		$("#frm").submit();
    		}
    		
    	});
    	
    	$('#listBtn').on("click",function(event) {
			location.href ="/FPBG/sboard/list";
		});
    	
	})
</script>
</body>
</html>