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

<title>아이디 비밀번호 찾기</title>


<style type="text/css">
body {
	font-family: 굴림;
}

.universal {
	margin-top: 200px;
	margin-bottom: 300px;
	align-items: center;
	justify-content: center;
}

.container {
	display: flex;
	/* align-items: center; */  /*세로축에서 중앙*/
	justify-content: center; /*가로축에서 중앙*/
}

.content
{
	display: flex;
	flex-direction: row;
}

.items {
	border: 3px solid #34314c;
	border-radius: 10px;
	
	width: 350px;
	height: 120px;
	
	margin-bottom: 30px;
	margin-left: 30px;
	margin-right: 30px;
	padding-bottom: 10px;
	
	display: flex;
	align-items: center;
	justify-content: center;
}

.items:hover
{
	border: 3px solid #ffc952;
}

.itemText
{
	font-size: 15pt;
	color: #353535;
	font-weight: bold;
}

</style>


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
			
			<a href="findIdForm.action" style="text-decoration: none;">
				<div class="items">
					<span class="itemText">
					아이디 찾기
					</span>
				</div>
			</a>
			
			<a href="preChangePwdForm.action" style="text-decoration: none;">
				<div class="items">
					<span class="itemText">비밀번호 찾기</span>
				</div>
			</a>
		
		</section>
	</div>
</div>

</body>
</html>