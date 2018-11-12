package com.apkkids.myinfo_server.controller;

import com.apkkids.myinfo_server.bean.Salary;
import com.apkkids.myinfo_server.mapper.SalaryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Salary Controller , get web request, and operate the database table salary.
 */
@RestController
@RequestMapping("/salary/sob")
public class SalaryController {
    @Autowired
    SalaryMapper mapper;

    @RequestMapping(value = "/salary", method = RequestMethod.GET)
    List<Salary> getAllSalary() {
        return mapper.getAllSalary();
    }
}
