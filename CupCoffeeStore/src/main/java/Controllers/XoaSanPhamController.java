package Controllers;

import java.io.File;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Dao.SanPhamDao;

/**
 * Servlet implementation class XoaSanPhamController
 */
@WebServlet("/XoaSanPham")
public class XoaSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaSanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ma = 0;
		try {
			ma = Integer.parseInt(request.getParameter("ma"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		HttpSession session = request.getSession();
		String filePathToDelete = request.getServletContext().getRealPath("/images/") + File.separator + SanPhamDao.layAnhBangMaSanPham(ma);
		if (SanPhamDao.xoaSanPham(ma))
		{
			File fileToDelete = new File(filePathToDelete);
			if (fileToDelete.exists())
			{
				try {
					fileToDelete.delete();
				} catch (Exception e) {
					
				}
			}
			
			session.setAttribute("mess", "Remove product success");
		}
		else {
			session.setAttribute("mess", "Remove product fail");
		}
		response.sendRedirect("QuanLySanPham");
	}

}
