<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="test.BankUserBean" %>
<%
	String msg=(String)request.getAttribute("WithdrawlMsg");
	BankUserBean bub = (BankUserBean) session.getAttribute("bub");

	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SBI | Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #003366, #0059b3);
        min-height: 100vh;
        font-family: "Segoe UI", sans-serif;
    }

    .navbar {
        background-color: #002244;
    }

    .navbar-brand {
        font-weight: bold;
        font-size: 22px;
    }

    .welcome-box {
        color: white;
        text-align: center;
        margin-top: 30px;
    }

    .card {
        border-radius: 15px;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .card:hover {
        transform: translateY(-8px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.3);
    }

    .card i {
        font-size: 40px;
        color: #003366;
    }

    .card-title {
        font-weight: 600;
        margin-top: 10px;
    }

    .logout-btn {
        background-color: #dc3545;
        border: none;
    }
    .card p {
    min-height: 48px;
    display: flex;
    align-items: center;
    justify-content: center;
}
    
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-dark">
    <div class="container-fluid">
        <span class="navbar-brand">
            <i class="bi bi-bank"></i> SBI Banking System
        </span>
        <a href="logout" class="btn logout-btn text-white">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>
</nav>

<!-- WELCOME -->
<div class="welcome-box">
    <h2>Welcome, <span class="fw-bold"><%= bub.getFullname() %></span></h2>
    <p>Your trusted banking partner</p>
     <% if(msg!=null){ %>
           <p> <%=msg %></p>
            <%} %>
</div>

<!-- FEATURES -->
<div class="container mt-5">
    <div class="row g-4">

        <!-- WITHDRAW -->
        <div class="col-md-3">
            <div class="card text-center p-4">
            	 
                <i class="bi bi-cash-stack"></i>
                <h5 class="card-title">Withdraw</h5>
                <p>Withdraw money from your account</p>
                <a href="withdrawl.html" class="btn btn-primary w-100">
                    Withdraw
                </a>
            </div>
        </div>

        <!-- DEPOSIT -->
        <div class="col-md-3">
            <div class="card text-center p-4">
           
                <i class="bi bi-wallet2"></i>
                <h5 class="card-title">Deposit</h5>
                <p>Deposit money to your account</p>
                <a href="deposite.html" class="btn btn-success w-100">
                    Deposit
                </a>
            </div>
        </div>

        <!-- CHECK BALANCE -->
        <div class="col-md-3">
            <div class="card text-center p-4">
                <i class="bi bi-bar-chart-line"></i>
                <h5 class="card-title">Check Balance</h5>
                <p>View your current balance</p>
                <a href="balance.jsp" class="btn btn-warning w-100">
                    Check
                </a>
            </div>
        </div>

        <!-- SEND MONEY -->
        <div class="col-md-3">
            <div class="card text-center p-4">
                <i class="bi bi-send"></i>
                <h5 class="card-title">Send Money</h5>
                <p>Transfer money to another account</p>
                <a href="VerifyUser.html" class="btn btn-danger w-100">
                    Send
                </a>
            </div>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
