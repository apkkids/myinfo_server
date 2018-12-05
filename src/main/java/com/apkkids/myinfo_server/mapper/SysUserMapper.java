package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.Role;
import com.apkkids.myinfo_server.bean.SysUser;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Author:      wxb
 * Project:     myinfo_server
 * Create Date: 2018/11/6
 * Create Time: 20:22
 * Description: Sysuser系统用户的Mapper接口
 */
@Component
@Mapper
public interface SysUserMapper {
    SysUser getSysUserById(Long id);

    /**
     * 得到除当前id外的所有管理员
     * @param currentId
     * @return
     */
    List<SysUser> getAllSysUser(@Param("currentId") Long currentId);

    /**
     * 通过用户名查找管理员（不带有角色信息）
     * @param username
     * @return
     */
    SysUser selectByUsername(@Param("username") String username);

    /**
     * 通过用户名查找管理员（带有角色信息）
     * @param username
     * @return
     */
    SysUser loadUserByUsername(@Param("username") String username);
    /**
     * 通过关键字查询管理员（带有角色信息）
     * @param keywords 前端传入的keywords，如果为空，前端会传来"all"
     * @return
     */
    List<SysUser> getUsersByKeywords(@Param("keywords") String keywords);
    /**
     * 更新管理员属性
     * @param sysUser
     * @return
     */
    int updateSysUser(SysUser sysUser);
    /**
     * 通过id查找管理员的角色
     * @param id
     * @return
     */
    List<Role> getRolesByUserId(Long id);

    /**
     * 注册一个管理员
     * @param username 管理员名字
     * @param password 管理员密码，此处的密码应该是在后端加密过的，直接存入数据库
     * @return
     */
    int sysUserReg(@Param("username") String username, @Param("password") String password);

    int deleteUserById(Long id);

    /**
     * 为管理员添加角色
     * @param userId 管理员id
     * @param rids 角色id数组
     * @return
     */
    int addRolesForSysUser(@Param("userId") Long userId, @Param("rids") Long[] rids);

    /**
     * 通过管理员id删除他的角色（在sysuser_role表中）
     * @param userId
     * @return
     */
    int deleteRoleByUserId(Long userId);
}
