package Controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Dao.DanhMucDao;
import Dao.SanPhamDao;
import Entiny.DanhMuc;
import Entiny.SanPham;

/**
 * Servlet implementation class TimSanPhamController
 */
@WebServlet("/TimSanPham")
public class TimSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimSanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
				ArrayList<DanhMuc> listDanhMuc = DanhMucDao.layTatCaDanhMuc();
				String keyWord = request.getParameter("key");
				ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
				String url = "TimSanPham?key=" + keyWord + "&";
				int currentPage = 0;
				int perPage = 2;
				int endPage = 0;
				if (request.getParameter("currentPage") == null)
				{
					currentPage = 1;
				}
				else {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				int total =  SanPhamDao.layTongSanPhamTheoTuKhoa(keyWord);
				
				//tinh endPage
				endPage = total / perPage;
				
				if (total % 3 != 0)
				{
					endPage++;
				}
				
				//lay account theo perPage
				
				listSanPham = SanPhamDao.laySanPhamTheoTuKhoa((currentPage - 1)*perPage, perPage,keyWord);
				
				//set Attribute
				request.setAttribute("listSanPham",listSanPham);
				request.setAttribute("endPage", endPage);
				request.setAttribute("url", url);
				request.setAttribute("listDanhMuc", listDanhMuc);
				// chuyen trang
				request.getRequestDispatcher("manage-product.jsp").forward(request, response);
	}

}
