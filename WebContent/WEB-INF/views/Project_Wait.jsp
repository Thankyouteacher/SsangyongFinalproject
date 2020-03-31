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

<title>대기/모집 중인 프로젝트</title>

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
   integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
   crossorigin="anonymous">

<style type="text/css">
body {
   font-family: 굴림;
}


.container {
   display: flex;
   /* align-items: center; */  /*세로축에서 중앙*/
   justify-content: center; /*가로축에서 중앙*/
   flex-direction: column;
}

.content
{
   display: flex;        
   /*flex-direction: column;*/
   justify-content: center;
}

.items{
   border: 3px solid #34314c;
   border-radius: 5px;
   width: 450px;
   height: 180px;
   margin-bottom: 50px;
   margin-left: 30px;
   margin-right: 30px;
   padding-bottom: 10px; padding-top: 10px;
   padding-left: 25px; padding-right: 25px;
   display: flex;
   flex-direction: column;
   justify-content: center;
}

.items:hover
{
   border: 3px solid #ffc952;
   background-color: rgba(255,201,81,0.03);
}

.inputBtn
{
   width: 150px;
   height: 80px;
   border : 3px solid #34314c !important;
   background-color: transparent;
   margin-left: 20px;
   margin-right: 20px;
   color: #353535;
   font-size: 10pt !important;
   font-weight: 800 !important;
   padding: 0px 0px 0px 0px !important; 
}

.activeBtn
{
   width: 150px;
   height: 80px;
   border : 3px solid #34314c !important;
   background-color: #34314c;
   margin-left: 20px;
   margin-right: 20px;
   color: white;
   font-size: 10pt !important;
   font-weight: 800 !important;
   padding: 0px 0px 0px 0px !important; 
}

.inputBtn:hover
{
   background-color: rgba(52, 49, 76, 0.10);
}


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

$().ready(function()
{
   $("#backMenu").click(function()
   {
      location.href = "mypage.action";
   });
   
   $("#notAchiBtn").click(function()
   {
      location.href = "notachievepage.action";
   });
   
   $("#projectIng").click(function()
   {
      location.href = "projecting.action";
   });
   
   $("#projectEnd").click(function()
   {
      location.href = "projectend.action";
   });
   
   $("#backMenu").mouseenter(function()
   {
      $("#backMenu").css("color", "#ffc952");
   });
   
   $("#backMenu").mouseleave(function()
   {
      $("#backMenu").css("color", "#34314c");
   });
   
   $(".items").click(function()
   {
      var pid = $(this).children().eq(0).children().eq(0).val();
      location.href = "project_join.action?pid="+ pid;
   });
});

</script>


</head>
<body>
   <div style="background-color: #34314c; height: 115px;"></div>
   <div class="">
      <header>
         <!-- <h1 >헤더</h1> -->
         <jsp:include page="Header.jsp" />
      </header>
   </div>
   
   <div class="arrowDiv" style="display: flex; ">
      <div style='display:flex; width:100%; height: 50px; margin-top: 20px; margin-left: 20px;' align="center">
         <span class="fas fa-arrow-left"  style="font-size: 20pt; color: #34314c;"  id="backMenu"></span>
      </div>
   </div>
   
   <div class="navDiv" style="display: flex; align-items: center; justify-content: center;">
      
   </div>





   <div class="container">
      <section style="display: flex; justify-content: center;" >
         <input type="button" class="inputBtn" value="진행 중인 프로젝트" id="projectIng">
         <input type="button" class="activeBtn" value="대기 중인 프로젝트" >
         <input type="button" class="inputBtn" value="완료한 프로젝트" id="projectEnd">
      </section>
   
   
      <section class="content"  style="margin-top: 5px; padding-top: 30px;">

      <div style="display: flex; flex-direction: column; width: 100%">
               <div style="display: flex;">
                        
                        <c:set var="i" value="0"/>
                        <c:forEach var="dto" items="${prjlist }">
                           <div class="items" style="">
                                 <div style="display:flex; flex-direction:column;">
                                    <input type="hidden" value=${dto.pid }>
                                    <span style="font-weight: bold; font-size: 15pt; margin-bottom: 5px;">${dto.rname }</span>
                                    <span>시작　:　${dto.ppDate }</span>
                                    <span>인원　:　${dto.peoCount } 명</span>
                                    <span>소개　:　${dto.pcontents }</span>
                                    <span>기술　:　
                                       <c:forEach var="name" items="${dto.skName }">
                                              ${name }　
                                       </c:forEach>
                                    </span>
                                 </div>
                           </div>
                        <c:set var="i" value="${i+1}"/>
                        <c:if test="${i%2==0}">
                           </div>
                           <div style="display: flex;">
                        </c:if>
                        
                        </c:forEach>

               </div>
      </div>      

      </section>
   </div>



</body>
</html>