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
<title>Insert title here</title>
<style type="text/css">
.hovItem:hover {
	color: #ffc952 !important;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$().ready(function()
	{
		$("#logoutTag").click(function()
		{
			$("#logoutForm").submit();
		});
	});
	
	function updatealarm()
	{
		alert("다음 업데이트를 기대해주세요!");
	}
</script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
	<header id="header">
		<div style="width: 100%; height: 100%;">
			<!-- class="navbar navbar-fixed-top"  -->
			<div style="width: 30%; height: 100%; float: left;" align="center">
			
			<c:if test="${usId==0 }">
				<a href="doproject.action">
					<img src="<%=cp%>/images/logo.png" style="width: 15%; height: 100%;" />
				</a>
			</c:if>	
			<c:if test="${usId>0}">
				<a href="mainpage.action">
					<img src="<%=cp%>/images/logo.png" style="width: 15%; height: 100%;" />
				</a>
			</c:if>				
				
				
			</div>

			<div class="d-flex justify-content-center" style="width: 40%;/*  background-color: blue;  */float: left;">
				<a href="moziplist.action" style="font-size: 15pt;">Project</a>
				<a href="#" style="font-size: 15pt;" onclick="updatealarm()">Contest</a>
				<!-- <a href="elements.html" style="font-size: 15pt;">Board</a> -->
				<ul style="list-style: none;" class="nav">
					<li class="nav-item dropdown" ><a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="font-size: 15pt;">Board</a>
						<div class="dropdown-menu" style="z-index: 14000 !important;">
							<a class="dropdown-item hovItem" href="board.action?bid=3">자유 게시판</a>
							<a class="dropdown-item hovItem" href="board.action?bid=1">질문 게시판</a>
							<a class="dropdown-item hovItem" href="board.action?bid=2">정보 게시판</a>
							<a class="dropdown-item hovItem" href="board.action?bid=4">건의 게시판</a>
						</div></li>
				</ul>
			</div>


			<c:choose>
				<c:when test="${usId > 0}">
					<div style="width: 30%; height: 100%; float: left;">
						<div style="width: 50px; float: left;"><img src="<%=cp%>/profilePhoto/member${usId }/${usPhoto}" style="width: 60px; height: 60px; border-radius: 30px; border: 2px solid #34314C;"onerror="this.src = '<%=cp %>/profilePhoto/default.png'"></div>
						<c:choose>
							<c:when test="${not empty adminId}">
							<div class="d-flex justify-content-around" style="width:200px; float: left;  margin-left: 65px;">
								<div style="margin-left: 5px; text-align: left; font-size: 15pt;">Admin</div>
								<a href="receive.action">
									<span style="font-size: 15pt; margin-left: 15px;">AdminPage</span>
								</a>
								<form action="logout.action" method="post" id="logoutForm">
									<a href="#" id="logoutTag">
										<span style="font-size: 15pt; margin-left: 15px;">Logout</span>
									</a>
								</form>
							</div>
							</c:when>
							<c:otherwise>
							<div class="d-flex justify-content-around" style="margin-left: 10px; width:280px; float: left;">
								<span style="text-align: left; font-size: 15pt;">${nickName } 님</span>
								<a href="mypage.action">
									<span style="font-size: 15pt;">MyPage</span>
								</a>
								<form action="logout.action" method="post" id="logoutForm">
									<a href="#" id="logoutTag">
										<span style="font-size: 15pt;">Logout</span>
									</a>
								</form>
							</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:when>

				<c:otherwise>
					<div style="width: 30%; height: 100%; float: left;" align="center">
						<a href="loginform.action" style="font-size: 15pt; ">Login</a>
						<a href="prejoin.action" style="font-size: 15pt;">Join</a>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</header>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>