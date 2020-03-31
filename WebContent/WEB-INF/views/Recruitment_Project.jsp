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
<title>Recruitment_Project.jsp</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<style type="text/css">

body
{
	display: flex;
	/* align-content: center; */
	flex-direction: column;;
	justify-content: center;
}

#container 
{
  display: grid;
  grid-template-columns: 3fr 1fr 4fr 1fr;
  margin-left: 50px;
  margin-top: 30px;
  margin-bottom: 150px; 
}

#box-one 
{
  background: white;
}

#box-two 
{
  background: white;
}

#box-three
{
  background: white;
  text-align: center;
}

#box-four
{
	background: white;
}
.create
{
	background-color: #47b8e0;
	color: white; 
}

.create:hover
{
	background-color: #34314c;
	color: white; 
}

.reset
{
	background-color: #79bd9a;
	color: white; 
}

.reset:hover
{
	background-color: #3b8686;
	color: white; 
}

.cancel
{
	background-color: #ff7473;
	color: white; 
}

.cancel:hover
{
	background-color: #E53A40;
	color: white;
}

#nickname
{
	width: 80px;
	height: 100%;
	float: left;
}

#situation
{
	color: gray;
	border: 2px solid #34314c;
	background-color: white;
}

#situation:hover
{
	color: black;
	/* background-color: #47b8e0; */
}

.message
{
	border: 2px solid black;
	border-radius: 20px 0px 0px 20px;
	overflow-y:scroll;
	overflow-x:hidden;
	width: 800px;
	height: 485px;
}

</style>

<script type="text/javascript">
	
	$(document).ready(function()
	{
		// 채팅 스크롤을 항상 아래로!
		$("#message").scrollTop($("#message")[0].scrollHeight);
	});
	
	function editProject()
	{
		var str = "수정하시겠습니까?";
		str += "\n\n※ 설정한 칭호는 초기화됩니다."
		
		if(confirm(str) == true)
		{
			f3 = document.edit;
			f3.submit();
		}
		else
			return;
	}
	
	function mozipProject()
	{
		var str = "moziplist.action";
		alert("모집중페이지로~");
		
		$(location).attr('href', str);
	}
	
	function exitProject()
	{
		var str = "정말로 프로젝트에 나가시겠습니까?"
		if(confirm(str) == true)
		{
			alert("나감~");
			
			f2 = document.exit;
			
			f2.submit();
			
		}
		else
			return;
	}
	
	$(function()
	{
		
		$("#contentBtn").click(function()
		{
			var content = $("#mcontents").val();
			var user = $("#user").val();
			var nickName = $("#nickName").val();
			var blank_pattern = /^\s+|\s+$/g;
			
			if(content == null || content == "")
			{
				alert("내용을 입력하세요.");
				return;
			}
			else if(content.replace( blank_pattern, '' ) == "")
			{
				alert("공백은 입력할 수 없습니다.");
				return;
			}	
			else
			{
				var mcontents = nickName + content;
				
				f1 = document.message;
				
				f1.submit();
				
			}
			
		});
		
	});

</script>

<body>
	
 	<div style="background-color: #34314c; height: 115px;"></div>
	<div class="container">
		<header>
			<jsp:include page="Header.jsp"></jsp:include>
		</header>
	</div><!-- end .container -->
	
	<div id="container">
		
	 	<div id="box-one">
		 	<div>
		 		<input type="text" value="프로젝트 제목" disabled="disabled" style="border: none; width: 550px; ">

		 		<!-- 개설자만 보이는 버튼 -->
		 		<c:if test="${getProject.id eq usId }">	<!-- 개설자 id와 자신의 id가 같은 경우! -->
		 			<c:if test="${empty start }"> <!-- 프로젝트가 시작되지 않은 경우... -->
		 				<!-- <input type="button" id="situation" class="fas fa-pen" value="수정" style="height: 40px; font-size: 12px; text-align: center;" onclick="editProject()"> -->
		 				<button id="situation" class="fas fa-edit" style="font-size: 13pt; border: none; height: 25px; text-align: center;" onclick="editProject()"></button>
		 				
		 			</c:if>
		 		</c:if>
		 		
		 	</div>
		 	<div>
		 		<input type="text" value="${getProject.rname }" style="width: 600px;" readonly="readonly">
		 		<input type="hidden" value="pid : ${getProject.pid }" style="width: 600px;" readonly="readonly">
		 		<input type="hidden" value="usId : ${usId }" style="width: 600px;" readonly="readonly">
		 	</div>
		 	
		 	<div>
		 		<input type="text" value="프로젝트 소개글" disabled="disabled" style="border: none; ">
			</div>
			<div>
		 		<textarea rows="3" cols="60" style="width: 600px; resize: none;" readonly="readonly">${getProject.pcontents }</textarea>
		 	</div>
		 	
		 	<div>
				<input type="text" value="대표 칭호" disabled="disabled" style="border: none; width: 200px;">
				
				<c:if test="${empty proAch }">
					<input type="text" value="없음" style="width:180px; height: 40px;">
				</c:if>
				
			</div>
			
			<c:if test="${not empty proAch }">
				<div>
					<c:forEach var="proAch" items="${proAch }">
						<input type="text" value="${proAch.acName }" style="width:200px; height: 40px;" readonly="readonly">
					</c:forEach>
				</div>
			</c:if>
		 	
		 	<div>
		 		<input type="text" value="온라인" disabled="disabled" style="border: none; width: 100px;">
		 		<input type="text" value="온라인 ${onRate } % / 오프라인 ${100-onRate } %" style="width: 345px; height: 40px;" readonly="readonly">
		 		<input type="text" value="오프라인" disabled="disabled" style="border: none; width: 120px;">
		 	</div>
		 	
		 	<div>
		 		<input type="text" value="지역" disabled="disabled" style="border: none; width: 100px;">
		 		<input type="text" value="${getProject.paddress } 부근" readonly="readonly" style="width: 500px; height: 40px;">
			</div>

			<div>
		 		<input type="text" value="프로젝트 기간" disabled="disabled" style="border: none; width: 180px;">
		 		<input type="text" value="${proPeriod }일" readonly="readonly" style="width:90px; height: 40px;">
		 		<!-- <input type="text" value="개월" disabled="disabled" style="border: none; width: 80px;"> -->
		 	</div>
		 	
		 	<div>
		 		<input type="text" value="프로젝트 개설일" disabled="disabled" style="border: none; width: 180px;">
		 		<input type="text" value="${getProject.createDate }" style="width: 265px; height: 40px;" readonly="readonly">
		 	</div>
		 	
		 	<div>
		 		<input type="text" value="프로젝트 시작일" disabled="disabled" style="border: none; width: 180px;">
		 		<input type="text" value="${startDate }" style="width: 265px; height: 40px;" readonly="readonly">
		 	</div>
		 	
		 	<div>
		 		<input type="text" value="필요한 기술" disabled="disabled" style="border: none; width: 180px;">
		 		
		 		<c:if test="${empty proSkill }">
		 			<input type="text" value="없음" readonly="readonly" style="width: 130px; height: 40px;">
		 		</c:if>
		 		
		 		<c:if test="${not empty proSkill }">
			 		<c:forEach var="proSkill" items="${proSkill }">
			 			<input type="text" value="${proSkill.skName }" readonly="readonly" style="width: 130px; height: 40px;">
			 		</c:forEach>
				</c:if>
		 	</div>
		 	
		 	<div>
		 		<input type="text" value="참여 가능 레벨" disabled="disabled" style="border: none; width: 180px;">
		 		<input type="text" value="Lv.${getProject.minLevel }~Lv.${getProject.maxLevel }" readonly="readonly" style="width: 130px; height: 40px;">
		 		
		 		<input type="text" disabled="disabled" style="width: 45px; border: none;">
		 		
		 		<input type="text" value="성별" disabled="disabled" style="border: none; width: 80px;">
		 		<input type="text" value="${getProject.gid == 3 ? '상관없음' : (getProject.gid == 1 ? '남자' : '여자') }" readonly="readonly" style="width: 130px; height: 40px;">
		 		
		 	</div>
		 	
		 	<div>
		 		<input type="text" value="주제" disabled="disabled" style="border: none; width: 80px;">
		 		
		 		<c:if test="${not empty sname }">
		 			<input type="text" disabled="disabled" style="border: none; width: 80px;">
	 			</c:if>
	 			
		 		<c:if test="${empty sname }">
		 			<input type="text" value="없음" style=" width: 80px; height: 40px; ">
	 			</c:if>
	 			
	 			<input type="text" disabled="disabled" style="border: none; width: 195px;">
	 			
	 			<input type="text" value="인원" disabled="disabled" style="border: none; width: 80px;">
		 		<input type="text" value="${totalCount } / ${peopleCount } 명" readonly="readonly" style="width: 130px; height: 40px;">
		 		
		 	</div>
		 	
		 	<div>
		 		<c:if test="${not empty sname }">
			 		<textarea rows="3" cols="60" style="width: 600px; resize: none;" readonly="readonly">${sname }</textarea>
		 		</c:if>
		 	</div>
		 	
		 	<div>
		 		<input type="text" value="외부 연락망" disabled="disabled" style="border: none; width: 160px;">
		 	</div>
		 	<div>
		 		<textarea rows="3" cols="60" style="width: 600px; resize: none;" readonly="readonly">${getProject.link }</textarea>
		 	</div>
	 	</div><!-- end #box-one -->
 		
 		<div id="box-two">
 			<div class="flex">
 				<div>
 					<!-- <input type="text" value="" disabled="disabled" style="width:100px; border: none;"> -->
 					<%-- <form action="project_edit.action?pid=${getProject.pid }&usId=${usId}" method="post" name="edit" id="edit"> --%>
 					<form action="project_edit.action" method="post" name="edit" id="edit">
 						<input type="hidden" value="${getProject.pid }" id="pid" name="pid">
						<input type="hidden" value="${usId }" id="usId" name="usId">
 					</form>
 				</div>
 			</div>
 		</div><!-- end #box-two -->
		
	 	<div id="box-three">
	 		
	 		
			<div style="display: flex; flex-direction: column;">
				<div style="display: flex;">
					
					<c:forEach var="memberInfo1" items="${memberInfo1 }">
						<div style="flex-grow: 1;">
		 					<div style="width: 120px; height: 100%;">
				 				<div style="height: 70%;">
									<!-- <i class="fas fa-user" style="font-size: 60pt; margin: 12px auto;"></i> -->
									<img src="<%=cp %>/profilePhoto/member${memberInfo1.usId }/${memberInfo1.usPhoto}" style="width: 80px; height: 80px; border-radius: 40px; margin: 12px auto;" onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
								</div>
								
								<div style="display:flex; align-items:left;  height: 30%;">
									<div style="width: 20px; height: 100%; float: left;">
										<span style="float: right; background-color: #79bd9a; color:white; border: 1px; border-radius: 5px; font-size: 13pt; width: 25px; height: 25px;">${memberInfo1.usLv }</span>
									</div>
									<div style="width: 80px; height: 100%; float: left; color: black;" align="center">
										<span>${memberInfo1.nickName }</span>
									</div>
									<div style="width: 20px;" align="left">
										<form action="member_info.action?member=${memberInfo1.usId }&pid=${memberInfo1.pid }&usId=${usId}" method="post">
											<button id='situation' type="submit" class="fas fa-info-circle" style="font-size: 13pt; border: none; height: 25px; text-align: center;"></button>
										</form>
									</div>
								</div>
							</div>
		 				</div>
	 				</c:forEach>
	 				
	 				<!-- 빈 공간을 메꿔주기 위한 반복문 (피라미드 해결하기 위해서!) -->
	 				<c:forEach var="i" begin="${memberInfo1Size }" end="3" step="1">
	 					<div style="flex-grow: 1;">
	 						<div style="height: 70%;"></div>
							
							<div style="display:flex; align-items:left;  height: 30%;">
								<div style="width: 20px; height: 100%; float: left;"></div>
								<div style="width: 80px; height: 100%; float: left; color: black;" align="center"></div>
								<div style="width: 20px;" align="left"></div>
							</div>
	 					</div>
	 				</c:forEach>
	 				
 				</div>
			</div>
	 		
	 		<c:if test="${not empty memberInfo2 }">
				<div style="display: flex; flex-direction: column;">
					<div style="display: flex;">
						
						<c:forEach var="memberInfo2" items="${memberInfo2 }">
							<div style="flex-grow: 1;">
			 					<div style="width: 120px; height: 100%;">
					 				<div style="height: 70%;">
										<!-- <i class="fas fa-user" style="font-size: 60pt; margin: 12px auto;"></i> -->
										<img src="<%=cp %>/profilePhoto/member${timeLineList.usId }/${timeLineList.usPhoto}" style="width: 80px; height: 80px; border-radius: 40px; margin: 12px auto;" onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
									</div>
									
									<div style="display:flex; align-items:left;  height: 30%;">
										<div style="width: 20px; height: 100%; float: left;">
											<span style="float: right; background-color: #79bd9a; color:white; border: 1px; border-radius: 5px; font-size: 13pt; width: 25px; height: 25px;">${memberInfo2.usLv }</span>
										</div>
										<div style="width: 80px; height: 100%; float: left; color: black;" align="center">
											<span>${memberInfo2.nickName }</span>
										</div>
										<div style="width: 20px;" align="left">
											<form action="member_info.action?member=${memberInfo2.usId }&pid=${memberInfo2.pid }&usId=${usId}" method="post">
												<button id='situation' type="submit" class="fas fa-info-circle" style="font-size: 13pt; border: none; height: 25px; text-align: center;"></button>
											</form>
										</div>
									</div>
								</div>
			 				</div>
		 				</c:forEach>
	 				
	 				<!-- 빈 공간을 메꿔주기 위한 반복문 (피라미드 해결하기 위해서!) -->
	 				<c:forEach var="i" begin="${memberInfo2Size }" end="3" step="1">
	 					<div style="flex-grow: 1;">
	 						<div style="height: 70%;"></div>
							
							<div style="display:flex; align-items:left;  height: 30%;">
								<div style="width: 20px; height: 100%; float: left;"></div>
								<div style="width: 80px; height: 100%; float: left; color: black;" align="center"></div>
								<div style="width: 20px;" align="left"></div>
							</div>
	 					</div>
	 				</c:forEach>
		 				
	 				</div>
				</div>
	 		</c:if>
			
	 		
	 		
	 		<br><br>
	 		
	 		<div align="left">
	 			<div>
		 			<input type="text" value="채팅창" style="width: 800px; text-align: center; border: none;" disabled="disabled">
		 		</div>
		 		<div class="message" id="message">
					<c:forEach var="message" items="${message }">
						<c:if test="${message.pmId eq 1 }">
							<input type="text" value="${message.mcontents }" style="width: 800px; height:40px; border: none;" readonly="readonly" disabled="disabled">
						</c:if>
						<c:if test="${message.pmId eq 2 }">
							<input type="text" value="${message.mcontents }" style="width: 800px; height:40px; border: none; color: red;" readonly="readonly" disabled="disabled">
						</c:if>
					</c:forEach>
				</div>
				<br>
				<div>
					<form action="send_message.action" method="post" id="message" name="message">
						<input type="hidden" value="${getProject.pid }" id="pid" name="pid">
						<input type="hidden" value="${usId }" id="usId" name="usId">
						<div>
							<input type="hidden" value="${getUser.nickName } : " id="nickName" name="nickName">
							<!-- 그래서 nickName.val() + allContent.val() 합쳐서 db에 저장 -->
				 			<!-- ex) 망고뭉뭉 : 안녕하세요~ -->
							<input type="text" id="mcontents" name="mcontents" placeholder="내용을 입력하세요" style="width: 720px;">
							<input type="button" id="contentBtn" class="reset" name="contentBtn" value="전송" style="width: 80px;">
							<!-- <button id="contentBtn" class="reset fas fa-paper-plane" name="contentBtn" style="width: 80px;"></button> -->
						</div>
						<br>
					</form>
					<div>
						<form action="project_exit.action" method="get" id="exit" name="exit">
							<input type="hidden" value="${getProject.pid }" id="pid" name="pid">
							<input type="hidden" value="${usId }" id="usId" name="usId">
							<input type="button" class="create" value="접어두기" style="width: 200px;" onclick="mozipProject()">
							<input type="text" style="border:none; width: 400px;" disabled="disabled">
							<input type="button" class="cancel" value="프로젝트 나가기" style="width: 200px;" onclick="exitProject()">
						</form>
					</div>
					
				</div>
			</div>
	 	</div><!-- end #box-three -->
	 	
	 	<div id="box-four">
	 		<div class="flex">
 				<div>
 					<input type="text" value="" disabled="disabled" style="width:100px; border: none;">
 				</div>
 			</div>
	 	</div><!-- end #box-four -->
	 	
	</div><!-- end #container -->
</body>
</html>