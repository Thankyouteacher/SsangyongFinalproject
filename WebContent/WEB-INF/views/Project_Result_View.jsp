<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트결과</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<style type="text/css">
.table th, td {
	text-align: center;
}

.nickName,
.uLevel
{
	font-size: 20pt;
	font-weight: bold;
	color: #34314C;
	
	/* margin-top: 5px;
	margin-bottom: 10px; */
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

	<div style="width: 1000px; height: 800px; /* background-color: red; */ margin: 0 auto; margin-top: 50px;">
		<div style="width: 50%; height: 10%; margin: 0 auto; text-align: center;">
			<h2 style="font-weight: bold;">프로젝트 결과</h2>
		</div>
		<div class="d-flex justify-content-center" style="width: 50%; height: 30%; float: left; padding: 10px; border-bottom: 2px solid; border-right: 2px solid;">
			<c:forEach var="member" items="${member }">
				<div style="width: 25%; height: 50%; margin: 0 auto;">
					<div style="width: 100%; height: 100%;">
						<div style="height: 70%;" align="center">
							<img src="<%=cp%>/profilePhoto/member${member.usId }/${member.usPhoto}" style="width: 70px; height: 70px; border-radius: 3Array5px; border: 2px solid #34314C;"onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
						</div>
						<div style="height: 30%;">
							<div style="width: 25%; height: 100%; float: left;">
								<span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${member.usLv }</span>
							</div>
							<div style="width: 50%; height: 100%; float: left;" align="center">
								<span>${member.nickName }</span>
							</div>
							<div style="width: 25%; height: 100%; float: right;">
								<a href="" style="float: left;">
									<i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="/* background-color: blue;  */width: 50%; height: 30%; float: right; padding: 10px; border-bottom: 2px solid;">
			<div class="d-flex flex-column">
				<div class="d-flex justify-content-center" style="display: flex;">
					<div>
						<span class="nickName" style="margin-right: 100px;">${myInfo.nickName }</span>
					</div>
					<div>
						<span class="uLevel">Lv.${myInfo.usLv}</span>
					</div>
				</div>
				<div class="progress" style="width: 90%; height: 40px; margin-top: 20px; border-radius: 15px; border: 2px solid #34314C;">
					<div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: ${progress }%; color:black;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${progress }%</div>
				</div>
				<div style="margin-top: 20px;">
					<h3 class="nickName">프로젝트 결과 : &nbsp;&nbsp;&nbsp;<span style="color: ${projectEndInfo.peSuccess==1 ? 'blue' : 'red'}">${projectEndInfo.peSuccess==1 ? '성공' : '실패' }</span></h3>
				</div>
			</div>
		</div>
		<div style="width: 100%; height: 60%; margin: 0 auto; padding: 10px;">
			<table class="table table-hover" style="font-size: 10pt; text-align: center;">
				<thead>
					<tr>
						<th>제출번호</th>
						<th>과제명</th>
						<th>최대공감인</th>
						<th>최초등록일</th>
						<th>평균별점</th>
						<th>조회수</th>
						<th>평가수</th>
						<th></th>
					</tr>
				</thead>
				<tbody align="left">
					<c:forEach var="afterSubmitList" items="${afterSubmitList }">
						<!-- <tr class="submittedReport" data-toggle="modal" data-target="#submittedReport"> -->
						<tr class="submittedReport">
							<td>${afterSubmitList.gpNum }</td>
							<td>${afterSubmitList.ssName }</td>
							<td></td>
							<td>${afterSubmitList.pdate }</td>
							<td class="d-flex justify-content-around">
								<i class="far fa-star" style="font-size: 14pt; margin: 0 auto; ${afterSubmitList.guideAvgScore == 1 ? 'color: red' : '' }; ${afterSubmitList.guideAvgScore > 1 ? 'color: #ffc952' : ''};"></i>
								<i class="far fa-star" style="font-size: 14pt; margin: 0 auto; ${afterSubmitList.guideAvgScore >= 2 ? 'color: #ffc952' : '' };"></i>
								<i class="far fa-star" style="font-size: 14pt; margin: 0 auto; ${afterSubmitList.guideAvgScore >= 3 ? 'color: #ffc952' : '' };"></i>
								<i class="far fa-star" style="font-size: 14pt; margin: 0 auto; ${afterSubmitList.guideAvgScore >= 4 ? 'color: #ffc952' : '' };"></i>
								<i class="far fa-star" style="font-size: 14pt; margin: 0 auto; ${afterSubmitList.guideAvgScore == 5 ? 'color: #ffc952' : '' };"></i>(${afterSubmitList.guideAvgScore }점)
							</td>
							<td>${afterSubmitList.guideClick }</td>
							<td style="${afterSubmitList.guideAdviceCount >= 15 ? 'color:#79bd9a' : 'color:#E53A40'}">${afterSubmitList.guideAdviceCount }</td>
							<td style="display: none;">
								<input type="text" value="${afterSubmitList.fsId }" />
							<td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>