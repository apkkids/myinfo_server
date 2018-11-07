package com.apkkids.myinfo_server.config;

import com.apkkids.myinfo_server.bean.Menu;
import com.apkkids.myinfo_server.bean.Role;
import com.apkkids.myinfo_server.mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import java.util.Collection;
import java.util.List;

/**
 * Created by wxb on 2018/10/26 0026.
 * 自定义的元数据源类，用来提供鉴权过程中，访问资源所需的角色.
 * 此处是从数据库menu、menu_role、role三个表中取出资源所需的角色
 */
@Component
public class MySecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
    @Autowired
    MenuMapper menuMapper;
    //本方法返回访问资源所需的角色集合
    AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        //从object中得到需要访问的资源，即网址
        String requestUrl = ((FilterInvocation) object).getRequestUrl();
        //从数据库中得到所有资源的url，以及对应的角色
        List<Menu> menuList = menuMapper.getAllMenu();
        for (Menu menu : menuList) {
            //首先进行地址匹配，匹配成功的将menu中取出的roles列表组成一个ConfigAttribut列表返回
            if (antPathMatcher.match(menu.getUrl(), requestUrl) && menu.getRoles().size() > 0) {
                List<Role> roles = menu.getRoles();
                int size = roles.size();
                String[] values = new String[size];
                for (int i = 0; i < size; i++) {
                    values[i] = roles.get(i).getName();
                }
                return SecurityConfig.createList(values);
            }
        }
        //匹配不成功返回一个特殊的ROLE_NONE
        return SecurityConfig.createList("ROLE_NONE");
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return FilterInvocation.class.isAssignableFrom(clazz);
    }
}
