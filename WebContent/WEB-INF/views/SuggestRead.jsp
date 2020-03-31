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
<title>건의게시판</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		//내용 글자 수 byte 받아오기.
		$('#commentHelp').on('keyup', function()
		{
			if($(this).val().length > 5000)
			{
				$(this).val($(this).val().substring(0,5000));
			}
		});
		
		// 내용 글자 수 입력 제한(4000byte)	
		$(document).on('keyup', '#commentHelp', function(e)
		{
			var textarea = $(this).val();
			$('#count').text(getBytes(textarea));
		});
		
		function getBytes(str)
		{
			var cnt = 0;
			for(var i=0; i<str.length; i++)
			{
				cnt += (str.charCodeAt(i) > 5000) ? 2 : 1;
			}
			return cnt;
		}
		
		$('.board').click(function()
		{
			var test = $(this).text();
			
			if (test == '질문 게시판')
			{
				$(location).attr('href', 'board.action?bid=1');
			}
			
			else if (test == '정보 게시판') 
			{
				$(location).attr('href', 'board.action?bid=2');
			}
			
			else if (test == '자유 게시판') 
			{
				$(location).attr('href', 'board.action?bid=3');
			}
			
			else if (test == '건의 게시판')
			{
				$(location).attr('href', 'board.action?bid=4');
			}
		});
		
		// 신고 접수 기능		
		$('.reportSuccess').click(function()
		{
			alert('신고 접수에 성공했습니다!');
			
			$('input[name="reportcheck"]:checked').each(function()
			{
				var rtId = $(this).attr('id');
				
				$('.rtId').val(rtId);
			});
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

	<br />
	<br />

	<div class="container">
		<p class="h1" style="font-weight: bold;"><a href="board.action?bid=4" style="color: black; text-decoration: none">건의 게시판</a></p>
	</div>
	
	<br /><br /><br />

	<div class="container">
	
		<div class="col-md-3 float-left" style="width: 300px;">
			<div class="col-12" align="left">
				<p class="h3" style="color: black">게시판</p>
				<br /><br />
				<ul class="list-group" style="color: black;">
					<c:forEach var="boardName" items="${boardName }" varStatus="status">
						<a href="#" id="${status.count }" class="board list-group-item list-group-item-action">${boardName.bname } 게시판</a>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<c:forEach var="readData" items="${readData }">
		<div class="col-lg-8 float-right">
			<!-- Title -->
			<p class="h1">${readData.postTitle }</p>
			<br />

			<!-- Author -->
			<p class="float-left" style="margin-right: 150px;">
				by <a href="#" style="font-size: 30px;">${readData.getNickName() }</a>
			</p>
			<p class="float-left" >작성일자 : ${readData.getCreateDate() }</p>
			<p class="float-right">조회 수 : ${hit }</p>
			
			<br />			
			<hr />			
			<br />
			
			<!-- Post Content -->
			<p class="lead">
				${readData.content }
			</p>
			
			<br /><br /><br /><br /><br /><br /><br />
			
			<div align="right">
				<c:if test="${usId == readData.usId }">
					<button type="button" class="btn btn-primary" onclick="location.href='freeupdateform.action?bid=${readData.bid }&bpid=${readData.bpid}'">수정하기</button>
					<button type="button" class="btn btn-danger" style="margin-right: 20px;" onclick="location.href='freedelete.action?bid=${readData.bid }&bpid=${readData.bpid }'">삭제하기</button>
				</c:if>
				<c:if test="${usId != readData.usId }">
					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" >신고하기</button>
				</c:if>
			</div>		
			
			<hr>
			
			<div>
			댓글 수 : ${commentCount }
			</div>
			
			<br /><br />
			
			<!-- Comments Form -->
			<c:forEach var="readComment" items="${readComment }">
			<div class="media mb-4">
				<div class="media-body">
					by <a href="#" style="font-size: 20px;">${readComment.getNickName() }</a>
				</div>
				
				<div class="float-right">
					<%-- ${readComment.commentDate } --%>
					작성일자 : ${readComment.getCommentDate() }
				</div>				
				
				<br /><br />
			</div>
			
			<div>
				${readComment.getCcontent() }
			</div>
			
			<br />
						
				<c:if test="${usId != readComment.usId }">
					<div>
						<button type="button" class="btn btn-danger float-left">신고하기</button>
					</div>
				</c:if>	
				<c:if test="${usId == readComment.usId }">
					<div style="margin-right: 5px;">
						<button type="button" class="btn btn-danger float-right" onclick="location.href='commentblind.action?coid=${readComment.coid }&bid=${bid }&bpid=${bpid }'">삭제하기</button>
					</div>
				</c:if>
					
				<input type="text" name="bid" value="${bid }" hidden/>
				<input type="text" name="bpid" value="${bpid }" hidden/>
				<input type="text" name="usId" value="${usId }"	hidden/>
				<br /><br /><br />
				<hr />
			</c:forEach>
			
			<!-- 신고 모달 시작 -->
			<div class="float-right">				
				<!-- The Modal -->
				<div class="modal" id="myModal" align="center">
				  <div class="modal-dialog" style="max-width: 50%;">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">신고하기</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body">
				      	<div class="col-md-10" style="width: 850px;">
							<form action="reportinsert.action" method="POST" role="form">
								<br />
								<div>
									<br />
									<div align="left">
										<select name="rtId">
											<c:forEach var="reportName" items="${reportName }" varStatus="report">
												<option id="${reportName.rtId }" value="${reportName.rtId }">${reportName.rtName }</option>
											</c:forEach>
										</select>
									</div>
									<br /><br />
									
									<div class="form-group" align="right">
										<label class="float-left">신고 접수 세부 내용</label>
										<br /><br />
										<textarea rows="10" cols="" name="rpText" class="form-control"></textarea>
									</div>								
								</div>
								
								
								<input type="text" name="bid" value="${bid }" hidden/>
								<input type="text" name="usId" value="${usId }" hidden/>
								<input type="text" name="rpText" value="${rpText }" hidden/>								
								<input type="text" name="bpid" value="${bpid }" hidden/>
								
								<button type="submit" class="btn float-right reportSuccess"
									style="width: 90px; height: 40px; background-color: #34314c; color: white;">확인</button>
							</form>
							
							<button type="submit" class="btn float-left"
								style="width: 90px; height: 40px; background-color: #79bd9a; color: white;" onclick="location.href='board.action?bid=1'">목록으로</button>
						</div>
				      </div>
				
				      <!-- Modal footer -->
				      <div class="modal-footer">
				        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				      </div>
				
				    </div>
				  </div>
				</div>
			</div>
			
			<!-- 신고 모달 끝 -->
			<!-- Comments Form -->
			<div class="card my-4">
				<h5 class="card-header">댓글 작성:</h5>
				<div class="card-body">
					<form action="comment.action?${bid }&${bpid }" method="POST">
						<div class="form-group">
							<textarea class="form-control" name="ccontent" rows="3" id="commentHelp" 
								placeholder="500자 이내만 입력하세요." maxlength="1000"></textarea>
						</div>
						
						<div class="float-right">
							<p class="byte"><span id="count">0</span>/1000 byte</p>
						</div>
						<br /><br /><br />
						
						<input type="text" name="bid" value="${bid }" hidden/>
						<input type="text" name="bpid" value="${bpid }" hidden/>
						<input type="text" name="usId" value="${usId }" hidden/>
						
						<button type="submit" class="btn float-right" style="background-color: #31314c; color: white">등록</button>
					</form>
					<div>
						
					</div>
				</div>
			</div>
			<br /><br /><br /><br /><br />
		</div>
		</c:forEach>
	</div>
</body>
</html>