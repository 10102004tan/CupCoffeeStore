package Controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Dao.SanPhamDao;
import Entiny.SanPham;

/**
 * Servlet implementation class QuanLySanPhamController
 */
@WebServlet("/QuanLySanPham")
public class QuanLySanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuanLySanPhamController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// data
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
		String url = "QuanLySanPham?";
		int currentPage = 0;
		int perPage = 5;
		int endPage = 0;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int total = SanPhamDao.layTongSanPham();
		endPage = total / perPage;

		if (total % perPage != 0) {
			endPage++;
		}

		listSanPham = SanPhamDao.layTatCaSanPham((currentPage - 1) * perPage, perPage);
		request.setAttribute("listSanPham", listSanPham);
		request.setAttribute("endPage", endPage);
		request.setAttribute("url", url);
		request.getRequestDispatcher("manage-product.jsp").forward(request, response);

	}

}
