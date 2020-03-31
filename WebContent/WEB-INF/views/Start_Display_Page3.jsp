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
<title>팀장선출</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>

	<!-- Header -->
	<div style="background-color: #34314c; height: 115px;"></div>
	<div class="container"><header>
			<jsp:include page="Header.jsp" />
		</header></div>

	<div style="background-color: white; width: 90%; height: 800px; margin: 0 auto;">

		<dl style="height: 8%; margin: 0 auto;">
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">●</div>
				<div style="height: 15%; font-size: 5pt" align="center">팀장선출</div>
				<div style="height: 15%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 1%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">-</div>
				<div style="height: 20%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">○</div>
				<div style="height: 15%; font-size: 5pt" align="center">모드선택</div>
				<div style="height: 15%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 1%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">-</div>
				<div style="height: 20%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">○</div>
				<div style="height: 15%; font-size: 5pt" align="center">과제선택</div>
				<div style="height: 15%; font-size: 5pt" align="center">(알리미)</div>
			</div>
			<div style="width: 1%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">-</div>
				<div style="height: 20%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">○</div>
				<div style="height: 15%; font-size: 5pt" align="center">일정선택</div>
				<div style="height: 15%; font-size: 5pt" align="center">(알리미)</div>
			</div>

		</dl>

		<dl style="width: 10%; height: 100%; float: left; position: absolute; margin-top: 70px;" class="d-flex flex-column mb-3">
			<!-- 투표한 사람들 리스트 나타내주기 -->
			<c:forEach var="member" items="${completeMembers }">
				<div style="width: 100%; height: 12.5%;">
					<div style="height: 70%;" align="center"><i class="fas fa-user-check" style="font-size: 30pt; margin: 12px auto;"></i></div>
					<div style="height: 30%;">
						<div style="width: 30%; height: 100%; float: left;"><span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${member.usLv }</span></div>
						<div style="width: 40%; height: 100%; float: left;" align="center"><span>${member.nickName }</span></div>
						<div style="width: 30%; height: 100%; float: right;"><a href="member_info_pro.action?member=${member.usId }" style="float: left;"> <i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
						</a></div>
				</div>
				</div>
			</c:forEach>
			<!-- 투표안한 사람들 리스트 나타내주기 -->
			<c:forEach var="member" items="${progressMembers }">
				<div style="width: 100%; height: 12.5%;">
					<div style="height: 70%;" align="center"><i class="fas fa-user" style="font-size: 30pt; margin: 12px auto;"></i></div>
					<div style="height: 30%;">
						<div style="width: 30%; height: 100%; float: left;"><span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${member.usLv }</span></div>
						<div style="width: 40%; height: 100%; float: left;" align="center"><span>${member.nickName }</span></div>
						<div style="width: 30%; height: 100%; float: right;"><a href="member_info_pro.action?member=${member.usId }" style="float: left;"> <i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
						</a></div>
				</div>
				</div>
			</c:forEach>
			<!-- 더미 데이터 -->
		</dl> <!-- 내가 선출한 팀원 -->

		<dl style="background-color: white !important; width: 50%; height: 30%; margin: 0 auto; margin-top: 80px; border: 1px solid black;" align="center" class="d-flex justify-content-center bg-secondary mb-3">
			<div style="width: 33.333%; height: 60%; margin: 50px auto;">
				<div style="height: 70%;"><i class="fas fa-user" style="font-size: 60pt; margin: 12px auto;"></i></div>
				<div style="height: 30%;">
					<!-- ${selecter} -->
					<div style="width: 37%; height: 100%; float: left;"><span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${selecter.usLv }</span></div>
					<div style="width: 26%; height: 100%; float: left;" align="center"><span>${selecter.nickName }</span></div>
					<div style="width: 37%; height: 100%; float: right;"><a href="member_info_pro.action?member=${selecter.usId }" style="float: left;"> <i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
					</a></div>
			</div>
			</div>
		</dl>




		<div style="width: 70%; height: 40%; margin: 50px auto;" align="center">
			<h3>다른팀원들의 투표가 진행중입니다. 투표를 독려해주세요!</h3> <br>
			<div style="width: 60%; margin: 0 auto;">
				<h1 style="font-weight: bold; color: #3b8686">[꼭 알아두세요!]</h1>
				<h1>투표가 완료되면, 팀장은 프로젝트 진행모드를 선택하게 됩니다.</h1>
				<h1>1. 가이드 챌린지 모드(어려움, 중간, 쉬움)</h1>
				<h1>2. 알리미 모드</h1>
				<h1>3. 셀프 디자인 모드</h1>
				<h1>팀원들과 충분한 논의 후 모드를 결정해주세요!</h1>
		</div> <!-- 
			user-circle
			<dd style="width: 16%; height: 10%; float: right; margin: 50px 0 0 0;">
				<nav>
					<ul class="pager">
						<li><a href="#" style="width: 100%;">Next</a></li>
					</ul>
				</nav>
			</dd>
			 -->
	</div>
	</div>
</body>
</html>