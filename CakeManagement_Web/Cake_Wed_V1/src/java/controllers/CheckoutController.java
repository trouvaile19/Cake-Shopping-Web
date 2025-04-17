/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CakeDAO;
import shopping.Cart;
import shopping.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "payment.jsp";
    private static final String EXPIRED_SESSION = "Your shopping cart has expired. Please purchase again.";
    private static final String EXCEED_QUANTITY = "Sorry! We only have ";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession(false);
            // Kiểm tra session null
            if (session == null) {
                request.setAttribute("MESSAGE", EXPIRED_SESSION);
                request.getRequestDispatcher(url).forward(request, response);
                return;
            }

            Cart cart = (Cart) session.getAttribute("CART");
            // Kiểm tra giỏ hàng null
            if (cart == null) {
                request.setAttribute("MESSAGE", EXPIRED_SESSION);
                request.getRequestDispatcher(url).forward(request, response);
                return;
            }

            CakeDAO dao = new CakeDAO();
            boolean check = true;

            for (Product cake : cart.getCart().values()) {  // Đảm bảo Cart có getProducts()
                int quantity = dao.checkQuantity(cake.getProductID());
                if (cake.getQuantity() > quantity) {
                    request.setAttribute("MESSAGE_".concat(cake.getProductID()), EXCEED_QUANTITY + quantity + " cakes left!");
                    url = ERROR;
                    check = false;
                }
            }
            if (check) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at PaymentController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
