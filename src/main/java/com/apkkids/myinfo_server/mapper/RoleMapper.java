package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.JobLevel;
import com.apkkids.myinfo_server.bean.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface RoleMapper {
    List<Role> getAllRoles();

    int deleteRoleById(@Param("id") String id);

    int addRole (@Param("role") Role role);

    int updateRole (@Param("role") Role role);
}
