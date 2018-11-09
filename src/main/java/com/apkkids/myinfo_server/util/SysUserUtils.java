package com.apkkids.myinfo_server.util;

import com.apkkids.myinfo_server.bean.SysUser;
import org.springframework.security.core.context.SecurityContextHolder;

public class SysUserUtils {
    /**
     * 从SecurityContextHolder中得到当前登录用户
     * @return
     */
    public static SysUser getCurrentSysUser(){
        return (SysUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
