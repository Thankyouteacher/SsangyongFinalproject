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
<title>ContestBoard.jsp</title>


<style type="text/css">

#table {display: table; width: 100%; text-align: center; font-size: 15px;}
.table {color: #d2d2d2}
.thead {display: table-header-group; background-color: #d2d2d2;}
.tbody {display: table-row-group; background-color: white;}
.cell {display: table-cell; padding: 3px; border-top: 0.8px solid black;}
.col1 {width: 5%;}	/* 번호 */
.col2 {width: 20%;}	/* 제목 */
.col3 {width: 20%;}	/* 모집일자 */
.col4 {width: 20%;}	/* 진행일자 */
.col5 {width: 10%;}	/* 총 상금 */
.col6 {width: 10%;}	/* 모집중인 팀 수 */
.col7 {width: 10%;}	/* 조회 수 */
.col8 {width: 5%;}	/* 확장*/

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/style.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		// 주최 중, 참여 중 버튼 탭 토글들
		// 참여중 공모전 리스트 여는 함수
		$('#flip').click(function()
		{
			$('#panel').slideToggle("slow");
		});
		
		// 주최중 공모전 리스트 여는 함수
		$('#created').click(function()
		{
			$('#panel2').slideToggle("slow");
		});
		
		// 참여중 공모전 닫기만 하는 함수
		$('#closed').click(function()
		{
			$('#panel').slideUp("slow");
		});
		
		// 주최중 공모전 닫기만 하는 함수
		$('#closed2').click(function()
		{
			$('#panel2').slideUp("slow");
		});
		
		
		//----------- 참여중 공모전 탭 리스트들 여는 함수		
		// 모집중인 공모전 팀 리스트 여는 함수
		$('#recruit1').click(function()
		{
			$('#team1').slideToggle('slow');
		});
		
		// 진행 중인 공모전 팀 리스트 여는 함수
		$('#progress1').click(function()
		{
			$('#team2').slideToggle('slow');
		});
		
		// 완료 중인 공모전 팀 리스트 여는 함수
		$('#end1').click(function()
		{
			$('#endTeam').slideToggle('slow');
		});
		
		//---------- 주최중 공모전 탭 리스트들 여는 함수
		// 모집 중인 공모전 팀 리스트 여는 함수
		$('#createdRe').click(function()
		{
			$('#createdTeam1').slideToggle('slow');
		});
		
		// 진행 중인 공모전 팀 리스트 여는 함수
		$('#createPlay').click(function()
		{
			$('#playTeam1').slideToggle('slow');
		});
		
		// 완료 된 공모전 팀 리스트 여는 함수
		$('#contestEnd').click(function()
		{
			$('#endingTeam').slideToggle('slow');
		});
	});

</script>

<style type="text/css">

td
{
	text-align: center;
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
	</div>

	<br /><br /><br />
	
	<div class="container">
		<p class="h1 bold" style="font-weight: bold; color: black;">공모전</p>
		
		<br />
		
		<div style="display:flex; flex-direction: column;">
			<div class="float-right" style="float:right; width:100%;" >
				<button id="flip" class="btn" style="background-color: #3b8686; color: white; height: 40px; float:right;  border-style: dashed; border-color: white; border-width: 2px;" >
				참여 중 공모전</button>
			</div>
				<div id="panel" style="width:1110px; display: none;">
					<div style="background-color: #3b8686; border-radius: 2%;" align="center">
						<br /><br /><br />			
						<p class="h5" align="left" style="margin-left: 30px; color: white;">모집중</p><br />
											
						<!-- 모집중 공모전 팀 리스트 -->
						<div id="table" style="width: 95%;">
							<div class="thead">
								<span class="cell col1">번호</span>
								<span class="cell col2">제목</span>
								<span class="cell col3">모집 일자</span>
								<span class="cell col4">진행 일자</span>
								<span class="cell col5">총 상금</span>
								<span class="cell col6">모집중인 팀 수</span>
								<span class="cell col7">조회 수</span>
								<span class="cell col8">확장</span>
							</div>
							<div class="tbody">
								<span class="cell col1">1</span>
								<span class="cell col2">2019 맵 콘테스트 공모전</span>
								<span class="cell col3">19-12-01 ~ 19-12-15</span>
								<span class="cell col4">16-12-15 ~ 19-01-15</span>
								<span class="cell col5">5,00,000</span>
								<span class="cell col6">3</span>
								<span class="cell col7">365</span>
								<span class="cell col8">
									<button id="recruit1" class="btn" style="color: black; height: 40px; padding-bottom: 0px; padding-top: 0px;">
										<i class="fas fa-angle-down" style="padding-bottom: 0px; font-size: 30px;"></i></button>
								</span>
							</div>									
						</div>
						
						<div id="team1" align="center" style="width: 95%; height: 150px; padding: 0px; display: none; background-color: white; border-radius: 20px 20px; border: dashed; border-color: 34314c;">
							<div class="container" style="display: table; width: 95%; height:25%;">
								<div style="display: table-row;">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										프로젝트 팀 이름
									</div>
									<div style="display: table-cell; width: 400px;">
										프로젝트 팀 명
									</div>
									<div style="display: table-cell; width: 75px; font-weight: bold;">
										개설자
									</div>
									<div style="display: table-cell;">
										닉네임
									</div>
									<div style="display: table-cell; width: 50px; font-weight: bold;">
										성별
									</div>
									<div style="display: table-cell; width: 100px;">
										상관없음
									</div>
								</div>
							</div>
							<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
								<div style="display: table-row">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										프로젝트 소개
									</div>
									<div style="display: table-cell; width: 400px;">
										프로젝트 소개 내용
									</div>
									<div style="display: table-cell; width: 75px; font-weight: bold;">
										개설일
									</div>
									<div style="display: table-cell;">
										2019-12-20
									</div>
									<div style="display: table-cell; width: 50px; font-weight: bold;">
										인원
									</div>
									<div style="display: table-cell; width: 100px;">
										4/6
									</div>
								</div>
							</div>
							<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
								<div style="display: table-row">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										온라인
									</div>
									<div style="display: table-cell; width: 600px;">
										<div class="progress">
											<div class="progress-bar progress-bar-animated progress-bar-striped bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
										</div>
									</div>
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										오프라인
									</div>			
								</div>
							</div>
							<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
								<div style="display: table-row">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										필요한 기술
									</div>
									<div style="display: table-cell; width: 150px;">
										JAVA
									</div>
									<div style="display: table-cell; width: 150px;">
										Servlet
									</div>
									<div style="display: table-cell; width: 150px;">
										Javascript
									</div>
									<div style="display: table-cell; width: 50px; font-weight: bold;">
										지역
									</div>
									<div style="display: table-cell; width: 150px;">
										서울 마포구
									</div>
								</div>
							</div>
						</div>
						
						<div id="table" style="width: 95%;">		
							<div class="tbody">
								<span class="cell col1">2</span>
								<span class="cell col2">이거 너무 어려워요.</span>
								<span class="cell col3">19-12-01 ~ 19-12-15</span>
								<span class="cell col4">16-12-15 ~ 19-01-15</span>
								<span class="cell col5">6,000,000</span>
								<span class="cell col6">3</span>
								<span class="cell col7">365</span>
								<span class="cell col8">
									<button id="recruit1" class="btn" style="color: black; height: 40px; padding-bottom: 0px; padding-top: 0px;">
										<i class="fas fa-angle-down" style="padding-bottom: 0px; font-size: 30px;"></i></button>
								</span>
							</div>
						</div>
						
						<br /><br />
						<div class="container" align="center">
							<div>
								<nav aria-label="Page navigation example"
									style="width: 300px;">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>	
							</div>						
						</div>
						
						<!-- --------------------------------- 진행중 ---------------------------------------------------------------------- -->
						<p class="h5" align="left" style="margin-left: 30px; color: white;">진행중</p><br />
						
	
						<!-- 진행 중 공모전 팀 리스트 -->
						<div id="table" style="width: 95%;">
							<div class="thead">
								<span class="cell col1">번호</span>
								<span class="cell col2">제목</span>
								<span class="cell col3">모집 일자</span>
								<span class="cell col4">진행 일자</span>
								<span class="cell col5">총 상금</span>
								<span class="cell col6">진행중인 팀 수</span>
								<span class="cell col7">조회 수</span>
								<span class="cell col8">확장</span>
							</div>
							<div class="tbody">
								<span class="cell col1">1</span>
								<span class="cell col2">2019 맵 콘테스트 공모전</span>
								<span class="cell col3">19-12-01 ~ 19-12-15</span>
								<span class="cell col4">16-12-15 ~ 19-01-15</span>
								<span class="cell col5">5,00,000</span>
								<span class="cell col6">3</span>
								<span class="cell col7">365</span>
								<span class="cell col8">
									<button id="progress1" class="btn" style="color: black; height: 40px; padding-bottom: 0px; padding-top: 0px;">
										<i class="fas fa-angle-down" style="padding-bottom: 0px; font-size: 30px;"></i></button>
								</span>
							</div>
									
						</div>
						
						<div id="team2" class="container" align="center" style="width: 95%; height: 150px; padding: 0px; display: none; background-color: white;border-radius: 20px 20px; border: dashed; border-color: 34314c;">
							<div class="container" style="display: table; width: 95%; height:25%;">
								<div style="display: table-row;">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										프로젝트 팀 이름
									</div>
									<div style="display: table-cell; width: 400px;">
										프로젝트 팀 명
									</div>
									<div style="display: table-cell; width: 75px; font-weight: bold;">
										개설자
									</div>
									<div style="display: table-cell;">
										닉네임
									</div>
									<div style="display: table-cell; width: 50px; font-weight: bold;">
										성별
									</div>
									<div style="display: table-cell; width: 100px;">
										상관없음
									</div>
								</div>
							</div>
							<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
								<div style="display: table-row">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										프로젝트 소개
									</div>
									<div style="display: table-cell; width: 400px;">
										프로젝트 소개 내용
									</div>
									<div style="display: table-cell; width: 75px; font-weight: bold;">
										개설일
									</div>
									<div style="display: table-cell;">
										2019-12-20
									</div>
									<div style="display: table-cell; width: 50px; font-weight: bold;">
										인원
									</div>
									<div style="display: table-cell; width: 100px;">
										4/6
									</div>
								</div>
							</div>
							<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
								<div style="display: table-row">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										온라인
									</div>
									<div style="display: table-cell; width: 600px;">
										<div class="progress">
											<div class="progress-bar progress-bar-animated progress-bar-striped bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
										</div>
									</div>
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										오프라인
									</div>			
								</div>
							</div>
							<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
								<div style="display: table-row">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										필요한 기술
									</div>
									<div style="display: table-cell; width: 150px;">
										JAVA
									</div>
									<div style="display: table-cell; width: 150px;">
										Servlet
									</div>
									<div style="display: table-cell; width: 150px;">
										Javascript
									</div>
									<div style="display: table-cell; width: 50px; font-weight: bold;">
										지역
									</div>
									<div style="display: table-cell; width: 150px;">
										서울 마포구
									</div>
								</div>
							</div>
						</div>
						
						<div id="table" style="width: 95%;">		
							<div class="tbody">
								<span class="cell col1">2</span>
								<span class="cell col2">이거 너무 어려워요.</span>
								<span class="cell col3">19-12-01 ~ 19-12-15</span>
								<span class="cell col4">16-12-15 ~ 19-01-15</span>
								<span class="cell col5">6,000,000</span>
								<span class="cell col6">3</span>
								<span class="cell col7">365</span>
								<span class="cell col8">
									<button id="recruit1" class="btn" style="color: black; height: 40px; padding-bottom: 0px; padding-top: 0px;">
										<i class="fas fa-angle-down" style="padding-bottom: 0px; font-size: 30px;"></i></button>
								</span>
							</div>
						</div>
						
						<!-- 진행 중 공모전 팀 리스트 end -->
						<br /><br />
						<div class="container" align="center">
							<div>
								<nav aria-label="Page navigation example"
									style="width: 300px;">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>	
							</div>						
						</div>
						
						<br />
						<br />
						<br />
						
						<p class="h5" align="left" style="margin-left: 30px; color: white;">완료</p><br />
	
						<!-- 완료 공모전 팀 리스트 -->
						<div id="table" style="width: 95%;">
							<div class="thead">
								<span class="cell col1">번호</span>
								<span class="cell col2">제목</span>
								<span class="cell col3">모집 일자</span>
								<span class="cell col4">진행 일자</span>
								<span class="cell col5">총 상금</span>
								<span class="cell col6">진행중인 팀 수</span>
								<span class="cell col7">조회 수</span>
								<span class="cell col8">확장</span>
							</div>
							<div class="tbody">
								<span class="cell col1">1</span>
								<span class="cell col2">2019 맵 콘테스트 공모전</span>
								<span class="cell col3">19-12-01 ~ 19-12-15</span>
								<span class="cell col4">16-12-15 ~ 19-01-15</span>
								<span class="cell col5">5,00,000</span>
								<span class="cell col6">3</span>
								<span class="cell col7">365</span>
								<span class="cell col8">
									<button id="end1" class="btn" style="color: black; height: 40px; padding-bottom: 0px; padding-top: 0px;">
										<i class="fas fa-angle-down" style="padding-bottom: 0px; font-size: 30px;"></i></button>
								</span>
							</div>
									
						</div>
						
						<div id="endTeam" align="center" style=" height: 150px; padding: 0px; display: none; background-color: white; width: 95%; border-radius: 20px 20px 20px 20px; border: dashed; border-color: 34314c;">
							<div class="container" style="display: table; width: 95%; height:25%;">
								<div style="display: table-row;">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										프로젝트 팀 이름
									</div>
									<div style="display: table-cell; width: 400px;">
										프로젝트 팀 명
									</div>
									<div style="display: table-cell; width: 75px; font-weight: bold;">
										개설자
									</div>
									<div style="display: table-cell;">
										닉네임
									</div>
									<div style="display: table-cell; width: 50px; font-weight: bold;">
										성별
									</div>
									<div style="display: table-cell; width: 100px;">
										상관없음
									</div>
								</div>
							</div>
							<div class="container" style="display: table; width: 100%; height:25%;background-color: white;">
								<div style="display: table-row">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										프로젝트 소개
									</div>
									<div style="display: table-cell; width: 400px;">
										프로젝트 소개 내용
									</div>
									<div style="display: table-cell; width: 75px; font-weight: bold;">
										개설일
									</div>
									<div style="display: table-cell;">
										2019-12-20
									</div>
									<div style="display: table-cell; width: 50px; font-weight: bold;">
										인원
									</div>
									<div style="display: table-cell; width: 100px;">
										4/6
									</div>
								</div>
							</div>
							<div class="container" style="display: table; width: 100%; height:25%; background-color: white;">
								<div style="display: table-row">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										온라인
									</div>
									<div style="display: table-cell; width: 600px;">
										<div class="progress">
											<div class="progress-bar progress-bar-animated progress-bar-striped bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
										</div>
									</div>
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										오프라인
									</div>			
								</div>
							</div>
							<div class="container" style="display: table; width: 100%; height:25%; background-color: white;">
								<div style="display: table-row">
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										필요한 기술
									</div>
									<div style="display: table-cell; width: 150px;">
										JAVA
									</div>
									<div style="display: table-cell; width: 150px;">
										Servlet
									</div>
									<div style="display: table-cell; width: 150px;">
										Javascript
									</div>
									<div style="display: table-cell; width: 150px; font-weight: bold;">
										평가여부
									</div>
									<div style="display: table-cell; width: 50px;">
										X
									</div>
								</div>
							</div>
						</div>
						
						<div id="table" style="width: 95%;">		
							<div class="tbody">
								<span class="cell col1">2</span>
								<span class="cell col2">이거 너무 어려워요.</span>
								<span class="cell col3">19-12-01 ~ 19-12-15</span>
								<span class="cell col4">16-12-15 ~ 19-01-15</span>
								<span class="cell col5">6,000,000</span>
								<span class="cell col6">3</span>
								<span class="cell col7">365</span>
								<span class="cell col8">
									<button id="recruit1" class="btn" style="color: black; height: 40px; padding-bottom: 0px; padding-top: 0px;">
										<i class="fas fa-angle-down" style="padding-bottom: 0px; font-size: 30px;"></i></button>
								</span>
							</div>
						</div>
						
						<!-- 완료 공모전 팀 리스트 end -->
						<br /><br />
						<div class="container" align="center">
							<div>
								<nav aria-label="Page navigation example"
									style="width: 300px;">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>	
							</div>						
						</div>
						
						<br /><br />
						
						<div class="float-center">
							<button id="closed" class="btn" style="background-color: #3b8686; color: white; height: 40px;  border-style: dashed; border-color: white; border-width: 2px;" >
							접기</button>
						</div>
						
						<br />
						<br />						
					</div>
				</div>
		</div>
		
		<div style="display:flex; flex-direction: column;">
			<div class="float-right" style="float:right; width:100%;" >
				<button id="created" class="btn" style="background-color: #47b8e0; color: white; height: 40px; float:right;  border-style: dashed; border-color: white; border-width: 2px;" >
				주최 중 공모전</button>
		</div>
		<div id="panel2" style="width:1110px; display: none;">
			<div style="background-color: #47b8e0; border-radius: 2%;" align="center">
				<br /><br /><br />
				
				<p class="h5" align="left" style="margin-left: 30px; color: white;">대기 중</p><br />
										
				<!--------------------------------- 대기 중 공모전 리스트 ------------------------->
				<div id="table" style="width: 95%;">
					<div class="thead">
						<span class="cell col1">번호</span>
						<span class="cell col2">제목</span>
						<span class="cell col3">모집 일자</span>
						<span class="cell col4">진행 일자</span>
						<span class="cell col5">입금 일자</span>
						<span class="cell col6">승인 여부</span>
						<span class="cell col7">총 상금</span>
					</div>
					<div class="tbody">
						<span class="cell col1">1</span>
						<span class="cell col2">2019 맵 콘테스트 공모전</span>
						<span class="cell col3">19-12-01 ~ 19-12-15</span>
						<span class="cell col4">16-12-15 ~ 19-01-15</span>
						<span class="cell col5">2019-11-25</span>
						<span class="cell col6">검토 중</span>
						<span class="cell col7">6,000,000 원</span>
					</div>			
				</div>
				<br /><br />
				
				<!------------------------- 모집 중 공모전 리스트 ------------------------------------>			
				<p class="h5" align="left" style="margin-left: 30px; color: white;">모집 중</p><br />						
				<!-- 모집중 공모전 팀 리스트 -->
				<div id="table" style="width: 95%;">
					<div class="thead">
						<span class="cell col1">번호</span>
						<span class="cell col2">제목</span>
						<span class="cell col3">모집 일자</span>
						<span class="cell col4">진행 일자</span>
						<span class="cell col5">총 상금</span>
						<span class="cell col6">모집중인 팀 수</span>
						<span class="cell col7">조회 수</span>
						<span class="cell col8">확장</span>
					</div>
					<div class="tbody">
						<span class="cell col1">1</span>
						<span class="cell col2">2019 맵 콘테스트 공모전</span>
						<span class="cell col3">19-12-01 ~ 19-12-15</span>
						<span class="cell col4">19-12-15 ~ 19-01-15</span>
						<span class="cell col5">5,000,000</span>
						<span class="cell col6">3</span>
						<span class="cell col7">365</span>
						<span class="cell col8">
							<button id="createdRe" class="btn" style="color: black; height: 40px; padding-bottom: 0px; padding-top: 0px;">
								<i class="fas fa-angle-down" style="padding-bottom: 0px; font-size: 30px;"></i></button>
						</span>
					</div>									
				</div>
				<div id="createdTeam1" align="center" style="width: 95%; height: 150px; padding: 0px; display: none; background-color: white; border-radius: 20px 20px; border: dashed; border-color: 34314c;">
					<div class="container" style="display: table; width: 95%; height:25%;">
						<div style="display: table-row;">
							<div style="display: table-cell; width: 150px; font-weight: bold;">
								프로젝트 팀 이름
							</div>
							<div style="display: table-cell; width: 400px;">
								프로젝트 팀 명
							</div>
							<div style="display: table-cell; width: 75px; font-weight: bold;">
								개설자
							</div>
							<div style="display: table-cell;">
								닉네임
							</div>
							<div style="display: table-cell; width: 50px; font-weight: bold;">
								성별
							</div>
							<div style="display: table-cell; width: 100px;">
								상관없음
							</div>
						</div>
					</div>
					<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
						<div style="display: table-row">
							<div style="display: table-cell; width: 150px; font-weight: bold;">
								프로젝트 소개
							</div>
							<div style="display: table-cell; width: 400px;">
								프로젝트 소개 내용
							</div>
							<div style="display: table-cell; width: 75px; font-weight: bold;">
								개설일
							</div>
							<div style="display: table-cell;">
								2019-12-20
							</div>
							<div style="display: table-cell; width: 50px; font-weight: bold;">
								인원
							</div>
							<div style="display: table-cell; width: 100px;">
								4/6
							</div>
						</div>
					</div>
					<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
						<div style="display: table-row">
							<div style="display: table-cell; width: 150px; font-weight: bold;">
								온라인
							</div>
							<div style="display: table-cell; width: 600px;">
								<div class="progress">
									<div class="progress-bar progress-bar-animated progress-bar-striped bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
								</div>
							</div>
							<div style="display: table-cell; width: 150px; font-weight: bold;">
								오프라인
							</div>			
						</div>
					</div>
					<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
						<div style="display: table-row">
							<div style="display: table-cell; width: 150px; font-weight: bold;">
								필요한 기술
							</div>
							<div style="display: table-cell; width: 150px;">
								JAVA
							</div>
							<div style="display: table-cell; width: 150px;">
								Servlet
							</div>
							<div style="display: table-cell; width: 150px;">
								Javascript
							</div>
							<div style="display: table-cell; width: 50px; font-weight: bold;">
								지역
							</div>
							<div style="display: table-cell; width: 150px;">
								서울 마포구
							</div>
						</div>
					</div>
				</div>
				<br /><br />
				<div class="container" align="center">
					<div>
						<nav aria-label="Page navigation example"
							style="width: 300px;">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>	
					</div>						
				</div>
				
				<br />
				<br />
				<br />
				
				<!-- ----------------------------- 진행 중 공모전 팀 리스트 -------------------------------------- -->
				<p class="h5" align="left" style="margin-left: 30px; color: white;">진행중</p><br />
				<div id="table" style="width: 95%;">
				<div class="thead">
					<span class="cell col1">번호</span>
					<span class="cell col2">제목</span>
					<span class="cell col3">모집 일자</span>
					<span class="cell col4">진행 일자</span>
					<span class="cell col5">총 상금</span>
					<span class="cell col6">모집중인 팀 수</span>
					<span class="cell col7">조회 수</span>
					<span class="cell col8">확장</span>
				</div>
				<div class="tbody">
					<span class="cell col1">1</span>
					<span class="cell col2">2019 맵 콘테스트 공모전</span>
					<span class="cell col3">19-12-01 ~ 19-12-15</span>
					<span class="cell col4">19-12-15 ~ 19-01-15</span>
					<span class="cell col5">5,000,000</span>
					<span class="cell col6">3</span>
					<span class="cell col7">365</span>
					<span class="cell col8">
						<button id="createPlay" class="btn" style="color: black; height: 40px; padding-bottom: 0px; padding-top: 0px;">
							<i class="fas fa-angle-down" style="padding-bottom: 0px; font-size: 30px;"></i></button>
					</span>
				</div>									
			</div>
			<div id="playTeam1" align="center" style="width: 95%; height: 150px; padding: 0px; display: none; background-color: white; border-radius: 20px 20px; border: dashed; border-color: 34314c;">
				<div class="container" style="display: table; width: 95%; height:25%;">
					<div style="display: table-row;">
						<div style="display: table-cell; width: 150px; font-weight: bold;">
							프로젝트 팀 이름
						</div>
						<div style="display: table-cell; width: 400px;">
							프로젝트 팀 명
						</div>
						<div style="display: table-cell; width: 75px; font-weight: bold;">
							개설자
						</div>
						<div style="display: table-cell;">
							닉네임
						</div>
						<div style="display: table-cell; width: 50px; font-weight: bold;">
							성별
						</div>
						<div style="display: table-cell; width: 100px;">
							상관없음
						</div>
					</div>
				</div>
				<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
					<div style="display: table-row">
						<div style="display: table-cell; width: 150px; font-weight: bold;">
							프로젝트 소개
						</div>
						<div style="display: table-cell; width: 400px;">
							프로젝트 소개 내용
						</div>
						<div style="display: table-cell; width: 75px; font-weight: bold;">
							개설일
						</div>
						<div style="display: table-cell;">
							2019-12-20
						</div>
						<div style="display: table-cell; width: 50px; font-weight: bold;">
							인원
						</div>
						<div style="display: table-cell; width: 100px;">
							4/6
						</div>
					</div>
				</div>
				<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
					<div style="display: table-row">
						<div style="display: table-cell; width: 150px; font-weight: bold;">
							온라인
						</div>
						<div style="display: table-cell; width: 600px;">
							<div class="progress">
								<div class="progress-bar progress-bar-animated progress-bar-striped bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
							</div>
						</div>
						<div style="display: table-cell; width: 150px; font-weight: bold;">
							오프라인
						</div>			
					</div>
				</div>
				<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
					<div style="display: table-row">
						<div style="display: table-cell; width: 150px; font-weight: bold;">
							필요한 기술
						</div>
						<div style="display: table-cell; width: 150px;">
							JAVA
						</div>
						<div style="display: table-cell; width: 150px;">
							Servlet
						</div>
						<div style="display: table-cell; width: 150px;">
							Javascript
						</div>
						<div style="display: table-cell; width: 50px; font-weight: bold;">
							지역
						</div>
						<div style="display: table-cell; width: 150px;">
							서울 마포구
						</div>
					</div>
				</div>
			</div>
				<br /><br />
				<div class="container" align="center">
					<div>
						<nav aria-label="Page navigation example"
							style="width: 300px;">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>	
					</div>						
				</div>
				
				<br />
				<br />
				<br />
				
				<!--------------------------------- 완료한 공모전 리스트 ----------------------------------->
				<p class="h5" align="left" style="margin-left: 30px; color: white;">완료</p><br />
				<div id="table" style="width: 95%;">
					<div class="thead">
						<span class="cell col1">번호</span>
						<span class="cell col2">제목</span>
						<span class="cell col3">모집 일자</span>
						<span class="cell col4">진행 일자</span>
						<span class="cell col5">총 상금</span>
						<span class="cell col6">참가 팀 수</span>
						<span class="cell col7">조회 수</span>
						<span class="cell col8">확장</span>
					</div>
					<div class="tbody">
						<span class="cell col1">1</span>
						<span class="cell col2">2019 맵 콘테스트 공모전</span>
						<span class="cell col3">19-12-01 ~ 19-12-15</span>
						<span class="cell col4">19-12-15 ~ 19-01-15</span>
						<span class="cell col5">5,000,000</span>
						<span class="cell col6">3</span>
						<span class="cell col7">365</span>
						<span class="cell col8">
							<button id="contestEnd" class="btn" style="color: black; height: 40px; padding-bottom: 0px; padding-top: 0px;">
								<i class="fas fa-angle-down" style="padding-bottom: 0px; font-size: 30px;"></i></button>
						</span>
					</div>									
				</div>
				<div id="endingTeam" align="center" style="width: 95%; height: 150px; padding: 0px; display: none; background-color: white; border-radius: 20px 20px; border: dashed; border-color: 34314c;">
					<div class="container" style="display: table; width: 95%; height:25%;">
						<div style="display: table-row;">
							<div style="display: table-cell; width: 150px; font-weight: bold;">
								프로젝트 팀 이름
							</div>
							<div style="display: table-cell; width: 400px;">
								프로젝트 팀 명
							</div>
							<div style="display: table-cell; width: 75px; font-weight: bold;">
								개설자
							</div>
							<div style="display: table-cell;">
								닉네임
							</div>
							<div style="display: table-cell; width: 50px; font-weight: bold;">
								성별
							</div>
							<div style="display: table-cell; width: 100px;">
								상관없음
							</div>
						</div>
					</div>
					<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
						<div style="display: table-row">
							<div style="display: table-cell; width: 150px; font-weight: bold;">
								프로젝트 소개
							</div>
							<div style="display: table-cell; width: 400px;">
								프로젝트 소개 내용
							</div>
							<div style="display: table-cell; width: 75px; font-weight: bold;">
								개설일
							</div>
							<div style="display: table-cell;">
								2019-12-20
							</div>
							<div style="display: table-cell; width: 50px; font-weight: bold;">
								인원
							</div>
							<div style="display: table-cell; width: 100px;">
								4/6
							</div>
						</div>
					</div>
					<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
						<div style="display: table-row">
							<div style="display: table-cell; width: 150px; font-weight: bold;">
								온라인
							</div>
							<div style="display: table-cell; width: 600px;">
								<div class="progress">
									<div class="progress-bar progress-bar-animated progress-bar-striped bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
								</div>
							</div>
							<div style="display: table-cell; width: 150px; font-weight: bold;">
								오프라인
							</div>			
						</div>
					</div>
					<div class="container" style="display: table; width: 95%; height:25%; background-color: white;">
						<div style="display: table-row">
							<div style="display: table-cell; width: 150px; font-weight: bold;">
								필요한 기술
							</div>
							<div style="display: table-cell; width: 150px;">
								JAVA
							</div>
							<div style="display: table-cell; width: 150px;">
								Servlet
							</div>
							<div style="display: table-cell; width: 150px;">
								Javascript
							</div>
							<div style="display: table-cell; width: 50px; font-weight: bold;">
								지역
							</div>
							<div style="display: table-cell; width: 150px;">
								서울 마포구
							</div>
						</div>
					</div>
				</div>
				<br /><br />
				<div class="container" align="center">
					<div>
						<nav aria-label="Page navigation example"
							style="width: 300px;">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>	
					</div>						
				</div>
				
				<br /><br />
				
				<div class="float-center">
					<button id="closed2" class="btn" style="background-color: #47b8e0; color: white; height: 40px;  border-style: dashed; border-color: white; border-width: 2px;" >
					접기</button>
				</div>
				
				<br />
				<br />
			</div>
		</div>
		
		</div>
		
		
	</div>
	
	<br /><br /><br />
	
	<div class="container" >
	
		<div class="float-left">
			<button type="submit" class="btn" style="background-color: #79bd9a; color: white;">모집 중</button>
			<button type="submit" class="btn" style="background-color: gray; color: white;">모집 완료</button>
		</div>
		<div class="float-right">
			<select class="col-md-5" style="height: 43px;">
				<option>전체</option>
				<option>제목</option>
				<option>내용</option>
				<option>작성자</option>
				<option>제목+전체</option>
			</select>
			<input type="text" class="form-control col-md-5" placeholder="Search" style="background-color: rgba( 255, 255, 255, 0.5 )">
			<a href="" style="padding-top: 5px;"><i class="fas fa-search fa-2x" style="color: #34314c"></i></a>
		</div>		
		
		<div class="col-lg-25">
			<table class="table table-hover table-striped" style="text-align: center;">
				<thead id="thead" style="text-align: center;">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>주최자</th>
						<th>모집기간</th>
						<th>진행일자</th>
						<th>총 상금</th>
						<th>상태</th>
						<th>참여 팀 수</th>
						<th>조회 수</th>
					</tr>
				</thead>
				<tbody id="tbody" style="text-align: right;">
					<tr>
						<th>1</th>
						<th>Bixby Developer 2019</th>
						<th>11 삼성전자</th>
						<th>19-09-30 ~ 19-10-15</th>
						<th>19-10-15 ~ 19-11-15</th>
						<th>900,000</th>
						<th>진행중</th>
						<th>10</th>
						<th>600</th>
					</tr>
					<tr>
						<th>2</th>
						<th>왜 안되냐?</th>
						<th>11 삼성전자</th>
						<th>19-09-30 ~ 19-10-15</th>
						<th>19-10-15 ~ 19-11-15</th>
						<th>1,000,000</th>
						<th>진행중</th>
						<th>10</th>
						<th>600</th>
					</tr>
					<tr>
						<th>3</th>
						<th>제발 좀 되자</th>
						<th>11 삼성전자</th>
						<th>19-09-30 ~ 19-10-15</th>
						<th>19-10-15 ~ 19-11-15</th>
						<th>2,300,000</th>
						<th>진행중</th>
						<th>10</th>
						<th>600</th>
					</tr>
					<tr>
						<th>4</th>
						<th>Bixby Developer 2019</th>
						<th>11 삼성전자</th>
						<th>19-09-30 ~ 19-10-15</th>
						<th>19-10-15 ~ 19-11-15</th>
						<th>총 상금</th>
						<th>진행중</th>
						<th>10</th>
						<th>600</th>
					</tr>
					<tr>
						<th>5</th>
						<th>Bixby Developer 2019</th>
						<th>11 삼성전자</th>
						<th>19-09-30 ~ 19-10-15</th>
						<th>19-10-15 ~ 19-11-15</th>
						<th>총 상금</th>
						<th>진행중</th>
						<th>10</th>
						<th>600</th>
					</tr>
					<tr>
						<th>6</th>
						<th>Bixby Developer 2019</th>
						<th>11 삼성전자</th>
						<th>19-09-30 ~ 19-10-15</th>
						<th>19-10-15 ~ 19-11-15</th>
						<th>총 상금</th>
						<th>진행중</th>
						<th>10</th>
						<th>600</th>
					</tr>
					<tr>
						<th>7</th>
						<th>Bixby Developer 2019</th>
						<th>11 삼성전자</th>
						<th>19-09-30 ~ 19-10-15</th>
						<th>19-10-15 ~ 19-11-15</th>
						<th>총 상금</th>
						<th>진행중</th>
						<th>10</th>
						<th>600</th>
					</tr>
					<tr>
						<th>8</th>
						<th>Bixby Developer 2019</th>
						<th>11 삼성전자</th>
						<th>19-09-30 ~ 19-10-15</th>
						<th>19-10-15 ~ 19-11-15</th>
						<th>총 상금</th>
						<th>진행중</th>
						<th>10</th>
						<th>600</th>
					</tr>
					<tr>
						<th>9</th>
						<th>Bixby Developer 2019</th>
						<th>11 삼성전자</th>
						<th>19-09-30 ~ 19-10-15</th>
						<th>19-10-15 ~ 19-11-15</th>
						<th>총 상금</th>
						<th>진행중</th>
						<th>10</th>
						<th>600</th>
					</tr>
					<tr>
						<th>10</th>
						<th>Bixby Developer 2019</th>
						<th>11 삼성전자</th>
						<th>19-09-30 ~ 19-10-15</th>
						<th>19-10-15 ~ 19-11-15</th>
						<th>총 상금</th>
						<th>진행중</th>
						<th>10</th>
						<th>600</th>
					</tr>
				</tbody>
			</table>
		</div>
		
		<br /><br /><br />
		
		<div class="container" style="clear: both;" align="right">
				<button type="button" class="btn" style="width: 100px; background-color : #34314c; color: white">작성하기</button>
		</div>
			
		<div class="container" align="center">
			<div style="clear: both;">
				<nav aria-label="Page navigation example"
					style="width: 300px;">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>	
			</div>						
		</div>
	</div>
	
</body>
</html>