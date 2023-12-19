package Controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Dao.NguoiDungDao;
import Entiny.NguoiDung;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenDangNhap = request.getParameter("tenDangNhap");
		String mk = request.getParameter("matKhau");
		if (NguoiDungDao.kiemTraDangNhap(tenDangNhap, mk))
		{
			HttpSession session = request.getSession();
			NguoiDung nguoiDung = NguoiDungDao.layNguoiDungBangTenDangNhap(tenDangNhap);
			session.setAttribute("name", nguoiDung.getTenDangNhap());
			if (nguoiDung.getQuyen() == 1)
			{
				response.sendRedirect("QuanLySanPham");
			}
			else {
				
				response.sendRedirect("TrangChu");
			}
			
		}
		else {
			request.setAttribute("mess", "Ten dang nhap hoac mat khau sai");
			request.getRequestDispatcher("login.jsp").forward(request, response);
//			response.getWriter().print(tenDangNhap);
//			response.getWriter().print(mk);
		}
	}

}
