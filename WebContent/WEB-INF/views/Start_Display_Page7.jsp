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
<title>모드선택</title>
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

		<div style="height: 8%; margin: 0 auto;">
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

		</div>
		<div style="width: 60%; height: 40%; margin: 100px auto;" align="center">
			<h3>팀장이 모드를 설정하고 있어요.</h3>
			<h3>설정이 완료되면 팀 프로젝트 페이지로 넘어가게 됩니다.</h3>
			<br>
			<br>
			<h1 style="font-weight: bold; color: #3b8686">[꼭 알아두세요!]</h1>
			<h1>
				<span style="color: #47b8e0">가이드 챌린지 모드</span>
				<span style="color: #47b8e0">알리미 모드</span>
				에서 정해진 수행과제 제출 기간을 넘기게 되면 할당된 경험치가 조금씩 삭감되니 주의하세요!
			</h1>
		</div>
	</div>
</body>
</html>