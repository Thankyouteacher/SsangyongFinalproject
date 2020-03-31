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
<title>프로젝트모집게시판</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	.blankTop 
	{
		border-top: 2px solid black;
	}
	.blankBot 
	{
		border-bottom: 2px solid black;
	}
	.title 
	{
		text-align: left;
		font-size: 20pt;
		font-family: 나눔고딕코딩;
	}
	.in, #mainContent 
	{
		display: flex;
		text-align: center;
		position: relative;
	}
	input 
	{
		text-align: center;
	}
	#inputBackground 
	{
		background-color: #34314c;
		color: white;
	}
	#lineRemove 
	{
		display: flex;
		border: none;
		-webkit-box-shadow: none;
		box-shadow: none;
	}
	#selectSituation 
	{
		color: white;
		background-color: #34314c;
	}
	#situation 
	{
		color: black;
		border: 2px solid #34314c;
	}
	#situation:hover 
	{
		color: white;
		background-color: #47b8e0;
	}
	#enter 
	{
		width: 100%;
		margin-left: 50%;
		background-color: transparent;
		border: 2px solid #34314c;
		outline: none;
		color: #34314c;
		margin-left: 100px;
	}
	#enter:hover 
	{
		background-color: #47b8e0;
		color: white;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function()
	{
		$("#flip1").click(function()
		{
			$("#panel1").slideToggle("slow");
			$("#panel2").slideUp("slow");
			$("#panel3").slideUp("slow");
			$("#flip1").css("background-color", "#34314c").css("color", "white");
			$("#flip2").css("background-color", "transparent").css("color", "black");
			$("#flip3").css("background-color", "transparent").css("color", "black");
			
			if ($("#flip1").css("background-color") == "rgb(52, 49, 76)")
			{
				$("#flip1").css("background-color", "transparent").css("color", "black");
			} 
		});
		
		$("#flip2").click(function()
		{
			$("#panel2").slideToggle("slow");
			$("#panel1").slideUp("slow");
			$("#panel3").slideUp("slow");
			$("#flip2").css("background-color", "#34314c").css("color", "white");
			$("#flip1").css("background-color", "transparent").css("color", "black");
			$("#flip3").css("background-color", "transparent").css("color", "black");

			if ($("#flip2").css("background-color") == "rgb(52, 49, 76)")
			{
				$("#flip2").css("background-color", "transparent").css("color", "black");
			}
		});
		$("#flip3").click(function()
		{
			$("#panel3").slideToggle("slow");
			$("#panel1").slideUp("slow");
			$("#panel2").slideUp("slow");
			$("#flip3").css("background-color", "#34314c").css("color", "white");
			$("#flip1").css("background-color", "transparent").css("color", "black");
			$("#flip2").css("background-color", "transparent").css("color", "black");

			if ($("#flip2").css("background-color") == "rgb(52, 49, 76)")
			{
				$("#flip3").css("background-color", "transparent").css("color", "black");
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

		<br>
		
		<!-- 비회원 -->
		<c:if test="${usId == 0 }">
			<div>
				<div id="flip2" class="button" style="display: none;">나의 완료 프로젝트</div>
				<div id="flip1" class="button" style="display: none;">나의 진행 프로젝트</div>
				<div id="flip3" class="button" style="display: none;">나의 모집 프로젝트</div>
		
				<div id="panel1" class="button" style="display: none;"><jsp:include page="MyProcessButton.jsp" /></div>
				<div id="panel2" class="button" style="display: none;"><jsp:include page="MyFinishButton.jsp" /></div>
				<div id="panel3" class="button" style="display: none;"><jsp:include page="MyMozipButton.jsp" /></div>
			</div>
		</c:if>
		
		<!-- 회원 -->
		<c:if test="${usId != 0 }">
			<div>
				<div id="flip2" class="button">나의 완료 프로젝트</div>
				<div id="flip1" class="button">나의 진행 프로젝트</div>
				<div id="flip3" class="button">나의 모집 프로젝트</div>
		
				<div id="panel1" class="button"><jsp:include page="MyProcessButton.jsp" /></div>
				<div id="panel2" class="button"><jsp:include page="MyFinishButton.jsp" /></div>
				<div id="panel3" class="button"><jsp:include page="MyMozipButton.jsp" /></div>
			</div>
		</c:if>
		
		<br><br>
		
		<div style="display: flex;">
			<div id="lineRemove">
				<a href="moziplist.action?usId=${usId }" class="button" id="situation" style="width: 70px;">모집</a> 
				<a href="mozipaddlist.action?usId=${usId }" class="button" id="situation" style="width: 65px;">추가모집</a> 
				<a href="progresslist.action?usId=${usId }" class="button" id="situation" style="width: 70px;">진행</a> 
				<a href="finishlist.action?usId=${usId }" class="button" id="selectSituation" style="width: 70px;">완료</a>
			</div>

			<!-- 비회원 -->
			<c:if test="${usId == 0 }">
				<div style="display: none;">
					<jsp:include page="Project_Create_modal.jsp" ></jsp:include>
				</div>
			</c:if>
			<!-- 회원 -->
			<c:if test="${usId != 0 }">
				<div>
					<jsp:include page="Project_Create_modal.jsp" ></jsp:include>
				</div>
			</c:if>
			
		<br><br><br>
		</div>
		
		<div id="searchDiv">
			<jsp:include page="SearchFinish.jsp"></jsp:include>
		</div>	
		<section id="three" class="wrapper align-center">
			<div class="inner">
				<div class="flex-2">
					<jsp:include page="FinishContent.jsp"></jsp:include>
				</div>
			</div>
		</section>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>