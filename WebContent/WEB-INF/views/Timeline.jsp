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
<title>타임라인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script type="text/javascript">
	$(function()
	{
		$(".timeLineDelete", this).click(function()
		{
			if (confirm("정말로 삭제하시겠습니까?"))
				$(this).parent().submit()
		});
		
		$(".download", this).click(function()
		{
			pid = $(this).children().eq(0).val();
			saveFileName = $(this).children().eq(1).val();
			usId = $(this).children().eq(2).val();
			alert(pid + " " + saveFileName + " " + usId);
			
			$(location).attr("href", "Timeline_Download.jsp?saveFileName=" + saveFileName + "&originalFileName=null&pid=" + pid + "&usId=" + usId);
		});
	});
</script>
<style type="text/css">
.main {
	width: 80%;
	height: 300px;
	border: 2px solid;
}

button {
	border: #34314c;
	color: #34314c;
}
</style>
</head>
<body>
	<c:if test="${hasLock==0 || (hasLock==1 && grade != 3)}">
		<c:if test="${myInfo.pid == pid && endKey != 1 && evalKey != 1}">
			<form action="timelineinsert.action" method="post" enctype="multipart/form-data">
				<div class="main" style="margin: 0 auto; margin-top: 3%;">
					<div style="width: 100%; height: 10%;">
						<div style="width: 15%; height: 100%; float: right;"></div>
						<div style="width: 20%; height: 100%; float: right; padding-top: 10px;"></div>
					</div>
					<div style="width: 24%; height: 80%; float: left;">
						<div style="width: 80%; height: 60%; margin: 0 auto; margin-top: 10%;">
							<div style="width: 100%; height: 85%;">
								<div style="height: 70%; padding-top: 10%;" align="center">
									<img src="<%=cp %>/profilePhoto/member${myInfo.usId }/${myInfo.usPhoto}" style="width: 80px; height: 80px; border-radius: 40px; margin: 12px auto;"onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
								</div>
							</div>
							<!-- 프로젝트번호, 유저번호, 유저 닉네임, 이름, 레벨 -->
							<input type="text" style="display: none;" name="pid" value="${myInfo.pid }">
							<div style="width: 30%; height: 15%; float: left;">
								<span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${myInfo.usLv }</span>
							</div>
							<div style="width: 30%; height: 15%; float: right;">
								<a href="member_info_pro.action?member=${myInfo.usId }" style="float: left;">
									<i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
								</a>
							</div>
							<div style="width: 40%; height: 15%; float: left;" align="center">
								<span>${myInfo.nickName }</span>
							</div>
						</div>
					</div>
					<div style="width: 76%; height: 80%; float: right; padding-right: 8px; padding-top: 10px;">
						<textarea name="content" style="width: 98%; height: 93%; float: right;" placeholder="내용을 입력하세요." required="required"></textarea>
					</div>
					<div style="width: 20%; height: 10%; float: right; padding-right: 8px;">
						<button type="submit" style="float: right; width: 100%; height: 80%; text-align: center">등록하기</button>
					</div>

					<div style="width: 5%; height: 10%; float: left; margin-left: 24%;">
						<input type="file" id="upload" name="pfile" style="width: 1%;">
						<!-- hidden -->
						<label for="upload" style="float: left; padding-left: 10px;">
							<span>
								<i class="fas fa-upload" style="font-size: 15pt; margin: 0 auto;"></i>
							</span>
						</label>
					</div>
					<div style="width: 44%; height: 10%; float: left;">
						<input name="hashTagLine" type="text" style="width: 90%; height: 80%; margin-left: 5%; font-size: 8pt;" placeholder="'띄어쓰기' 로 구분하여 태그를 달아보세요!">
					</div>
				</div>
			</form>
		</c:if>

		<br>

		<c:forEach var="timeLineList" items="${timeLineList }">
			<div class="main" style="margin: 0 auto; margin-top: 3%;">
				<div style="width: 100%; height: 10%;">
					<c:if test="${myInfo.usId != timeLineList.usId }">
						<div style="width: 12%; height: 100%; float: right;">
							<a href="#" style="font-weight: bold; float: right; padding-right: 8px; padding-top: 10px;">신고하기</a>
						</div>
					</c:if>
					<c:if test="${myInfo.usId == timeLineList.usId && evalKey != 1 && endKey != 1 }">
						<div style="width: 8%; height: 100%; float: right;">
							<form action="timelinedelete.action" method="get" class="deleteForm">
								<input type="text" style="display: none;" name="tid" value="${timeLineList.tid }">
								<a href="" class="timeLineDelete" style="font-weight: bold; float: right; padding-right: 8px; padding-top: 10px;">삭제</a>
							</form>
						</div>
						<div style="width: 8%; height: 100%; float: right;">
							<a href="" style="font-weight: bold; float: right; padding-right: 8px; padding-top: 10px;">수정</a>
						</div>
					</c:if>
					<div style="width: 25%; height: 100%; float: right; padding-top: 10px;">
						<span style="float: right;">${timeLineList.pdate }</span>
					</div>
				</div>
				<div style="width: 24%; height: 80%; float: left;">
					<div style="width: 80%; height: 60%; margin: 0 auto; margin-top: 10%;">
						<div style="width: 100%; height: 85%;">
							<div style="height: 70%; padding-top: 10%;" align="center">
								<img src="<%=cp %>/profilePhoto/member${timeLineList.usId }/${timeLineList.usPhoto}" style="width: 80px; height: 80px; border-radius: 40px; margin: 12px auto;"onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
							</div>
						</div>
						<div style="width: 30%; height: 15%; float: left;">
							<span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${timeLineList.usLv }</span>
						</div>
						<div style="width: 30%; height: 15%; float: right;">
							<a href="member_info_pro.action?member=${timeLineList.usId }" style="float: left;">
								<i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
							</a>
						</div>
						<div style="width: 40%; height: 15%; float: left;" align="center">
							<span>${timeLineList.nickName }</span>
						</div>
					</div>
				</div>
				<div style="width: 76%; height: 80%; float: right; padding-right: 8px; padding-top: 10px;">
					<textarea style="width: 98%; height: 93%; float: right;" readonly="readonly">${timeLineList.content }</textarea>
				</div>
				<div style="width: 70%; height: 10%; float: right; padding-right: 8px;">
					<div style="width: 100%; height: 80%; float: right; border: 2px solid">
						<c:forEach var="hashTag" items="${timeLineList.hashTag}">
							<span style=" width: 20%; height: 100%; float: left; color: #47b8e0"># ${hashTag }</span>
						</c:forEach>
					</div>
				</div>
				<div style="width: 5%; height: 10%; float: left; margin-left: 24%;">
					<!-- <label for="download" style="float: left; padding-left: 10px;">
						<span>
							<i class="fas fa-download" style="font-size: 15pt; margin: 0 auto;"></i>
						</span>
					</label> -->
					<div class="download" style="float: left; padding-left: 10px;">
					 	<input type="text" value="${timeLineList.pid }" hidden/>
						<input type="text" value="${timeLineList.pfile }" hidden/>
						<input type="text" value="${timeLineList.usId }" hidden/>
						<i class="fas fa-download" style="font-size: 15pt; margin: 0 auto;"></i>
					</div>
				</div>

			</div>
		</c:forEach>
	</c:if>
	<c:if test="${hasLock==1 && grade==3 }">
		<div class="main" style="background-color: gray; margin: 0 auto; margin-top: 3%; padding: 13%;" align="center">
			<h2>팀에서 비공개로 설정했어요</h2>
		</div>
	</c:if>

</body>
</html>