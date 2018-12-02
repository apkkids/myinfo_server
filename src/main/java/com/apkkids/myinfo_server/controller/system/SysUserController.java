package com.apkkids.myinfo_server.controller.system;

import com.apkkids.myinfo_server.bean.SysUser;
import com.apkkids.myinfo_server.mapper.SysUserMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by wxb on 2018/12/2 0002.
 * 管理员的Controller
 */
@RestController
@RequestMapping("/system/sysuser")
public class SysUserController {
    @Autowired
    SysUserMapper mapper;
    @RequestMapping("/{keywords}")
    List<SysUser> getUsersByKeywords(@PathVariable(required = false) String keywords){
        List<SysUser> sysUserList = mapper.getUsersByKeywords(keywords);
        return sysUserList;
    }
}
