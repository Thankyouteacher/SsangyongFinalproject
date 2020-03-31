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
<title>회원 탈퇴</title>


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

.items
{
	display: flex;
	/* align-items: center; */
	margin-bottom: 15px;
}
.firstItem
{
	width: 150px;
	align-self: center;
	text-align: left;
	color: #353535;
	font-size: 12pt;
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
	$(document).ready(function()
	{
		
		$(".btnSub").click(function()
		{
			//변수 선언
			var password = $("#password").val();
			var pwdConfirm = $("#pwdConfirm").val();

			if (password.length == 0 || password.length == "")
			{
				alert("비밀번호를 입력해주세요");
				$("#password").focus();
				return;
			}
			
			if (password.length < 8 || password.length > 15)
			{
				alert("비밀번호는 8글자 이상, 15글자 이하입니다.");
				$("#userPwd").focus();
				return;
			}
			
			if(confirm("정말 탈퇴하시겠습니까?"))
			{
				quitForm.submit();
			}
			
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
			<form action="quit.action" id="quitForm">
				<div class="items">
					<span style="margin-bottom: 15px; margin-left: 30px;">비밀번호를 한번 더 입력해주세요</span> 
				</div>
				
				<div class="items">
					<input type="password" required="required" id="password" name="password" style="width:300px; margin-bottom: 10px;" >
				</div>
				<div>
					<p style="color: red; font-size:9pt; margin-left: 5%; margin-top: -5%;  margin-bottom: -1px;" id="notCorrect" >${message }</p>				
				</div>
				
				<div>
					<input type="button" id="" value="회원 탈퇴" style="width:100%; " class="btnSub">  <br>
				</div>
			</form>
		</div>
	</section>
</div>
</body>
</html>









