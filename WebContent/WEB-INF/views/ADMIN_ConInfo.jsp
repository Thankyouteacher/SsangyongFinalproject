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

<title>ADMIN_PAGE - 공모전</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-item.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style type="text/css">
.a {	text-decoration: none; color:black;}
.menu a { cursor: pointer; }
.menu .hide { display: none; }

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
		
		$(".backList").click(function()
		{
			location.href="conlist.action";
		})
			
		$(".conOk").click(function()
		{
			var massage = confirm("해당 공모전을 승인하겠습니까?");
			if(massage==true)
			{
				location.href="conOk.action";
			}
		});
		$(".cancleCon").click(function()
		{
			location.href="conlist.action";
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
				<div class="card card-outline-secondary my-4" style="display: flex; flex-direction: column; height: 70%;">
					<div class="card-header">공모전 관리</div>
					<div class="card-body">
						<div style="display: flex; flex-direction: row; width: 100%; height: 200px;">
						
							<!--  프로필 사진 -->						
							<div style="display:flex; flex-direction:column; width: 20%; height: 180px;  margin: 10px">
								<div style="width: 100%; height: 120px'"><img alt="userPic" src="images/santa.png" style="width: 120px; border-radius:60px; margin-left: 10%"></div>	
								<div style="width: 100%; height: 80px"><input type="text" style="width: 80%; height: 40px; margin-left: 20%" value="${conInfo.uname }" readonly="readonly"></div>
							</div>
							
							<!--  공모전 정보가 들어있는 div-->
							<div style="width: 80%; height: 180px; margin: 10px">
								<div style="display: flex; flex-direction: row; width: 98%; height: 50px; margin: 5px;">
									공모전 제목 : <input type="text" style="width: 50%; height: 40px; margin-left: 2%;"value="${conInfo.subject }" readonly="readonly">
								</div>
								<div style="display: flex; flex-direction: row; width: 98%; height: 110px; margin: 5px;">
									공모전 설명
									<textarea style="width: 80%; margin-left: 2%;">${conInfo.content }</textarea>
								</div>
							</div>
						</div>
						<div style="width: 100%; height: 400px; margin-top: 3%">
							<div style="display: flex; flex-direction: row; height: 50px;">
								최소인원 : <input type="text" style="width: 8%; height: 40px; margin-left: 2%; margin-right: 2%;" value="${conInfo.minNum }" readonly="readonly"> 명
							</div>
							<div style="display: flex; flex-direction: row; height: 50px;">
								모집기한 :<input type="text" style="width: 25%; height: 40px; margin-left: 2%; margin-right: 2%"
									value="${conInfo.recruitDate }" readonly="readonly"> ~ <input type="text" style="width: 25%; height: 40px;
									 margin-left: 2%;" value="${conInfo.endDate }" readonly="readonly">
							</div>
							<div style="display: flex; flex-direction: row; height: 50px;">
								진행기한 :<input type="text" style="width: 25%; height: 40px; margin-left: 2%; margin-right: 2%" value="${conInfo.proStDate }" readonly="readonly">
									~ <input type="text" style="width: 25%; height: 40px; margin-left: 2%;" value="${conInfo.proEndDate }" readonly="readonly">
							</div>
							<div style="display: flex; flex-direction: row; height: 50px;">
								기술 : <input type="text" style="width: 50%; height: 40px; margin-left: 7%;" >
							</div>
							<%-- <div style="display: flex; flex-direction: row; height: 50px;">
								주제 : <input type="text" style="width: 50%; height: 40px; margin-left: 7%;" value="${conInfo.subject }" readonly="readonly">
							</div>
							<div style="display: flex; flex-direction: row; height: 50px;">
								세부 주제: <input type="text" style="width: 50%; height: 40px; margin-left: 2%;" >
							</div> --%>
							<div style="display: flex; flex-direction: row; height: 50px;">
								수행 과제 : <input type="text" style="width: 50%; height: 40px; margin-left: 2%;">
							</div>
							<div style="display: flex; flex-direction: row; height:50px;">
								상금 : 1등: <input type="text" style="width: 20%; height: 40px; margin-left: 2%; margin-right: 2%;" value="${conInfo.first }원" readonly="readonly">
									   2등: <input type="text" style="width: 20%; height: 40px; margin-left: 2%; margin-right: 2%;" value="${conInfo.second }원" readonly="readonly">
									   3등: <input type="text" style="width: 20%; height: 40px; margin-left: 2%; margin-right: 2%;" value="${conInfo.third }원" readonly="readonly">
							</div>
						</div> 

						<!-- Button div -->
						<form action="conOk.action" method="get">
						<div align="center" style="padding: 5%; position: relative; margin-top: -5%">
							<button type="button" class="btn backList " style="background-color: #3b8686; color: white; height: 70%" >  닫기</button>
							<button type="button" class="btn " style="background-color: #E53A40; color: white; height: 70%"data-toggle="modal" data-target="#ConCancle" >
							승인 거부</button>
							<button type="submit" class="btn conOk" style="background-color: #34314c; color: white; height: 70%">승인</button>
								<input type="hidden"  value="${conInfo.conId}"  name="conId">
								<%-- <input type="hidden"  value="${conInfo.conId}"  name="conId"> --%>
						</div>
					</form>

					</div>
				</div>
				<!-- /.card -->

			</div>
			<!-- /.col-lg-9 -->

		</div>

		<!-- The Modal -->
		<div class="modal" id="ConCancle">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">공모전 승인거부를 하시겠습니까?</h4>
						<button type="button" style="box-shadow: inset 0 0 0 0px"
							class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body" >
						승인을 거부하는 이유를 입력해주세요. 
						<input type="text" style="width: 100%	" name="reason" id="reason">
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger cancleCon" data-dismiss="modal">Cancle</button>
						<button type="button" class="btn" data-dismiss="modal"
							style="background-color: #47b8e0; color: #fff;">OK</button>
					</div>

				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>


