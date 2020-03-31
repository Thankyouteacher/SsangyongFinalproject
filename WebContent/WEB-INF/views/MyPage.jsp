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

<title>마이 페이지</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

<style type="text/css">
body {
	font-family: 굴림;
}

.universal {
	margin-top: 50px;
	display: flex;
	flex-direction: column;
	margin-bottom: 300px;
	align-items: center;
	justify-content: center;
}

.container {
	display: flex;
	/* align-items: center; */ /*세로축에서 중앙*/
	justify-content: center; /*가로축에서 중앙*/
	display: flex;
}

.items {
	/* border: 1px solid tomato; */
	display: flex;
	flex-direction: column;
	align-items: center;
}

.subitems {
	display: flex;
	align-items: center;
	justify-content: center;
}

.thirditems {
	border: 3px solid #34314c;
	border-radius: 5px;
	width: 350px;
	height: 120px;
	margin-bottom: 30px;
	margin-left: 30px;
	margin-right: 30px;
	padding-bottom: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	display: flex;
	/* align-items: center; */
}

.restitems {
	width: 350px;
	height: 120px;
	margin-bottom: 30px;
	margin-left: 30px;
	margin-right: 30px;
	padding-bottom: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	display: flex;
	/* align-items: center; */
}

.thirditems:hover, .thirditems:focus {
	border: 3px solid #ffc952;
	background-color: rgba(255, 201, 81, 0.03);
}

.pUpBtn
{
	background-color: rgba(52,49,76,0.8);
}

.status {
	border: 5px solid #34314c;
	border-radius: 5px;
	width: 900px;
	margin-bottom: 70px;
	margin-left: 10px;
	margin-right: 10px;
}

.subjectText {
	font-size: 15pt;
	font-weight: bold;
	color: #34314C;
	margin-top: 5px;
	margin-bottom: 10px;
}

.subjectText_sub {
	color: #353535;
	font-size: 12pt;
	margin-left: 15px;
}

.profile {
	width: 150px;
	margin: 10px 0px 10px 30px;
	border-radius: 5px;
	/* padding-right: 0px; */
}

.nickName, .uLevel {
	font-size: 20pt;
	font-weight: bold;
	color: #34314C;

	/* margin-top: 5px;
	margin-bottom: 10px; */
}

.a {
	text-decoration: none;
	color: #353535;
}

label {
	margin: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$().ready(function()
	{
		$("#myProfile").click(function()
		{
			location.href = "prechangeinfo.action";
		});

		$("#myAchieve").click(function()
		{
			location.href = "achievepage.action";
		});

		$("#myContest").click(function()
		{
			alert("다음 업데이트를 기대해주세요!");
		});

		$("#myRecord").click(function()
		{
			alert("다음 업데이트를 기대해주세요!");
		});

		$("#myProject").click(function()
		{
			location.href = "projecting.action";
		});

		$("#myBoard").click(function()
		{
			location.href = "boardcollection.action";
		});

		$("#profileBtn").mouseenter(function()
		{
			$("#profileBtn").css("color", "#ffc952");
		});

		$("#profileBtn").mouseleave(function()
		{
			$("#profileBtn").css("color", "#34314c");
		});

		$("#profileBtn").click(function()
		{
			$("#profilePhoto").submit;
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

	<div class="universal">
		<div class="container">
			<section class="content">

				<div class="items status" style="display: flex; flex-direction: row;">
					<!-- 프사 -->
					<div class="profile" style="width: 25%;">
						<form action="profilephoto.action" id="profilePhoto" style="margin-bottom: 0px;" method="post" enctype="multipart/form-data">
							<label for="pfUpload" style="margin-top: 25px;">
								<img src="<%=cp%>/profilePhoto/member${usId }/${usPhoto}" style="width: 150px; height: 150px; border-radius: 75px; border: 2px solid #34314C;"onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
								<span class="fas fa-cog" style="font-size: 18pt; color: #34314c; margin-left: 130px; margin-top: -50px;" id="profileBtn"></span>
							</label>
							<input type="file" name="usPhoto" id="pfUpload" style="width: 0px;">
							<input type="submit" style="background-color: #34314c; color:white; margin-left: 16px;" class="pUpBtn" value="사진 변경 확인">
													
						</form>
					</div>
					<!-- 닉네임 레벨 경험치 -->
					<div style="display: flex; flex-direction: column; flex-grow: 1;">

						<div style="display: flex;">
							<div>
								<span class="nickName" style="margin-right: 100px; font-size: 21pt;">${nickName }</span>
							</div>
							<div>
								<span class="uLevel">Lv.${ulevel}</span>
							</div>
						</div>
						<div class="progress" style="width: 90%; height: 50px; margin-top: 20px; border-radius: 15px; border: 2px solid #34314C;">
							<div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: ${progress }%; color:black;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">　${progress }%</div>
						</div>
					</div>

				</div>

				<div class="items">
					<div class="subitems">
						<div class="thirditems" style="display: flex; flex-direction: column; justify-content: center;" id="myProfile">
							<span class="subjectText" style="text-align: center;"> 마이 프로필 </span>
							<ul style="list-style-type: none; margin: 0px 0px 0px 0px;">
								<li class="subjectText_sub">개인 정보 조회 및 수정</li>
								<li class="subjectText_sub">회원 탈퇴</li>
							</ul>
						</div>

						<div class="thirditems" style="display: flex; flex-direction: column; justify-content: center;" id="myAchieve">
							<span class="subjectText" style="text-align: center;"> 마이 업적 </span>
							<ul style="list-style-type: none; margin: 0px 0px 0px 0px;">
								<li class="subjectText_sub">달성 업적</li>
								<li class="subjectText_sub">미달성 업적</li>
							</ul>
						</div>

					</div>



					<div class="subitems" style="">
						<div class="thirditems" style="display: flex; flex-direction: column; justify-content: center;" id="myProject">
							<span class="subjectText" style="text-align: center;"> 마이 프로젝트 </span>
							<ul style="list-style-type: none; margin: 0px 0px 0px 0px;">
								<li class="subjectText_sub">프로젝트 현황</li>
							</ul>
						</div>

						<div class="thirditems" style="display: flex; flex-direction: column; justify-content: center;" id="myBoard">
							<span class="subjectText" style="text-align: center;"> 마이 게시글 </span>
							<ul style="list-style-type: none; margin: 0px 0px 0px 0px;">
								<li class="subjectText_sub">작성한 게시글 목록</li>
								<li class="subjectText_sub">작성한 댓글 목록</li>
							</ul>
						</div>
						<!--  -->
					</div>


					<div class="subitems" style="">
						<div class="thirditems" style="display: flex; flex-direction: column; justify-content: center;" id="myContest">
							<span class="subjectText" style="text-align: center;"> 마이 공모전 </span>
							<ul style="list-style-type: none; margin: 0px 0px 0px 0px;">
								<li class="subjectText_sub">내가 제안한 공모전</li>
								<li class="subjectText_sub">참여 중인 공모전</li>
							</ul>
						</div>

						<div class="thirditems" style="display: flex; flex-direction: column; justify-content: center;" id="myRecord">
							<span class="subjectText" style="text-align: center;"> 마이 기록 </span>
							<ul style="list-style-type: none; margin: 0px 0px 0px 0px;">
								<li class="subjectText_sub">활동 기록</li>
							</ul>
						</div>


					</div>

				</div>
			</section>
		</div>
	</div>
	<footer></footer>



</body>
</html>