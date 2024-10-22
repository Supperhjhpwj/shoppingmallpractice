import dao.LogsDao;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.IOException.*;


@WebServlet("/ClearLogsServlet")
public class ClearLogsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        LogsDao logDao = new LogsDao();
        logDao.clearLogs();  // 调用清除日志的方法

        response.sendRedirect("user_activity_log.jsp");  // 重定向回管理员页面
    }
}
