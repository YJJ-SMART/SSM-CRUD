package com.crud.service;

import com.crud.bean.Employee;
import com.crud.bean.EmployeeExample;
import com.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    /*
    * 查询所员工数据（有分页查询）
    * */
    public List<Employee> getAll(){
        return  employeeMapper.selectByExampleWithDept(null);
    }
    /*
    * 插入员工信息
    * */
    public void saveEmps(Employee employee) {
        employeeMapper.insertSelective(employee);
    }
    /*
    *
    * 校验用户名是否重复
    * */
    public boolean checkName(String empName) {
           EmployeeExample employeeExample=new EmployeeExample();
           EmployeeExample.Criteria criteria= employeeExample.createCriteria();
           criteria.andEmpNameEqualTo(empName);
          long reults= employeeMapper.countByExample(employeeExample);
          return reults==0;  //如果是true的则可以添加
    }

    public Employee getEmps(int id) {
        Employee employee=employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);//有哪个数据就更新那个数据
    }

    public void deleteByline(int id) {
          employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> emps_id) {
        EmployeeExample employeeExample=new EmployeeExample();
        EmployeeExample.Criteria criteria=employeeExample.createCriteria();
        //delete from xxx where emp_id in(1、2、3、4）
        criteria.andEmpIdIn(emps_id);
        employeeMapper.deleteByExample(employeeExample);
    }
}
