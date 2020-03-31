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
<title>회원 아이디 알림</title>


<style type="text/css">

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

.items
{
	display: flex;
	/* align-items: center; */
	margin-bottom: 15px;
	flex-direction: column;
}
.firstItem
{
	/* width: 120px; */
	align-self: center;
	text-align: left;
	color: #353535;
	font-size: 15pt;
}

.btnSub
{
	margin-top: 35px;
	background-color: #34314c;
	color:white; /* box-shadow: inset 0 0 0 0px */
}

.btnSub:hover 
{
	background-color: rgba(52, 49, 76, 0.80); 
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function()
{
	$("#searchIdBtn").click(function()
	{
		$("#alrExistForm").attr("action", "findIdForm.action");
		
		alrExistForm.submit();
	});
});
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
		<div class="mainItem" align="center" >
			<form action="" id="alrExistForm">
				<div class="items">
					<span class="firstItem">기존에 가입된 아이디가 존재합니다.</span>
				</div>
										
				<div>
					<input type="button" id="toMainBtn" value="메인 페이지로" style="width:150px; margin-right: 7px;" class="btnSub">
					<input type="button" id="searchIdBtn" value="아이디 찾기" style="width:150px; margin-left: 7px;" class="btnSub"> 
				</div>
			</form>
		</div>
	</section>
	<footer>
		<!-- <h1>푸터</h1> -->
	</footer>
</div>
</body>
</html>









