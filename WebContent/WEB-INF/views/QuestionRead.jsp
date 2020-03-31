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
<title>질문 게시판</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/classic/ckeditor.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- ckEditor 크기 조절 -->
<style type="text/css">
.ck.ck-editor
{
	max-width: 700px;
}
.ck-editor_editable
{
	min-height: 500px;
}
</style>

<script type="text/javascript">

	$(document).ready(function()
	{
		// popover 활성화
		// $('[data-toggle="popover"]').popover();
		
		// 댓글 글자 수 byte 받아오기
		$('#commentHelp').on('keyup', function()
		{
			if($(this).val().length > 500)
			{
				$(this).val($(this).val().substring(0,500));
			}
		});
		
		// 댓글 글자 수 입력 제한(1000byte)
		$(document).on('keyup', '#commentHelp', function(e)
		{
			var textarea = $(this).val();
			$('#count').text(getBytes(textarea));
		});
		
		function getBytes(str)
		{
			var count = 0;
			for(var i=0; i<str.length; i++)
			{
				count += (str.charCodeAt(i) > 500) ? 2 : 1;
			}
			return count;
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
		
		$('.select').ready(function ()
		{
			var check = $('.select').val();
			
			if(check >= 1)
			{
				$('.select').hide();
				$('.selected').show();
				
			}
			
			else
			{
				$('.selected').hide();
				$('.select').show();
			}
		});
		
		$('.select').click(function()
		{
			alert('선택하신 답변이 채택되었습니다!');
		});
		
		$('.selected').click(function()
		{
			alert('채택 취소가 되었습니다!');
		});
		
		// 신고 접수 기능
		$('.reportSuccess').click(function()
		{
			alert('신고 접수에 성공했습니다!');
			
			$('input[name="reportcheck"]:checked').each(function()
			{
				
				var rtId = $(this).attr('id');
				
				// alert($(this).attr('id'));				
				$('.rtId').val(rtId);
			});
		});
		
		// CKEditor 활성화
		ClassicEditor.create(document.querySelector('#editor'));
		
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
		<p class="h1" style="font-weight: bold;"><a href="board.action?bid=1" style="color: black; text-decoration: none">질문 게시판</a></p>
	</div>
	
	<br /><br /><br />

	<div class="container">
		<div class="col-md-3 float-left" style="width: 300px;">
			<div class="col-12" align="left">
				<p class="h3" style="color: black">게시판</p>
				<ul class="list-group" style="color: black;">
					<c:forEach var="boardName" items="${boardName }" varStatus="status">
						<a href="#" id="${status.count }" class="board list-group-item list-group-item-action">${boardName.bname } 게시판</a>
					</c:forEach>
				</ul>
			</div>
		</div>	
		
		<div class="col-lg-9 float-right">
			<c:forEach var="readData" items="${readData }">
			<!-- Title -->
			<p><i class="far fa-question-circle" style="font-size: 60px;"></i></p> 
			<p class="h1" style="width: 700px;">${readData.getPostTitle() }</p>
			<br />

			<!-- Author -->
			<p class="float-left" style="margin-left:0px; margin-bottom:0px; margin-top:0px; margin-right: 150px; font-size: 30px;">
				by ${readData.getNickName() }
			</p>
			<p class="float-left" >작성일자 : ${readData.getCreateDate() }</p>
			<p class="float-right">조회 수 : ${hit }</p>
			<br /><hr />	
			
			<!-- Post Content -->
			<p class="lead">
				${readData.getContent() }
			</p>
			
			<br /><br /><br /><br /><br /><br /><br /><br />
			<div align="left">
				<c:if test="${usId == readData.usId }">
					<button type="button" class="btn btn-primary" onclick="location.href='questionupdateform.action?bid=${readData.bid }&bpid=${readData.bpid }'">수정하기</button>
					<button type="button" class="btn btn-danger" style="margin-right: 20px;" onclick="location.href='freedelete.action?bid=${readData.bid }&bpid=${readData.bpid }'">삭제하기</button>
				</c:if>
				
				<c:if test="${usId != readData.usId }">
					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal2" >신고하기</button>
					<button type="button" class="btn float-right" data-toggle="modal" data-target="#myModal" style="background-color: #31314c; color: white">
					  답변 작성</button>
				</c:if>
			</div>
			
			</c:forEach>
			
			<br />
			<!-- 신고 모달 시작 -->
			<div class="float-right">				
				<!-- The Modal -->
				<div class="modal" id="myModal2" align="center">
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
			
			<div class="float-right">				
				<!-- The Modal -->
				<div class="modal" id="myModal" align="center">
				  <div class="modal-dialog" style="max-width: 50%;">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">답변 작성하기</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body">
				      	<div class="col-md-10" style="width: 850px;">
							<form action="answerinsert.action" method="POST" role="form">
								<br />
								<div class="form-group">
									<label>내용</label>
										<textarea name="content" id="editor"></textarea>
								</div>
								
								<input type="text" name="bid" value="${bid }" hidden/>
								<input type="text" name="bpid" value="${bpid }" hidden/>
								<input type="text" name="usId" value="${usId }"	hidden/>
								
								<button type="submit" class="btn float-right"
								style="width: 90px; height: 40px; background-color: #34314c; color: white;">확인</button>
								
								<button type="button" class="btn float-left"
									style="width: 90px; height: 40px; background-color: #79bd9a; color: white;" onclick="location.href='board.action?bid=1'">목록으로</button>
							</form>
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
			
			
			
			<br /><br /><br /><br />

			<hr />

			<!-- Answer Content -->
			
			<c:forEach var="questionComment" items="${questionComment }">
			<p>
				<i class="far fa-lightbulb" style="font-size: 60px; margin-right: 10px;"></i>
				
				<!-- 답변 채택 여부에 따라서 채택 마크를 표시해줘야 하기 때문이다. -->
				<c:if test="${questionComment.selectid != 0 }">
					<i class="far fa-check-circle" style="font-size: 60px; color: green;"></i>
				</c:if>				
			</p>
			
			
			<div class="float-left">				
				<p class="float-left" style="margin-left:0px; margin-bottom:0px; margin-top:0px; margin-right: 150px; font-size: 30px;">
					by ${questionComment.nickName }
				</p>
			</div>
			
			<div class="float-right">
				<p>작성일자 : ${questionComment.quCreateDate }</p>
			</div>
					
			<br /><br /><br /><br />
					
			<p class="lead">
				${questionComment.quContent }
			</p>
						
			<br /><br /><br /><br /><br /><br /><br />
			
			<div align="right">
				<c:forEach var="readData" items="${readData }">
				<c:if test="${usId == readData.usId }">
					<button type="button" class="btn btn-danger delete" value="${check }" style="margin-right: 20px;"
						onclick="location.href='answerdelete.action?bid=${questionComment.bid }&bpid=${questionComment.bpid }&qid=${questionComment.qid }'">
						삭제하기
					</button>
					
				</c:if>
				
				<c:if test="${usId != readData.usId }">
					<button type="button" class="btn btn-danger">신고하기</button>
				</c:if>
				
				<c:if test="${usId == readData.usId }">
					<button type="button" class="btn btn-success select" value="${check }" 
						onclick="location.href='answerselect.action?bid=${questionComment.bid }&bpid=${questionComment.bpid }&qid=${questionComment.qid }'">
						채택하기
					</button>
					
					<button type="button" class="btn btn-success selected" value="${check }" 
						 onclick="location.href='answercancle.action?bid=${questionComment.bid }&bpid=${questionComment.bpid }&qid=${questionComment.qid }&selectid=${questionComment.selectid }'">
						채택 취소
					</button>
				</c:if>
				</c:forEach>
			</div>
			
			<br /><br />
						
			<hr />
			</c:forEach>
			
			<hr /><hr /><hr /><hr /><hr />
			
			<div>
				댓글 수 : ${commentCount }
			</div>
			
			<br />
			
			<!-- Comments Form -->
			<c:forEach var="readComment" items="${readComment }">
			<div class="media mb-4">
				by&nbsp;&nbsp;<p class="media-body" style="margin-left:0px; margin-bottom:0px; margin-top:0px; margin-right: 150px; font-size: 20px;">
						${readComment.nickName }
					</p>
				
				<div class="float-right">
					작성일자 : ${readComment.commentDate }
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
			
			<!-- Comments Form -->
			<div class="card my-4">
				<h5 class="card-header">댓글 작성:</h5>
				<div class="card-body">
					<form action="comment.action" method="POST">
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
			<!-- Comments Form end -->
			
			
			<hr /><br />
			<br /><br />
		</div>
	</div>
</body>
</html>