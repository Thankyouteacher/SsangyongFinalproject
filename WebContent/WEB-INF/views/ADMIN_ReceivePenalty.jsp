<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ADMIN_PAGE - 신고관리-처리-상세</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/shop-item.css" rel="stylesheet">
<!-- Bootstrap 4.3.1 CDN  -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	  integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	  
<style type="text/css">
.a { text-decoration: none; color:black; }
.menu a { cursor: pointer; }
.menu .hide { display: none; }

[data-tooltip-text]:hover 
{
	position: relative;
	
}

[data-tooltip-text]:after 
{
	-webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	-moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	transition: bottom .3s ease-in-out, opacity .3s ease-in-out;

	background-color: rgba(0, 0, 0, 0.8);

  -webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	
  -webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	
  	color: #FFFFFF;
	font-size: 14px;
	margin-bottom: 10px;
	padding: 7px 12px;
	position: absolute; 
	margin-top : -50%;
	width: auto;
	min-width: 185px;
	max-width: 300px;
	word-wrap: break-word;

	z-index: 9999;

	opacity: 0;
	left: -9999px;
  	top: 90%;
	
	content: attr(data-tooltip-text);
}

[data-tooltip-text]:hover:after {
	top: 80%;
	left: 0;
	opacity: 1;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$(".menu>a").click(function()
		{
			$(this).next("ul").toggleClass("hide");
		});
		
		 $(".deleteReceive").click(function()
		{
			var massage = confirm("해당신고를 삭제하시겠습니까?");
			if (massage == true)
			{
				
				location.href="receivedelete.action";
			}
		}); 
		$(".receivePenalty").click(function()
		{
			
			var massage = comfirm("해당 유저에게 패널티를 부여하시겠습니까?"); 
			 if (massage==true)
			{
				location.href="receivepenalty.action" ;
			}
		})
	});
</script>

</head>
<body>
	<div style="background-color: #34314c ; height: 115px;" ></div>
	<jsp:include page="Header.jsp" />
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">
				<p class="my-4 h3">관리자 페이지</p>
				<div class="list-group" style="margin-left: -20%">
					<div>
						<ul>
							<li class="menu list-group-item a "><a>공모전 관리</a>
								<ul class="hide" style="list-style: none;">
									<li><a href="conlist.action"> 공모전 승인 </a></li>
									<li><a href="conOklist.action">승인한 공모전</a></li>
								</ul>
							</li>
							<li class="menu list-group-item a "><a>신고관리</a>
								<ul class="hide" style="list-style: none;">
									<li><a href="receive.action" class="a ">신고 처리</a></li>
									<li><a href="receivedlist.action"class=" a ">신고 처리된 유저</a></li>
								</ul>
							</li>
							<li class="menu list-group-item a "><a href="lockuser.action" class="a">휴면관리</a></li>
							<li class="menu list-group-item a "><a>관리자 계정 관리</a>
								<ul class="hide" style="list-style: none;">
									<li><a href="userlist.action">관리자 등록 </a></li>
									<li><a href="adminlist.action">관리자 관리</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4"
					style="display: flex; flex-direction: column;">
					<div class="card-header">신고 처리 - 패널티 부여</div>
					<div class="card-body">
						<div
							style="display: flex; flex-direction: row; width: 100%; height: 200px;">
							<!--  프로필 사진 -->						
							<div style="display:flex; flex-direction:column; width: 20%; height: 180px;  margin: 10px">
								<div style="width: 100%; height: 120px'"><img alt="userPic" src="images/santa.png" style="width: 120px; border-radius:60px; margin-left: 10%"></div>	
							</div>
							
							<div style="width: 80%; height: 180px; margin: 10px">
								<div
									style="display: flex; flex-direction: row; width: 60%; height: 50px; margin: 5px; position: relative; top: 65%;">
									신고당한 사람 이름 <input type="text" style="width: 40%; height: 70%; margin-left: 2%;" value="${searchUser.receivedName }" readonly="readonly">
								</div>
								<div
									style="display: flex; flex-direction: row; width: 40%; height: 50px; margin: 5px; position: relative; top: 34%; left: 59%;">
									신고자 이름 : <input type="text" style="width: 50%; height: 70%; margin-left: 2%;" value="${searchUser.receiver }" readonly="readonly">
								</div>
							</div>
						</div>
							<form action="receivepenalty.action" method="get">
							<div style="width: 100%; height: 280px; ">
								<div style="display: flex; flex-direction: row; height: 50px;">
									내용 :<input type="text" style="width: 50%; height: 70%; margin-left: 7%;" value="${searchUser.rpText }" readonly="readonly">
								</div>
								<div style="display: flex; flex-direction: row; height: 50px; margin-top: 2%">
									항목 :<input type="text" style="width: 50%; height: 70%; margin-left: 7%;" value="${searchUser.rtName }"readonly="readonly">
								</div>
								<div style="display: flex; flex-direction: row; height: 50px;">
									링크 :<input type="text" style="width: 50%; height: 70%; margin-left: 7%;">
								</div>
								<div style="display: flex; flex-direction: row; height: 80px;">
									첨부 파일 :<input type="text" style="width: 20%; height: 100%; margin-left: 2%;">
									<input type="text" style="width: 20%; height: 100%; margin-left: 2%;">
								</div>
								
								
								
								<div style="display: flex; flex-direction: row; height: 50px; margin-top: 2%">
									정지 기간 : <select style="margin-left: 2%; height: 70%; " name="term">
													<option value="1">1개월</option>
													<option value="2">2개월</option>
													<option value="3">3개월</option>
												</select>
									<span data-tooltip-text="패널티는 신고항목의 경중에 따라 관리자가 부여하도록 한다." style="margin-left: 2%; ">
									<i class="fas fa-info-circle"></i></span>
								</div>
							</div>
							
								<button type="submit" class="btn receivePenalty" style="background-color: #34314c;  color: white; width: 20%; height: 70%; margin-left: 30%; margin-top: 5%" >패널티 부여</button>
									<input type="hidden" value="${searchUser.rpId }"  name="rpId">
									<input type="hidden" value="${searchUser.rpText}" name="rpText">
									
							</form>
							<form action="receivedelete.action" method="get">
								<button type="submit" class="btn deleteReceive"  style="background-color: #e53a40; color: white; width: 20%; height: 70%; margin-left: 55%; margin-top: -17%" > 신고 삭제</button>
									<input type="hidden" value="${searchUser.num }" name="num">
									<input type="hidden" value="${searchUser.rpId }" name="rpId">

							</form>	
						
					</div>
				</div>
				<!-- /.card -->
			</div>
			<!-- /.col-lg-9 -->
		</div>
	</div>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

