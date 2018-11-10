package com.apkkids.myinfo_server.bean;

import java.sql.Timestamp;

/**
 * Created by wxb on 2018/11/9 0009.
 * 数据库字典表joblevel
 */
public class JobLevel {
    private Integer id;
    private String name;
    private String titleLevel;
    private Timestamp createDate;
    private boolean enabled;

    public Integer getId() {
        return id;
    }

    @Override
    public String toString() {
        return "JobLevel{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", titleLevel='" + titleLevel + '\'' +
                ", createDate=" + createDate +
                ", enabled=" + enabled +
                '}';
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

    public String getTitleLevel() {
        return titleLevel;
    }

    public void setTitleLevel(String titleLevel) {
        this.titleLevel = titleLevel;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
