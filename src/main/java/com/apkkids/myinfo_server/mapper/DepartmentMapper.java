package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.Department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface DepartmentMapper {
    void addDep(@Param("dep") Department department);

    void deleteDep(@Param("did") Long did);

    List<Department> getDepByPid(Long pid);

    List<Department> getAllDeps();
}
