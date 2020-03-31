<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container mt-3">
   <!-- Button to Open the Modal -->
   <c:if test="${empty project.pid }">
      <div id="situation" class="button" data-toggle="modal" data-target="#myModal" style="width: 150px; margin-left: 670px;">프로젝트 개설하기</div>
   </c:if>
   <c:if test="${not empty project.pid }">
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="width: 200px;">프로젝트 수정하기</button>
   </c:if>

   <!-- The Modal -->
   <div class="modal fade" id="myModal">
      <div class="modal-dialog" style="max-width: 810px;">
         <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header" style="height: 60px;">
               <c:if test="${empty project.pid }">
                  <h4 class="modal-title">프로젝트 개설하기</h4>
               </c:if>
               <c:if test="${not empty project.pid }">
                  <h4 class="modal-title">프로젝트 수정하기</h4>
               </c:if>
               <button type="button" class="close" data-dismiss="modal">×</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body modal-lg">
               <jsp:include page="Project_Create.jsp" />
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
               <div class="flex">
               <c:if test="${not empty project.pid }">
                  <input type="button" class="btn1 create" value="수정하기" onclick="update()">
               </c:if>
               <c:if test="${empty project.pid }">
                  <input type="button" class="btn1 create" value="개설하기" onclick="create()">
               </c:if>
               <c:if test="${empty project.pid }">
                  <input type="reset" class="btn1 reset" value="다시입력" onclick="reset()">
               </c:if>
                  <input type="button" class="btn1 cancel" value="취소하기" data-dismiss="modal">
               </div>
            </div>

         </div>
      </div>
   </div>
   
</div>

</body>
</html>