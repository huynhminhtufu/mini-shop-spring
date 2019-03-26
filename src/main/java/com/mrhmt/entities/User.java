package com.mrhmt.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="users")
public class User {
    @Id
    @NotNull
    @Column(name="username", length=45)
    private String username;

    @Column(name="password", length=450)
    @NotNull
    private String password;

    @Column(name="enabled")
    @NotNull
    private int enabled = 1;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username=username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password=password;
    }

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled=enabled;
    }

    public User(String username, String password, int enabled) {
        this.username=username;
        this.password=password;
        this.enabled=enabled;
    }

    public User() {
    }
}
