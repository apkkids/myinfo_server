package com.apkkids.myinfo_server.bean;

/**
 * 对应数据库字典表nation，用于Employee
 */
public class Nation {
    private  Long id;
    private String name;

    public Nation(){}

    public Nation(String name) {
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

        Nation that = (Nation)obj;
        return name == null ? that.name == null : this.name.equals(that.name);
    }

    @Override
    public String toString() {
        return "Nation{" +
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
