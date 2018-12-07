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
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;

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

    @RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
    RespBean getUploadImage(MultipartFile file) {
        if (Objects.isNull(file) || file.isEmpty()) {
            return RespBean.ok("文件为空，请重新上传");
        }

        try {
            byte[] bytes = file.getBytes();
            // 这里需要重新考虑将图片写入一个web服务器中，而不是本后台程序的目录下
            String filePath = new File(".").getCanonicalPath() + "/src/main/resources/static/pics/";
            Path path = Paths.get(filePath + file.getOriginalFilename());
            //如果没有files文件夹，则创建
            if (!Files.isWritable(path)) {
//                Files.createDirectories(Paths.get(filePath));
            }
            //文件写入指定路径
//            Files.write(path, bytes);
            return RespBean.ok("用户头像上传成功");
        } catch (IOException e) {
            e.printStackTrace();
            return RespBean.ok("用户头像上传失败");
        }
    }
}
