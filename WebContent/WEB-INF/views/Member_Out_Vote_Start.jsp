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
<title>Do!Project</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$(".voteBtn").click(function()
		{
			if($("input:checked").val()==1 || $("input:checked").val()==2 || $("input:checked").val()==3)
				$("#voteForm").submit();
			else
			{
				alert("체크해주세요.");
				return false;
			}	
		});
		
		$("a").click(function()
		{
			if(confirm("투표창을 나가시면 '무효' 처리됩니다. 그래도 나가시겠습니까?"))
			{
				$("a").attr("href","member_out_vote_ok.action?slId="+3);
			}
			else
				event.preventDefault();
		});
		
		
	});
	
</script>
</head>
<body>
	<!-- Header -->
	<div style="background-color: #34314c; height: 115px;"></div>
	<div class="container">
		<header>
			<jsp:include page="Header.jsp" />
		</header>
	</div>
	<div style="width: 800px; height: 800px; margin: 0 auto; margin-top: 2%;">
		<div style="width: 80%; height: 8%; /*  background-color: yellow;  */ margin: 0 auto;" align="center">
			<div style="width: 5%; height: 100%; float: left;">
				<a href="team_main.action" style="font-size: 15pt;">
					<i class="fas fa-arrow-left"></i>
				</a>
			</div>
			<div style="width: 25%; height: 100%; float: right; font-size: 15pt;">
				<i class="far fa-clock"></i>
				${remainTime.outHours}:${remainTime.outMinutes }:${remainTime.outSeconds } 남음
			</div>
			<div style="width: 40%; height: 100%; font-size: 20pt;">
				<b>퇴출 투표</b>
			</div>
		</div>
		<div style="width: 40%; height: 25%; margin-top: 3%; /*  background-color: yellow;  */ margin: 0 auto;">
			<div style="width: 60%; height: 100%; margin: 0 auto; border: 2px solid; border-radius: 5px; float: left">
				<div style="width: 33.333%; height: 70%; margin: 0 auto; margin-top: 20px;">
					<div style="height: 70%;" align="center">
						<img src="<%=cp %>/profilePhoto/member${targetInfo.usId }/${targetInfo.usPhoto}" style="width: 80px; height: 80px; border-radius:40px; margin: 12px auto;" onerror="this.src= '<%=cp %>/profilePhoto/default.png'">
					</div>
					<div style="height: 30%;">
						<!-- ${selecter} -->
						<div style="width: 5%; height: 100%; float: left;">
							<span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${targetInfo.usLv}<%-- ${selecter.usLv } --%></span>
						</div>
						<div style="width: 90%; height: 100%; float: left;" align="center">
							<span style="font-size: 12pt;">${targetInfo.nickName}<%-- ${selecter.nickName } --%></span>
						</div>
						<div style="width: 5%; height: 100%; float: right;">
							<a href="" style="float: left;">
								<i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 38%; height: 100%; margin: 0 auto; border: 2px solid; border-radius: 5px; float: right" class="d-flex flex-column" align="center">
				<form action="member_out_vote_ok.action" id="voteForm">
					<div style="margin-top: 25%;">
						<input type="radio" name="slId" value="1" id="찬성" hidden="">
						<label for="찬성">찬 성</label>
					</div>
					<div>
						<input type="radio" name="slId" value="2" id="반대" hidden="">
						<label for="반대">반 대</label>
					</div>
					<div>
						<input type="radio" name="slId" value="3" id="무효" hidden="">
						<label for="무효">무 효</label>
					</div>
				</form>
			</div>
		</div>
		<div style="width: 100%; height: 20%; margin-top: 3%;">
			<div style="width: 50%; height: 100%; margin: 0 auto; border-radius: 5px;">
				<div align="center">
					<b>퇴출 사유</b>
				</div>
				<div>
					<input type="text" value="${targetReason }" style="width: 100%; height: 30%; text-align: left;" readonly="readonly">
				</div>
				<div style="" align="center">
					<span style="font-weight: bold; color: #3b8686; font-size: 10pt;">[꼭 알아두세요!]</span>
					<br>
					<span style="font-size: 8pt;">투표를 하지않고 나가게되면 <span style="color: #E53A40;">'무효'</span>로 처리됩니다.
					</span>
					<br>
					<span style="font-size: 8pt;">투표 미실시의 경우, 투표종료 기간이 되면 자동으로 <span style="color: #E53A40;">'무효'</span>로 처리되며, 과반수 찬성일 경우 팀원이 퇴출됩니다.
					</span>
				</div>
			</div>
		</div>
		<div style="width: 100%; height: 10%; margin-top: 3%;" align="center">
			<button type="button" class="voteBtn">투표완료</button>
		</div>
	</div>

</body>
</html>