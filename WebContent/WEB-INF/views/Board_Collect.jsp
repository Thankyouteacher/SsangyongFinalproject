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

<title>게시글 목록</title>

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
   integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
   crossorigin="anonymous">

<style type="text/css">
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
   flex-direction: column;
   justify-content: center;
}

.items{
   border: 3px solid #34314c;
   border-radius: 5px;
   width: 300px;
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
   
   $("#commentBtn").click(function()
   {
      location.href = "commentcollect.action";
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
      var bpId = $(this).children().eq(0).children().eq(0).val();
      var bid = $(this).children().eq(0).children().eq(1).val();
      //alert(bpId + " " + boardName);
      location.href = "boardread.action?bpid="+bpId+"&bid="+bid;
      
      // 게시판 번호와 게시글번호
      // boardread.action

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
         <input type="button" class="activeBtn" value="작성한 게시글 목록">
         <input type="button" class="inputBtn" value="작성한 댓글 목록" id="commentBtn">
      </section>
   
   
      <section class="content"  style="margin-top: 5px; padding-top: 30px;">
      <div style="display: flex;">      
         <c:set var="i" value="0"/>
         <c:forEach var="ubdto" items="${ublist }">
            <div class="items" style="padding-left: 25px; padding-right: 25px">
                  <div style="display:flex; flex-direction:column;">
                     <input type="hidden" value="${ubdto.bpId }">
                     <input type="hidden" value="${ubdto.bid }">
                     <span style="font-weight: bold; font-size: 13pt; margin-bottom: 5px;">${ubdto.postTitle }</span>
                     <span style="font-size: 11pt;" >${ubdto.content }</span><br>
                     <span style="font-size: 11pt;">${ubdto.boardName }게시판</span>
                     <span style="font-size: 11pt;">${ubdto.createDate }</span>
                  </div>
            </div>
         <c:set var="i" value="${i+1 }"/>
         <c:if test="${i%3 == 0 }">
            </div>   
            <div style="display: flex;">   
         </c:if>
         </c:forEach>
      </div>

      </section>
   </div>



</body>
</html>