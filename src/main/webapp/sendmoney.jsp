<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.BankUserBean" %>
<%
	BankUserBean fromme=(BankUserBean)session.getAttribute("bub");
	BankUserBean toWhom=(BankUserBean)session.getAttribute("sendBankUserBean");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SBI Bank | Send Money</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #141e30, #243b55);
            min-height: 100vh;
        }

        .transfer-card {
            border-radius: 22px;
            animation: scaleFade 0.8s ease;
        }

        @keyframes scaleFade {
            from {
                opacity: 0;
                transform: scale(0.95) translateY(30px);
            }
            to {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }

        .card-header {
            background: linear-gradient(90deg, #0d47a1, #1976d2);
            color: white;
            text-align: center;
            padding: 22px;
            border-radius: 22px 22px 0 0;
        }

        .user-box {
            background: #f8f9fa;
            border-radius: 14px;
            padding: 15px;
            margin-bottom: 15px;
            transition: transform 0.3s ease;
        }

        .user-box:hover {
            transform: translateY(-3px);
        }

        .user-label {
            font-size: 14px;
            color: #666;
        }

        .user-name {
            font-size: 18px;
            font-weight: 600;
        }

        .form-control {
            height: 55px;
            border-radius: 14px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            box-shadow: 0 0 15px rgba(25,118,210,0.5);
            border-color: #1976d2;
        }

        .btn-send {
            height: 55px;
            border-radius: 14px;
            background: linear-gradient(90deg, #0d47a1, #1976d2);
            border: none;
            font-size: 17px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-send:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.35);
        }
    </style>
</head>

<body class="d-flex justify-content-center align-items-center">

<div class="card transfer-card shadow-lg" style="width: 30rem;">

    <!-- Header -->
    <div class="card-header">
        <i class="bi bi-arrow-left-right fs-2"></i>
        <h4 class="mb-0">Send Money</h4>
        <small>Confirm & Transfer</small>
    </div>

    <!-- Body -->
    <div class="card-body p-4">

        <!-- From User -->
        <div class="user-box">
            <div class="user-label">From</div>
            <div class="user-name text-primary">
                <i class="bi bi-person-circle"></i> <%=fromme.getFullname() %>
            </div>
        </div>

        <!-- To User -->
        <div class="user-box">
            <div class="user-label">To</div>
            <div class="user-name text-success">
                <i class="bi bi-person-check"></i> <%=toWhom.getFullname() %>
            </div>
        </div>

        <!-- Amount Form -->
        <form action="SendMoneyServlet" method="post" class="mt-4">
            <div class="mb-4">
                <label class="form-label fw-semibold">
                    Amount (₹)
                </label>
                <input type="number"
                       name="amount"
                       class="form-control"
                       placeholder="Enter amount to send"
                       min="1"
                       required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-send text-white">
                    <i class="bi bi-send-check"></i> Send Money
                </button>
            </div>
        </form>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
