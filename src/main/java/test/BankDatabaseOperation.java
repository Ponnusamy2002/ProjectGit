package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BankDatabaseOperation {
	public int registerUser(BankUserBean bub) {
		int k=0;
		try {
			Connection con=new GetConnection().getCon();
			PreparedStatement ps=con.prepareStatement
					("insert into bankuser values(?,?,?,?,?,?,?)");
			ps.setString(1, bub.getUsername());
			ps.setString(2, bub.getPassword());
			ps.setString(3, bub.getFullname());
			ps.setString(4, bub.getAddress());
			ps.setLong(5, bub.getAdhar());
			ps.setLong(6, bub.getPhoneno());
			ps.setFloat(7, bub.getBalance());
			k=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
	public BankUserBean logIn(String username,String password) {
		//select * from bankuser where username=? and password=?
		BankUserBean bub=null;
		try {
			Connection con=new GetConnection().getCon();
			PreparedStatement ps=con.prepareStatement
					("select * from bankuser where username=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				bub=new BankUserBean();
				bub.setUsername(rs.getString(1));
				bub.setPassword(rs.getString(2));
				bub.setFullname(rs.getString(3));
				bub.setAddress(rs.getString(4));
				bub.setAdhar(rs.getLong(5));
				bub.setPhoneno(rs.getLong(6));
				bub.setBalance(rs.getFloat(7));
			}
			else {
				bub=null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bub;
	}
	public int updateBalance(BankUserBean bub) {
		int k=0;
		try {
			Connection con=new GetConnection().getCon();
			PreparedStatement ps=con.prepareStatement
					("update bankuser set balance=? where username=?");
			ps.setFloat(1, bub.getBalance());
			ps.setString(2, bub.getUsername());
			k=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
	public BankUserBean getUserDetailsBaseedOnUserName(String vuserName) {
		BankUserBean bub=null;
		try {
			Connection con=new GetConnection().getCon();
			PreparedStatement ps=con.prepareStatement
					("select * from bankuser where username=? ");
			ps.setString(1, vuserName);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				bub=new BankUserBean();
				bub.setUsername(rs.getString(1));
				bub.setPassword(rs.getString(2));
				bub.setFullname(rs.getString(3));
				bub.setAddress(rs.getString(4));
				bub.setAdhar(rs.getLong(5));
				bub.setPhoneno(rs.getLong(6));
				bub.setBalance(rs.getFloat(7));
			}
			else {
				bub=null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bub;
	}
}
