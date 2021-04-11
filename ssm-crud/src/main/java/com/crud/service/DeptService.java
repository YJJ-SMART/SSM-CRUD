package com.crud.service;

import com.crud.bean.Department;
import com.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {

    @Autowired
  private   DepartmentMapper departmentMapper;
    public List<Department> getDept(){
        List<Department> dept_data=departmentMapper.selectByExample(null);
        return  dept_data;
    }

}
