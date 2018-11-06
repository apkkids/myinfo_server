package com.apkkids.myinfo_server.bean;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Collection;

/**
 * Author:      wxb
 * Project:     myinfo_server
 * Create Date: 2018/11/6
 * Create Time: 20:04
 * Description:系统用户Sysuser对应的Bean，数据库表为sysuser，它继承了UserDetails，用于验证系统用户拥有的权限
 */
@Component
public class SysuserBean implements UserDetails{
//      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'hrID',
//            `name` varchar(32) DEFAULT NULL COMMENT '姓名',
//            `phone` char(11) DEFAULT NULL COMMENT '手机号码',
//            `telephone` varchar(16) DEFAULT NULL COMMENT '住宅电话',
//            `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
//            `enabled` tinyint(1) DEFAULT '1',
//            `username` varchar(255) DEFAULT NULL COMMENT '用户名',
//            `password` varchar(255) DEFAULT NULL COMMENT '密码',
//            `userface` varchar(255) DEFAULT NULL,
//  `remark` varchar(255) DEFAULT NULL,



//    SELECT u.* , r.id as rid, r.name as rname,r.nameZh AS rnameZh FROM (( sysuser u LEFT JOIN sysuser_role u_r on ((u.id=u_r.sysuser_id)))
//    LEFT JOIN role r on ((u_r.role_id=r.id))) where u.id=3;

    private Integer id;
    private String name;
    private String phone;
    private String telephone;
    private String address;
    private boolean enabled;
    private String username;
    private String password;
    private String userface;
    private String remark;

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserface() {
        return userface;
    }

    public void setUserface(String userface) {
        this.userface = userface;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }




    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }
}
