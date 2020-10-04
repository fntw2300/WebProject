package week05;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/book")
public class BookServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//사용자 입력 정보 가져오기
		String name = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		
		//공통 저장소에 저장한다.
		request.setAttribute("title", name);
		request.setAttribute("author", author);
		request.setAttribute("publisher", publisher);
		
		//view page로 요청 재지정
		RequestDispatcher rd =request.getRequestDispatcher("5week/bookout.jsp");
		rd.forward(request, response);
	}
}
