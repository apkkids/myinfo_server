package com.apkkids.myinfo_server.bean;

/**
 * 对应数据库字典表nation，用于Employee
 */
public class Nation {
    private  Integer id;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
