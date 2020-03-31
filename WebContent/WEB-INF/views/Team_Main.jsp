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
<title>Do!Project</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script>
	$(document).ready(function()
	{
		$("#flip").click(function()
		{
			$("#panel").slideToggle("slow");
		});
		
		
	});
</script>
<style>
#panel, #flip {
	padding: 5px;
	text-align: center;
	background-color: #34314c;
	border: solid 1px #34314c;
}

#panel {
	display: none;
}
</style>
</head>
<body style="margin-top: 0;">

	<!-- Header -->
	<div style="background-color: #34314c; height: 115px;"></div>
	<div class="container">
		<header>
			<jsp:include page="Header.jsp" />
		</header>
	</div>
	<div style="width: 100%; height: 800px; margin: 0 auto;">
		<jsp:include page="Info.jsp"></jsp:include>
		<div id="flip" style="width: 50px; margin: 0 auto; border: 0px; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px; background-color: #34314c; color: white;">info</div>
		<div id="teamtitle" style="width: 60%; height: 20%; margin: 0 auto; padding-top: 70px; position: relative;" align="center">
			<a href="team_main.action">
				<h2 style="font-weight: bold;">${progressInfo.ppName == null ? '팀명을정하세요' : progressInfo.ppName }</h2>
			</a>
		</div>
		<div  style="/* background-color: red; */ width: 100%; height: 15%; /* background-color:red; */ margin: 0 auto; position: relative; z-index: 1;">
			<div style="/* background-color:yellow; */ width: 50px; height: 40%; margin: 0 auto;">
				<a class="alarm" style="float: right; width: 100%; height: 26px; text-align: center;">
					<i class="fas fa-bell"></i>
				</a>
			</div>
			<jsp:include page="Calendar.jsp"></jsp:include>
		</div>
		<div style="width: 70%; height: 45%; margin: 0 auto; position: relative;">
			<div class="container">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#timeline">타임라인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#timelog">타임로그</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#report">수행과제</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#visitor">방명록</a>
					</li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content" style="height: 100%;">
					<div id="timeline" class="container tab-pane active" style="padding: 0 auto;">
						<jsp:include page="Search.jsp"></jsp:include>
						<jsp:include page="Timeline.jsp"></jsp:include>
					</div>
					<div id="timelog" class="container tab-pane fade">
						<div class="container">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item">
									<a class="nav-link" data-toggle="tab" href="#activitylog">활동로그</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-toggle="tab" href="#reportlog">수행과제로그</a>
								</li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content" style="height: 100%;">
								<div id="activitylog" class="container tab-pane fade">
									<br>
									<h3>타임로그</h3>
									<p>다음 업데이트를 기대해주세요!</p>
								</div>
								<div id="reportlog" class="container tab-pane fade">
									<br>
									<h3>수행과제로그</h3>
									<p>다음 업데이트를 기대해주세요!</p>
								</div>
							</div>

						</div>
					</div>
					<div id="report" class="container tab-pane fade">
						<jsp:include page="Report.jsp"></jsp:include>
						<input type="text" id="reportMessage" value="${reportMessage }" hidden>
					</div>
					<div id="visitor" class="container tab-pane fade"><jsp:include page="Visitor.jsp"></jsp:include></div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>