package homework;
import java.sql.Date;

public class Guestbook {
	private int num;
	private String username;
	private String email;
	private Date dayc;
	private String title;
	private String pass;
	private String cont;
	
	public int getNum() {
		return num;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDayc() {
		return dayc;
	}
	public void setDayc(Date dayc) {
		this.dayc = dayc;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

}
