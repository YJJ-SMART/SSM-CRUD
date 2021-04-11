package com.crud.dao;

import com.crud.bean.Department;
import com.crud.bean.DepartmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepartmentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    long countByExample(DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    int deleteByExample(DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    int deleteByPrimaryKey(Integer deptId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    int insert(Department record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    int insertSelective(Department record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    List<Department> selectByExample(DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    Department selectByPrimaryKey(Integer deptId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    int updateByExampleSelective(@Param("record") Department record, @Param("example") DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    int updateByExample(@Param("record") Department record, @Param("example") DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    int updateByPrimaryKeySelective(Department record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Sat Mar 06 13:37:35 CST 2021
     */
    int updateByPrimaryKey(Department record);
}