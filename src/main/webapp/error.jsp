<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header bg-danger text-white">
                    <h3 class="card-title">Error</h3>
                </div>
                <div class="card-body">
                    <p>An error occurred while processing your request.</p>
                    <p>Error details: <%= exception != null ? exception.getMessage() : "Unknown error" %></p>
                    <a href="<%=request.getContextPath()%>/cars/list" class="btn btn-primary">Go to Home Page</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>