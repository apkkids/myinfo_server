package com.apkkids.myinfo_server;

import com.apkkids.myinfo_server.bean.*;
import com.apkkids.myinfo_server.mapper.EmployeeMapper;
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
    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void contextLoads() {
    }

    @Test
    public void testSysuserMapper() {
        List<SysUser> list = mapper.getAllSysUser(null);
        for (SysUser user : list) {
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
        List<Menu> menuList = menuMapper.getAllMenu();
        if (menuList == null) {
            System.out.println("数据库中无此menu");
        }
        for (Menu menu : menuList) {
            System.out.println("========Menu["+menu.getName()+"]===========");
            System.out.println(menu.getName() + "," + menu.getUrl() + ", " + menu.getComponent());
            System.out.println("--------roles--------");
            List<Role> roles = menu.getRoles();
            if (roles != null && roles.size() > 1) {
                for (Role r : roles) {
                    System.out.println(r.getId() + ", " + r.getName() + ", " + r.getNameZh());
                }
            }
            System.out.println("--------MenuMeta--------");
            MenuMeta memuMeta = menu.getMeta();
            if (memuMeta != null) {
                System.out.println(memuMeta.isKeepAlive() + "," + memuMeta.isRequireAuth());
            }
        }
    }

    @Test
    public void testMenuMapperBySysUserId() {
        //id=3 , admin
        List<Menu> list = menuMapper.getMenusBySysUserId(3);
        if (list == null) {
            throw new RuntimeException("数据库中无此menu");
        }
        for (Menu menu : list        ) {
            System.out.println("========Menu["+menu.getName()+"]===========");
            System.out.println(menu.getName() + "," + menu.getUrl() + ", " + menu.getComponent());
            System.out.println("--------roles--------");
            List<Role> roles = menu.getRoles();
            if (roles != null && roles.size() > 1) {
                for (Role r : roles) {
                    System.out.println(r.getId() + ", " + r.getName() + ", " + r.getNameZh());
                }
            }
            System.out.println("--------MenuMeta--------");
            MenuMeta memuMeta = menu.getMeta();
            if (memuMeta != null) {
                System.out.println(memuMeta.isKeepAlive() + "," + memuMeta.isRequireAuth());
            }
            System.out.println("--------Children--------");
            List<Menu> children = menu.getChildren();
            for (Menu m : children) {
                System.out.println(m.getName() + "," + m.getComponent());
            }
        }
    }

    @Test
    public void testEmployeeMapper(){
        List<Employee> list = employeeMapper.getEmployeeByPage(0, 5,null,null,null,null,null);
        for (Employee e : list) {
            System.out.println("========Employee["+e.getName()+"]===========");
            System.out.println(e.getId()+","+e.getName()+","+e.getAddress()+","+e.getGender());
            System.out.println(e.getNation());
            System.out.println(e.getPosition());
            System.out.println(e.getDepartment());
            System.out.println(e.getJobLevel());
            System.out.println(e.getPoliticsStatus());
        }
    }
}
