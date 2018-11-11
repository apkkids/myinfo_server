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

    Salary getSalaryById(@Param("id") Integer id);

    int addSalary(@Param("salary") Salary salary);

    int updateSalary(@Param("salary") Salary salary);

    /**
     * 删除一系列salary
     * @param ids 要删除的salary的id数组
     * @return
     */
    int deleteSalary(@Param("ids") String[] ids);
}
