package com.apkkids.myinfo_server.controller.system;

import com.apkkids.myinfo_server.bean.*;
import com.apkkids.myinfo_server.mapper.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统基础信息的Controller
 */
@RestController
@RequestMapping("/system/basic")
public class SystemBasicController {
    @Autowired
    RoleMapper mapper;
    @Autowired
    MenuMapper menuMapper;
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    PositionMapper positionMapper;
    @Autowired
    JobLevelMapper jobLevelMapper;
    @Autowired
    MenuRoleMapper menuRoleMapper;

    // Role request
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

    @RequestMapping(value = "/role/{did}",method = RequestMethod.DELETE)
    public RespBean deleteRoleById(@PathVariable("did") Long did){
        if (mapper.deleteRoleById(String.valueOf(did)) == 1) {
            return RespBean.ok("删除角色成功");
        }
        return RespBean.error("删除角色失败");
    }

    @RequestMapping(value = "/role", method = RequestMethod.POST)
    public RespBean addRole(Role role) {
        if (mapper.addRole(role) == 1) {
            return RespBean.ok("添加角色成功");
        }
        return RespBean.error("添加角色失败");
    }

    /**
     * 更新角色权限表menu_role
     * @param rid 角色id
     * @param mids 角色对应的menu表中的id集合
     * @return
     */
    @RequestMapping(value = "/role", method = RequestMethod.PUT)
    public RespBean updateMenuRoleByRid(Long rid,  Long[] mids){
        //首先删除这个角色所有权限，再讲mids中所有的权限加入
        menuRoleMapper.deleteMenuByRid(rid);
        menuRoleMapper.addMenu(rid, mids);
        return RespBean.ok("更新角色权限成功");
    }

    @RequestMapping(value = "/dep/{pid}", method = RequestMethod.GET)
    public List<Department> getDepByPid(@PathVariable Long pid) {
        List<Department> departments = departmentMapper.getDepByPid(pid);
        return departments;
    }

    /**
     * 将某个角色id需要的权限组装成一个map返回给前端
     * @param rid
     * @return
     */
    @RequestMapping(value = "/menuTree/{rid}", method = RequestMethod.GET)
    public Map<String, Object> menuTree(@PathVariable("rid") Long rid) {
        Map<String, Object> map = new HashMap<>();
        List<Menu> menus = menuMapper.menuTree();
        List<Long> mids = menuMapper.getMenusByRid(rid);
        map.put("menus", menus);
        map.put("mids", mids);
        return map;
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