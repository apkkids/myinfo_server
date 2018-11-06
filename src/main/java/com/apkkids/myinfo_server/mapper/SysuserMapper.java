package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.SysuserBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
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
public interface SysuserMapper {
    /**
     * 从数据库中查询用户
     * @param username
     * @return
     */
    @Select("select * from sysuser where username = #{username}")
    SysuserBean selectByUsername(@Param("username") String username);

    /**
     * 从数据库中查询用户和角色
     * @param username
     * @return
     */
//    @Select("SELECT u.* , r.id as rid, r.name as rname,r.nameZh AS rnameZh FROM (( sysuser u LEFT JOIN sysuser_role u_r on ((u.id=u_r.sysuser_id)))\n" +
//            "//    LEFT JOIN role r on ((u_r.role_id=r.id))) where u.username=#{username}")
//    List<SysuserBean> selectUserWithRolesByUsername(@Param("username") String username);
}
