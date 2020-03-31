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

<title>미달성 업적 조회</title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<style type="text/css">
body {
	font-family: 굴림;
}


.container {
	display: flex;
	/* align-items: center; */  /*세로축에서 중앙*/
	justify-content: center; /*가로축에서 중앙*/
	flex-direction: column;
}

.content
{
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.items{
	border: 3px solid #34314c;
	border-radius: 5px;
	width: 100%;
	height: 180px;
	margin-bottom: 50px;
	margin-left: 30px;
	margin-right: 30px;
	padding-bottom: 10px; display : flex;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.inputBtn
{
	width: 100px;
	height: 80px;
	border : 3px solid #34314c !important;
	background-color: transparent;
	margin-left: 20px;
	margin-right: 20px;
	color: #353535;
	font-size: 10pt !important;
	font-weight: 800 !important;
	padding: 0px 0px 0px 0px !important; 
}

.activeBtn
{
	width: 100px;
	height: 80px;
	border : 3px solid #34314c !important;
	background-color: #34314c;
	margin-left: 20px;
	margin-right: 20px;
	color: white;
	font-size: 10pt !important;
	font-weight: 800 !important;
	padding: 0px 0px 0px 0px !important; 
}

.inputBtn:hover
{
	background-color: rgba(52, 49, 76, 0.10);
}

.item


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

$().ready(function()
{
	$("#backMenu").click(function()
	{
		location.href = "mypage.action";
	});
	
	$("#achiBtn").click(function()
	{
		location.href = "achievepage.action";
	});
	
	$("#backMenu").mouseenter(function()
	{
		$("#backMenu").css("color", "#ffc952");
	});
	
	$("#backMenu").mouseleave(function()
	{
		$("#backMenu").css("color", "#34314c");
	});
});

</script>


</head>
<body>
	<div style="background-color: #34314c; height: 115px;"></div>
	<div class="">
		<header>
			<!-- <h1 >헤더</h1> -->
			<jsp:include page="Header.jsp" />
		</header>
	</div>
	
	<div class="arrowDiv" style="display: flex; ">
		<div style='display:flex; width:100%; height: 50px; margin-top: 20px; margin-left: 20px;' align="center">
			<span class="fas fa-arrow-left"  style="font-size: 20pt; color: #34314c;"  id="backMenu"></span>
		</div>
	</div>
	
	<div class="navDiv" style="display: flex; align-items: center; justify-content: center;">
		
	</div>





	<div class="container">
		<section style="display: flex; justify-content: center;" >
			<input type="button" class="inputBtn" value="달성한 업적" id="achiBtn">
			<input type="button" class="activeBtn" value="미달성 업적">
		</section>
	
	
		<section class="content"  style="margin-top: 5px; padding-top: 30px;">
			
			<c:forEach var="acdto"  items="${acnlist }">
				<div class="items">
				<span style="font-size: 20pt; font-weight: bold; margin-bottom: 15px; margin-left: 70px;"> ${acdto.acName }</span>
				<span style="margin-left: 70px; font-weight: bold; "> ${acdto.require } ${acdto.requireNum }번</span>
					<!--  <div class="progress" style="align-self:center; width:90%; height: 40px; border-radius: 15px; border: 2px solid #34314C;">
						<div class="progress-bar bg-warning progress-bar-striped" role="progressbar" 
						style=" width: 100%; color:black;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
						</div>
					</div> -->
				
				</div>
			</c:forEach>
			
			
			<!--  	<div class="items">
					<span style="font-size: 20pt; font-weight: bold; margin-bottom: 15px; margin-left: 70px;"> 업적 명 </span>
					<span style="margin-left: 70px; font-weight: bold; "> 업적 조건 (3/3)</span>
					<div class="progress" style="align-self:center; width:90%; height: 40px; border-radius: 15px; border: 2px solid #34314C;">
						<div class="progress-bar bg-warning progress-bar-striped" role="progressbar" 
							 style=" width: 100%; color:black;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
						</div>
					</div>
				
				</div> -->
				

		</section>
	</div>



</body>
</html>