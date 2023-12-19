package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.SanPhamDao;
import Entiny.SanPham;

/**
 * Servlet implementation class ChiTietSanPhamController
 */
@WebServlet("/ChiTietSanPham")
public class ChiTietSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChiTietSanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ma = Integer.parseInt(request.getParameter("ma"));
		SanPham sanPham = SanPhamDao.laySanPhamBangMa(ma);
		request.setAttribute("sanPham", sanPham);
		request.getRequestDispatcher("shop-details.jsp").forward(request, response);
	}

	

}
