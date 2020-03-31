<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>ADMIN_PAGE - 신고처리된유저</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/shop-item.css" rel="stylesheet">
  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style type="text/css">
.a { text-decoration: none; color:black; }
	.menu a { cursor: pointer; }
	.menu .hide { display: none; }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$().ready(function()
	{
		$(".menu>a").click(function()
		{
			$(this).next("ul").toggleClass("hide");
		}); 
		
		$(".backList").click(function()
		{
			location.href="receivedlist.action";
		});
		 
	});
</script>

</head>
<body>
  <div style="background-color: #34314c ; height: 115px;" ></div>
  <jsp:include page="Header.jsp"/>

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
        <div class="card card-outline-secondary my-4" style="display: flex; flex-direction:  column;">
          <div class="card-header">
            신고 처리된 유저 관리
          </div>
          <div class="card-body"">
          	<div style="display: flex; flex-direction: row; width: 100%; height: 200px; ">
          		<!--  프로필 사진 -->						
				<div style="display:flex; flex-direction:column; width: 20%; height: 180px;  margin: 10px">
					<div style="width: 100%; height: 120px'"><img alt="userPic" src="images/santa.png" style="width: 120px; border-radius:60px; margin-left: 10%"></div>	
					
				</div>
          		<div style=" width: 80%; height:  margin:10px">
          			<div style="display: flex; flex-direction: row; width: 55%; height: 50px;  margin:5px; position: relative; top : 45%;"">
          			 신고당한 사람 이름  <input type="text" style="width: 40%; height: 70%; margin-left : 2%;"value="${receivedinfo.receivedName }" readonly="readonly"></div>
          			<div style="display: flex; flex-direction: row; width: 40%; height: 50px;  margin:5px; position: relative; top : 15%;  left: 59%;" >
          			 신고자 이름 : <input type="text" style="width: 40%; height: 70%; margin-left : 3%;" value="${receivedinfo.receiver }" readonly="readonly"></div>
          		</div>
          	</div>
          	<div style="width: 100%; height: 280px; margin-top: -5%">
          		<div style="display: flex; flex-direction: row; height: 50px;">
					내용 :<input type="text" style="width: 50%; height: 70%; margin-left: 7%;" value="${receivedinfo.rpText }" readonly="readonly">
				</div>
          		<div style="display: flex; flex-direction: row;  height: 50px;"> 
          		 링크 : <input type="text" style="width: 50%; height: 70%; margin-left : 6%;"></div>
          		<div style="display: flex; flex-direction: row;  height: 80px;"> 
          		 첨부파일 : <input type="text" style="width: 50%; height: 45%; margin-left : 2%;"></div>
          		<div style="display: flex; flex-direction: row;  height: 50px;"> 
          		 항목 : <input type="text" style="width: 50%; height: 70%; margin-left : 6%; margin-top:-3%;"value="${receivedinfo.rtName }" readonly="readonly"></div>
          		<div style="display: flex; flex-direction: row;  height: 50px;"> 
          		 정지 기간 : <input type="text" style="width: 15%; height: 70%; margin-left : 2%;" value="${receivedinfo.board_penalty}" readonly="readonly">개월</div>
          	</div>
            
            <div align="center" style="padding: 5%;">
	            <button type="button" class="btn backList" style=" background-color: #34314c  ;color : white; width: 20%;height: 70% ">목록으로</button>
            </div>
            
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

