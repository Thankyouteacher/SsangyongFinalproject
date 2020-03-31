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
<title>방명록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script type="text/javascript">
	$(function()
	{
		$(".visitorDelete", this).click(function()
		{
			if (confirm("정말로 삭제하시겠습니까?"))
				$(this).parent().submit()
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

	<form action="visitorinsert.action">
		<div class="main" style="margin: 0 auto; margin-top: 5%;">
			<input type="text" name="usId" value="${myInfo.usId }" hidden />
			<input type="text" name="pid" value="${myInfo.pid }" hidden />
			<div style="width: 100%; height: 10%;">
				<div style="width: 15%; height: 100%; float: right;"></div>
				<div style="width: 20%; height: 100%; float: right; padding-top: 10px;"></div>
			</div>
			<div style="width: 24%; height: 80%; float: left;">
				<div style="width: 80%; height: 60%; margin: 0 auto; margin-top: 10%;">
					<div style="width: 100%; height: 85%;">
						<div style="height: 70%; padding-top: 10%;" align="center">
							<img src="<%=cp %>/profilePhoto/member${myInfo.usId }/${myInfo.usPhoto}" style="width: 80px; height: 80px; border-radius:40px; margin: 12px auto;"onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
						</div>
					</div>
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
				<textarea name="vsText" style="width: 98%; height: 93%; float: right;" placeholder="내용을 입력하세요." required="required"></textarea>
			</div>
			<div style="width: 20%; height: 10%; float: right; padding-right: 8px;">
				<button type="submit" style="float: right; width: 100%; height: 80%; text-align: center">등록하기</button>
			</div>
		</div>
	</form>

	<br>

	<c:forEach var="visitorList" items="${visitorList }">
		<div class="main" style="margin: 0 auto; margin-top: 5%;">
			<div style="width: 100%; height: 10%;">
				<c:if test="${myInfo.usId != visitorList.usId }">
					<div style="width: 12%; height: 100%; float: right;">
						<a href="#" style="font-weight: bold; float: right; padding-right: 8px; padding-top: 10px;">신고하기</a>
					</div>
				</c:if>
				<c:if test="${myInfo.usId == visitorList.usId }">
					<div style="width: 8%; height: 100%; float: right;">
						<form action="visitordelete.action" method="get" class="deleteForm">
							<input type="text" name="vid" value="${visitorList.vid }" hidden />
							<a class="visitorDelete" href="#" style="font-weight: bold; float: right; padding-right: 8px; padding-top: 10px;">삭제</a>
						</form>
					</div>
					<div style="width: 8%; height: 100%; float: right;">
						<a href="#" style="font-weight: bold; float: right; padding-right: 8px; padding-top: 10px;">수정</a>
					</div>
				</c:if>
				<div style="width: 25%; height: 100%; float: right; padding-top: 10px;">
					<span style="float: right;">${visitorList.vsDate }</span>
				</div>
			</div>
			<div style="width: 24%; height: 80%; float: left;">
				<div style="width: 80%; height: 60%; margin: 0 auto; margin-top: 10%;">
					<div style="width: 100%; height: 85%;">
						<div style="height: 70%; padding-top: 10%;" align="center">
							<img src="<%=cp %>/profilePhoto/member${visitorList.usId }/${visitorList.usPhoto}" style="width: 80px; height: 80px; border-radius:40px; margin: 12px auto;"onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
						</div>
					</div>
					<div style="width: 30%; height: 15%; float: left;">
						<span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${visitorList.usLv }</span>
					</div>
					<div style="width: 30%; height: 15%; float: right;">
						<a href="member_info_pro.action?member=${visitorList.usId }" style="float: left;">
							<i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
						</a>
					</div>
					<div style="width: 40%; height: 15%; float: left;" align="center">
						<span>${visitorList.nickName}</span>
					</div>
				</div>
			</div>
			<div style="width: 76%; height: 80%; float: right; padding-right: 8px; padding-top: 10px;">
				<textarea style="width: 98%; height: 93%; float: right;" readonly="readonly">${visitorList.vsText }</textarea>
			</div>
		</div>
	</c:forEach>


</body>
</html>