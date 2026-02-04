package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BankUserBean bub=new BankUserBean();
		bub.setUsername(req.getParameter("username"));
		bub.setPassword(req.getParameter("password"));
		bub.setFullname(req.getParameter("fullname"));
		bub.setAddress(req.getParameter("address"));
		bub.setAdhar(Long.parseLong(req.getParameter("adhar")));
		bub.setPhoneno(Long.parseLong(req.getParameter("phoneno")));
		bub.setBalance(Float.parseFloat(req.getParameter("balance")));
		int k=new BankDatabaseOperation().registerUser(bub);
		if(k>0) {
			req.getRequestDispatcher("index.html").forward(req, resp);
		}
		else {
			req.setAttribute("msg", "Not Register");
			req.getRequestDispatcher("msg.jsp").forward(req, resp);
		}
	}
}
