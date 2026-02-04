package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/VerifyUserServlet")
public class VerifyUserServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String vuserName=req.getParameter("username");
		BankUserBean sendBankUserBean = new BankDatabaseOperation().getUserDetailsBaseedOnUserName(vuserName);
		if(sendBankUserBean!=null) {
			HttpSession hs = req.getSession(false);
			hs.setAttribute("sendBankUserBean", sendBankUserBean);
			req.getRequestDispatcher("sendmoney.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("WithdrawlMsg", "User Not Exist");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
		
	}
}
