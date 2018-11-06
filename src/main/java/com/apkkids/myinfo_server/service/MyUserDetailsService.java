package com.apkkids.myinfo_server.service;

import com.apkkids.myinfo_server.bean.MyUserBean;
import com.apkkids.myinfo_server.bean.SysuserBean;
import com.apkkids.myinfo_server.mapper.MyUserMapper;
import com.apkkids.myinfo_server.mapper.SysuserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Created by wxb on 2018/10/23 0023.
 * UserDetailsService的实现类，用于在程序中引入一个自定义的AuthenticationProvider，实现数据库访问模式的验证
 *
 */
@Service
public class MyUserDetailsService implements UserDetailsService {
    @Autowired
    MyUserMapper mapper;
    @Autowired
    SysuserMapper sysuserMapper;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysuserBean bean = sysuserMapper.selectByUsername(username);
        if (bean == null) {
            throw new UsernameNotFoundException("数据库中无此用户！");
        }
        return bean;
    }
}
