<%-- 
    Document   : thanks
    Created on : 6 Nov 2025, 20:10:16
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>    
    <meta charset="utf-8">
    <title>Welcome Aboard!</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>

<body>
    <div class="success-card">
        
        <div class="checkmark-wrapper">
            <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none"/>
                <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
            </svg>
        </div>

        <h1>Success!</h1>
        <p class="subtitle">Thanks for joining our email list.</p>

        <div class="user-info-card">
            <div class="info-row">
                <span class="info-label">Email:</span>
                <span class="info-value">${user.email}</span>
            </div>
            
            <% 
               murach.business.User u = (murach.business.User) request.getAttribute("user");
               if(u != null && u.getFirstName() != null && !u.getFirstName().equals("Guest") && !u.getFirstName().isEmpty()) { 
            %>
            <div class="info-row">
                <span class="info-label">Full Name:</span>
                <span class="info-value">${user.firstName} ${user.lastName}</span>
            </div>
            <% } %>
        </div>

        <p class="footer-note">We've sent a confirmation email to you.</p>

        <form action="emailList" method="get">
            <input type="hidden" name="action" value="join">
            <button type="submit" class="btn-glow">Return Home</button>
        </form>
    </div>

</body>
</html>