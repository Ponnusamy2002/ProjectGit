package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SendMoneyServlet")
public class SendMoneyServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Float amount=Float.parseFloat(req.getParameter("amount"));
		HttpSession session = req.getSession();
		BankUserBean bub=(BankUserBean)session.getAttribute("bub");
		BankUserBean recieverbub=(BankUserBean)session.getAttribute("sendBankUserBean");
		if(amount<=bub.getBalance()) {
			bub.setBalance(bub.getBalance()-amount);// 200-200=0
			int k=new BankDatabaseOperation().updateBalance(bub);
			recieverbub.setBalance(amount+recieverbub.getBalance());
			int k1=new BankDatabaseOperation().updateBalance(recieverbub);
			if(k>0 && k1>0) {
				req.setAttribute("WithdrawlMsg", "Money Send Successfully to : "+recieverbub.getFullname());
				req.getRequestDispatcher("home.jsp").forward(req, resp);
			}
			else {
				req.setAttribute("WithdrawlMsg", "Bank Server Failed To Send Money");
				req.getRequestDispatcher("home.jsp").forward(req, resp);
			}
		}
		else {
			req.setAttribute("WithdrawlMsg", "Insuffcient Funds");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
	}
}
