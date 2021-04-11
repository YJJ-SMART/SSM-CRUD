package com.crud.controller;

import com.crud.bean.Department;
import com.crud.bean.Msg;
import com.crud.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller

public class DeptController {
    @Autowired
    DeptService deptService;
    /*
     获取部门信息
    */
    @RequestMapping("/depts")
    @ResponseBody
     public Msg getDeptWithJson(){
        List<Department> dept_data=deptService.getDept();
        return Msg.success().add("dept_data",dept_data);
    }
}
