package controllers;

import Client_Key.Constants;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserDAO;
import model.UserDTO;
import model.UserGoogleDTO;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

@WebServlet(urlPatterns = {"/LoginGoogleController"})
public class LoginGoogleController extends HttpServlet {

    private static final String US_PAGE = "user.jsp";
    private static final String AD_PAGE = "admin.jsp";
    private static final String ERROR_URL = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = ERROR_URL;

        String code = request.getParameter("code");
        System.out.println("Code received: " + code);
        String accessToken = getToken(code);
        UserGoogleDTO userGoogle = getUserInfo(accessToken);
        System.out.println(userGoogle);
        UserDAO dao = new UserDAO();
        try {
            if (dao.checkExistEmail(userGoogle.getEmail())) {
                UserDTO userEmail = dao.emailLogin(userGoogle);
                UserDTO userLogin = dao.checkLogin(userEmail.getUserID(), userEmail.getPassword());
                if (userLogin != null) {
                    session.setAttribute("LOGIN_USER", userLogin);
                    String roleID = userLogin.getRoleID();
                    if ("AD".equals(roleID)) {
                        url = AD_PAGE;
                    } else if ("US".equals(roleID)) {
                        url = US_PAGE;
                    }
                }
            } else {
                    request.setAttribute("ERROR_MESS", "Please sign up user to login in GMAIL!");
                    url = ERROR_URL;
            }
        } catch (SQLException e) {

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);

        return googlePojo;
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
