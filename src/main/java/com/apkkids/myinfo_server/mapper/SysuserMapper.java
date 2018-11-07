package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.Role;
import com.apkkids.myinfo_server.bean.SysuserBean;
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
public interface SysuserMapper {
    /**
     * 从数据库中查询用户
     *
     * @param username
     * @return
     */
    @Select("select * from sysuser where username = #{username}")
    SysuserBean selectByUsername(@Param("username") String username);

    /**
     * 从数据库中查询用户和角色，参考这篇文章使用@Many和@One
     * https://blog.csdn.net/wfq784967698/article/details/78786001
     *
     * @param username
     * @return
     */
    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "roles", column = "id", many = @Many(select = "com.apkkids.myinfo_server.mapper.SysuserMapper.queryRoleBySysuserid"))
    }
    )
    @Select("select * from sysuser where username = #{username}")
    SysuserBean selectUserWithRolesByUsername(@Param("username") String username);

    /**
     * 根据userid从角色表中选择相应的角色，在selectUserWithRolesByUsername中使用
     *
     * @return
     */
    @Select("SELECT r.* FROM sysuser_role u,role r where u.role_id=r.id AND u.sysuser_id=#{id}")
    List<Role> queryRoleBySysuserid(@Param("id") Integer id);

}
