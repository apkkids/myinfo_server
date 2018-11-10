package com.apkkids.myinfo_server.bean;

/**
 * Created by wxb on 2018/11/10 0010.
 */
public class PoliticsStatus {
    private Integer id;
    private String name;

    @Override
    public String toString() {
        return "PoliticsStatus{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }

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
