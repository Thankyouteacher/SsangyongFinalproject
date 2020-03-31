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

<title>ADMIN_PAGE - 휴면관리</title>
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
.main {
		width: 30%;
		margin-bottom: 2%;
	}
.menu a { cursor: pointer; }
.menu .hide { display: none; }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$(".menu>a").click(function()
		{
			$(this).next("ul").toggleClass("hide");
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
				<div class="card card-outline-secondary my-4"
					style="display: flex; flex-direction: column;">
					<div class="card-header">휴면처리된 유저 목록</div>
					<div class="card-body">
 
				 <form name="form1"  method="get" action="lockUser_searchname.action">
				
							<div style="display: flex; flex-direction: row; align-items: right; padding-right: 0px; padding-bottom: 1%">
									<div style="flex-grow: 4"></div>
									<div style="flex-grow: 1">
										<select name="category" style="margin-left: 25%; height: 100%;">
											<option value="uname" >이름</option>
											<option value="nickName">닉네임</option> 
										</select>
										<input type="text" name="sname" style="width: 35%" 	placeholder="입력해주세요."  >
										<button type="button" class="btn btn-secondary search" style="width: 50px; height: 43px; "><i class="fa fa-search"></i> </button>
									</div>
							</div>
						</form>
					<table class="table table-striped">
							<thead>
								<tr>
									<th style="text-align: center">NO.</th>
									<th style="text-align: center">유저코드</th>
									<th style="text-align: center">이름</th>
									<th style="text-align: center">닉네임</th>
									<th style="text-align: center">마지막 로그인 날짜</th>
								</tr>
							<tbody>
								
								<c:forEach var="lock" items="${lockUser_list }">
									<tr>
										<th style="text-align: center">${lock.num }</th>
										<th style="text-align: center">${lock.usId }</th>
										<th style="text-align: center">${lock.uname }</th>
										<th style="text-align: center">${lock.nickName }</th>
										<th style="text-align: center">${lock.lastLoginDate }</th>
									</tr>
								</c:forEach> 
							</tbody>
						</table>

						<div  class="row text-center">
						<nav aria-label="Page navigation example" style="width: 30%; float:none; margin:0 auto">
						  <ul class="pagination">
						    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item"><a class="page-link" href="#">Next</a></li>
						  </ul>
						</nav>
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

