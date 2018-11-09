package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * Employee的Mapper接口
 */
@Component
@Mapper
public interface EmployeeMapper {
    /**
     * 多条件分页查询
     * @param start  数据游标起始位置
     * @param size   要查询的数据量
     * @param keywords
     * @param politicId
     * @param nationId
     * @param posId
     * @param jobLevelId
     * @param engageForm
     * @param departmentId
     * @param startBeginDate
     * @param endBeginDate
     * @return
     */
    List<Employee> getEmployeeByPage(@Param("start") Integer start, @Param("size") Integer size,@Param("nationId") Long nationId,
                                     @Param("posId") Integer posId);
//            ,
//                                     @Param("keywords") String keywords, @Param("politicId") Long politicId,
//                                     @Param("nationId") Long nationId, @Param("posId") Long posId, @Param("jobLevelId") Long jobLevelId,
//                                     @Param("engageForm") String engageForm, @Param("departmentId")Long  departmentId, @Param("startBeginDate") Date startBeginDate,
//                                     @Param("endBeginDate") Date endBeginDate);

}
