<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의게시판 게시글 작성</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/classic/ckeditor.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- ckEditor 크기 조절 -->
<style type="text/css">
.ck.ck-editor
{
	max-width: 850px;
}
.ck-editor_editable
{
	min-height: 500px;
}
</style>

</head>
<script type="text/javascript">

	$(document).ready(function()
	{
		//제목 글자 수 byte 받아오기.
		$('#subjectHelp').on('keyup', function()
		{
			if($(this).val().length > 200)
			{
				$(this).val($(this).val().substring(0,200));
			}
		});
		
		// 제목 글자 수 입력 제한(200byte)	
		$(document).on('keyup', '#subjectHelp', function(e)
		{
			var textarea = $(this).val();
			$('#postTitle').text(getSubject(textarea));
		});
		
		function getSubject(str)
		{
			var count = 0;
			for(var i=0; i<str.length; i++)
			{
				count += (str.charCodeAt(i) > 200) ? 2 : 1;
			}
			return count;
		}
		
		$('.board').click(function()
		{
			var test = $(this).text();
			
			if (test == '질문 게시판')
			{
				$(location).attr('href', 'board.action?bid=1');
			}
			
			else if (test == '정보 게시판') 
			{
				$(location).attr('href', 'board.action?bid=2');
			}
			
			else if (test == '자유 게시판') 
			{
				$(location).attr('href', 'board.action?bid=3');
			}
			
			else if (test == '건의 게시판')
			{
				$(location).attr('href', 'board.action?bid=4');
			}
		});
		
		$('#write').click(function()
		{
			$(location).attr('href', 'boardwrite.action?bid=4');
		});
		
		$('.secret').change(function()
		{
			if($(this).is(':checked'))
			{
				// alert('비밀글 체크됨!');
				$('.select').val(1);
			}
		});
		
		$('#write').click(function()
		{
			$(location).attr('href', 'boardwrite.action?bid=3');
		});
		
		ClassicEditor.create(document.querySelector( '#editor' ));
	});

</script>

<body>
	<!-- Header -->
	<div style="background-color: #34314c; height: 115px;"></div>
	<div class="container">
		<header>
			<jsp:include page="Header.jsp" />
		</header>
	</div>
	
	<br />
	<br />

	<div class="container">
		<p class="h1" style="font-weight: bold;"><a href="board.action?bid=4" style="color: black; text-decoration: none">건의 게시판</a></p>
	</div>

	<br />
	<br />

	<div class="container">

		<div class="row col-md-3 float-left" style="width: 300px;">
			<div class="col-10">
				<div class="list-group" id="list-tab" role="tablist">
				<c:forEach var="boardName" items="${boardName }" varStatus="status">
					<a href="#" id="${status.count }" class="board list-group-item list-group-item-action">${boardName.bname } 게시판</a>
				</c:forEach>					
				</div>
			</div>
		</div>

		<p class="h3" style="color: black">게시글 작성</p>
		<br /><br />

		<div class="col-md-9 float-right" style="width: 850px;">
			<form action="boardinsert.action" method="POST" role="form">
				<div class="form-group" style="font-style: bold;">
					<label>제목</label> 
					<input type="text" name="postTitle" id="subjectHelp" class="form-control" 
						placeholder="100자 이내만 입력하세요." style="background-color: rgba(255, 255, 255, 0.5)">
				</div>
				
				<br />
				
				<div class="float-right">
					<p class="byte" style="margin-bottom: 0px;"><span id="postTitle">0</span>/200 byte</p>
				</div>
				
				<div class="form-group">
					<label>내용</label>
						<textarea name="content" id="editor"></textarea>
				</div>
				
				<input type="text" name="bid" value="${bid }" hidden/>
				<input tpee="text" name="usId" value="${usId }"	hidden/>
				
				<br />
				<div class="custom-control custom-switch">
				    <input type="checkbox" class="custom-control-input secret" id="customSwitch1">
				    <label class="custom-control-label" for="customSwitch1" style="padding-left: 10px;">비밀글 선택</label>
				    <input type="text" class="select" value="0" name="ssid" hidden/>
				</div>
				
				<br />
				
				<button type="submit" class="btn float-right"
					style="width: 90px; height: 40px; background-color: #34314c; color: white;">확인</button>
					
				<button type="button" class="btn float-center"
					style="width: 90px; height: 40px; background-color: #79bd9a; color: white;" onclick="location.href='board.action?bid=4'">목록으로</button>	
					

			</form>
					
			<br /><br /><br /><br /><br /><br /><br /><br />	
		</div>
	</div>

</body>
</html>