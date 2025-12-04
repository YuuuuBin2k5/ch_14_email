<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>User Management</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

    <div class="container" style="max-width: 800px;"> <h1>User Management</h1>
        <p>Manage your email list users below.</p>

        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th style="text-align: center;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${users}">
                        <tr>
                            <td>${u.email}</td>
                            <td>${u.firstName}</td>
                            <td>${u.lastName}</td>
                            <td style="text-align: center;">
                                <a href="userAdmin?action=display_user&email=${u.email}" class="action-btn edit-btn">Edit</a>
                                
                                <a href="userAdmin?action=delete_user&email=${u.email}" 
                                   class="action-btn delete-btn"
                                   onclick="return confirm('Are you sure you want to delete ${u.email}?');">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div style="text-align: center;">
             <a href="emailList?action=join" class="add-btn">+ Add New User</a>
        </div>
    </div>

</body>
</html>