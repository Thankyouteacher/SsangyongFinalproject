<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀장선출</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>

	<!-- Header -->
	<div style="background-color: #34314c; height: 115px;"></div>
	<div class="container">
		<header>
			<jsp:include page="Header.jsp" />
		</header>
	</div>
	<div style="background-color: white; width: 90%; height: 800px; margin: 0 auto;">
		<!-- <dl style="background-color: yellow; height: 8%;">
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">●</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">ㅡ</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">○</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">ㅡ</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">○</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">ㅡ</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">○</dd>
		
		</dl> -->

		<dl style="height: 8%; margin: 0 auto;">
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">●</div>
				<div style="height: 15%; font-size: 5pt" align="center">팀장선출</div>
				<div style="height: 15%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 1%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">-</div>
				<div style="height: 20%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">○</div>
				<div style="height: 15%; font-size: 5pt" align="center">모드선택</div>
				<div style="height: 15%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 1%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">-</div>
				<div style="height: 20%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">○</div>
				<div style="height: 15%; font-size: 5pt" align="center">과제선택</div>
				<div style="height: 15%; font-size: 5pt" align="center">(알리미)</div>
			</div>
			<div style="width: 1%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">-</div>
				<div style="height: 20%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">○</div>
				<div style="height: 15%; font-size: 5pt" align="center">일정선택</div>
				<div style="height: 15%; font-size: 5pt" align="center">(알리미)</div>
			</div>

		</dl>
		<dl style="width: 60%; height: 40%; margin: 100px auto;" align="center">
			<h3>프로젝트가 시작되기 위해선 팀장을 선출해야 해요.</h3>
			<h3>팀장을 선출하세요!</h3>
			<br>
			<br>
			<h1 style="font-weight: bold; color: #3b8686">[꼭 알아두세요!]</h1>
			<h1>
				'팀장 선출' 기간은 <span style="color: #ff7473;">${startVoteEnd }</span>까지 입니다.
			</h1>
			<h1>
				'팀장 선출'이 이루어지지 않을경우, <span style="color: #ff7473;">프로젝트는 종료</span>됩니다.
			</h1>

		</dl>
		<div style="width: 16%; height: 10%; float: right; margin: 50px 0 0 0;">
			<nav>
				<ul class="pager">
					<li><a href="start_display_page2.action" style="width: 100%;">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>