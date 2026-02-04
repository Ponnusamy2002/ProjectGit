<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* Force vertical layout */
    .page-wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .msg {
        color: red;
        font-weight: 600;
        margin-bottom: 15px;
        text-align: center;
    }
</style>
</head>
<body>
<%
	String msg=(String)request.getAttribute("msg");
	
%>
 <div class="msg"><%= msg %></div>
<jsp:include page="index.html"></jsp:include>
</body>
</html>
