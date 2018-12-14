package com.apkkids.myinfo_server.controller.system;

import com.apkkids.myinfo_server.bean.*;
import com.apkkids.myinfo_server.mapper.DepartmentMapper;
import com.apkkids.myinfo_server.mapper.JobLevelMapper;
import com.apkkids.myinfo_server.mapper.PositionMapper;
import com.apkkids.myinfo_server.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;
import java.util.Date;
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
    @Autowired
    PositionMapper positionMapper;
    @Autowired
    JobLevelMapper jobLevelMapper;

    /**
     * 返回系统中所有角色
     *
     * @return
     */
    @RequestMapping(value = "/roles", method = RequestMethod.GET)
    public List<Role> getAllRoles() {
        List<Role> list = mapper.getAllRoles();
        return list;
    }

    @RequestMapping(value = "/dep/{pid}", method = RequestMethod.GET)
    public List<Department> getDepByPid(@PathVariable Long pid) {
        List<Department> departments = departmentMapper.getDepByPid(pid);
        return departments;
    }

    @RequestMapping(value = "/dep", method = RequestMethod.PUT)
    public RespBean addDep(Department dep) {
        departmentMapper.addDep(dep);
        departmentMapper.setIsParent(dep.getParentId());
        List<Department> departments = departmentMapper.getDepByPid(dep.getParentId());
        for (Department department : departments) {
            if (department.getDepPath().equals(dep.getDepPath())) {
                departmentMapper.setDepPath(department.getId(), department.getDepPath() + "." + department.getId());
                break;
            }
        }
        return RespBean.ok("添加部门成功");
    }

    @RequestMapping(value = "/dep/{did}", method = RequestMethod.DELETE)
    public RespBean deleteDep(@PathVariable Long did) {
        departmentMapper.deleteDep(did);
        return RespBean.ok("删除部门成功");
    }

    @RequestMapping(value = "/pos/getAll", method = RequestMethod.GET)
    public List<Position> getAllPositions() {
        return positionMapper.getAllPositions();
    }

    @RequestMapping(value = "/pos/add", method = RequestMethod.PUT)
    public RespBean addPosition(Position pos) {
        pos.setCreateDate(new Timestamp(new Date().getTime()));
        Long result = positionMapper.addPosition(pos);
        if (result == 1) {
            return RespBean.ok("add Position success.");
        }
        return RespBean.error("add Position failed.");
    }

    @RequestMapping(value = "/pos/{ids}", method = RequestMethod.DELETE)
    public RespBean deletePosition(@PathVariable("ids") String ids) {
        String[] split = ids.split(",");
//        if (positionMapper.deletePosition(did) == 1)
        positionMapper.deletePositionById(split);
        return RespBean.ok("删除职位成功");
    }

    @RequestMapping(value = "/pos", method = RequestMethod.PUT)
    public RespBean updatePos(Position pos) {
        if (positionMapper.updatePos(pos) == 1) {
            return RespBean.ok("修改职位成功");
        }
        return RespBean.error("修改职位失败");
    }

    //JobLevel request
    @RequestMapping(value = "/jobLevel/getAll", method = RequestMethod.GET)
    public List<JobLevel> getAllJobLevels() {
        return jobLevelMapper.getAllJobLevels();
    }

    @RequestMapping(value = "/jobLevel", method = RequestMethod.POST)
    public RespBean addJobLevel(JobLevel jobLevel) {
        if (jobLevelMapper.addJobLevel(jobLevel) == 1) {
            return RespBean.ok("添加职称成功");
        }
        return RespBean.error("添加职称失败");
    }

    @RequestMapping(value = "/jobLevel", method = RequestMethod.PUT)
    public RespBean updateJobLevel(JobLevel jobLevel) {
        if (jobLevelMapper.updateJobLevel(jobLevel) == 1) {
            return RespBean.ok("更新职称成功");
        }
        return RespBean.error("更新职称失败");
    }

    @RequestMapping(value = "/jobLevel/{ids}", method = RequestMethod.DELETE)
    public RespBean deleteJobLevelById(@PathVariable("ids") String ids) {
        String[] split = ids.split(",");
        jobLevelMapper.deleteJobLevelById(split);
        return RespBean.ok("删除职称成功");
    }
}