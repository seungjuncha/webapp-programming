package homework;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

@WebServlet("/guestbookControl")
public class GuestbookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    GuestbookDAO dao;
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	dao = new GuestbookDAO();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String view = "";
		
		if(request.getParameter("action") == null) {
			getServletContext().getRequestDispatcher("guestbookControl?action=list")
			.forward(request, response);
		}else {
			switch(action) {
			case "list": view = list(request, response); break;
			case "insert": view = insert(request, response); break;
			}
			getServletContext().getRequestDispatcher("/homework/"+view).forward(request, response);
		}
	}

	public String list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("guestbooks", dao.getALL());
		return "guestbookInfo.jsp";
	}
	
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		Guestbook g = new Guestbook();
		try {
			BeanUtils.populate(g, request.getParameterMap());
		} catch (Exception e) { e.printStackTrace(); }
		dao.insert(g);
		return "guestbookInfo.jsp";
	}
}
