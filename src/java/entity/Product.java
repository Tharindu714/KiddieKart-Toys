package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "product_condition_id", nullable = false)
    private Product_Condition product_condition;
    
    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private Product_Category product_category;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "price", nullable = false)
    private double price;
    
    @Column(name = "delivery_fee", nullable = false)
    private double delivery_fee;

    @Column(name = "qty", nullable = false)
    private int qty;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "date_time_added")
    private Date date_time;

    @ManyToOne
    @JoinColumn(name = "product_status_id")
    private Product_Status product_Status;

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product_Condition getProduct_condition() {
        return product_condition;
    }

    public void setProduct_condition(Product_Condition product_condition) {
        this.product_condition = product_condition;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDate_time() {
        return date_time;
    }

    public void setDate_time(Date date_time) {
        this.date_time = date_time;
    }

    public Product_Status getProduct_Status() {
        return product_Status;
    }

    public void setProduct_Status(Product_Status product_Status) {
        this.product_Status = product_Status;
    }

    /**
     * @return the product_category
     */
    public Product_Category getProduct_category() {
        return product_category;
    }

    /**
     * @param product_category the product_category to set
     */
    public void setProduct_category(Product_Category product_category) {
        this.product_category = product_category;
    }

    /**
     * @return the delivery_fee
     */
    public double getDelivery_fee() {
        return delivery_fee;
    }

    /**
     * @param delivery_fee the delivery_fee to set
     */
    public void setDelivery_fee(double delivery_fee) {
        this.delivery_fee = delivery_fee;
    }

    
    
}
