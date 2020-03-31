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
h5.tt {
	font-weight: bold;
	margin-right: 5px;
	font-size: 6pt;
}

h5.dd {
	border: 1px solid;
	width: 80%;
	font-size: 6pt;
}
</style>
<script type="text/javascript">
	$(function()
	{
		$(".lock").click(function()
		{
			if (confirm("비공개설정을 변경하시겠습니까?"))
			{
				$.post("timeline_lock.action");
			} else
				return false;
		});
	});
</script>

</head>
<body>
	<div id="panel" style="width: 100%; height: 40%; background-color: #34314c;">
		<div style="width: 48%; height: 100%; float: left;">
			<div style="width: 50%; height: 100%; float: left;">
				<div style="height: 12.5%"></div>
				<div style="height: 12.5%">
					<div style="width: 30%; height: 100%; float: left;" align="right">
						<h5 class="tt" style="color: white;">팀명</h5>
					</div>
					<div style="width: 70%; height: 100%; float: left;">
						<h5 class="dd" style="color: white;">${progressInfo.ppName == null ? '팀명을정하세요' : progressInfo.ppName }</h5>
					</div>
				</div>
				<div style="height: 12.5%">
					<div style="width: 30%; height: 100%; float: left;" align="right">
						<h5 class="tt" style="color: white;">주제</h5>
					</div>
					<div style="width: 70%; height: 100%; float: left;">
						<h5 class="dd" style="color: white;">${progressInfo.subject == null ? '주제를정하세요' : progressInfo.subject }</h5>
					</div>
				</div>
				<div style="height: 12.5%">
					<div style="width: 30%; height: 100%; float: left;" align="right">
						<h5 class="tt" style="color: white;">진행기간</h5>
					</div>
					<div style="width: 70%; height: 100%; float: left;">
						<h5 class="dd" style="color: white;">${progressInfo.ppDate }-${progressInfo.peDate }(${progressInfo.proPeriod }일)</h5>
					</div>
				</div>
				<div style="height: 12.5%">
					<div style="width: 30%; height: 100%; float: left;" align="right">
						<h5 class="tt" style="color: white;">인원</h5>
					</div>
					<div style="width: 70%; height: 100%; float: left;">
						<h5 class="dd" style="color: white;">${progressInfo.peoNum }/${progressInfo.peoCount }</h5>
					</div>
				</div>
				<div style="height: 12.5%">
					<div style="width: 30%; height: 100%; float: left;" align="right">
						<h5 class="tt" style="color: white;">레벨</h5>
					</div>
					<div style="width: 70%; height: 100%; float: left;">
						<h5 class="dd" style="color: white;">${progressInfo.minLevel }~${progressInfo.maxLevel }</h5>
					</div>
				</div>
				<div style="height: 12.5%">
					<div style="width: 30%; height: 100%; float: left;" align="right">
						<h5 class="tt" style="color: white;">모드</h5>
					</div>
					<div style="width: 70%; height: 100%; float: left;">
						<h5 class="dd" style="color: white;">${modeName }</h5>
					</div>
				</div>
				<div style="height: 12.5%">
					<div style="width: 30%; height: 100%; float: left;" align="right">
						<h5 class="tt" style="color: white;">사용 기술</h5>
					</div>
					<div style="width: 70%; height: 100%; float: left;">
						<c:forEach var="skill" items="${skillNames }">
							<input type="text" style="width: 30%; height: 70%; float: left; padding: 0;" value="${skill }">
						</c:forEach>
					</div>
				</div>
			</div>
			<div style="width: 50%; height: 100%; float: left;">
				<div style="width: 100%; height: 12.5%;">
					<h5 class="tt" style="color: white;">프로젝트 소개</h5>
				</div>
				<div style="width: 100%; height: 75%; padding: 5px;">
					<textarea style="width: 100%; height: 100%;" readonly="readonly">${progressInfo.pcontents }</textarea>
				</div>
				<div style="width: 100%; height: 12.5%;" align="center">
					<c:if test="${grade==1 && endKey!=1 && evalKey!=1}">
						<!-- 팀장만 보여준다 -->
						<button type="button" style="padding: 0; height: 70%; width: 60%; margin-bottom: 8px; font-size: 10pt;">수정하기</button>
					</c:if>
				</div>
			</div>
		</div>
		<div style="width: 48%; height: 100%; float: right;">
			<div class="d-flex justify-content-center" style="width: 100%; height: 60%;">
				<c:forEach var="member" items="${member }">
					<label for="user1" style="width: 25%; height: 50%; margin: 0 auto;">
						<div style="width: 100%; height: 100%;">
							<div style="height: 70%;" align="center">
								<img src="<%=cp %>/profilePhoto/member${member.usId }/${member.usPhoto}" style="width: 50px; height: 50px; border-radius: 40px; margin: 12px auto;"onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
							</div>
							<div style="height: 30%;">
								<div style="width: 25%; height: 100%; float: left;">
									<span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${member.usLv }</span>
								</div>
								<div style="width: 50%; height: 100%; float: left;" align="center">
									<span>${member.nickName }</span>
								</div>
								<div style="width: 25%; height: 100%; float: right;">
									<a href="member_info_pro.action?member=${member.usId }" style="float: left;">
										<i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
									</a>
								</div>
							</div>
						</div>
					</label>
				</c:forEach>
			</div>
			${grade }
			<div style="width: 100%; height: 40%;" class="d-flex justify-content-around">
				<c:if test="${grade==1 && endKey!=1 && evalKey!=1}">
						<div style="width: 23%; height: 100%; margin-top: 15px; margin-left: 8px;">
							<button type="button" style="width: 90%; height: 60px; padding: 0;" ${memberOutKey != 1 ? '' : 'disabled="disabled"' } onclick="location.href='member_out_propose.action'">퇴출투표발의</button>
						</div>
						<div style="width: 23%; height: 100%; margin-top: 15px; margin-left: 8px;">
							<button type="button" style="width: 90%; height: 60px; padding: 0;" ${teamRemoveKey != 1 ? '' : 'disabled="disabled"' } onclick="location.href='team_remove_propose.action'">팀해체 & 종료</button>
						</div>
					<div style="width: 23%; height: 100%; margin-top: 15px; margin-left: 8px;">
						<button type="button" data-toggle="modal" data-target="#team_exit" style="width: 90%; height: 60px; padding: 0;">프로젝트 탈퇴</button>
						<jsp:include page="Team_Exit.jsp"></jsp:include>
					</div>
					<div style="width: 23%; height: 100%; padding-top: 30px;">
						<span class="switch" style="width: 90%; height: 60px; padding: 0; margin-top: 15px; margin-left: 8px;">
							<input type="checkbox" class="switch" id="switch-id" ${hasLock == 1 ? "checked='checked'" : "" } hidden>
							<label class="lock" for="switch-id" style="font-size: 10pt;">타임라인 비공개</label>
						</span>
					</div>
				</c:if>
				<c:if test="${grade==2 &&endKey!=1 && evalKey!=1 }">
					<div style="width: 23%; height: 100%; margin-top: 15px; margin-left: 8px;">
						<button type="button" data-toggle="modal" data-target="#team_exit" style="width: 90%; height: 60px; padding: 0;">프로젝트 탈퇴</button>
						<jsp:include page="Team_Exit.jsp"></jsp:include>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>