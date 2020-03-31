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
<title>질문 게시판</title>

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
			
			$(location).attr('href', 'searchboard.action?bid=1&category=' + category + "&content=" + content);
		});
		
		$('#write').click(function()
		{
			$(location).attr('href', 'boardwrite.action?bid=1');
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

	<div class="container">
		<p class="h1" style="font-weight: bold;"><a href="board.action?bid=1" style="color: black; text-decoration: none">질문 게시판</a></p>
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
			<button type="button" class="searchBtn" style="background-color: white"><i class="fas fa-search fa-2x" style="color: #34314c"></i></button>
		</div>
		
		<br /><br />
		<div class="col-md-3 float-left" style="width: 300px;">      
			<div class="col-10">
				<div class="list-group" id="list-tab" role="tablist">
				<c:forEach var="boardName" items="${boardName }" varStatus="status">
					<a href="#" id="${status.count }" class="board list-group-item list-group-item-action">${boardName.bname } 게시판</a>
				</c:forEach>					
				</div>
			</div>
		</div>
		
		<div class="col-md-9 float-right" style="width: 850px;">
			<table class="table table-hover table-striped" style="text-align: center;">
				<thead id="thead" style="text-align: center;">
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">등록일</th>
						<th style="text-align: center;">조회수</th>
						<th style="text-align: center;">답변 채택</th>
					</tr>
				</thead>
				<tbody id="tbody" style="text-align: right;">
					<c:forEach var="questionList" items="${questionList }">					
					<tr onclick="location.href='boardread.action?bid=${questionList.bid }&bpid=${questionList.bpid }'">
						<th style="text-align: center;">${questionList.bpid }</th>
						<th style="text-align: center;">${questionList.postTitle }</th>
						<th style="text-align: center;">${questionList.nickName }</th>
						<th style="text-align: center;">${questionList.createDate }</th>
						<th style="text-align: center;">${questionList.click }</th>
						<c:if test="${questionList.selectid != 0}">
							<th style="text-align: center;"><i class="fas fa-check" style="color: green;"></i></th>
						</c:if>
						<c:if test="${questionList.selectid == 0}">
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
	
	
	
</body>
</html>