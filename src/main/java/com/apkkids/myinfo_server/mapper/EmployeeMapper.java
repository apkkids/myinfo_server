package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;
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
    List<Employee> getEmployeeByPage(@Param("start") Integer start, @Param("size") Integer size, @Param("keywords") String keywords,
                                     @Param("politicId") Long politicId, @Param("nationId") Long nationId, @Param("posId") Long posId,
                                     @Param("jobLevelId") Long jobLevelId, @Param("engageForm") String engageForm, @Param("departmentId")Long  departmentId,
                                     @Param("startBeginDate") Date startBeginDate, @Param("endBeginDate") Date endBeginDate);

    /**
     * 返回所有符合条件的条目数量
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
    Long getCountByKeywords(@Param("keywords") String keywords,
                            @Param("politicId") Long politicId, @Param("nationId") Long nationId, @Param("posId") Long posId,
                            @Param("jobLevelId") Long jobLevelId, @Param("engageForm") String engageForm, @Param("departmentId")Long  departmentId,
                            @Param("startBeginDate") Date startBeginDate, @Param("endBeginDate") Date endBeginDate);

    /**
     * 查询emp以及工资套账
     * @param start
     * @param size
     * @return
     */
    List<Employee> getEmployeeWithSalary(@Param("start") Integer start, @Param("size") Integer size);

    /**
     * 更新员工工资套账
     * @param eid 员工id
     * @param sid 工资账套id
     * @return
     */
    Integer updateSalaryEmp(@Param("eid") Integer eid, @Param("sid") Integer sid);

    /**
     * 查询有账套的员工
     * @param eid
     * @return
     */
    Integer getSalaryEmpCount(@Param("eid") Integer eid);

    /**
     * 增加员工工资套账
     * @param eid
     * @param sid
     * @return
     */
    Integer addSalaryEmp(@Param("eid") Integer eid, @Param("sid") Integer sid);

    /**
     * 返回所有Nation字典表内容
     * @return
     */
    List<Nation> getAllNations();
    List<Position> getAllPosition();
    List<JobLevel> getAllJobLevel();
    List<PoliticsStatus> getAllPoliticsStatus();
    List<Department> getAllDepartment();

    /**
     * 删除员工
     * @param ids
     * @return
     */
    Long deleteEmpById(@Param("ids") String[] ids);

    /**
     * 增加员工
     * @param emp
     * @return
     */
    Long addEmp(@Param("emp") Employee emp);

    /**
     * 增加多个员工
     * @param emps
     * @return
     */
    Long addEmps(@Param("emps") List<Employee> emps);

    Long updateEmp(@Param("emp") Employee emp);
}
