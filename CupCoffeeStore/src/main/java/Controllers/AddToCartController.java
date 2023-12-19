package Controllers;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import Dao.SanPhamDao;
import Entiny.Order;
import Entiny.SanPham;
@WebServlet("/AddToCart")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Gson gson = new Gson();
		long totalPrice = 0;
	        Map<Integer, Order> orders = (Map<Integer, Order>) session.getAttribute("orders");
	        if (orders == null) {
	        	orders = new HashMap<>();
	            session.setAttribute("orders", orders);
	        }
	        int soLuong = 1;
	        int maSanPham = Integer.parseInt(request.getParameter("ma"));
	        SanPham sanPham = SanPhamDao.laySanPhamBangMa(maSanPham);
	        Order temp = new Order(maSanPham,sanPham,soLuong,sanPham.getGia());
	        for (Order order : orders.values())
	        {
	        	if (order.getMa() == maSanPham)
	        	{
	        		temp.setSoLuong(order.getSoLuong()+ temp.getSoLuong());
	        		orders.remove(order.getMa());
	        		break;
	        	}
	        }
	        
	        orders.put(maSanPham,temp);
	        for(Order order : orders.values())
	        {
	        	totalPrice+=(order.getGia()*order.getSoLuong());
	        }
	        session.setAttribute("totalPrice", totalPrice);
	        request.getRequestDispatcher("shopping-cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
