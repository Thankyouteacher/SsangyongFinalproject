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
<title>Member_Information.jsp</title>

<!-- 
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
-->


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/main.css">
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"> -->
<style type="text/css">

body
{
   display: flex;
   /* align-content: center; */
   flex-direction: column;;
   justify-content: center;
   color: white;
   
}

#container 
{
  display: grid;
  grid-template-columns: 3fr 3fr 3fr;
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
  /* text-align: center; */
}

#box-four
{
   background: white;
}

input
{
   height: 40px;
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

</style>

<script type="text/javascript">
   
   function vote()
   {
      f = document.memberOut;

      f.submit();
   }
   
   function impossible1()
   {
      var msg = "자기 자신은 퇴출 투표를 할 수 없습니다."
      
      alert(msg);
      
      return;
   }
   
   function impossible2()
   {
      var msg = "현재 퇴출 투표가 진행중이기 때문에 퇴출 투표를 할 수 없습니다."

      alert(msg);
      
      return;
   }
   
   function impossible3()
   {
      var msg = "참여 인원이 3명 이하인 경우 퇴출 투표를 할 수 없습니다."
      
      alert(msg);
      
      return;
   }
   
   function impossible4()
   {
      var msg = "퇴출 투표는 개설자만 할 수 있습니다."
      
      alert(msg);
      
      return;
   }
   
   

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
      
      </div>
      
      <div id="box-three">
         <div>
            <img src="<%=cp %>/profilePhoto/member${member}/${usPhoto_mem}" style="width: 80px; height: 80px; border-radius: 40px; margin: 12px auto;" onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
            <input type="text" value="닉네임" style="border: none; width: 127px;" disabled="disabled">
            <input type="text" value="${getUser.nickName }" style="width: 200px; height: 40px;" readonly="readonly">
            <input type="text" value="레벨" style="border: none; width: 80px;" disabled="disabled">
            <input type="text" value="${userLevel }" style="width: 60px; height: 40px;" readonly="readonly">
            
            <div>
               <input type="text" style="border: none; width: 80px;" disabled="disabled"><!-- 공백 -->
               <input type="text" value="나이" style="border: none; width: 127px;" disabled="disabled">
               <input type="text" value="${userAge }세" style="width: 80px; height: 40px;" readonly="readonly">
               <input type="text" style="border: none; width: 115px;" disabled="disabled"><!-- 공백 -->
               <input type="text" value="성별" style="border: none; width: 80px;" disabled="disabled">
               <input type="text" value="${getUser.ssdBack == 1 || getUser.ssdBack == 3 ? '남자' : '여자' }" style="width: 80px; height: 40px;" readonly="readonly">
            </div>
            
            <div>
               <input type="text" value="대표 칭호" disabled="disabled" style="border: none; width: 210px;">
               <c:if test="${empty userAch }">
                  <input type="text" value="없음" style="width: 80px; height: 40px;">
               </c:if>
            </div>
            
            <c:if test="${not empty userAch }">
               <div>
                  <c:forEach var="userAch" items="${userAch }">
                     <input type="text" value="${userAch.acName }" style="width: 200px; height: 40px;" readonly="readonly">
                  </c:forEach>
               </div>
            </c:if>
            <div>
               <input type="text" value="주로 활동한 지역" style="border: none; width: 210px;" disabled="disabled">
               <c:if test="${empty manyActiveAddress }">
                  <input type="text" value="없음" style="width: 80px; height: 40px;" readonly="readonly">
               </c:if>

               <c:if test="${not empty manyActiveAddress }">
                  <input type="text" value="${manyActiveAddress }" style="width: 200px; height: 40px;" readonly="readonly">
               </c:if>
            </div>
            
            <div>
               <input type="text" value="주로 사용한 기술" style="border: none; width: 210px;" disabled="disabled">
               <c:if test="${empty manyUseSkill }">
                  <input type="text" value="없음" style="width: 80px; height: 40px;" readonly="readonly">
               </c:if>
               <c:if test="${not empty manyUseSkill }">
                  <c:forEach var="manyUseSkill" items="${manyUseSkill }">
                     <input type="text" value="${manyUseSkill }" style="width: 130px; height: 40px;" readonly="readonly">
                  </c:forEach>
               </c:if>
               
            </div>
            
            <div>
               <input type="text" value="프로젝트 진행 갯수" style="border: none; width: 210px;" disabled="disabled">
               <input type="text" value="${ingProject } 개" style="width: 130px; height: 40px;" readonly="readonly">
            </div>
            
            <div>
               <input type="text" value="프로젝트 완료 갯수" style="border: none; width: 210px;" disabled="disabled">
               <input type="text" value="${completedProject } 개" style="width: 130px; height: 40px;" readonly="readonly">
            </div>
            
            <div>
               <input type="text" value="프로젝트 평균 기간" style="border: none; width: 210px;" disabled="disabled">
               <input type="text" value="${avgPeriod == 0.0 ? 0 : avgPeriod} 일" style="width: 130px; height: 40px;" readonly="readonly">
            </div>
            
            <div>
               <input type="text" value="설문평점" style="border: none; width: 210px;" disabled="disabled">
               <c:if test="${avgEstimate == 0.0}">
                  <input type="text" value="없음" style="width: 130px; height: 40px;" readonly="readonly">
               </c:if>
            </div>
            
            <c:if test="${avgEstimate != 0.0}">
               <div>
                  <input type="text" value="실력" style="width: 200px; height: 40px;" disabled="disabled">
                  <input type="text" value="창의성" style="width: 200px; height: 40px;" disabled="disabled">
                  <input type="text" value="분석력" style="width: 200px; height: 40px;" disabled="disabled">
               </div>
               
               <div>
                  <input type="text" value="${avgEstimate1.score }/5점 (평가: ${avgEstimate1.count }개)" style="width: 200px; height: 40px;" readonly="readonly">
                  <input type="text" value="${avgEstimate2.score }/5점 (평가: ${avgEstimate2.count }개)" style="width: 200px; height: 40px;" readonly="readonly">
                  <input type="text" value="${avgEstimate3.score }/5점 (평가: ${avgEstimate3.count }개)" style="width: 200px; height: 40px;" readonly="readonly">
               </div>
               
               <br>
               
               <div>
                  <input type="text" value="의사소통능력" style="width: 200px; height: 40px;" disabled="disabled">
                  <input type="text" value="리더십" style="width: 200px; height: 40px;" disabled="disabled">
                  <input type="text" value="책임감" style="width: 200px; height: 40px;" disabled="disabled">
               </div>
               
               <div>
                  <input type="text" value="${avgEstimate4.score }/5점 (평가: ${avgEstimate4.count }개)" style="width: 200px; height: 40px;" readonly="readonly">
                  <input type="text" value="${avgEstimate5.score }/5점 (평가: ${avgEstimate5.count }개)" style="width: 200px; height: 40px;" readonly="readonly">
                  <input type="text" value="${avgEstimate6.score }/5점 (평가: ${avgEstimate6.count }개)" style="width: 200px; height: 40px;" readonly="readonly">
               </div>
               
               <br>
               
               <div>
                  <input type="text" value="성실도" style="width: 200px; height: 40px;" disabled="disabled">
                  <input type="text" value="" style="border: none; width: 200px; height: 40px;" disabled="disabled">
                  <input type="text" value="평균" style="width: 200px; height: 40px;" disabled="disabled">
               </div>
               
               <div>
                  <input type="text" value="${avgEstimate7.score }/5점 (평가: ${avgEstimate7.count }개)" style="width: 200px; height: 40px;" readonly="readonly">
                  <input type="text" value="" style="border: none; width: 200px; height: 40px;" disabled="disabled">
                  <input type="text" value="${avgEstimate }/5점" style="width: 200px; height: 40px;" readonly="readonly">
               </div>
            </c:if>
            
            <br>
            
            <div class="flex">
               <c:choose>
                  <c:when test="${getProject.id eq usId}">
                     <c:if test="${memberOutVoteIng eq 0 && totalCount >= 3}">
                        <c:if test="${usId == member}">
                           <input type="button" class="cancel" value="퇴출" style="width:200px;" onclick="impossible1()">
                        </c:if>
                        <c:if test="${usId != member}">
                           <input type="button" class="cancel" value="퇴출" style="width:200px;" onclick="vote()">
                        </c:if>
                     </c:if>
                     <c:if test="${memberOutVoteIng == 1}">
                        <input type="button" class="cancel" value="퇴출" style="width:200px;" onclick="impossible2()">
                     </c:if>
                     <c:if test="${totalCount < 3}">
                        <input type="button" class="cancel" value="퇴출" style="width:200px;" onclick="impossible3()">
                     </c:if>
                  </c:when>
                  <c:otherwise>
                     <input type="button" class="cancel" value="퇴출" style="width:200px;" onclick="impossible4()">
                  </c:otherwise>
               </c:choose>
               
            	<c:if test="${naviKey != 1 }">
               		<input type="button" class="create" value="확인" style="width:200px;" data-dismiss="modal" onclick="location.href='recruitment_project.action?pid=${pid}&usId=${usId }'">
            	</c:if>
            	<c:if test="${naviKey == 1 }">
            		<input type="button" class="create" value="확인" style="width:200px;" data-dismiss="modal" onclick="location.href='projectnavi.action?pid=${pid}&usId=${usId }'">
            	</c:if>
            </div>
            
            <form action="rec_member_out_propose.action" method="post" id="memberOut" name="memberOut">
               <input type="hidden" value="${pid }" name="pid" id="pid">
               <input type="hidden" value="${usId }" name="usId" id="usId">
               <input type="hidden" value="${member }" name="member" id="member">
            </form>
            
         </div>
      </div>
   </div>
</body>
</html>