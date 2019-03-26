package com.mrhmt.entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="categories")
public class Category implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
    private int id;
    @Column(name="name", nullable=true)
    private String name;

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

    public Category(String name) {
        this.name=name;
    }

    public Category() {
    }
}
