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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$(".voteBtn").click(function()
		{
			$(location).attr("href","team_main.action");
		});
		
		$(".endBtn").click(function()
		{
			$(location).attr("href","#");
		});
		
		$(".recBtn").click(function()
		{
			var usId = $("#usId").val();
			var pid = $("#pid").val();

			$(location).attr("href","recruitment_project.action?pid=" + pid + "&usId=" + usId);
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
	<div style="width: 800px; height: 400px; margin: 0 auto; margin-top: 2%; /* background-color: red; */">
		<div style="width: 40%; height: 8%; /* background-color: yellow;  */margin: 0 auto;" align="center">
			<div style="width: 40%; height: 100%; font-size: 15pt;">
				<b>퇴출 투표 결과</b>
			</div>
		</div>
		<div style="/* background-color: gray; */ width: 40%; height: 50%; margin: 0 auto; margin-top: 10px; border: 2px solid; border-radius: 10px;" align="center" class="d-flex flex-column">
			<p style="font-weight: bold; font-size: 15pt; margin-top: 10px;">찬 성 &nbsp;&nbsp; : &nbsp;&nbsp; ${yes == null ? 0 : yes } 표</p>
			<p style="font-weight: bold; font-size: 15pt;">반 대 &nbsp;&nbsp; : &nbsp;&nbsp; ${no == null ? 0 : no } 표</p>
			<p style="font-weight: bold; font-size: 15pt;">무 효 &nbsp;&nbsp; : &nbsp;&nbsp; ${noAnswer == null ? 0 : noAnswer } 표</p>
		</div>
		<div style="width: 40%; height: 10%; margin: 0 auto; margin-top: 10px;" align="center">
			<span>" ${target} " ${message }</span>
			<br>
			<span>투표 종료 시간 : ${resultDate }</span>
		</div>
		<c:if test="${end==1}">
			<div style="width: 100%; height: 10%; margin-top: 3%;" align="center">
				<button type="button" class="endBtn" >메인페이지로</button>
			</div>
		</c:if>
		<c:if test="${end==0 }">
			<div style="width: 100%; height: 10%; margin-top: 3%;" align="center">
				<button type="button" class="voteBtn" >팀페이지로</button>
			</div>
		</c:if>
		
		<c:if test="${end==2 }">
			<div style="width: 100%; height: 10%; margin-top: 3%;" align="center">
				<button type="button" class="recBtn" >모집중 페이지로</button>
			</div>
		</c:if>
      
		<input type="hidden" value="${usId }" id="usId" name="usId">
		<input type="hidden" value="${pid }" id="pid" name="pid">
		
	</div>

</body>
</html>