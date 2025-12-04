<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Edit User</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

    <div class="container">
        <h1>Edit User</h1>
        <p>Update user information below.</p>

        <form action="userAdmin" method="post">
            <input type="hidden" name="action" value="update_user">

            <label>Email Address:</label>
            <input type="email" name="email" value="${user.email}" readonly style="background-color: #e9ecef; cursor: not-allowed;">

            <label>First Name:</label>
            <input type="text" name="firstName" value="${user.firstName}" required>

            <label>Last Name:</label>
            <input type="text" name="lastName" value="${user.lastName}" required>

            <input type="submit" value="Update User">
        </form>
        
        <form action="userAdmin" method="post" style="margin-top: 10px;">
            <input type="hidden" name="action" value="display_users">
            <input type="submit" value="Cancel / Back to List" style="background-color: #95a5a6;">
        </form>
    </div>

</body>
</html>