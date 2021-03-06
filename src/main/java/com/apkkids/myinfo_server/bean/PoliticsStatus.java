package com.apkkids.myinfo_server.bean;

/**
 * Created by wxb on 2018/11/10 0010.
 */
public class PoliticsStatus {
    private Long id;
    private String name;

    public PoliticsStatus(){}
    public PoliticsStatus(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }

        PoliticsStatus that = (PoliticsStatus)obj;
        return name == null ? that.name == null : this.name.equals(that.name);
    }

    @Override
    public String toString() {
        return "PoliticsStatus{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
