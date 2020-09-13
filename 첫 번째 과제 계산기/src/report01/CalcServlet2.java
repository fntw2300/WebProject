package report01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalcServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	public void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num1, num2;
		int result;
		String op;
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		num1 = Integer.parseInt(request.getParameter("num1"));
		num2 = Integer.parseInt(request.getParameter("num2"));
		op = request.getParameter("operator");
		
		Calc calc = new Calc(num1, num2, op);
		result = calc.result();
		
		out.println("<HTML>");
		out.println("<head><title>계산 결과</title></head>");
		out.println("<body>");
		out.println("<h1>계산결과 : "+result+" </h1>");
		out.println("</body></html>");
	}
}
