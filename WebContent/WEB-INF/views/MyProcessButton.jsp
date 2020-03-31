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
<title>MyProcessButton.jsp</title>
<style type="text/css">
#flip1:hover {
	color: white;
	background-color: #47b8e0;
}

#flip1 {
	width: 150px;
	float: right;
	color: black;
}

#panel1, #flip1 {
	padding: 5px;
	border: solid 2px #34314c;
}

#panel1 {
	display: none;
	height: 650px;
	width: 1100px;
	clear: both;
}

#flip2:hover {
	color: white;
	background-color: #47b8e0;
}

#flip2 {
	width: 150px;
	float: right;
	color: black;
}

#panel2, #flip2 {
	padding: 5px;
	border: solid 2px #34314c;
}

#panel2 {
	display: none;
	height: 650px;
	width: 1100px;
	clear: both;
}

#flip3:hover {
	color: white;
	background-color: #47b8e0;
}

#flip3 {
	width: 150px;
	float: right;
	color: black;
}

#panel3, #flip3 {
	padding: 5px;
	border: solid 2px #34314c;
}

#panel3 {
	display: none;
	height: 650px;
	width: 1100px;
	clear: both;
}
</style>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(function()
	{
		$(".btnn").click(function()
		{
			var pid = $(this).parent().children().eq(0).val();
			
			alert(pid);
			
			$(this).attr("href", "projectnavi.action?pid=" + pid); 
		});
	});

</script>
</head>
<body>
	<c:forEach var="list" items="${myMainProjectListProgress }">
		<article>
			<br />
			<div class="blankTop"></div>
			<div id="mainContent">
				<input class="title" type="text" style="width: 550px; background-color: transparent; border: 0; color: black;" readonly="readonly" value="${list.rname }">
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 20%; background-color: transparent; border: none; color: gray; margin-top: 3%;" readonly="readonly" value="주제">
					<div>
						<input type="text" id="inputBackground" class="form-control" style="width: 150%; margin-top: 5%;" readonly="readonly" value="${list.sname == null ? '주제미정' : list.sname }">
					</div>
				</div>
			</div>
			<div id="mainContent">
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 30%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="개설자">
					<div class="inContent">
						<input type="text" id="inputBackground" class="form-control" style="width: 100%;" readonly="readonly" value="${list.nickName }">
					</div>
				</div>
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 10%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="칭호">
					<c:forEach var="acName" items="${list.acName }">
						<div>
							<input type="text" id="inputBackground" class="form-control" style="width: 100%;" readonly="readonly" value="${acName }">
						</div>
					</c:forEach>
				</div>
			</div>

			<div>
				<br>
			</div>

			<div id="mainContent">
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 85%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="시작일">
					<div>
						<input type="text" id="inputBackground" class="form-control" style="width: 95%;" readonly="readonly" value="${list.startDate }">
					</div>
				</div>
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 85%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="남은일자">
					<div>
						<input type="text" id="inputBackground" class="form-control" style="width: 60%;" readonly="readonly" value="${list.restDate }일">
					</div>
				</div>
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 40%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="종료일">
					<div>
						<input type="text" id="inputBackground" class="form-control" style="width: 70%;" readonly="readonly" value="${list.finishDate }">
					</div>
				</div>
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 80%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="온라인비율">
					<div>
						<input type="text" id="inputBackground" class="form-control" style="width: 70%;" readonly="readonly" value="${list.onRate }%">
					</div>
				</div>
			</div>

			<div>
				<br>
			</div>

			<div id="mainContent">
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 25%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="레벨">
					<div>
						<input type="text" id="inputBackground" class="form-control" style="width: 70%;" readonly="readonly" value="${list.minLevel }">
					</div>
					~
					<div>
						<input type="text" id="inputBackground" class="form-control" style="width: 70%;" readonly="readonly" value="${list.maxLevel }">
					</div>
				</div>
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 40%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="성별">
					<div>
						<input type="text" id="inputBackground" class="form-control" style="width: 50%;" readonly="readonly" value="${list.gselect }">
					</div>
				</div>
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 39%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="인원">
					<div>
						<c:forTokens var="currentCount" items="${list.currentCount}" delims=",">
							<input type="text" id="inputBackground" class="form-control" style="width: 50%;" readonly="readonly" value="${currentCount }/${list.peoCount }">
						</c:forTokens>
					</div>
				</div>
			</div>

			<div>
				<br>
			</div>

			<div id="mainContent">
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 18%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="지역">
					<div class="inContent">
						<input type="text" id="inputBackground" class="form-control" style="width: 160%;" readonly="readonly" value="${list.paddress }">
					</div>
				</div>
				<div class="in" style="height: 10px;">
					<input type="text" style="width: 16%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="기술">
					<c:forEach var="skName" items="${list.skName }">
						<div>
							<input type="text" id="inputBackground" class="form-control" style="width: 100%;" readonly="readonly" value="${skName }">
						</div>
					</c:forEach>
				</div>
			</div>

			<div>
				<br>
			</div>

			<div id="mainContent">
				<div class="in" style="height: 10px;">
					<div>
						<input type="text" style="width: 30%; background-color: transparent; border: 0; color: gray;" readonly="readonly" value="소개">
					</div>
					<div>
						<input type="text" id="inputBackground" class="form-control" style="width: 150%;" readonly="readonly" value="${list.pcontents }">
					</div>
				</div>
				<div>
					<input type="text" style="display: none;" value="${list.pid }">
					<!-- 프로젝트 번호 -->
					<a href="#" class="button btnn" id="enter" style="margin-left: 300px;">입장하기 &rarr;</a>
				</div>
			</div>

			<br>
			<div class="blankBot"></div>
		</article>
		<div>
			<br>
		</div>
	</c:forEach>
	<div>
		<br>
		<br>
	</div>
</body>
</html>