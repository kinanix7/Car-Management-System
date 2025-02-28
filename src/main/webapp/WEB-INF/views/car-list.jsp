<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.carapp.model.Car" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Currency" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Premium Car Management System Styling */
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

        /* Base styling with enhanced 3D effect */
        :root {
            --primary: #2b6cb0;
            --primary-dark: #2c5282;
            --primary-light: #4299e1;
            --secondary: #38b2ac;
            --danger: #e53e3e;
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

        /* Search bar with glow effect */
        .row.mb-3 {
            animation: fadeInUp 0.8s ease-out 0.3s both;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .d-flex input[type="text"] {
            border-radius: var(--border-radius) 0 0 var(--border-radius);
            border: 2px solid rgba(226, 232, 240, 0.8);
            padding: 12px 18px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.9);
            transition: var(--transition);
        }

        .d-flex input[type="text"]:focus {
            border-color: var(--primary-light);
            box-shadow: 0 0 0 5px rgba(66, 153, 225, 0.3);
            background: white;
        }

        .d-flex button {
            border-radius: 0 var(--border-radius) var(--border-radius) 0;
            background: rgba(66, 153, 225, 0.1);
            color: var(--primary);
            font-weight: 600;
            padding: 12px 24px;
            border: 2px solid rgba(66, 153, 225, 0.2);
            border-left: none;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .d-flex button:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgba(43, 108, 176, 0.4);
        }

        .d-flex button::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: linear-gradient(rgba(255,255,255,0.3), rgba(255,255,255,0));
            transform: translateY(-100%);
            transition: all 0.3s ease;
        }

        .d-flex button:hover::after {
            transform: translateY(0);
        }

        /* Table with card-like effect */
        .table-responsive {
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--shadow-lg);
            animation: tableSlideUp 1s cubic-bezier(0.22, 1, 0.36, 1) 0.5s both;
            transform-style: preserve-3d;
            background: white;
        }

        @keyframes tableSlideUp {
            0% {
                opacity: 0;
                transform: translateY(60px) translateZ(-100px);
            }
            100% {
                opacity: 1;
                transform: translateY(0) translateZ(0);
            }
        }

        .table {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
        }

        .table th {
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 100%);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 16px;
            border: none;
            position: relative;
            overflow: hidden;
        }

        .table th::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
        }

        .table td {
            padding: 16px;
            vertical-align: middle;
            border-bottom: 1px solid rgba(226, 232, 240, 0.8);
            transition: all 0.3s ease;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(247, 250, 252, 0.7);
        }

        .table-hover tbody tr {
            transition: all 0.3s ease;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(235, 248, 255, 0.9);
            transform: scale(1.01) translateZ(10px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 2;
        }

        /* Action buttons with ripple effect */
        .btn-sm {
            padding: 8px 16px;
            font-weight: 600;
            border-radius: 8px;
            border: none;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
        }

        .btn-sm::after {
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

        .btn-sm:focus:not(:active)::after {
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
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, var(--primary-light) 0%, var(--primary) 100%);
            box-shadow: 0 6px 15px rgba(43, 108, 176, 0.5);
            transform: translateY(-3px) scale(1.05);
        }

        .btn-danger {
            background: linear-gradient(135deg, var(--danger) 0%, #c53030 100%);
            box-shadow: 0 4px 10px rgba(229, 62, 62, 0.3);
        }

        .btn-danger:hover {
            background: linear-gradient(135deg, #f56565 0%, var(--danger) 100%);
            box-shadow: 0 6px 15px rgba(229, 62, 62, 0.5);
            transform: translateY(-3px) scale(1.05);
        }

        /* Gorgeous staggered row animation */
        tbody tr {
            opacity: 0;
            animation-fill-mode: forwards;
        }

        @keyframes rowFadeIn {
            from {
                opacity: 0;
                transform: translateX(-20px) translateZ(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0) translateZ(0);
            }
        }

        tbody tr:nth-child(1) { animation: rowFadeIn 0.6s ease-out 0.7s forwards; }
        tbody tr:nth-child(2) { animation: rowFadeIn 0.6s ease-out 0.8s forwards; }
        tbody tr:nth-child(3) { animation: rowFadeIn 0.6s ease-out 0.9s forwards; }
        tbody tr:nth-child(4) { animation: rowFadeIn 0.6s ease-out 1.0s forwards; }
        tbody tr:nth-child(5) { animation: rowFadeIn 0.6s ease-out 1.1s forwards; }
        tbody tr:nth-child(6) { animation: rowFadeIn 0.6s ease-out 1.2s forwards; }
        tbody tr:nth-child(7) { animation: rowFadeIn 0.6s ease-out 1.3s forwards; }
        tbody tr:nth-child(8) { animation: rowFadeIn 0.6s ease-out 1.4s forwards; }
        tbody tr:nth-child(9) { animation: rowFadeIn 0.6s ease-out 1.5s forwards; }
        tbody tr:nth-child(10) { animation: rowFadeIn 0.6s ease-out 1.6s forwards; }

        /* Alert styling with pulsing effect */
        .alert {
            border-radius: var(--border-radius);
            font-weight: 500;
            padding: 20px;
            background: rgba(56, 178, 172, 0.1);
            border-left: 5px solid var(--secondary);
            color: var(--primary-dark);
            animation: alertPulse 3s infinite;
            margin-top: 20px;
        }

        @keyframes alertPulse {
            0% { box-shadow: 0 0 0 0 rgba(56, 178, 172, 0.4); }
            70% { box-shadow: 0 0 0 15px rgba(56, 178, 172, 0); }
            100% { box-shadow: 0 0 0 0 rgba(56, 178, 172, 0); }
        }

        /* Footer with floating effect */
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

        /* Dynamic hover effects for table cells */
        td:not(:last-child) {
            transition: all 0.3s ease;
            position: relative;
        }

        td:not(:last-child)::before {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--primary-light);
            transition: all 0.3s ease;
        }

        tr:hover td:not(:last-child)::before {
            width: 100%;
        }

        tr:hover td:not(:last-child) {
            color: var(--primary-dark);
            font-weight: 500;
            transform: translateY(-2px);
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

        /* Responsive adjustments with cool effects */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 20px 10px;
                border-radius: 8px;
            }

            .table-responsive {
                border-radius: 8px;
            }

            .table th, .table td {
                padding: 12px;
            }

            .btn-sm {
                padding: 6px 12px;
                font-size: 0.85rem;
            }

            .nav-pills .nav-link {
                padding: 8px 14px;
                font-size: 0.9rem;
            }

            .d-flex input[type="text"], .d-flex button {
                padding: 10px 16px;
            }
        }

        /* Floating car icon animation in header */
        .fs-4::after {
            content: '🚗';
            position: absolute;
            right: -40px;
            top: 0;
            font-size: 24px;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0% { transform: translateY(0) rotate(0); }
            50% { transform: translateY(-8px) rotate(5deg); }
            100% { transform: translateY(0) rotate(0); }
        }

        /* Price column highlight */
        td:nth-child(6) {
            color: var(--primary-dark);
            font-weight: 600;
            position: relative;
        }

        /* Table empty state with better animation */
        .text-center {
            padding: 40px 0;
            font-style: italic;
            color: var(--gray);
            background: linear-gradient(rgba(247, 250, 252, 0.5), rgba(247, 250, 252, 0.8));
            position: relative;
        }

        .text-center::before {
            content: '🔍';
            display: block;
            font-size: 32px;
            margin-bottom: 10px;
            animation: searching 2s ease-in-out infinite;
        }

        @keyframes searching {
            0% { transform: translateX(-5px) rotate(-10deg); }
            50% { transform: translateX(5px) rotate(10deg); }
            100% { transform: translateX(-5px) rotate(-10deg); }
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

    <div class="row mb-3">
        <div class="col-md-6">
            <h2>Cars List</h2>
        </div>
        <div class="col-md-6">
            <form action="<%=request.getContextPath()%>/cars/search" method="get" class="d-flex">
                <input type="text" name="keyword" value="<%=request.getAttribute("keyword") != null ? request.getAttribute("keyword") : ""%>" class="form-control me-2" placeholder="Search for cars...">
                <button type="submit" class="btn btn-outline-primary">Search</button>
            </form>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Make</th>
                <th>Model</th>
                <th>Year</th>
                <th>Color</th>
                <th>Price</th>
                <th>Mileage</th>
                <th>Registration</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Car> cars = (List<Car>) request.getAttribute("cars");
                NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
                NumberFormat numberFormatter = NumberFormat.getNumberInstance();

                if (cars != null && !cars.isEmpty()) {
                    for (Car car : cars) {
            %>
            <tr>
                <td><%=car.getId()%></td>
                <td><%=car.getMake()%></td>
                <td><%=car.getModel()%></td>
                <td><%=car.getYear()%></td>
                <td><%=car.getColor()%></td>
                <td><%=currencyFormatter.format(car.getPrice())%></td>
                <td><%=numberFormatter.format(car.getMileage())%> km</td>
                <td><%=car.getRegistrationNumber()%></td>
                <td class="table-actions">
                    <a href="<%=request.getContextPath()%>/cars/edit?id=<%=car.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                    &nbsp;
                    <a href="<%=request.getContextPath()%>/cars/delete?id=<%=car.getId()%>"
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('Are you sure you want to delete this car?')">Delete</a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="9" class="text-center">No cars found</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <% if (cars == null || cars.isEmpty()) { %>
    <div class="alert alert-info">No cars found.</div>
    <% } %>

    <footer class="pt-3 mt-4 text-muted border-top">
        &copy; 2025 Car Management System
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>