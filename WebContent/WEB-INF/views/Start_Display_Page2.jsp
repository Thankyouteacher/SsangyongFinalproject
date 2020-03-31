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
		<dl style="width: 50%; height: 10%; margin: 50px auto;" align="center">
			<h3>원하는 인원을 선택하세요.</h3>
		</dl>
		<div style="width: 95%; height: 20%; margin: 10px auto;" align="center" class="d-flex justify-content-center mb-3">
			<c:forEach var="member" items="${member }">
				<label class="user" for="${member.usId}" style="width: 12.5%; height: 100%;">
					<div style="width: 100%; height: 100%;">
						<div style="height: 70%;">
							<i class="fas fa-user" style="font-size: 60pt; margin: 12px auto;"></i>
						</div>
						<div style="height: 30%;">
							<div style="width: 35%; height: 100%; float: left;">
								<span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${member.usLv }</span>
							</div>
							<div style="width: 30%; height: 100%; float: left;" align="center">
								<span>${member.nickName }</span>
							</div>
							<div style="width: 35%; height: 100%; float: right;">
								<a href="member_info_pro.action?member=${member.usId }" style="float: left;">
									<!-- 이 부분 모달팝업으로 정보 링크 걸어야 함 -->
									<i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
								</a>
							</div>
						</div>
					</div>
				</label>
			</c:forEach>
		</div>
		<div style="width: 16%; height: 10%; float: right; margin: 50px 0 0 0;">
			<nav>
				<ul class="pager">
					<li><a href="#" id="next" style="width: 100%;">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<form action="start_display_page3.action" id="myForm">
		<c:forEach var="member" items="${member }">
			<input type="radio" id="${member.usId }" name="selecter" value="${member.usId}" style="height: 10px; display: none;" />
		</c:forEach>
	</form>

</body>
</html>