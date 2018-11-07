package com.apkkids.myinfo_server.controller;

import com.apkkids.myinfo_server.bean.RespBean;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 * Author:      wxb
 * Project:     myinfo_server
 * Create Date: 2018/11/7
 * Create Time: 21:02
 * Description:
 */
@RestController
public class LoginController {
    @RequestMapping("/login_p")
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public RespBean login() {
        return RespBean.error("尚未登录，请登录!");
    }
}
