package com.apkkids.myinfo_server.controller;

import com.apkkids.myinfo_server.bean.Menu;
import com.apkkids.myinfo_server.mapper.MenuMapper;
import com.apkkids.myinfo_server.util.SysUserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 配置信息获取Controller
 */
@RestController
@RequestMapping("/config")
public class ConfigController {
    @Autowired
    MenuMapper menuMapper;

    /**
     * 获取当前登录用户对应的菜单
     * @return
     */
    @RequestMapping("/sysmenu")
    public List<Menu> sysmenu(){
        List<Menu> list = menuMapper.getMenusBySysUserId(SysUserUtils.getCurrentSysUser().getId());
        return list;
    }
}
