package homework;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class GuestbookDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
	
	public void open() {
		try {
		Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(JDBC_URL, "jwbook","1234");
	}	catch (Exception e) { e.printStackTrace(); }	
}

	public void close() {
	    try {
	        if (pstmt != null) {
	            pstmt.close();
	        }
	        if (conn != null) {
	            conn.close();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	public void insert(Guestbook g) {
	    try {
	        open();
	        String sql = "INSERT INTO guestbook(username, email, dayc, title) values(?,?,?,?)";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, g.getUsername());
	        pstmt.setString(2, g.getEmail());
	        pstmt.setDate(3, g.getDayc());
	        pstmt.setString(4, g.getTitle());
	        pstmt.setString(5, g.getPass());
	        pstmt.setString(6, g.getCont());
	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	}

	public List<Guestbook> getALL() {
	    List<Guestbook> guestbooks = new ArrayList<>();
	    try {
	        open();
	        pstmt = conn.prepareStatement("SELECT * FROM guestbook");
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            Guestbook g = new Guestbook();
	            g.setNum(rs.getInt("num"));
	            g.setUsername(rs.getString("username"));
	            g.setEmail(rs.getString("email"));
	            g.setDayc(rs.getDate("dayc"));
	            g.setTitle(rs.getString("title"));
	            g.setPass(rs.getString("pass"));
	            g.setCont("cont");
	            guestbooks.add(g);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return guestbooks;
	}

}