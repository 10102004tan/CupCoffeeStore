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
 * Servlet implementation class CapNhatSanPhamController
 */
@MultipartConfig(maxFileSize = 209715200)
@WebServlet("/CapNhatSanPham")
public class CapNhatSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int ma = 0;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ma = 0;
		try {
			ma = Integer.parseInt(request.getParameter("ma"));
		} catch (Exception e) {
			
		}
		SanPham sanPham = SanPhamDao.laySanPhamBangMa(ma);
		ArrayList<DanhMuc> listDanhMuc = DanhMucDao.layTatCaDanhMuc();
		request.setAttribute("listDanhMuc", listDanhMuc);
		request.setAttribute("sanPham", sanPham);
		request.getRequestDispatcher("edit-product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String ten = request.getParameter("ten");
		String moTa = request.getParameter("moTa");
		String xuatXu = request.getParameter("xuatXu");
		String hinh = "";
		hinh = SanPhamDao.layAnhBangMaSanPham(ma);
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
    			
    			File fileToDelete = new File(hinh);
    			if (fileToDelete.exists())
    			{
    				try {
    					fileToDelete.delete();
    				} catch (Exception e) {
    					
    				}
    			}
    			
    			hinh = filePart.getSubmittedFileName();
    			is.read(data);
    			fos.write(data);
    			fos.close();

    		} catch (Exception e) {
    			
    		}
			
			
		}
		
		SanPham sanPham = new SanPham(ma,ten, hinh, xuatXu, gia, moTa,maDanhMuc);
		HttpSession session = request.getSession();
		if (SanPhamDao.capNhatSanPham(sanPham))
		{
			
			session.setAttribute("mess", "Update product success");
			
		}
		else {
			session.setAttribute("mess", "Update product fail");
		}
		
		
		response.sendRedirect("QuanLySanPham");
	}

}
