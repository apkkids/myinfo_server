package com.apkkids.myinfo_server;

import com.apkkids.myinfo_server.bean.Menu;
import com.apkkids.myinfo_server.bean.MenuMeta;
import com.apkkids.myinfo_server.bean.Role;
import com.apkkids.myinfo_server.bean.SysUser;
import com.apkkids.myinfo_server.mapper.MenuMapper;
import com.apkkids.myinfo_server.mapper.SysUserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MyinfoServerApplicationTests {
    @Autowired
    SysUserMapper mapper;
    @Autowired
    MenuMapper menuMapper;

    @Test
    public void contextLoads() {
    }

    @Test
    public void testSysuserMapper() {
        List<SysUser> list = mapper.getAllSysUser(null);
        for (SysUser user:list             ) {
            System.out.println(user.getName());
        }

        SysUser bean = mapper.loadUserByUsername("admin");
        if (bean == null) {
            throw new UsernameNotFoundException("数据库中无此用户！");
        }
        System.out.println("username=" + bean.getUsername());
        List<Role> roles = bean.getRoles();
        for (Role r : roles) {
            System.out.println(r.getNameZh());
        }
    }

    @Test
    public void testMenuMapper() {
        //测试getRolesByMenuId
//        List<Role> roles = menuMapper.getRolesByMenuId(7);
//        for (Role r:roles             ) {
//            System.out.println(r.getId()+", "+r.getName()+", "+r.getNameZh());
//        }

        List<Menu> menuList = menuMapper.getAllMenu();
        if (menuList == null) {
            System.out.println("数据库中无此menu");
        }
        for (Menu menu : menuList) {
            System.out.println(menu.getName() + "," + menu.getUrl() + ", " + menu.getComponent());
            System.out.println("=======roles=============");
            List<Role> roles = menu.getRoles();
            if (roles != null && roles.size() > 1) {
                for (Role r : roles) {
                    System.out.println(r.getId() + ", " + r.getName() + ", " + r.getNameZh());
                }
            }
            System.out.println("=======MenuMeta=============");
            MenuMeta memuMeta = menu.getMeta();
            if (memuMeta != null) {
                System.out.println(memuMeta.isKeepAlive() + "," + memuMeta.isRequireAuth());
            }
        }
    }
}
