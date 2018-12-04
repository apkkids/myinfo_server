package com.apkkids.myinfo_server.controller.system;

import com.apkkids.myinfo_server.bean.RespBean;
import com.apkkids.myinfo_server.bean.Role;
import com.apkkids.myinfo_server.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 系统基础信息的Controller
 */
@RestController
@RequestMapping("/system/basic")
public class SystemBasicController {
    @Autowired
    RoleMapper mapper;
    /**
     * 返回系统中所有角色
     * @return
     */
    @RequestMapping(value = "/roles", method = RequestMethod.GET)
    public List<Role> getAllRoles(){
        List<Role> list =mapper.getAllRoles();
        return list;
    }
}
