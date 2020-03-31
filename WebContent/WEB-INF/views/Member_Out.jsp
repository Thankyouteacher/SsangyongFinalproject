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
<title>Insert title here</title>
<style type="text/css">
table th {
	text-align: center !important;
}

table tr {
	background-color: white !important;
}
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

	<div style="width: 800px; height: 400px; margin: 0 auto; margin-top: 100px;">
		<div style="width: 100%; height: 20%;" align="center">
			<h3>퇴출투표결과</h3>
		</div>
		<div style="width: 100%; height: 60%;" class="">
			<c:if test="${outCase == 2 }"> 
				<table style="width: 60%; height: 40%; text-align: center; margin: 0 auto;">
					<tr>
						<th>팀명</th>
						<td>${projectInfo.ppName }</td>
					</tr>
					<tr>
						<th>퇴출일자</th>
						<td>${date }</td>
					</tr>
					<tr>
						<th>퇴출사유</th>
						<td>${reason }</td>
					</tr>
				</table>
				<div style="width: 40%; height: 50%; margin: 0 auto; margin-top: 10px; border: 2px solid; border-radius: 10px;" align="center" class="d-flex flex-column">
					<span style="font-weight: bold; font-size: 15pt; margin-top: 10px;">찬 성 &nbsp;&nbsp; : &nbsp;&nbsp; ${yes == null ? 0 : yes } 표</span> <span style="font-weight: bold; font-size: 15pt;">반 대 &nbsp;&nbsp; : &nbsp;&nbsp; ${no == null ? 0 : no } 표</span> <span style="font-weight: bold; font-size: 15pt;">무 효 &nbsp;&nbsp; : &nbsp;&nbsp; ${noAnswer == null ? 0 : noAnswer } 표</span>
				</div>
				<div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">프로젝트에서 퇴출되었습니다.</div>
			</c:if>
				<div style="text-align: center;">
					<span>' <h3>${projectInfo.ppName }</h3> ' <h4>팀을 탈퇴하였습니다.</h4></span>
					<h4>프로젝트에 대한 기록이 삭제되었습니다.</h4>
				</div>
			<div class="progress" style="width: 90%; height: 40px; margin-top: 20px; border-radius: 15px; border: 2px solid #34314C; margin: 0 auto;">
				<div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: ${progress }%; color:black;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${progress }%</div>
			</div>
			<div style="margin: 0 auto; width: 150px; height: 40px; margin-top: 100px;">
				<a class="button" href="moziplist.action" style="width: 100%; height: 100%; text-align: center;">프로젝트 홈으로</a>
			</div>
		</div>
	</div>

</body>
</html>