package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.Salary;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by wxb on 2018/11/10 0010.
 */
@Component
@Mapper
public interface SalaryMapper {
    List<Salary> getAllSalary();

    int addSalary(@Param("salary") Salary salary);
}
