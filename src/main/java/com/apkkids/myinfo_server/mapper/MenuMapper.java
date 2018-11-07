package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.Menu;
import com.apkkids.myinfo_server.bean.MenuMeta;
import com.apkkids.myinfo_server.bean.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Menu的Mapper接口
 */
@Component
@Mapper
public interface MenuMapper {
    /**
     * 组合menu、menu_role、role三个表，查询所有的menu以及它所需的角色
     * @return
     */
    @Select("SELECT\n" +
            "m.*, r.id AS rid,\n" +
            "r.name AS rname,\n" +
            "r.nameZh AS rnamezh\n" +
            "FROM\n" +
            "menu m\n" +
            "LEFT JOIN menu_role mr ON m.id = mr.mid\n" +
            "LEFT JOIN role r ON mr.rid = r.id\n" +
            "WHERE\n" +
            "m.enabled = TRUE\n" +
            "ORDER BY\n" +
            "m.id DESC")
    @Results({
            //通过menu的id查询，确定roles的值，组成一个集合
            @Result(property = "roles", column = "id", many = @Many(select = "com.apkkids.myinfo_server.mapper.MenuMapper.getRolesByMenuId")),
            //通过menu的id查询，确定meta的值
            @Result(property = "meta", column = "id", one = @One(select = "com.apkkids.myinfo_server.mapper.MenuMapper.getMetaByMenuId"))
    })
    List<Menu> getAllMenu();

    /**
     * 根据menu的id，查询它的roles集合，用于getAllMenu方法
     * @param id
     * @return
     */
    @Select("SELECT\n" +
            "  r.id AS rid,\n" +
            "r.name AS rname,\n" +
            "r.nameZh AS rnamezh\n" +
            "FROM\n" +
            "menu m\n" +
            "LEFT JOIN menu_role mr ON m.id = mr.mid\n" +
            "LEFT JOIN role r ON mr.rid = r.id\n" +
            "WHERE\n" +
            "m.enabled = TRUE and m.id= #{id} order by rid asc")
    @Results({
            @Result(property = "id",column = "rid"),
            @Result(property = "name",column = "rname"),
            @Result(property = "nameZh",column = "rnamezh")
    })
    List<Role> getRolesByMenuId(@Param("id") Integer id);

    /**
     * 根据menu的id，查询它的keepAlive和requireAuth属性，返回一个MenuMeta对象，用于getAllMenu方法
     * @param id
     * @return MenuMeta对象
     */
    @Select("SELECT keepAlive,requireAuth from menu where id = #{id}")
    MenuMeta getMetaByMenuId(@Param("id") Integer id);
}
