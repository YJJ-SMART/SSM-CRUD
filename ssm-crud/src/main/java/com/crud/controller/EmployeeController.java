package com.crud.controller;

import com.crud.bean.Employee;
import com.crud.bean.Msg;
import com.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * 处理员工CRUD请求
 *
 * */
@Controller
public class EmployeeController {


    @Autowired
   private EmployeeService employeeService;

    /*
    * 批量单一删除整合
    * */
    @RequestMapping(value = "/emp/{ids}",method =RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteByline(@PathVariable("ids") String ids) {

        if (ids.contains("-")) {
            List<Integer> emps_Id = new ArrayList<>();
            String[] empsId = ids.split("-");
            for (String string : empsId) {
                emps_Id.add(Integer.parseInt(string));
            }
            employeeService.deleteBatch(emps_Id);
            return Msg.success();
        } else {
            employeeService.deleteByline(Integer.parseInt(ids));
            return Msg.success();
        }
    }

    /*
    *更新员工信息
    * */
    @RequestMapping(value = "/emp/{empId}",method =RequestMethod.PUT)
    @ResponseBody
    public  Msg updateEmp(Employee employee){
                     employeeService.updateEmp(employee);
                     return  Msg.success();
    }

    /*
     * 查询员工信息
     *
     * */
    @RequestMapping(value = "/emp/{id}",method =RequestMethod.GET)
    @ResponseBody
   public  Msg getEmps(@PathVariable int id){
       Employee employee= employeeService.getEmps(id);

       return  Msg.success().add("emp",employee);
   }

    /*
     * 查询所有员工数据（分页查询）
     *
     * */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)   //post:插入 、put:修改、delete:删除 get:查询
    @ResponseBody
    public  Msg saveEmps(@Valid Employee employee, BindingResult result){
           if (result.hasErrors()){
               //校验失败，返回错误信息在模态框
               Map<String,Object> map=new HashMap<String,Object>();
             List<FieldError> error= result.getFieldErrors();
             for (FieldError fieldError:error){
                 System.out.println("错误字段名："+fieldError.getField());
                 System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
             }
             return Msg.fail().add("error",map);
           }else {
               employeeService.saveEmps(employee);
               return Msg.success();
           }
    }
 /*
 * 校验名字是否重复
 *
 * */
    @RequestMapping("/checkUser")
    @ResponseBody
    public Msg checkUser(@RequestParam("empName")String empName){
             String check_code="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
             if(!empName.matches(check_code)){
                 return Msg.fail().add("mess","用户名可以是2~5的中文或者6~16的英文！");
             }
             boolean result=employeeService.checkName(empName);
            if(result) {
                return Msg.success();
            }
            else
                {
                    return Msg.fail().add("mess","用户不可用！");
                }
    }

    @RequestMapping("/emps")
    @ResponseBody  //将java数据转换为json数据
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){//@RequestParam 作用是可以对传入参数指定参数名
         //分页查询
        // 使用PageHelper
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据,传入连续显示的页数
        PageInfo page=new PageInfo(emps,5);

       return  Msg.success().add("pageInfo",page);
    }

//    @RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
//            Model model){
//
//        // 分页查询
//        // 使用PageHelper
//        //在查询之前只需要调用，传入页码，以及每页的大小
//        PageHelper.startPage(pn,5);
//        //startPage后面紧跟的这个查询就是一个分页查询
//        List<Employee> emps = employeeService.getAll();
//        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
//        //封装了详细的分页信息，包括我们查询出来的数据,传入连续显示的页数
//        PageInfo page=new PageInfo(emps,5);
//        model.addAttribute("pageInfo",page);
//
//        return "list";
//    }
}
