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
<title>건의 게시판</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		$(".list-group-item", this).click(function()
		{
			$(this).parent().submit();
		});
		
		/* $('#board').addClass('active'); */
		
		/* if($('#board').text == '자유 게시판')
		{
			$(this).addClass('active');
		} */
		
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
		
		$('.searchBtn').click(function()
		{
			// 검색 카테고리 받아오기
			var category = $('option:selected').val();
			
			var content = $('.boardContent').val();
			
			$(location).attr('href', 'searchboard.action?bid=4&category=' + category + "&content=" + content);
		});
		
		$('#write').click(function()
		{
			$(location).attr('href', 'boardwrite.action?bid=4');
		});
		
		$('.checkusId').click(function()
		{
			// 작성자의 usId를 숨겨둔 th 태그에서 받아오기
			var creater = $(this).children().eq(5).html();
			
			// 비밀글 체크 여부를 숨겨둔 th 태그에서 받아오기
			var hideCheck = $(this).children().eq(6).html();
			
			// 현재 세션에 담겨져 있는 usID 받아오기
			var usId = $('#usId').val();
			
			if (creater != usId && hideCheck > 0)
			{
				alert('비밀글은 작성자 본인과 관리자만 볼 수 있습니다.');
			}
		});
		
	});

</script>

</head>

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
	<br />

	<div class="container">
		<p class="h1" style="font-weight: bold;"><a href="board.action?bid=4" style="color: black; text-decoration: none">건의 게시판</a></p>
	</div>

	<br />
	
	<div class="container">
		<div class="float-right" style="display: flex;">
			<select name="category" class="col-md-5" style="height: 38.5px;">
			   <option value="postTitle">제목</option>
			   <option value="content">내용</option>
			   <option value="nickName">작성자</option>
			</select>
			
			<input type="search" class="form-control col-md-5 boardContent" placeholder="Search" style="background-color: rgba( 255, 255, 255, 0.5 ); pointer-events: auto; width: 200px;">
			<button type="button" class="searchBtn"  style="background-color: white"><i class="fas fa-search fa-2x" style="color: #34314c"></i></button>
		</div>
		
		<br /><br />
		<div class="row col-md-3 float-left" style="width: 300px;">      
			<div class="col-10">
				<div class="list-group" id="list-tab" role="tablist">
				<c:forEach var="boardName" items="${boardName }" varStatus="status">
					<a href="#" id="${status.count }" class="board list-group-item list-group-item-action">${boardName.bname } 게시판</a>
				</c:forEach>					
				</div>
			</div>
		</div>
		
		<!-- 세션에 담긴 usId 를 받아와서 input 태그에 넣기 -->
		<input type="text" id="usId" value="${usId }" hidden/>
		
		<div class="col-md-9 float-right" style="width: 850px;">
			<table class="table table-hover table-striped">
				<thead id="thead" style="text-align: center;">
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">등록일</th>
						<th style="text-align: center;">조회 수</th>
						<th style="text-align: center;">비밀 글</th>
					</tr>
				</thead>
				<tbody id="tbody" style="text-align: right;">
					<c:forEach var="suggestList" items="${suggestList }">					
					<tr id="checkusId" class="checkusId" onclick="location.href='boardread.action?bid=${suggestList.bid }&bpid=${suggestList.bpid }&ssid=${suggestList.ssid }&usId=${suggestList.usId }'">
						<th style="text-align: center;">${suggestList.bpid }</th>
						<th style="text-align: center;">${suggestList.postTitle }</th>
						<th style="text-align: center;">${suggestList.nickName }</th>
						<th style="text-align: center;">${suggestList.createDate }</th>
						<th style="text-align: center;">${suggestList.click }</th>
						<th class="check" style="display: none;">${suggestList.usId }</th>
						<th class="hideCheck" style="display: none;">${suggestList.hideCheck }</th>
						<c:if test="${suggestList.hideCheck > 0 }">
							<th style="text-align: center;"><i class="fas fa-check" style="color: green;"></i></th>
						</c:if>
						<c:if test="${suggestList.hideCheck == 0 }">
							<th style="text-align: center;"><i class="fas fa-times" style="color: red;"></i></th>
						</c:if>
						
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr />
		</div>
		
		<div class="container" style="clear: both;" align="right">
				<button type="button" id="write" class="btn" style="width: 100px; background-color : #34314c; color: white">작성하기</button>
		</div>
		
			
		<div class="container" align="center" style="margin-left: 200px">
			<div style="clear: both;">
				<nav aria-label="Page navigation example"
					style="width: 300px;">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>	
			</div>						
		</div>
	</div>
	
	<br />
	<br />
	<br />
	<br />
	
</body>
</html>