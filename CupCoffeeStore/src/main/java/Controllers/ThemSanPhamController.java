package Controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Dao.DanhMucDao;
import Dao.SanPhamDao;
import Entiny.DanhMuc;
import Entiny.SanPham;

/**
 * Servlet implementation class ThemSanPhamController
 */
@MultipartConfig(maxFileSize = 209715200)
@WebServlet("/ThemSanPham")
public class ThemSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemSanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<DanhMuc> listDanhMuc = DanhMucDao.layTatCaDanhMuc();
		request.setAttribute("listDanhMuc", listDanhMuc);
		request.getRequestDispatcher("add-product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String ten = request.getParameter("ten");
		String moTa = request.getParameter("moTa");
		String xuatXu = request.getParameter("xuatXu");
		String hinh = "";
		int gia = 0;
		int maDanhMuc = 0;
		try {
			gia = Integer.parseInt(request.getParameter("gia"));
			maDanhMuc = Integer.parseInt(request.getParameter("maDanhMuc"));
		} catch (Exception e) {
			// TODO: handle exception
		}
	
		Part filePart = request.getPart("hinh");
		if (filePart != null) {
			String uploadPath = request.getServletContext().getRealPath("/images/") + File.separator + filePart.getSubmittedFileName();
			try {
    			FileOutputStream fos = new FileOutputStream(uploadPath);
    			InputStream is = filePart.getInputStream();
    			byte[] data = new byte[is.available()];
    			hinh = filePart.getSubmittedFileName();
    			is.read(data);
    			fos.write(data);
    			fos.close();

    		} catch (Exception e) {
    			
    		}
		}
		
		SanPham sanPham = new SanPham(ten, hinh, xuatXu, gia, moTa, maDanhMuc);
		if (SanPhamDao.themSanPham(sanPham))
		{
			HttpSession session = request.getSession();
			session.setAttribute("mess", "Add product success");
			response.sendRedirect("QuanLySanPham");
		}else {
			
		}
		
		
		
	}

}
