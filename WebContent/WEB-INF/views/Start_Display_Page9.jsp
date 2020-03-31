<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.team1.pro.ing.IProjectDAO"%>
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
<title>과제선택(알리미)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		
		$("#next").click(function()
		{
			routine = $("#routine").val();
			routineSel = $("#routineSel option:selected").text();
			str = routine + " : " + routineSel + "\n";
			if($("#meeting").prop("checked"))
			{
				meeting = $("#meeting").val();
				meetingSel = $("#meetingSel option:selected").text();
				str += meeting + " : " + meetingSel + "\n";
			}
			
			test = "-------------------\n";
			
			$("input:checked").each(function() {
				test += $(this).val() + "\n";

			});
			
			str += test;
			 
			
			confirm(str);
			
			/* $("#myForm").submit(); */
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
		<div style="width: 80%; height: 50%; margin: 100px auto;" align="center">
			<form action="start_display_page10.action" method="get" id="myForm">
				<div style="width: 50%; height: 100%; float: left;">
					<div class="d-flex flex-column" style="width: 70%; height: 60%; margin: 0 auto;">
						<div>
							<input type="checkbox" id="routine" value="업무일지" style="display: none;" checked="checked" disabled="disabled">
							<label for="routine" style="float: left;">업무일지</label>
							<select style="float: right; height: 70%" id="routineSel">
								<option value="">선택하세요.</option>
								<c:forEach var="frequency" items="${reportFrequency }">
									<c:if test="${frequency==0 }">
										<option value="${frequency }">자유롭게 등록</option>
									</c:if>
									<c:if test="${frequency!=0 }">
										<option value="${frequency }">${frequency }일 단위</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div style="margin-top: 30%;">
							<input type="checkbox" id="meeting" value="회의록" style="display: none;">
							<label for="meeting" style="float: left;">회의록</label>
							<select style="float: right; height: 70%" id="meetingSel">
								<option value="">선택하세요.</option>
								<c:forEach var="frequency" items="${reportFrequency }">
									<c:if test="${frequency==0 }">
										<option value="${frequency }">자유롭게 등록</option>
									</c:if>
									<c:if test="${frequency!=0 }">
										<option value="${frequency }">${frequency }일 단위</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>

				<div style="width: 50%; height: 100%; float: right; border-left: 2px solid gray;">
					<div class="d-flex flex-column" style="width: 70%; height: 100%; margin: 0 auto;">
						<c:forEach var="report" items="${reportList }">
							<div style="margin-bottom: 10px;">
								<input type="checkbox" id="${report }" value="${report }" style="display: none;">
								<label for="${report }" style="float: left;">${report }</label>
							</div>
						</c:forEach>
					</div>
				</div>


			</form>
		</div>

		<div style="width: 16%; height: 10%; float: right; margin: 50px 0 0 0;">
			<nav>
				<ul class="pager">
					<li><a href="#" style="width: 100%;" id="next">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>


</body>
</html>