
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import shopping.Product;
import utils.DBUtils;

public class CakeDAO {
    private static final String LIST_PRODUCT = "SELECT productID, name, price, quantity, imageURL FROM tblProducts";
    private static final String CHECK_QUANTITY = "SELECT quantity FROM tblProducts WHERE productID = ?";
    private static final String CHECK_INSERT_ITEM = "INSERT INTO tblProducts(productID, name, price, quantity, imageURL) VALUES(?,?,?,?,?)";
    private static final String SELECT_ITEM_ID = "SELECT productID, name, price, quantity, imageURL FROM tblProducts WHERE productID = ?";
    
    public List<Product> getListCake() throws SQLException{
        List<Product> listCake = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!= null){
                psm = conn.prepareStatement(LIST_PRODUCT);
                rs = psm.executeQuery();
                while(rs.next()){
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("imageURL");
                    listCake.add(new Product(productID, name, price, quantity, img));
                }
            }
        }catch(ClassNotFoundException | SQLException e){
            
        }finally{
            if(rs!= null) rs.close();
            if(psm!= null) psm.close();
            if(conn!= null) conn.close();
        }
        
        return listCake;
    }    
    public int checkQuantity(String productID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(CHECK_QUANTITY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if(rs.next()){                   
                    quantity = rs.getInt("quantity");
                }
            }
            
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return quantity;
    }
    public boolean checkInsertItem(String productID, String name, double price, int quantity, String imageURL) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(CHECK_INSERT_ITEM);
                ptm.setString(1,productID);
                ptm.setString(2,name);
                ptm.setDouble(3,price);
                ptm.setInt(4,quantity);
                ptm.setString(5,imageURL);
                check = ptm.executeUpdate()>0?true:false;
                
            }
        }catch(ClassNotFoundException | SQLException e){
            
        }finally{
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    public boolean CheckExistID(String itemID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(SELECT_ITEM_ID);
                ptm.setString(1,itemID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    check =true;
                }
                
            }
        }catch(ClassNotFoundException | SQLException e){
            
        }finally{
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
}


