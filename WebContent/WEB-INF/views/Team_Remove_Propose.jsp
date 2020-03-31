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
<title>팀해체투표</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{

		$(".user", this).click(function()
		{
			$(".user").css('background-color', 'white');
			$(this).css('background-color', '#79bd9a');
		});

		$("#next").click(function()
		{
			$(location).attr("href","team_remove_propose_ok.action");
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

	<div style="width: 90%; height: 800px; margin: 0 auto;">
		<div style="width: 50%; height: 30%; margin: 0 auto; margin-top: 5%;" align="center">
			<h1 style="font-weight: bold; color: #3b8686">[꼭 알아두세요!]</h1>
			<h1>
				'투표 종료' 예정 기간은 <span style="color: #E53A40;">${voteEnd }</span> 입니다.
			</h1>
			<h1>
				1. 투표를 하지않고 나가게되면 <span style="color: #E53A40;">'무효'</span>로 처리됩니다.
			</h1>
			<h1>
				2. 투표 미실시의 경우, 투표종료 기간이 되면 자동으로 <span style="color: #E53A40;">'무효'</span>로 처리되며,
				<br> 과반수 찬성일 경우 팀이 해체됩니다.
			</h1>
			<h1>
				3. 팀이 해체되면, 프로젝트 기록은 전부 삭제됩니다.
			</h1>
		</div>

		<div style="/* background-color:red; */ width: 16%; height: 10%; margin: 0 auto;" align="center">
			<button type="button" id="next" style="width: 100%;">투표 발의</button>
		</div>
	</div>

</body>
</html>