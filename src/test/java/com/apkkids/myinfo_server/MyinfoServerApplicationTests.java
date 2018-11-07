package com.apkkids.myinfo_server;

import com.apkkids.myinfo_server.bean.Role;
import com.apkkids.myinfo_server.bean.SysuserBean;
import com.apkkids.myinfo_server.mapper.SysuserMapper;
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
    SysuserMapper mapper;

    @Test
    public void contextLoads() {
    }

    @Test
    public void testSysuserMapper() {
        SysuserBean bean = mapper.selectByUsername("admin");
        if (bean == null) {
            throw new UsernameNotFoundException("数据库中无此用户！");
        }
        System.out.println("username=" + bean.getUsername());

        bean = mapper.selectUserWithRolesByUsername("admin");
        if (bean == null) {
            throw new UsernameNotFoundException("数据库中无此用户！");
        }
        System.out.println("username=" + bean.getUsername());


        List<Role> roles = bean.getRoles();
//        List<Role> roles = mapper.queryRoleBySysuserid(3);
        for (Role r : roles) {
            System.out.println(r.getNameZh());
        }
    }
}
