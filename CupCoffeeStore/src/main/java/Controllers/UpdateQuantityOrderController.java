package Controllers;

import java.io.IOException;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Entiny.Order;

/**
 * Servlet implementation class UpdateQuantityCartController
 */
@WebServlet("/UpdateQuantityOrder")
public class UpdateQuantityOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuantityOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Map<Integer, Order> orders = (Map<Integer, Order>) session.getAttribute("orders");
		int maSanPham = Integer.parseInt(request.getParameter("ma"));
		int soLuong = Integer.parseInt(request.getParameter("soLuong"));
		Gson gson = new Gson();
		JsonObject jsonResponse = new JsonObject();
		String json = gson.toJson("0");
		for (Order order : orders.values()) {
			if (order.getMa() == maSanPham){
				order.setSoLuong(soLuong);
				int updatedTotalPrice = soLuong * order.getGia();
		        jsonResponse.addProperty("updatedPrice", updatedTotalPrice);
				break;
			}
		}
		long totalPrice = 0;
		for(Order order : orders.values())
	    {
	        totalPrice+=(order.getGia()*order.getSoLuong());
	    }
		session.setAttribute("totalPrice", totalPrice);
		jsonResponse.addProperty("totalPrice", totalPrice);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(gson.toJson(jsonResponse));
		
	}

}
