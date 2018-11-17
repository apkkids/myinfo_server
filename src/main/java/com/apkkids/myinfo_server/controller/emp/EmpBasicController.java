package com.apkkids.myinfo_server.controller.emp;

import com.apkkids.myinfo_server.bean.*;
import com.apkkids.myinfo_server.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wxb on 2018/11/17 0017.
 * 响应对数据库Employee的请求
 */
@RestController
@RequestMapping("/employee/basic")
public class EmpBasicController {
    @Autowired
    EmployeeMapper mapper;
    /**
     * 返回与Employee相关的基础数据字典表，例如国家、民族等
     * @return
     */
    @RequestMapping(value = "/basicdata" , method = RequestMethod.GET)
    public Map<String,Object> getAllNations(){
        Map<String, Object> map = new HashMap<>();
        List<Nation> nationList = mapper.getAllNations();
        List<Position> positionList = mapper.getAllPosition();
        List<JobLevel> jobLevelList = mapper.getAllJobLevel();
        List<PoliticsStatus> politicsStatusList = mapper.getAllPoliticsStatus();
        List<Department> departmentList = mapper.getAllDepartment();
        // 此处的名字要与前端的名字一致
        map.put("nations", nationList);
        map.put("positions", positionList);
        map.put("joblevels", jobLevelList);
        map.put("politics", politicsStatusList);
        map.put("deps", departmentList);
        return map;
    }
}
