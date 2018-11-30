package com.apkkids.myinfo_server;

import com.apkkids.myinfo_server.bean.*;
import com.apkkids.myinfo_server.common.PoiUtils;
import com.apkkids.myinfo_server.mapper.EmployeeMapper;
import com.apkkids.myinfo_server.mapper.MenuMapper;
import com.apkkids.myinfo_server.mapper.SalaryMapper;
import com.apkkids.myinfo_server.mapper.SysUserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MyinfoServerApplicationTests {
    @Autowired
    SysUserMapper mapper;
    @Autowired
    MenuMapper menuMapper;
    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void contextLoads() {
    }

    @Test
    public void testSysuserMapper() {
        List<SysUser> list = mapper.getAllSysUser((long) 3);
        for (SysUser user : list) {
            System.out.println(user.getName());
        }

        System.out.println("========SysUser[loadUserByUsername]===========");
        SysUser bean = mapper.loadUserByUsername("admin");
        if (bean == null) {
            throw new UsernameNotFoundException("数据库中无此用户！");
        }
        System.out.println("username=" + bean.getUsername());
        List<Role> roles = bean.getRoles();
        for (Role r : roles) {
            System.out.println(r.getNameZh());
        }

        System.out.println("========SysUser[getRolesByUserId]===========");
        roles = mapper.getRolesByUserId((long) 3);
        for (Role r : roles) {
            System.out.println(r.getNameZh());
        }

        System.out.println("========SysUser[sysUserReg]===========");
        mapper.sysUserReg("anotheradmin", "123456");
        SysUser anotheradmin = mapper.selectByUsername("anotheradmin");
        if (anotheradmin != null) {
            System.out.println(anotheradmin);
        }
    }

    @Test
    public void testMenuMapper() {
        List<Menu> menuList = menuMapper.getAllMenu();
        if (menuList == null) {
            System.out.println("数据库中无此menu");
        }
        for (Menu menu : menuList) {
            System.out.println("========Menu[" + menu.getName() + "]===========");
            System.out.println(menu.getName() + "," + menu.getUrl() + ", " + menu.getComponent());
            System.out.println("--------roles--------");
            List<Role> roles = menu.getRoles();
            if (roles != null && roles.size() > 1) {
                for (Role r : roles) {
                    System.out.println(r.getId() + ", " + r.getName() + ", " + r.getNameZh());
                }
            }
            System.out.println("--------MenuMeta--------");
            MenuMeta memuMeta = menu.getMeta();
            if (memuMeta != null) {
                System.out.println(memuMeta.isKeepAlive() + "," + memuMeta.isRequireAuth());
            }
        }
    }

    @Test
    public void testMenuMapperBySysUserId() {
        //id=3 , admin
        List<Menu> list = menuMapper.getMenusBySysUserId(3);
        if (list == null) {
            throw new RuntimeException("数据库中无此menu");
        }
        for (Menu menu : list) {
            System.out.println("========Menu[" + menu.getName() + "]===========");
            System.out.println(menu.getName() + "," + menu.getUrl() + ", " + menu.getComponent());
            System.out.println("--------roles--------");
            List<Role> roles = menu.getRoles();
            if (roles != null && roles.size() > 1) {
                for (Role r : roles) {
                    System.out.println(r.getId() + ", " + r.getName() + ", " + r.getNameZh());
                }
            }
            System.out.println("--------MenuMeta--------");
            MenuMeta memuMeta = menu.getMeta();
            if (memuMeta != null) {
                System.out.println(memuMeta.isKeepAlive() + "," + memuMeta.isRequireAuth());
            }
            System.out.println("--------Children--------");
            List<Menu> children = menu.getChildren();
            for (Menu m : children) {
                System.out.println(m.getName() + "," + m.getComponent());
            }
        }
    }

    @Test
    public void testEmployeeMapper() {
        List<Employee> list = employeeMapper.getEmployeeByPage(0, 5, null, null, null, null, null,
                null,null,null,null);
        for (Employee e : list) {
            System.out.println("========Employee[" + e.getName() + "]===========");
            System.out.println(e.getId() + "," + e.getName() + "," + e.getAddress() + "," + e.getGender());
            System.out.println(e.getNation());
            System.out.println(e.getPosition());
            System.out.println(e.getDepartment());
            System.out.println(e.getJobLevel());
            System.out.println(e.getPoliticsStatus());
        }
        System.out.println("--------Nation--------");
        List<Nation> nationList = employeeMapper.getAllNations();
        for (Nation nation : nationList) {
            System.out.println(nation);
        }
        System.out.println("--------Position--------");
        List<Position> positionList = employeeMapper.getAllPosition();
        for (Position position : positionList) {
            System.out.println(position);
        }
        System.out.println("--------JobLevel--------");
        List<JobLevel> jobLevelList = employeeMapper.getAllJobLevel();
        for (JobLevel jobLevel : jobLevelList) {
            System.out.println(jobLevel);
        }
        System.out.println("--------PoliticalStatus--------");
        List<PoliticsStatus> politicsStatusList = employeeMapper.getAllPoliticsStatus();
        for (PoliticsStatus politicsStatus : politicsStatusList) {
            System.out.println(politicsStatus);
        }
        System.out.println("--------Department--------");
        List<Department> departmentList = employeeMapper.getAllDepartment();
        for (Department department : departmentList) {
            System.out.println(department);
        }
    }

    @Test
    public void testEmployeeMapper_add(){
        Employee emp = new Employee();
        emp.setName("test");
        emp.setGender("男");
        emp.setBirthday(new Date());
        emp.setPoliticId((long) 1);
        emp.setNationId((long) 1);
        emp.setNativePlace("北京");
        emp.setEmail("wxb@163.com");
        emp.setAddress("beijing");
        emp.setPosId((long) 29);
        emp.setJobLevelId((long) 9);
        emp.setDepartmentId((long) 1);
        emp.setPhone("12324325425");
        emp.setWorkID("10001");
        emp.setTiptopDegree("博士");
        emp.setSchool("北京大学");
        emp.setSpecialty("jisuanji");
        emp.setBeginDate(new Date());
        emp.setConversionTime(new Date());
        emp.setBeginContract(new Date());
        emp.setEndContract(new Date());
        emp.setIdCard("10000121023103201");
        emp.setEngageForm("劳务合同");
        emp.setWedlock("已婚");
        Long result = employeeMapper.addEmp(emp);
        System.out.println(result);
    }

    @Autowired
    SalaryMapper salaryMapper;

    @Test
    public void testSalaryMapper() {
        //得到所有的Salary记录
        List<Salary> list = salaryMapper.getAllSalary();
        for (Salary s : list) {
            System.out.println(s);
        }

        //得到第一个Salary
        if (!list.isEmpty()) {
            Salary salary = salaryMapper.getSalaryById(list.get(0).getId());
            System.out.println("getSalaryById:" + salary);
        }

        //add a salary
        Salary salary = new Salary();
        salary.setBasicSalary(1000);
        salary.setBonus(2100);
        salary.setLunchSalary(210);
        salary.setTrafficSalary(213);
        salary.setPensionBase(3000);
        salary.setPensionPer(0.8f);
        salary.setName("test salary");
        int result = salaryMapper.addSalary(salary);
        assertEquals(result, 1);

        // update the newest salary
        list = salaryMapper.getAllSalary();
        salary = list.get(list.size() - 1);
        int id = salary.getId();
        salary.setName("test update");
        salary.setBonus(1);
//        salary.setId(Integer.MAX_VALUE - 10);
        result = salaryMapper.updateSalary(salary);
        assertEquals(result, 1);
        salary = salaryMapper.getSalaryById(id);
        assertEquals(salary.getName(), "test update");

        //delete the added salary
        String[] ids = new String[1];
        String stringid = String.valueOf(salary.getId());
        ids[0] = stringid;
        result = salaryMapper.deleteSalary(ids);
        assertEquals(result, 1);

    }

    @Test
    public void testPoiUtils(){
        List<Employee> list = employeeMapper.getEmployeeByPage(0, 10, null, null, null, null, null,
                null,null,null,null);
        for (Employee emp : list             ) {
            System.out.println(emp);
        }
        ResponseEntity<byte[]> entity = PoiUtils.exportEmp2Excel(list);
        byte[] outBytes = entity.getBody();
        try {
            //得到当前目录下名为emps.xls文件的路径
            String outputfile = new File(".").getCanonicalPath() + File.separator + "emps.xls";
            System.out.println(outputfile);
            FileOutputStream fos = new FileOutputStream(outputfile);
            fos.write(outBytes, 0, outBytes.length);
            fos.flush();
            fos.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
