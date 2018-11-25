package com.apkkids.myinfo_server.controller.emp;

import com.apkkids.myinfo_server.bean.*;
import com.apkkids.myinfo_server.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wxb on 2018/11/17 0017.
 * 响应对数据库Employee的请求
 */
@RestController
@RequestMapping("/employee/basic")
public class EmpBasicController {
    @Autowired
    EmployeeMapper mapper;
    SimpleDateFormat birthdayFormat = new SimpleDateFormat("yyyy-MM-dd");

    /**
     * 返回与Employee相关的基础数据字典表，例如国家、民族等
     *
     * @return
     */
    @RequestMapping(value = "/basicdata", method = RequestMethod.GET)
    public Map<String, Object> getAllNations() {
        Map<String, Object> map = new HashMap<>();
        List<Nation> nationList = mapper.getAllNations();
        List<Position> positionList = mapper.getAllPosition();
        List<JobLevel> jobLevelList = mapper.getAllJobLevel();
        List<PoliticsStatus> politicsStatusList = mapper.getAllPoliticsStatus();
        List<Department> departmentList = mapper.getAllDepartment();
        // 此处的名字要与前端的名字一致
        map.put("nations", nationList);
        map.put("positions", positionList);
        map.put("joblevels", jobLevelList);
        map.put("politics", politicsStatusList);
        map.put("deps", departmentList);
        return map;
    }

    /**
     * 响应员工复杂查询，将员工列表装入emp，将员工数量装入count，返回一个Map
     * @param page
     * @param size
     * @param keywords
     * @param politicId
     * @param nationId
     * @param posId
     * @param jobLevelId
     * @param engageForm
     * @param departmentId
     * @param beginDateScope
     * @return
     */
    @RequestMapping(value = "/emp", method = RequestMethod.GET)
    public Map<String, Object> getEmployeeByPage(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(defaultValue = "") String keywords,
            Long politicId, Long nationId, Long posId,
            Long jobLevelId, String engageForm,
            Long departmentId, String beginDateScope) {
        Map<String, Object> map = new HashMap<>();

        int start = (page - 1) * size;
        Date startBeginDate = null;
        Date endBeginDate = null;
        if (beginDateScope != null && beginDateScope.contains(",")) {
            try {
                String[] split = beginDateScope.split(",");
                startBeginDate = birthdayFormat.parse(split[0]);
                endBeginDate = birthdayFormat.parse(split[1]);
            } catch (ParseException e) {
            }
        }

        List<Employee> employeeByPage = mapper.getEmployeeByPage(start, size, keywords, politicId, nationId, posId, jobLevelId, engageForm, departmentId, startBeginDate, endBeginDate);
        Long count = mapper.getCountByKeywords(keywords, politicId, nationId, posId, jobLevelId, engageForm, departmentId, startBeginDate, endBeginDate);
        map.put("emps", employeeByPage);
        map.put("count", count);
        return map;
    }

    /**
     * 删除员工
     * @param ids 一组id，使用逗号分开
     * @return
     */
    @RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
    public Long deleteEmp(@PathVariable String ids){
        String[] split = ids.split(",");
        return mapper.deleteEmpById(split);
    }

    /**
     * 添加一个employee
     * @param emp
     * @return
     */
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    public RespBean addEmp(Employee emp) {
        if (mapper.addEmp(emp) == 1){
            return RespBean.ok("添加用户成功");
        }
        return RespBean.error("添加用户失败");
    }

    @RequestMapping(value = "/emp", method = RequestMethod.PUT)
    public RespBean updateEmp(Employee emp){
        if (mapper.updateEmp(emp) == 1) {
            return RespBean.ok("更新用户成功");
        }
        return RespBean.error("更新用户失败");
    }
}