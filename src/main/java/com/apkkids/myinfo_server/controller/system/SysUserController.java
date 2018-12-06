package com.apkkids.myinfo_server.controller.system;

import com.apkkids.myinfo_server.bean.RespBean;
import com.apkkids.myinfo_server.bean.SysUser;
import com.apkkids.myinfo_server.mapper.SysUserMapper;
import com.apkkids.myinfo_server.util.GeneratePassword;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    List<SysUser> getUsersByKeywords(@PathVariable(required = false) String keywords) {
        List<SysUser> sysUserList = mapper.getUsersByKeywords(keywords);
        return sysUserList;
    }

    @RequestMapping(value = "/roles", method = RequestMethod.PUT)
    RespBean updateRoles(Long currentId, Long[] rids) {
        mapper.deleteRoleByUserId(currentId);
        int result = mapper.addRolesForSysUser(currentId, rids);
        if (result == rids.length) {
            return RespBean.ok("success");
        }
        return RespBean.error("更新用户角色失败");
    }

    @RequestMapping("/id/{id}")
    SysUser getSysUserById(@PathVariable Long id) {
        SysUser sysUser = mapper.getSysUserById(id);
        return sysUser;
    }

    @RequestMapping("/del/{id}")
    RespBean delSysUserById(@PathVariable Long id) {
        int result = mapper.deleteUserById(id);
        if (result == 1) {
            mapper.deleteRoleByUserId(id);
            return RespBean.ok("删除管理员成功");
        }
        return RespBean.error("删除管理员失败");
    }

    @RequestMapping(value = "/add", method = RequestMethod.PUT)
    RespBean addSysUser(SysUser user) {
        user.setPassword(GeneratePassword.generatePassword(user.getPassword()));
        int result = mapper.addSysUser(user);
        if (result == 1) {
            return RespBean.ok("添加管理员成功");
        }
        return RespBean.error("添加管理员失败");
    }
}
