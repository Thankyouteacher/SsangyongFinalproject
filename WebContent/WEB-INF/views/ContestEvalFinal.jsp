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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">
button:hover {
	background-color: #47b8e0;
}

.blankTop {
	border-top: 1px solid black;
}

.blankBot {
	border-bottom: 1px solid black;
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
			<div class="blankTop">&nbsp;</div>
			<div style="display: flex;">
				<div>
					<input type="text" value="1등" readonly="readonly"/>
				</div>
				<div style="flex-direction: column;">
					<input type="text" value="선생님감사합니다" readonly="readonly"/>

					<div>
						<input type="text" value="총점 : 99점" readonly="readonly"/>
					</div>
				</div>
				<div>
					<textarea rows="3" cols="40" placeholder="세부평가를 해주세요"></textarea>
				</div>
				<div>
					<input type="text" value="500,000원" readonly="readonly"
						style="margin-left: 100px;" />
				</div>
			</div>


			<div class="blankBot">&nbsp;</div>

			<br /> <br /> <br />

			<div style="display: flex;">
				<div>
					<button type="reset"
						style="border: 2px solid #34314c; width: 100px;">다시작성</button>
				</div>
				<div>
					<button type="button"
						style="border: 2px solid #34314c; width: 100px; margin-left: 900px;">최종평가완료</button>
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