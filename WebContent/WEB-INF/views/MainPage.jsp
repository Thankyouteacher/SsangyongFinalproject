<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html>
<head>
<title>Do Project!</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/main.css">
</head>
<body class="">

	<!-- Header -->
	<jsp:include page="Header.jsp" />

	<!-- Banner -->
	<section id="banner">
		<div class="inner">

			<header>
				<h1>Welcome to "Do Project!"</h1>
			</header>
			<div class="flex ">

				<div>
					<span class="fas fa-chalkboard-teacher"
						style="font-size: 30pt; color: #79bd9a;"></span>
					<h3>Project</h3>
					<p style="font-size : 15pt; ">사람들과 새로운 프로젝트 경험을</p>
				</div>
				
				<div>
					<span class="fas fa-rocket"
						style="font-size: 30pt; color: #79bd9a;"></span>
					<h3>Contest</h3>
					<p style="font-size : 15pt; ">조금 더 높은 곳을 목표로</p>
				</div>

				<div>
					<span class="fas fa-user-friends" style="font-size: 30pt; color: #79bd9a;"></span>
					<h3>Board</h3>
					<p style="font-size : 15pt; ">나누고 싶은 이야기가 있다면</p>
				</div>

			</div>


		</div>
	</section>


	<!-- Three -->
	<section id="three" class="wrapper align-center">
		<div class="inner">
			<div
				style="display: flex; flex-direction: column; justify-content: center;"
				align="center">

				<article style="margin-bottom: 100px;">
					<header>
						<h3>
							<Strong>" ${projectNum } "</Strong><br> 현재까지 진행된 프로젝트의 수
						</h3>
					</header>
					<div style="background-color: red; margin: 0 auto; margin-top: 20px; width: 600px; height: 350px;">
						<img src="<%=cp %>/mainpage/main1.jpg" style="width: 100%; height: 100%; border-radius: 5px;">
					</div>
				</article>

				<article style="margin-bottom: 100px;">
					<header>
						<h3>
							<Strong>프로젝트 </Strong><br> 사람들과 새로운 프로젝트 경험을 가져보세요
						</h3>
					</header>
					<div style="background-color: red; margin: 0 auto; margin-top: 20px; width: 600px; height: 350px;">
						<img src="<%=cp %>/mainpage/main2.png" style="width: 100%; height: 100%; border-radius: 5px;">
					</div>
				</article>

			</div>
		</div>

		<div align="center"
			style="margin-right: 25px; margin-top: 50px; margin-bottom: 0px;">
			<a href="#header"><span class="glyphicon glyphicon-triangle-top"></span></a>
		</div>
	</section>




	<!-- Footer -->
	<footer id="footer">
		<div class="inner" style="height: 100px">

			<h3>사이트 정보</h3>

			<div class="copyright">© Programming: 쌍용교육센터 1팀</div>
			<div class="copyright">
				© Design Ref: <a href="https://templated.co">TEMPLATED</a>. Images:
				<a href="https://unsplash.com">Unsplash</a>.
			</div>

		</div>
	</footer>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>


	<div id="navPanel">
		<a href="index.html"
			style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Home</a> <a
			href="generic.html"
			style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Generic</a> <a
			href="elements.html"
			style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Elements</a> <a
			href="#navPanel" class="close"
			style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></a>
	</div>
</body>
</html>