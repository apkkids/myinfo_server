package com.apkkids.myinfo_server.controller.system;

import com.apkkids.myinfo_server.bean.Department;
import com.apkkids.myinfo_server.bean.RespBean;
import com.apkkids.myinfo_server.bean.Role;
import com.apkkids.myinfo_server.mapper.DepartmentMapper;
import com.apkkids.myinfo_server.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
    @Autowired
    DepartmentMapper departmentMapper;
    /**
     * 返回系统中所有角色
     * @return
     */
    @RequestMapping(value = "/roles", method = RequestMethod.GET)
    public List<Role> getAllRoles(){
        List<Role> list =mapper.getAllRoles();
        return list;
    }

    @RequestMapping(value = "/dep/{pid}", method = RequestMethod.GET)
    public List<Department> getDepByPid(@PathVariable Long pid) {
        List<Department> departments = departmentMapper.getDepByPid(pid);
        return departments;
    }

    @RequestMapping(value = "/dep", method = RequestMethod.PUT)
    public RespBean addDep( Department dep){
        departmentMapper.addDep(dep);
        return RespBean.ok("添加部门成功");
    }

    @RequestMapping(value = "/dep/{did}", method = RequestMethod.DELETE)
    public RespBean deleteDep(@PathVariable Long did) {
        departmentMapper.deleteDep(did);
        return RespBean.ok("删除部门成功");
    }
}
