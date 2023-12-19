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
 * Servlet implementation class ShopController
 */
@WebServlet("/Shop")
public class ShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<DanhMuc> listDanhMuc = DanhMucDao.layTatCaDanhMuc();
		ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
		String url = "Shop?";
		int maDanhMuc;
		String keyWord;
		int currentPage = 0;
		int perPage = 3;
		int endPage = 0;
		int total = 0;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		if (request.getParameter("maDanhMuc") == null)
		{
			total = SanPhamDao.layTongSanPham();
			endPage = total / perPage;
			listSanPham = SanPhamDao.layTatCaSanPham((currentPage - 1) * perPage, perPage);
		}
		else {
			maDanhMuc =(Integer.parseInt(request.getParameter("maDanhMuc")));
			url = "Shop?maDanhMuc=" + maDanhMuc + "&";
			total = SanPhamDao.layTongSanPhamTheoDanhMuc(maDanhMuc);
			endPage = total / perPage;
			listSanPham = SanPhamDao.layDanhSachSanPhamTheoDanhMuc(maDanhMuc, (currentPage - 1) * perPage, perPage);
		}
		
		if (request.getParameter("key") != null)
		{
			keyWord = request.getParameter("key");
			url = "Shop?key=" + keyWord + "&";
			total =  SanPhamDao.layTongSanPhamTheoTuKhoa(keyWord);
			endPage = total / perPage;
			listSanPham = SanPhamDao.laySanPhamTheoTuKhoa((currentPage - 1)*perPage, perPage,keyWord);
		}
		
		if (total % perPage != 0) {
			endPage++;
		}
		
		
		request.setAttribute("listSanPham", listSanPham);
		request.setAttribute("listDanhMuc", listDanhMuc);
		request.setAttribute("endPage", endPage);
		request.setAttribute("url", url);
		request.getRequestDispatcher("shop.jsp").forward(request,response);
//		response.getWriter().print(listSanPham.size());
	}

	

}
