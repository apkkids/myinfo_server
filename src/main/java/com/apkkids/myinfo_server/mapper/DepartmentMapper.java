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

    /**
     * 将id代表的Department的IsParent属性设置为1
     * @param id
     */
    void setIsParent(Long id);

    /**
     * 将id代表的Department的depPath属性设置为参数值
     * @param id
     * @param depPath
     */
    void setDepPath(@Param("id") Long id, @Param("depPath") String depPath);
}
