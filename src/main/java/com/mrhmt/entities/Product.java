package com.mrhmt.entities;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Proxy(lazy=false)
@Table(name="products")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="name")
    private String name;

    @Column(name="description")
    private String description;

    @Column(name="price")
    private double price;

    @Column(name="amount")
    private int amount;

    @Column(name="thumbnail")
    private String thumbnail;

    @ManyToOne
    @JoinColumn(name="cateId")
    private Category category;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id=id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name=name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description=description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price=price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount=amount;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail=thumbnail;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category=category;
    }

    public Product(String name, String description, double price, int amount, String thumbnail, Category category) {
        this.name=name;
        this.description=description;
        this.price=price;
        this.amount=amount;
        this.thumbnail=thumbnail;
        this.category=category;
    }

    public Product() {
    }
}
