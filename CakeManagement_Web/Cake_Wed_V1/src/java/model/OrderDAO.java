
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

public class OrderDAO {
    private static final String SETORDER = "INSERT INTO tblOrders (userID, total) VALUES (?, ?)";
    private static final String GET_ORDERID = "SELECT orderID FROM tblOrders WHERE userID = ? ORDER BY order_date DESC";


    public boolean addOrder(String userID, double total) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                psm = conn.prepareStatement(SETORDER);
                psm.setString(1, userID);
                psm.setDouble(2, total);
                return check = psm.executeUpdate() > 0;
            }
        }catch(ClassNotFoundException | SQLException e){
            
        }finally{
            if(psm != null) psm.close();
            if(conn != null) conn.close();           
        }
        return check;
    }
    public int getOrderID(String userID) throws SQLException{
        int orderID = 0; 
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(GET_ORDERID);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    orderID = rs.getInt("orderID");
                }
            }
            
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return orderID;
    }
}
