
package model;

import java.sql.Timestamp;

public class OrderDTO {
    private String orderID;
    private String userID;
    private double total;
    private Timestamp orderDate;
    
    public OrderDTO(){}

    public OrderDTO(String orderID, String userID, double total, Timestamp orderDate) {
        this.orderID = orderID;
        this.userID = userID;
        this.total = total;
        this.orderDate = orderDate;
    }

    // Getters và Setters
    public String getOrderID() { return orderID; }
    public void setOrderID(String orderID) { this.orderID = orderID; }

    public String getUserID() { return userID; }
    public void setUserID(String userID) { this.userID = userID; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }
}
