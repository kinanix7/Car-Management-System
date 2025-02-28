<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.carapp.model.Car" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Premium Car Form Page Styling */
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

        /* Base styling with enhanced 3D effect */
        :root {
            --primary: #2b6cb0;
            --primary-dark: #2c5282;
            --primary-light: #4299e1;
            --secondary: #38b2ac;
            --secondary-dark: #285e61;
            --danger: #e53e3e;
            --success: #38a169;
            --light: #f7fafc;
            --dark: #1a202c;
            --gray: #a0aec0;
            --border-radius: 12px;
            --shadow-sm: 0 2px 4px rgba(0, 0, 0, 0.1);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        body {
            font-family: 'Montserrat', sans-serif;
            background: radial-gradient(ellipse at bottom, #1B2735 0%, #090A0F 100%);
            color: #333;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            overflow-x: hidden;
            perspective: 1000px;
        }

        /* Stars background animation */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image:
                    radial-gradient(white, rgba(255,255,255,.2) 2px, transparent 7px),
                    radial-gradient(white, rgba(255,255,255,.15) 1px, transparent 5px),
                    radial-gradient(white, rgba(255,255,255,.1) 2px, transparent 10px);
            background-size: 550px 550px, 350px 350px, 250px 250px;
            background-position: 0 0, 40px 60px, 130px 270px;
            z-index: -1;
            animation: twinkle 8s linear infinite;
        }

        @keyframes twinkle {
            0% { opacity: 0.5; }
            50% { opacity: 1; }
            100% { opacity: 0.5; }
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-xl), 0 0 20px rgba(66, 153, 225, 0.3);
            padding: 30px;
            margin: 40px auto;
            transform-style: preserve-3d;
            animation: containerEntrance 1.2s cubic-bezier(0.22, 1, 0.36, 1);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        /* Container entrance animation */
        @keyframes containerEntrance {
            0% {
                opacity: 0;
                transform: translateY(30px) rotateX(10deg);
            }
            100% {
                opacity: 1;
                transform: translateY(0) rotateX(0);
            }
        }

        /* Container interactive effects */
        .container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                    to bottom right,
                    rgba(255, 255, 255, 0) 0%,
                    rgba(255, 255, 255, 0.3) 50%,
                    rgba(255, 255, 255, 0) 100%
            );
            transform: rotate(30deg);
            animation: shine 6s infinite linear;
            pointer-events: none;
        }

        @keyframes shine {
            0% { transform: translateX(-100%) rotate(30deg); }
            100% { transform: translateX(100%) rotate(30deg); }
        }

        /* Header with 3D effect */
        header {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            position: relative;
            animation: headerSlideDown 0.8s ease-out;
            transform-style: preserve-3d;
        }

        @keyframes headerSlideDown {
            from {
                transform: translateY(-50px) translateZ(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0) translateZ(0);
                opacity: 1;
            }
        }

        .fs-4 {
            font-weight: 700;
            color: var(--primary-dark);
            letter-spacing: -0.5px;
            position: relative;
            transform-style: preserve-3d;
            transition: var(--transition);
        }

        .fs-4::before {
            content: 'Car Management System';
            position: absolute;
            left: 0;
            top: 0;
            color: var(--primary-light);
            transform: translateZ(-10px);
            filter: blur(5px);
            opacity: 0.7;
            transition: var(--transition);
        }

        .fs-4:hover {
            transform: translateY(-3px) translateZ(20px);
            text-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .fs-4:hover::before {
            transform: translateZ(-25px);
            filter: blur(10px);
            opacity: 0.9;
        }

        /* Navigation pills with floating effect */
        .nav-pills {
            display: flex;
            gap: 10px;
        }

        .nav-pills .nav-link {
            border-radius: var(--border-radius);
            padding: 10px 18px;
            font-weight: 600;
            color: var(--dark);
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(0, 0, 0, 0.1);
            box-shadow: var(--shadow-sm);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .nav-pills .nav-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                    90deg,
                    rgba(255, 255, 255, 0) 0%,
                    rgba(255, 255, 255, 0.8) 50%,
                    rgba(255, 255, 255, 0) 100%
            );
            transition: all 0.6s ease;
        }

        .nav-pills .nav-link:hover::before {
            left: 100%;
        }

        .nav-pills .nav-link:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: var(--shadow-lg);
            color: var(--primary);
            background: white;
        }

        .nav-pills .nav-link.active {
            background-color: var(--primary);
            color: white;
            box-shadow: 0 8px 15px rgba(43, 108, 176, 0.4);
        }

        /* Page title animation */
        h2 {
            color: var(--primary-dark);
            position: relative;
            display: inline-block;
            margin-bottom: 30px;
            font-weight: 700;
            animation: titleReveal 1s ease-out forwards;
            opacity: 0;
            transform: translateY(20px);
        }

        @keyframes titleReveal {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary), var(--primary-light));
            border-radius: 2px;
            animation: lineExpand 0.6s ease-out 0.4s forwards;
            transform-origin: left;
            transform: scaleX(0);
        }

        @keyframes lineExpand {
            0% { transform: scaleX(0); }
            100% { transform: scaleX(1); }
        }

        /* Form card styling */
        .card {
            border: none;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-lg);
            overflow: hidden;
            animation: cardReveal 0.8s ease-out 0.4s both;
            transform: translateY(30px);
            opacity: 0;
            background: white;
        }

        @keyframes cardReveal {
            0% {
                opacity: 0;
                transform: translateY(30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card-body {
            padding: 30px;
        }

        /* Form controls with floating label effect */
        .form-label {
            font-weight: 500;
            color: var(--primary-dark);
            transform: translateY(0);
            transition: all 0.3s ease;
            margin-bottom: 8px;
            position: relative;
        }

        .form-label::before {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--primary-light);
            transition: all 0.3s ease;
        }

        .form-control:focus + .form-label::before,
        .form-control:not(:placeholder-shown) + .form-label::before {
            width: 100%;
        }

        .form-control {
            padding: 12px 16px;
            border: 2px solid rgba(160, 174, 192, 0.2);
            border-radius: 8px;
            transition: all 0.3s ease;
            background: rgba(247, 250, 252, 0.5);
        }

        .form-control:focus {
            border-color: var(--primary-light);
            box-shadow: 0 0 0 4px rgba(66, 153, 225, 0.2);
            background: white;
        }

        .input-group {
            position: relative;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            transition: all 0.3s ease;
        }

        .input-group:focus-within {
            box-shadow: 0 0 0 4px rgba(66, 153, 225, 0.2);
        }

        .input-group-text {
            background: var(--primary-dark);
            color: white;
            border: none;
            font-weight: 600;
            padding-left: 16px;
            padding-right: 16px;
        }

        /* Staggered row animation */
        .row.mb-3 {
            opacity: 0;
            transform: translateY(20px);
            animation: rowFadeIn 0.6s ease-out forwards;
        }

        .row.mb-3:nth-child(1) { animation-delay: 0.5s; }
        .row.mb-3:nth-child(2) { animation-delay: 0.7s; }
        .row.mb-3:nth-child(3) { animation-delay: 0.9s; }
        .row.mb-3:nth-child(4) { animation-delay: 1.1s; }

        @keyframes rowFadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Button styling with ripple effect */
        .btn {
            padding: 12px 24px;
            font-weight: 600;
            border-radius: 8px;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            letter-spacing: 0.5px;
            border: none;
        }

        .btn::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1, 1) translate(-50%, -50%);
            transform-origin: 50% 50%;
        }

        .btn:focus:not(:active)::after {
            animation: ripple 1s ease-out;
        }

        @keyframes ripple {
            0% {
                transform: scale(0, 0);
                opacity: 0.5;
            }
            100% {
                transform: scale(30, 30);
                opacity: 0;
            }
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            box-shadow: 0 4px 10px rgba(43, 108, 176, 0.3);
            margin-right: 10px;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, var(--primary-light) 0%, var(--primary) 100%);
            box-shadow: 0 6px 15px rgba(43, 108, 176, 0.5);
            transform: translateY(-3px) scale(1.05);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #718096 0%, #4a5568 100%);
            box-shadow: 0 4px 10px rgba(74, 85, 104, 0.3);
        }

        .btn-secondary:hover {
            background: linear-gradient(135deg, #a0aec0 0%, #718096 100%);
            box-shadow: 0 6px 15px rgba(74, 85, 104, 0.5);
            transform: translateY(-3px) scale(1.05);
        }

        /* Save button animation */
        .btn-primary {
            animation: buttonReveal 0.6s ease-out 1.3s both;
            transform: translateY(20px);
            opacity: 0;
        }

        .btn-secondary {
            animation: buttonReveal 0.6s ease-out 1.5s both;
            transform: translateY(20px);
            opacity: 0;
        }

        @keyframes buttonReveal {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Footer styling */
        footer {
            text-align: center;
            font-size: 0.9rem;
            color: var(--gray);
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            animation: footerFadeIn 1s ease-in-out 1.5s both;
            position: relative;
        }

        @keyframes footerFadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        footer::before {
            content: '';
            position: absolute;
            width: 100px;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--primary-light), transparent);
            top: -1px;
            left: 50%;
            transform: translateX(-50%);
        }

        /* Custom styling for year field */
        #year {
            position: relative;
        }

        #year::-webkit-inner-spin-button,
        #year::-webkit-outer-spin-button {
            opacity: 1;
            background: var(--primary-light);
            border-radius: 50%;
            height: 1.5em;
        }

        /* Price and mileage fields with animated focus */
        #price, #mileage {
            position: relative;
            transition: all 0.3s ease;
        }

        #price:focus, #mileage:focus {
            transform: scale(1.02);
        }

        #price::-webkit-inner-spin-button,
        #price::-webkit-outer-spin-button,
        #mileage::-webkit-inner-spin-button,
        #mileage::-webkit-outer-spin-button {
            opacity: 1;
            background: linear-gradient(var(--primary-light), var(--primary));
            border-radius: 50%;
            height: 1.5em;
        }

        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 12px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(247, 250, 252, 0.5);
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: linear-gradient(var(--primary-light), var(--primary));
            border-radius: 10px;
            border: 3px solid rgba(247, 250, 252, 0.5);
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--primary-dark);
        }

        /* Loading animation for the whole page */
        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--dark);
            z-index: 9999;
            animation: pageLoad 1s cubic-bezier(0.645, 0.045, 0.355, 1) forwards;
        }

        @keyframes pageLoad {
            0% { transform: scaleY(1); transform-origin: top; }
            100% { transform: scaleY(0); transform-origin: top; opacity: 0; pointer-events: none; }
        }

        /* Floating car icon animation for Add/Edit page */
        h2::before {
            content: '🚗';
            position: absolute;
            left: -40px;
            top: 0;
            font-size: 24px;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0% { transform: translateY(0) rotate(0); }
            50% { transform: translateY(-8px) rotate(5deg); }
            100% { transform: translateY(0) rotate(0); }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 20px 10px;
                border-radius: 8px;
            }

            .card-body {
                padding: 20px;
            }

            .btn {
                padding: 10px 20px;
            }

            h2::before {
                left: -30px;
                font-size: 20px;
            }

            .form-control, .input-group-text {
                padding: 10px 14px;
            }

            .row > div[class^="col"] {
                margin-bottom: 15px;
            }
        }

        /* Special effects for Edit Car page */
        body.edit-car .container {
            background: linear-gradient(rgba(255, 255, 255, 0.95), rgba(255, 255, 255, 0.98));
        }

        /* Add required field indicator */
        .form-label.required::after {
            content: '*';
            color: var(--danger);
            margin-left: 4px;
        }

        /* Focus effect for the entire form row */
        .row:focus-within {
            transform: translateZ(20px);
            z-index: 2;
        }

        /* Success state animation for button click */
        .btn-primary:active {
            animation: successPulse 0.5s ease-out;
        }

        @keyframes successPulse {
            0% { box-shadow: 0 0 0 0 rgba(56, 161, 105, 0.7); }
            70% { box-shadow: 0 0 0 15px rgba(56, 161, 105, 0); }
            100% { box-shadow: 0 0 0 0 rgba(56, 161, 105, 0); }
        }

        /* Add car/edit car icon variations */
        .add-new-car h2::before {
            content: '🚗+';
        }

        .edit-car h2::before {
            content: '🚗✏️';
        }

        /* Special field animations */
        #registrationNumber:focus {
            letter-spacing: 1px;
        }

        /* Add a typing indicator animation for active input */
        .form-control:focus {
            background-image: linear-gradient(90deg, var(--primary-light) 50%, transparent 0);
            background-position: 100% 100%;
            background-size: 200% 2px;
            background-repeat: no-repeat;
            animation: typing 2s infinite;
        }

        @keyframes typing {
            0% { background-position: 100% 100%; }
            50% { background-position: 0 100%; }
            100% { background-position: 100% 100%; }
        }
    </style>
</head>
<body>
<div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="<%=request.getContextPath()%>/cars/list" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <span class="fs-4">Car Management System</span>
        </a>
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="<%=request.getContextPath()%>/cars/list" class="nav-link">Home</a></li>
            <li class="nav-item"><a href="<%=request.getContextPath()%>/cars/new" class="nav-link">Add New Car</a></li>
        </ul>
    </header>

    <%
        Car car = (Car) request.getAttribute("car");
        boolean isEdit = (car != null);
    %>

    <h2><%=isEdit ? "Edit Car" : "Add New Car"%></h2>

    <div class="card">
        <div class="card-body">
            <form action="<%=request.getContextPath()%>/cars/<%=isEdit ? "update" : "insert"%>" method="post">
                <% if (isEdit) { %>
                <input type="hidden" name="id" value="<%=car.getId()%>" />
                <% } %>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="make" class="form-label">Make</label>
                        <input type="text" class="form-control" id="make" name="make"
                               value="<%=isEdit ? car.getMake() : ""%>" required>
                    </div>
                    <div class="col-md-6">
                        <label for="model" class="form-label">Model</label>
                        <input type="text" class="form-control" id="model" name="model"
                               value="<%=isEdit ? car.getModel() : ""%>" required>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="year" class="form-label">Year</label>
                        <input type="number" class="form-control" id="year" name="year" min="1900" max="2100"
                               value="<%=isEdit ? car.getYear() : ""%>" required>
                    </div>
                    <div class="col-md-4">
                        <label for="color" class="form-label">Color</label>
                        <input type="text" class="form-control" id="color" name="color"
                               value="<%=isEdit ? car.getColor() : ""%>">
                    </div>
                    <div class="col-md-4">
                        <label for="registrationNumber" class="form-label">Registration Number</label>
                        <input type="text" class="form-control" id="registrationNumber" name="registrationNumber"
                               value="<%=isEdit ? car.getRegistrationNumber() : ""%>" required>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="price" class="form-label">Price</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="number" class="form-control" id="price" name="price" min="0" step="0.01"
                                   value="<%=isEdit ? car.getPrice() : ""%>" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="mileage" class="form-label">Mileage (km)</label>
                        <input type="number" class="form-control" id="mileage" name="mileage" min="0"
                               value="<%=isEdit ? car.getMileage() : ""%>" required>
                    </div>
                </div>

                <div class="mb-3">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="<%=request.getContextPath()%>/cars/list" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>

    <footer class="pt-3 mt-4 text-muted border-top">
        &copy; 2025 Car Management System
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>