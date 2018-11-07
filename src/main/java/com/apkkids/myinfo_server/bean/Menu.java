package com.apkkids.myinfo_server.bean;

import java.util.List;

/**
 * 对应数据库的menu表，存储了资源url
 */
public class Menu {
//    CREATE TABLE `menu` (
//            `id` int(11) NOT NULL AUTO_INCREMENT,
//  `url` varchar(64) DEFAULT NULL,
//  `path` varchar(64) DEFAULT NULL,
//  `component` varchar(64) DEFAULT NULL,
//  `name` varchar(64) DEFAULT NULL,
//  `iconCls` varchar(64) DEFAULT NULL,
//  `keepAlive` tinyint(1) DEFAULT NULL,
//  `requireAuth` tinyint(1) DEFAULT NULL,
//  `parentId` int(11) DEFAULT NULL,
//  `enabled` tinyint(1) DEFAULT '1',
//    PRIMARY KEY (`id`),
//    KEY `parentId` (`parentId`),
//    CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`)
//            ) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

    // 数据库中的原始属性
    private Integer id;
    private String url;
    private String path;
    private String component;
    private String name;
    private String iconCls;
    private Integer parentId;
    private boolean enabled;
    // 封装了keepAlive和requireAuth的MenuMeta属性
    private MenuMeta meta;

    // 通过二次查询组合得到的集合属性
    private List<Role> roles;
    private List<Menu> children;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public MenuMeta getMeta() {
        return meta;
    }

    public void setMeta(MenuMeta meta) {
        this.meta = meta;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }
}
