package com.apkkids.myinfo_server;

import com.apkkids.myinfo_server.bean.*;
import com.apkkids.myinfo_server.common.PoiUtils;
import com.apkkids.myinfo_server.mapper.*;
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
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    PositionMapper positionMapper;
    @Autowired
    JobLevelMapper jobLevelMapper;

    @Test
    public void contextLoads() {
    }

    @Test
    public void testJobLevelMapper() {
        List<JobLevel> jobLevels = jobLevelMapper.getAllJobLevels();
        if (jobLevels.isEmpty()) {
            return;
        }
        for (JobLevel j : jobLevels) {
            System.out.println(j);
        }

        //add a new record
        JobLevel newOne = jobLevels.get(jobLevels.size() - 1);
        newOne.setName("testTitle");
        newOne.setTitleLevel("初级");
        newOne.setEnabled(false);
        Long result = jobLevelMapper.addJobLevel(newOne);
        assertEquals(result, Long.valueOf(1));

        //update this new one
        JobLevel thatOne = null;
        jobLevels = jobLevelMapper.getAllJobLevels();
        for (JobLevel j : jobLevels) {
            if (j.getName().equals("testTitle")) {
                thatOne = j;
                break;
            }
        }
        if (thatOne != null) {
            thatOne.setName("thatOne");
            thatOne.setTitleLevel("中级");
            thatOne.setEnabled(true);
            int rel = jobLevelMapper.updateJobLevel(thatOne);
            assertEquals(rel, 1);
        }

        // delete that one
        if (thatOne != null) {
            String[] ids = new String[1];
            ids[0] = String.valueOf(thatOne.getId());
            result = jobLevelMapper.deleteJobLevelById(ids);
            assertEquals(result, Long.valueOf(1));
        }
    }

    @Test
    public void testPositionMapper() {
        List<Position> positions = positionMapper.getAllPositions();
        for (Position pos : positions) {
            System.out.println(pos);
        }
    }

    @Test
    public void testDepartmentMapper() {
        List<Department> departments = departmentMapper.getAllDeps();
        for (Department dep : departments) {
            System.out.println(dep);
        }

        Department department = departments.get(1);
        department.setName("test");
        department.setDepPath("test");
        departmentMapper.addDep(department);
        departments = departmentMapper.getAllDeps();
        for (Department dep : departments) {
            System.out.println(dep);
        }

        departmentMapper.deleteDep(department.getId());
        departments = departmentMapper.getAllDeps();
        for (Department dep : departments) {
            System.out.println(dep);
        }
    }

    @Test
    public void testSysuserMapper() {
        SysUser sysUser = mapper.getSysUserById((long) 5);
        System.out.println(sysUser);

        System.out.println("========SysUser[addSysUser]===========");
        sysUser.setName("wwxxbb");
        sysUser.setName("wxb");
        sysUser.setPhone("1234567890");
        sysUser.setId((long) 100);
        sysUser.setRemark("test remark");
        int result = mapper.addSysUser(sysUser);
        System.out.println(result);

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

        System.out.println("========SysUser[deleteUserById]===========");
        mapper.deleteUserById((long) anotheradmin.getId());
        anotheradmin = mapper.selectByUsername("anotheradmin");
        if (anotheradmin == null) {
            System.out.println("删除成功");
        }

        System.out.println("========SysUser[getUsersByKeywords]===========");
        List<SysUser> users = mapper.getUsersByKeywords("李");
        for (SysUser user : users) {
            System.out.println(user);
        }

        System.out.println("========SysUser[updateSysUser]===========");
        SysUser zenggong = mapper.loadUserByUsername("zenggong");
        zenggong.setPhone("1122334");
        mapper.updateSysUser(zenggong);
        zenggong = mapper.loadUserByUsername("zenggong");
        assertEquals(zenggong.getPhone(), "1122334");

        System.out.println("========SysUser[addRolesForSysUser,deleteRoleByUserId]===========");
        mapper.sysUserReg("test", "test");
        SysUser tempUser = mapper.selectByUsername("test");
        mapper.addRolesForSysUser(tempUser.getId(), new Long[]{Long.valueOf(2), Long.valueOf(3), Long.valueOf(4)});
        result = mapper.deleteRoleByUserId(tempUser.getId());
        assertEquals(result, 3);
        result = mapper.deleteUserById(tempUser.getId());
        assertEquals(result, 1);

        System.out.println("========SysUser[getUsersByKeywords]===========");
        list = mapper.getUsersByKeywords("all");
        for (SysUser user : list) {
            System.out.println(user);
        }
    }

    @Test
    public void testMenuMapperMenuTree() {
        List<Menu> menuList = menuMapper.menuTree();
        for (Menu menu : menuList) {
            System.out.println(menu);
        }
        //
        List<Long> ids = menuMapper.getMenusByRid((long) 2);
        for (Long id:ids             ) {
            System.out.println(id);
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
        List<Menu> list = menuMapper.getMenusBySysUserId((long) 3);
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
                null, null, null, null);
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
    public void testEmployeeMapper_add() {
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

    @Test
    public void testEmployeeMapper_getEmployeeWithSalary()    {
        List<Employee> employeeList = employeeMapper.getEmployeeWithSalary(0, 10);
        for (Employee emp : employeeList) {
            System.out.println(emp);
        }
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
    public void testPoiUtils() {
        List<Employee> list = employeeMapper.getEmployeeByPage(0, 10, null, null, null, null, null,
                null, null, null, null);
        for (Employee emp : list) {
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

    @Autowired
    RoleMapper roleMapper;

    @Test
    public void testRoleMapper() {
        List<Role> roleList = roleMapper.getAllRoles();
        for (Role role : roleList) {
            System.out.println(role);
        }

        Role role = roleList.get(roleList.size() - 1);
        if (role != null) {
            role.setName("lasttest");
            role.setNameZh("测试角色最后");
            int result = roleMapper.addRole(role);
            assertEquals(result, 1);
        }

        roleList = roleMapper.getAllRoles();
        for (Role r : roleList) {
            if (r.getName().equals("lasttest")) {
                role = r;
                break;
            }
        }
        if (role != null) {
            role.setName("chageTest");
            role.setNameZh("测试角色改变");
            int result = roleMapper.updateRole(role);
            assertEquals(result, 1);
        }

        if (role != null) {
            int result = roleMapper.deleteRoleById(String.valueOf(role.getId()));
            assertEquals(result, 1);
        }
    }
}
