package com.apkkids.myinfo_server.controller;

import com.apkkids.myinfo_server.bean.RespBean;
import com.apkkids.myinfo_server.bean.Salary;
import com.apkkids.myinfo_server.mapper.SalaryMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

/**
 * Salary Controller , get web request, and operate the database table salary.
 */
@RestController
@RequestMapping("/salary/sob")
public class SalaryController {
    @Autowired
    SalaryMapper mapper;

    /**
     * 获取数据库中所有的Salary
     * @return salary列表
     */
    @RequestMapping(value = "/salary", method = RequestMethod.GET)
    public List<Salary> getAllSalary() {
        return mapper.getAllSalary();
    }

    /**
     * 加入一个Salary到数据库
     * @param salary
     * @return
     */
    @RequestMapping(value = "/salary", method = RequestMethod.POST)
    public RespBean addSalary(Salary salary) {
        int result = mapper.addSalary(salary);
        if (result == 1) {
            return RespBean.ok("添加Salary成功");
        }
        return RespBean.error("添加Salary失败");
    }

    /**
     * 修改数据库中的一个Salary，以id作为where条件
     * @param salary
     * @return
     */
    @RequestMapping(value = "/salary", method = RequestMethod.PUT)
   public RespBean updateSalary(Salary salary) {
        int result = mapper.updateSalary(salary);
        if (result == 1) {
            return RespBean.ok("修改Salary成功");
        }
        return RespBean.error("修改Salary失败");
    }

    @RequestMapping(value = "/salary/{ids}", method = RequestMethod.DELETE)
    public RespBean deleteSalary(@PathVariable String ids) {
        String[] split = ids.split(",");
        if (mapper.deleteSalary(split) > 0) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }
}
