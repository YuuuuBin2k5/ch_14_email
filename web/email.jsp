<%-- 
    Document   : email
    Created on : 27 Nov 2025, 14:52:56
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/main.css"/>
        <title>Join Email List</title>
        <style>
            /* Ép trang web luôn full màn hình để căn giữa */
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
                width: 100%;
            }
            body {
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <div class="success-card" style="max-width: 400px; width: 90%;"> 
            <h1>Send Email</h1>
            
            <p class="subtitle">Hãy Nhập Gmail mà bạn muốn gửi đến. <br> Lưu ý thư được chuyển qua mục QUẢNG CÁO or THƯ RÁC</p>
            
            <p style="color: #e74c3c; font-weight: bold; min-height: 20px; font-size: 0.9rem;">
                ${message}
            </p>
            
            <form action="emailList" method="post" style="text-align: left; margin-top: 10px;">
                <input type="hidden" name="action" value="add">
                
                <div style="margin-bottom: 15px;">
                    <label style="color: #2c3e50; font-weight: 600; margin-left: 5px;">First Name:</label>
                    <input type="text" name="firstName" required placeholder="Enter first name..." 
                           style="margin-top: 5px; width: 100%; box-sizing: border-box; border: 1px solid rgba(0,0,0,0.1);">
                </div>

                <div style="margin-bottom: 15px;">
                    <label style="color: #2c3e50; font-weight: 600; margin-left: 5px;">Last Name:</label>
                    <input type="text" name="lastName" required placeholder="Enter last name..." 
                           style="margin-top: 5px; width: 100%; box-sizing: border-box; border: 1px solid rgba(0,0,0,0.1);">
                </div>
                
                <div style="margin-bottom: 20px;">
                    <label style="color: #2c3e50; font-weight: 600; margin-left: 5px;">Email Address:</label>
                    <input type="email" name="email" required placeholder="Enter your email here..." 
                           style="margin-top: 5px; width: 100%; box-sizing: border-box; border: 1px solid rgba(0,0,0,0.1);">
                </div>

                <div style="text-align: center;">
                    <button type="submit" class="btn-glow" style="width: 100%;">
                        Send
                    </button>
                </div>
            </form>

            <div style="margin-top: 25px; border-top: 1px solid rgba(0,0,0,0.1); padding-top: 15px;">
                <a href="userAdmin" style="text-decoration: none; color: #7f8c8d; font-size: 0.85rem; transition: 0.3s;">
                    Admin Access <span style="font-size: 1.2em;">🔐</span>
                </a>
            </div>
            
        </div>
    </body>
</html>