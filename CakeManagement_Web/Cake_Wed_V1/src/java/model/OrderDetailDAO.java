
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import utils.DBUtils;

public class OrderDetailDAO {
    private static final String INSERT = "INSERT INTO tblOrderDetails (orderID, productID, quantity, price) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_QUANTITY = "UPDATE tblProducts SET quantity = quantity - ? WHERE productID = ?";  
        public boolean checkOrderDetail(OrderDetailDTO orderDetail) throws SQLException {
          
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, orderDetail.getOrderID());
                ptm.setString(2, orderDetail.getProductID());
                ptm.setInt(3, orderDetail.getQuantity());
                ptm.setDouble(4, orderDetail.getPrice());           
                check = ptm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
        public boolean checkUpdateQuantity(int quantity, String productID) throws SQLException{
            boolean check = false;
            Connection conn = null;
            PreparedStatement ptm = null;
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {    
                    ptm = conn.prepareStatement(UPDATE_QUANTITY);
                    ptm.setInt(1, quantity);
                    ptm.setString(2, productID);
                    check = ptm.executeUpdate()>0?true:false;
                }  
            }catch(ClassNotFoundException | SQLException e){
                
            }finally{
                if(ptm!=null) ptm.close();
                if(conn!=null) conn.close();
            }
            return check;
        }
}
