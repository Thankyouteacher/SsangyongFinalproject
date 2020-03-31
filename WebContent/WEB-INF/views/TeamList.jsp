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
<title>TeamList.jsp</title>

<style type="text/css">

#table {display: table; width: 100%; text-align: center; font-size: 15px;}
.table {color: #d2d2d2}
.thead {display: table-header-group; background-color: #d2d2d2;}
.tbody {display: table-row-group;}
.cell {display: table-cell; padding: 3px; border: 0.8px solid black;}
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
	});

</script>

</head>
<body>

<div class="container">

	<!-- 모집중 공모전 팀 리스트 -->

	<div id="table">
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
	
	<div id="team1" class="container" align="center" style=" height: 150px; padding: 0px; display: none;">
		<div class="container" style="display: table; width: 100%; height:25%; background-color: #d2d2d2;">
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
		<div class="container" style="display: table; width: 100%; height:25%; background-color: #d2d2d2;">
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
		<div class="container" style="display: table; width: 100%; height:25%; background-color: #d2d2d2;">
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
		<div class="container" style="display: table; width: 100%; height:25%; background-color: #d2d2d2;">
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
	
	<div id="table">		
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
	
	<!-- 모집 중 공모전 팀 리스트 end -->
	
	<br /><br /><br /><br /><br />
	
	<!-- 진행 중 공모전 팀 리스트 -->
	<div id="table">
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
	
	<div id="team2" class="container" align="center" style=" height: 150px; padding: 0px; display: none;">
		<div class="container" style="display: table; width: 100%; height:25%; background-color: #d2d2d2;">
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
		<div class="container" style="display: table; width: 100%; height:25%;background-color: #d2d2d2;">
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
		<div class="container" style="display: table; width: 100%; height:25%; background-color: #d2d2d2;">
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
		<div class="container" style="display: table; width: 100%; height:25%; background-color: #d2d2d2;">
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
	
	<div id="table">		
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
	<br /><br /><br /><br /><br />
	
	<!-- 완료 공모전 팀 리스트 -->
	<div id="table">
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
	
	<div id="endTeam" class="container" align="center" style=" height: 150px; padding: 0px; display: none;">
		<div class="container" style="display: table; width: 100%; height:25%; background-color: #d2d2d2;">
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
		<div class="container" style="display: table; width: 100%; height:25%;background-color: #d2d2d2;">
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
		<div class="container" style="display: table; width: 100%; height:25%; background-color: #d2d2d2;">
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
		<div class="container" style="display: table; width: 100%; height:25%; background-color: #d2d2d2;">
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
	
	<div id="table">		
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
</div>



<br /><br />

<br /><br /><br />





		
		
		
</body>
</html>