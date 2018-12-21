package com.apkkids.myinfo_server.controller.salary;

import com.apkkids.myinfo_server.bean.Employee;
import com.apkkids.myinfo_server.bean.RespBean;
import com.apkkids.myinfo_server.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:      wxb
 * Project:     myinfo_server
 * Create Date: 2018/12/21
 * Create Time: 9:22
 * Description:
 */
@RestController
@RequestMapping("/salary/sobcfg")
public class SalaryEmpController {
    @Autowired
    EmployeeMapper employeeMapper;

    @RequestMapping(value = "/emp", method = RequestMethod.GET)
    public Map<String, Object> getEmployeeByPage(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        int start = (page - 1) * size;
        List<Employee> employeeList = employeeMapper.getEmployeeWithSalary(start, size);
        Long count = employeeMapper.getCountByKeywords("", null, null, null, null, null, null, null, null);
        Map<String, Object> map = new HashMap<>();
        map.put("emps", employeeList);
        map.put("count", count);
        return map;
    }

    @RequestMapping(value = "/updateCfg", method = RequestMethod.PUT)
    public RespBean updateSalaryEmp(Integer eid, Integer sid) {
        if (employeeMapper.getSalaryEmpCount(eid) == 0) {
            if (employeeMapper.addSalaryEmp(eid, sid) == 1) {
                return RespBean.ok("更新员工工资套账成功");
            }
        } else if (employeeMapper.updateSalaryEmp(eid, sid) == 1) {
            return RespBean.ok("更新员工工资套账成功");
        }
        return RespBean.error("更新员工工资账套失败");
    }
}

