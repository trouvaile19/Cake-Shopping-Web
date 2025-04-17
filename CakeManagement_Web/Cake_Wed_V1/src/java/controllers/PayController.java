/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.OrderDAO;
import model.OrderDetailDAO;
import model.OrderDetailDTO;
import model.UserDTO;
import shopping.Cart;
import shopping.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "PayController", urlPatterns = {"/PayController"})
public class PayController extends HttpServlet {
    private static final String SUCCESS = "payment.jsp";
    private static final String ERROR = "login.jsp";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("CART");
        UserDTO userLogin = (UserDTO) session.getAttribute("LOGIN_USER");
        
        OrderDAO orderDao = new OrderDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        double total = (double) session.getAttribute("TOTAL");
        
        
        try{
            if (userLogin != null) {
                String userID = userLogin.getUserID();
                if (orderDao.addOrder(userID, total)) {
                    int orderID = orderDao.getOrderID(userID);
                    for (Product cake : cart.getCart().values()) {
                        String productID = cake.getProductID();
                        int quantity = cake.getQuantity();
                        double price = cake.getPrice();
                        boolean checkOrderDetail = orderDetailDAO.checkOrderDetail(new OrderDetailDTO(orderID, productID, quantity, price));
                        boolean checkUpdateQuantity = orderDetailDAO.checkUpdateQuantity(quantity, productID);
                    }
                    request.setAttribute("MESS", "SUCCESSFUL PAYMENT");
                    session.removeAttribute("CART");
                    url = SUCCESS;
                }
            }else{
                request.setAttribute("ERROR", "FAILURE PAYMENT! You have to sign in to purchase!");
                url = ERROR;
            }
        }catch(SQLException e){
            
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
