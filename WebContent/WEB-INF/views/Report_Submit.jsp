<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>과제제출</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	$(function()
	{
		gpId = 0;
		upload = null;
		
		meetEndDate = $(".meetEndDate").val();
		logEndDate = $(".logEndDate").val();
		
		
		
		
		$(".alarm").click(function()
		{
			/* 회의록, 업무일지 외 수행과제 안내해주기 */
			alert($("#reportMessage").val());
			
			/* 회의록, 업무일지 제출기간에 따라 안내해주기 */
			if($(".notYet1").html()=='업무일지')
			{
				alert("다음 업무일지는 '" + $(".logEndDate").val()+"' 부터 제출이 가능합니다.");
			}
			else
			{
				alert("업무일지 제출기간이 지났습니다. 얼른 제출하세요!");
			}
			
			if($(".notYet2").html()=='회의록')
			{
				alert("다음 회의록은 '" + $(".meetEndDate").val()+"' 부터 제출이 가능합니다.");
			}
			else
			{
				alert("회의록 제출기간이 지났습니다. 얼른 제출하세요!");
			}
		});

		
		$("#report_list").change(function()
		{
			
			gpId = $("option:selected").val();
			
		});
		
		
		// 제출하기버튼 눌렀을 때
		$(".submit").click(function()
		{
			upload = $(".upload").val();

			if (upload == "" || upload == null)
			{
				alert("제출할 수행과제를 첨부하세요");
				return false;
			}

			// 과제를 선택하세요 상태에서 제출하기 눌렀을 때
			if (gpId == 0)
			{
				alert("과제를 선택하세요");
				return false;
			} 
			else
			{
				$("#myForm").submit();
			}
		});
		
		

	});
</script>
</head>
<body>

	<div class="container">
		<div class="modal fade" id="report_submit">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="height: 300px;">


					<!-- Modal Header -->
					<div class="modal-header" style="height: 20%;">
						<h4 class="modal-title">수행과제 제출</h4>
						<button type="button" class="close" data-dismiss="modal" style="height: 100%; margin: 0; padding: 0; float: right;">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form id="myForm" action="reportsubmit.action" method="post" enctype="multipart/form-data">
							<div style="width: 45%; height: 50%; float: left;">
								<span style="float: right; padding-right: 10px;">제출할 수행과제</span>
							</div>
							<div style="width: 55%; height: 50%; float: left;">
								<select id="report_list" name="gpId" style="width: 50%; height: 60%;">
									<option value="0">과제를 선택하세요</option>
									<c:forEach var="submitList" items="${beforeSubmitList }">
										<!-- <option value="">회의록</option>
											 <option value="">업무일지</option>
											 <option value="">요구분석서</option> -->
										<option value="${submitList.gpId }" style="${(submitList.ssName=='회의록' && meetKey.submitCount>0) || (submitList.ssName=='업무일지' && logKey.submitCount>0) ? 'color:red' : '' }"
											${(submitList.ssName=='회의록' && meetKey.submitCount>0) || (submitList.ssName=='업무일지' && logKey.submitCount>0) ? 'disabled="disabled"' : '' }
											${(submitList.ssName=='회의록' && meetKey.submitCount>0) ? 'class="notYet2"' : '' }
											 ${(submitList.ssName=='업무일지' && logKey.submitCount>0) ? 'class="notYet1"' : ''}>${submitList.ssName }</option>
									</c:forEach>
								</select>
							</div>
							<div style="width: 45%; height: 50%; float: left;">
								<span style="float: right; padding-right: 10px;">첨부파일</span>
							</div>
							<div style="width: 55%; height: 50%; float: left;">
								<input class="upload" type="file" name="pfile">
							</div>
						</form>
						<input class="meetEndDate" value="${meetKey.gpEndDate }" hidden="hidden">
						<input class="logEndDate" value="${logKey.gpEndDate }" hidden="hidden">
					</div>

					<!-- Modal footer -->
					<div style="width: 100%; height: 20%;">
						<div class="modal-footer" style="width: 50%; height: 100%; float: left;">
							<button class="submit" type="button" data-dismiss="modal" style="padding: 0; width: 50%; height: 80%;">제출하기</button>
						</div>
						<div class="modal-footer" style="width: 50%; height: 100%; float: left;">
							<button type="button" data-dismiss="modal" style="padding: 0; width: 50%; height: 80%;">닫기</button>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

</body>
</html>
