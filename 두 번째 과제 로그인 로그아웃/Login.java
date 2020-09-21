package report02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	public void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		HttpSession session = request.getSession();

		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);

		PrintWriter out = response.getWriter();

		out.println("<HTML>");
		out.println("<head><title>로그인</title></head>");
		out.println("<body>");
		out.println("<h1>로그인되었습니다</h1>");
		out.println("<hr>");
		out.println("id = "+id+"<br>pwd = "+pwd);
		out.println("</body></html>");
	}
}
