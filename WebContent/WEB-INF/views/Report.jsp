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
<title>수행과제</title>
<script type="text/javascript">
	$(function()
	{
		$(".submittedReport", this).click(function()
		{
			valfsId = $(this).children().eq(7).children().val();

			$(location).attr('href', 'advicelist.action?fsId=' + valfsId);
		});

		
	});
</script>
</head>
<body>
	<div class="container" style="margin-top: 20px; height: 600px;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>제출번호</th>
					<th>과제명</th>
					<th>최대공감인</th>
					<th>최초등록일</th>
					<th>수정일</th>
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
						<td>${afterSubmitList.pgDate }</td>
						<td>${afterSubmitList.guideClick }</td>
						<td style="${afterSubmitList.guideAdviceCount >= 15 ? 'color:#79bd9a' : 'color:#E53A40'}">${afterSubmitList.guideAdviceCount }</td>
						<td style="display: none;">
							<input type="text" value="${afterSubmitList.fsId }" />
						<td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="width: 100%; height: 5%;">
			<div style="width: 10%; height: 100%; float: right; margin-left: 10px;">
				<button type="button" data-toggle="modal" data-target="#report_submit" style="padding: 0; width: 100%; height: 100%; font-size: 10pt;">제출하기</button>
				<jsp:include page="Report_Submit.jsp"></jsp:include>
			</div>
			<div style="width: 13%; height: 100%; float: right;">
				<button type="button" data-toggle="modal" data-target="#report_download_list" style="padding: 0; width: 100%; height: 100%; font-size: 10pt;">양식다운로드</button>
				<jsp:include page="Report_Download_List.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>