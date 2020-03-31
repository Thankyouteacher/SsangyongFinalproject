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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">

	button:hover
	{
		background-color: #47b8e0;
	}
	
</style>

</head>
<body>

	<!-- Header -->
	<div style="background-color: #34314c; height: 115px;"></div>
	<div class="container">
		<header>
			<jsp:include page="Header.jsp" />
		</header>

		<br /> <br /> <br /> <br />

		<article>

			<div>
				<div style="display: flex;">
					<input type="text" value="번호" readonly="readonly" style="width: 80px; background-color: #34314c; color: white; border: white;" />
					<input type="text" value="팀명" readonly="readonly" style="width: 1000px; background-color: #34314c; color: white; border: white;" />
					<input type="text" value="인원" readonly="readonly" style="width: 80px; background-color: #34314c; color: white; border: white;" />
					<input type="text" value="기획안" readonly="readonly" style="width: 100px; background-color: #34314c; color: white; border: white;" />
					<input type="text" value="플로우차트" readonly="readonly" style="width: 135px; background-color: #34314c; color: white; border: white;" />
					<input type="text" value="ERD" readonly="readonly" style="width: 80px; background-color: #34314c; color: white; border: white;" />
					<input type="text" value="소감문" readonly="readonly" style="width: 95px; background-color: #34314c; color: white; border: white;" />
					<input type="text" value="최종보고서" readonly="readonly" style="width: 140px; background-color: #34314c; color: white; border: white;" />
					<input type="text" value="총점" readonly="readonly" style="width: 80px; background-color: #34314c; color: white; border: white;" />
					<input type="text" value="메모" readonly="readonly" style="width: 350px; background-color: #34314c; color: white;" />
				</div>
				<div style="display: flex;">
					<input type="text" value="10" readonly="readonly" style="width: 80px;" /> 
					<input type="text" value="탕수육은찍먹이지" readonly="readonly" style="width: 1000px;" /> 
					<input type="text" value="6/6" readonly="readonly" style="width: 80px;" /> 
					<input type="text" style="width: 100px;" /> 
					<input type="text" style="width: 135px;" /> 
					<input type="text" style="width: 80px;" />
					<input type="text" style="width: 95px;" /> 
					<input type="text" style="width: 140px;" /> 
					<input type="text" style="width: 80px;" readonly="readonly" /> 
					<input type="text" style="width: 240px;" />
				</div>
			</div>

			<br /> <br /> <br />

			<div style="display: flex;">
				<div>
					<button type="reset" style="border: 2px solid #34314c; width: 100px;">초기화</button>
				</div>
				<div>
					<button type="button" style="border: 2px solid #34314c; width: 100px;">저장</button>
				</div>
				<div>
					<button type="button" style="border: 2px solid #34314c; width: 100px; margin-left: 900px;">최종평가</button>
				</div>
			</div>

		</article>

	</div>
	

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>