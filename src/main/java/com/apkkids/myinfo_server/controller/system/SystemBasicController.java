package com.apkkids.myinfo_server.controller.system;

import com.apkkids.myinfo_server.bean.RespBean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 系统基础信息的Controller
 */
@RestController
@RequestMapping("/system/basic")
public class SystemBasicController {
    /**
     * 返回系统中所有角色
     * @return
     */
    @RequestMapping(value = "/roles", method = RequestMethod.GET)
    public RespBean getAllRoles(){
        return RespBean.ok("ok");
    }
}
