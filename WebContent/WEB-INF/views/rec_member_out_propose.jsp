<%@page import="java.io.File"%>
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
<title>member_out_propose.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">

#situation
{
	color: gray;
	border: 2px solid #34314c;
	background-color: white;
}

#situation:hover
{
	color: black;
	/* background-color: #47b8e0; */
}

</style>

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
			$("#myForm").submit();
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
		<div style="width: 95%; height: 20%; margin: 10px auto;" align="center" class="d-flex justify-content-center mb-3">
			<div style="flex-grow: 1;">
				<div style="width: 120px; height: 100%;">
 					<div style="height: 70%;">
						<img src="<%=cp %>/profilePhoto/member${memberInfo.usId }/${memberInfo.usPhoto}" style="width: 80px; height: 80px; border-radius: 40px; margin: 12px auto;" onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
					</div>
						
					<div style="display:flex; align-items:left;  height: 30%;">
						<div style="width: 20px; height: 100%; float: left;">
							<span style="float: right; background-color: #79bd9a; color:white; border: 1px; border-radius: 5px; font-size: 13pt; width: 25px; height: 25px;">${memberInfo.usLv }</span>
						</div>
						<div style="width: 80px; height: 100%; float: left; color: black;" align="center">
							<span>${memberInfo.nickName }</span>
						</div>
						<div style="width: 20px;" align="left">
							<form action="member_info.action?member=${memberInfo.usId }&pid=${memberInfo.pid }&usId=${usId}" method="post">
								<input type="hidden" value="${memberInfo.usId }" name="member" id="member">
								<input type="hidden" value="${memberInfo.pid }" name="pid" id="pid">
								<input type="hidden" value="${usId }" name="usId" id="usId">
								<button id='situation' type="submit" class="fas fa-info-circle" style="font-size: 13pt; border: none; height: 25px; text-align: center;"></button>
							</form>
						</div>
					</div>
				</div>
 			</div>
		</div>
		<form action="rec_member_out_propose_ok.action" id="myForm">
		<div style="width: 50%; height: 20%; margin: 10px auto;">
			<div style="width: 100%; height: 50%; font-size: 30px; padding-top: 2%;" align="center">퇴출하려는 사유를 입력하세요</div>
			<div style="width: 100%; height: 50%; padding: 2%;">
				<input type="text" id="preason" name="preason" style="width: 100%; height: 100%;">
			</div>
		</div>
		<div style="width: 50%; height: 30%; margin: 0 auto;" align="center">
			<h1 style="font-weight: bold; color: #3b8686">[꼭 알아두세요!]</h1>
			<h1>
				'투표 종료' 예정 기간은 <span style="color: #E53A40;">${memberOutVoteEnd }</span> 입니다.
			</h1>
			<h1>
				1.투표를 하지않고 나가게되면 <span style="color: #E53A40;">'무효'</span>로 처리됩니다.
			</h1>
			<h1>
				2. 투표 미실시의 경우, 투표종료 기간이 되면 자동으로 <span style="color: #E53A40;">'무효'</span>로 처리되며,
				<br> 과반수 찬성일 경우 팀원이 퇴출됩니다.
			</h1>
		</div>

		<div style="/* background-color:red; */ width: 16%; height: 10%; margin: 0 auto;" align="center">
			<button type="button" id="next" style="width: 100%;">투표 발의</button>
		</div>
	</div>
		<input type="text" name="pid" value="${memberInfo.pid }" hidden>
		<input type="text" id="${memberInfo.usId }" name="usId" value="${memberInfo.usId}" style="height: 10px; display: none;" />
		<input type="text" id="${member }" name="member" value="${member}" style="height: 10px; display: none;" />
	</form>

</body>
</html>