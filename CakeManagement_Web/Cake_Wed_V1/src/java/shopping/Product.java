
package shopping;

public class Product {
    private String productID;
    private String name;
    private double price;
    private int quantity;
    private String imageURL;
    public Product() {
        this.productID = "";
        this.name = "";
        this.price = 0;
        this.quantity= 0;
        this.imageURL = "";
    }

    
    public Product(String productID, String name, double price, int quantity, String imageURL) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.imageURL = imageURL;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
    
    

}
