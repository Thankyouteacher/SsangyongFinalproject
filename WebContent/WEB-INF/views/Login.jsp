<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>


<style type="text/css">
body
{
	display: flex;
	flex-direction: column;;
	justify-content: center;
	color: white;
}

.container
{
	display: flex;
	flex-direction :column;
	align-content: center;
	/* border: 1px solid gray; */
	
}
.content
{
	/* border: 1px solid gray; */
	display: flex;
	flex-direction :column;
	align-items: center;
	
}
.mainItem
{
	margin-top: 200px;
	padding-top:50px; 
	padding-bottom:50px; 
	border: 2px solid #34314c ;
	border-radius: 5px;
	display: flex;
	flex-direction :column;
	align-items: center;
	width: 700px;
	
}

.btnSub
{
	box-shadow: #34314c;
	color: #34314c;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>

<!-- Header -->
<div style="background-color: #34314c ; height: 115px;" ></div>
<div class="container">
	<header>
		<!-- <h1 >헤더</h1> -->
		<jsp:include page="Header.jsp" />
	</header>
	
	
	<section class="content" >
		
			<header>
				<!-- <h1 >섹션 - 헤더</h1>
				<h1 >로그인</h1> -->
			</header>
			<main>
				<!-- <h1 >섹션 - 메인</h1> -->
				<div class="mainItem" align="center" >
					<form action="login.action" id="loginForm" method="post">
				
						아 이 디 &nbsp;&nbsp;&nbsp; <input type="text" required="required" id="userId" name="userId" style="width:200px; margin-right: 70px; margin-bottom: 10px;" > <br>
						비밀번호 &nbsp;<input type="password" required="required" id="password" name="password" style="width:200px; margin-right: 70px; margin-bottom: 10%; " > <br>
							<p style="color: red; font-size: 9pt; margin-top: -30px; margin-bottom: 3px;">${message }</p>
						<input type="submit" id="loginBtn" value="로그인" style="margin-top:10px; width:200px; background-color: #34314c; color:white; box-shadow: inset 0 0 0 0px" class="btnSub">  <br>
						<span style="font-size: 9pt;">
						<a href="findIdPwdForm.action">아이디/비밀번호 찾기</a>
						</span>
						
						
					</form>
				</div>
			</main>
			<footer>
				<!-- <h1>섹션 - 푸터</h1> -->
			</footer>
		
	</section>
	<footer>
		<!-- <h1>푸터</h1> -->
	</footer>
</div>
</body>
</html>









