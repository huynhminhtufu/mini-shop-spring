package com.mrhmt.entities;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="user_roles", uniqueConstraints={@UniqueConstraint(columnNames={"ROLE", "username"})})
public class Role {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="user_role_id")
    private int user_role_id;

    @Column(name="role", length=45)
    @NotNull
    private String ROLE;

    @ManyToOne
    @JoinColumn(name="username")
    private User username;

    public int getUser_role_id() {
        return user_role_id;
    }

    public void setUser_role_id(int user_role_id) {
        this.user_role_id=user_role_id;
    }

    public String getROLE() {
        return ROLE;
    }

    public void setROLE(String ROLE) {
        this.ROLE=ROLE;
    }

    public User getUsername() {
        return username;
    }

    public void setUsername(User username) {
        this.username=username;
    }

    public Role(String ROLE, User username) {
        this.ROLE=ROLE;
        this.username=username;
    }

    public Role() {
    }
}
