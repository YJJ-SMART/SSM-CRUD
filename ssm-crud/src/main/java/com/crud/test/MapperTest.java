package com.crud.test;

import com.crud.bean.Department;
import com.crud.bean.Employee;
import com.crud.dao.DepartmentMapper;
import com.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/*
        1、导入SpringTest模块
        2、@ContextConfiguration指定Spring配置文件的位置
        3、直接autowired使用的组件即可
            */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired//按类型自动注入
      DepartmentMapper departmentMapper;
    @Autowired
      EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
       public  void testCrud(){
          //System.out.print(departmentMapper);
          /*插入几个部门*/
        new Department();
        new Employee();
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"IT部"));
        /*插入员工*/
    //    employeeMapper.insertSelective(new Employee(null,"Jerry","男","Jerry@qq.com",1));
       EmployeeMapper mapper= sqlSession.getMapper(EmployeeMapper.class);
        for (int i=0; i<50;i++){
            String uid= UUID.randomUUID().toString().substring(0,4);
              mapper.insertSelective(new Employee(null,uid,"男",uid+"@qq.com",1));
        }
    }
}
