<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>양식다운로드</title>
<style type="text/css">
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">

	$(function()
	{
		/* $(".timeLineDelete", this).click(function()
		{
			if (confirm("정말로 삭제하시겠습니까?"))
				$(this).parent().submit()
		}); */
		
		$(".downloadReport", this).click(function()
		{
			saveFileName = $(this).parent().children().eq(0).val();
			
			alert("해당주소=" + saveFileName);
			
			if(saveFileName.indexOf(".txt") != -1)
				$(this).attr("href", "ReportSubmitList_Download.jsp?saveFileName=" + saveFileName + "&originalFileName=null");
		});
	});

</script>

</head>
<body>
	<div class="container">
		<div class="modal fade" id="report_download_list">
			<div class="modal-dialog modal-dialog-scrollable" style="max-width: 800px;">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h1 class="modal-title">양식 다운로드</h1>
						<button type="button" class="close" data-dismiss="modal" style="height: 100%; margin: 0; padding: 0; float: right;">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>과제명</th>
									<th>다운로드/링크</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="reportList" items="${reportList }">
									<tr>
										<td>${reportList.ssId }</td>
										<td>${reportList.ssName }</td>
										<td>
											<input type="text" value="${reportList.downLink }"  hidden>
											<a class="downloadReport" href="${reportList.ssId == 5 || reportList.ssId == 6 || reportList.ssId == 7 ? reportList.downLink : ''}">
											${reportList.ssId == 5 || reportList.ssId == 6 || reportList.ssId == 7 ? reportList.ssName : reportList.downLink }
											</a>
										</td>
									</tr>
								</c:forEach>
								<!-- <tr>
									<td>1</td>
									<td>업무일지</td>
									<td><button type="button"></button></td>
								</tr>
								<tr>
									<td>2</td>
									<td>회의록</td>
									<td><button type="button"></button></td>
								</tr>
								<tr>
									<td>3</td>
									<td>요구분석서</td>
									<td><button type="button"></button></td>
								</tr> -->
							</tbody>
						</table>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>

	</div>

</body>
</html>