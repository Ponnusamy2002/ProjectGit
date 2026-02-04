<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="test.BankUserBean" %>

<%
    BankUserBean bub = (BankUserBean) session.getAttribute("bub");
    if(bub == null){
        response.sendRedirect("index.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SBI | Balance</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #002f6c, #0059b3);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: "Segoe UI", sans-serif;
    }

    .balance-card {
        background: white;
        border-radius: 15px;
        padding: 30px;
        width: 420px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.25);
        animation: fadeUp 0.6s ease-out;
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(25px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .balance-amount {
        font-size: 35px;
        font-weight: bold;
        color: #003366;
    }
</style>
</head>

<body>

<div class="balance-card text-center">
    <i class="bi bi-wallet2" style="font-size:45px; color:#003366;"></i>
    <h3 class="mt-2">Account Balance</h3>
    <hr>
    
    <div class="balance-amount">
        ₹ <%= bub.getBalance() %>
    </div>

    <p class="text-muted">User: <%= bub.getFullname() %></p>

    <a href="home.jsp" class="btn btn-primary mt-3 w-100">
        <i class="bi bi-arrow-left"></i> Back to Home
    </a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
