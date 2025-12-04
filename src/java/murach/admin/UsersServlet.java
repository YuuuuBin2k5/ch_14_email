package murach.admin;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; // Nếu cần dùng session
import murach.business.User;
import murach.data.UserDB;

public class UsersServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        // Mặc định action là display_users nếu không có tham số
        String action = request.getParameter("action");
        if (action == null) {
            action = "display_users";
        }

        String url = "/index.jsp"; // Mặc định về trang chủ

        // --- 1. DISPLAY USERS (Hiển thị danh sách) ---
        if (action.equals("display_users")) {
            List<User> users = UserDB.selectUsers();
            request.setAttribute("users", users);
            url = "/index.jsp";
        } 
        
        // --- 2. DISPLAY USER (Hiển thị form update cho 1 user) ---
        else if (action.equals("display_user")) {
            String email = request.getParameter("email");
            User user = UserDB.selectUser(email);
            request.setAttribute("user", user);
            url = "/user.jsp"; // Chuyển đến trang sửa user
        } 
        
        // --- 3. UPDATE USER (Thực hiện update vào DB) ---
        else if (action.equals("update_user")) {
            // Lấy thông tin từ form
            String email = request.getParameter("email");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");

            // Tìm user cũ trong DB để lấy ID (quan trọng với JPA)
            User user = UserDB.selectUser(email);
            
            if (user != null) {
                user.setFirstName(firstName);
                user.setLastName(lastName);
                // JPA sẽ dựa vào ID của user object này để update dòng tương ứng
                UserDB.update(user);
            }
            
            // Update xong thì load lại danh sách
            List<User> users = UserDB.selectUsers();
            request.setAttribute("users", users);
            url = "/index.jsp";
        } 
        
        // --- 4. DELETE USER (Xóa user) ---
        else if (action.equals("delete_user")) {
            String email = request.getParameter("email");
            User user = UserDB.selectUser(email);
            
            if (user != null) {
                UserDB.delete(user);
            }
            
            // Xóa xong thì load lại danh sách
            List<User> users = UserDB.selectUsers();
            request.setAttribute("users", users);
            url = "/index.jsp";
        }

        getServletContext().getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}