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
<title>회원 가입</title>


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
	width: 120px;
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

$(function()
{
	$(".btnSub").click(function()
	{
		if($("#uname").val()=="")
		{
			alert("이름을 입력해주세요.");
			$("#uname").focus();
			return;
		}
		
		var ssd = $("#ssdFront").val() + "-" + $("#ssdBack").val();
		var ssdPattern = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
		/* 해당 정규표현식은 완벽하지 않고, xxxxxx-x 까지만 검사하므로 나중에 더 정확한 걸 찾아서 바꿀 것. */
		
		if($("#ssdFront").val()=="" || $("#ssdBack").val()=="")
		{
			alert("주민등록번호를 입력해주세요.");
			$("#ssdFront").focus();
			return;
		}
		
		//alert(ssdPattern.test(ssd));
		if(!ssdPattern.test(ssd))
		{
			alert("유효하지 않은 주민등록번호입니다.");
			$("#ssdFront").focus();
			return;
		}
		
		findIdForm.submit();
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
		
			<header>
				<!-- <h1 >섹션 - 헤더</h1>
				<h1 >로그인</h1> -->
			</header>
			<main>
				<!-- <h1 >섹션 - 메인</h1> -->
				<div class="mainItem" align="center" >
					<form action="joinform.action" id="findIdForm" method="post">
						<div class="items">
							<span class="firstItem">이름</span> 
							<input type="text" required="required" id="uname" name="uname" style="margin-bottom: 10px;" >
						</div>
						
						<div class="items">
						<span class="firstItem">주민등록 번호</span> 
							<input type="text" required="required" style="width:100px; margin-right: 5px;" id="ssdFront" name="ssdFront"> - 
							<input type="password" required="required" style="width:100px; margin-left: 5px; " id="ssdBack" name="ssdBack">
						</div>
						<p style="color: red; font-size: 9pt; margin-top:-10px; margin-left:30%;">${message }</p>
						
						<div>
							<input type="button" value="다음 절차로" style="width:100%;" class="btnSub">  <br>
						</div>
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









