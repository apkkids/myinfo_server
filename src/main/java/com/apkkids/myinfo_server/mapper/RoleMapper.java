package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.Role;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface RoleMapper {
    List<Role> getAllRoles();
}
