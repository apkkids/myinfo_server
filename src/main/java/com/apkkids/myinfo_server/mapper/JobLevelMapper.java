package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.JobLevel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface JobLevelMapper {
    public List<JobLevel> getAllJobLevels();

    public Long deleteJobLevelById(@Param("ids") String[] ids);

    public Long addJobLevel(@Param("jobLevel") JobLevel jobLevel);

    int updateJobLevel(@Param("jobLevel") JobLevel jobLevel);
}
