package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/withdrawl")
public class WithdrawlServlet extends HttpServlet{
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			Float amount=Float.parseFloat(req.getParameter("amount"));
			HttpSession hs = req.getSession(false);
			BankUserBean bub=(BankUserBean)hs.getAttribute("bub");
			Float balance=bub.getBalance();
			if(amount<=balance && amount>=0) {
				bub.setBalance(bub.getBalance()-amount);
				int k=new BankDatabaseOperation().updateBalance(bub);
				if(k>0) {
					req.setAttribute("WithdrawlMsg", "WithDrawlSuccessfull");
					req.getRequestDispatcher("home.jsp").forward(req, resp);
				}
			}
			else {
				req.setAttribute("WithdrawlMsg", "WithDrawl Not Successfull");
				req.getRequestDispatcher("home.jsp").forward(req, resp);
			}
		}
}