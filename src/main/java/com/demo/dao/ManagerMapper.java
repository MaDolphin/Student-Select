package com.demo.dao;

import com.demo.entity.Major;
import com.demo.entity.Manager;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ManagerMapper {
    @Delete({
        "delete from manager",
        "where manager_name = #{managerName,jdbcType=VARCHAR}"
    })
    int deleteByPrimaryKey(String managerName);

    @Insert({
        "insert into manager (manager_name, manager_pwd, ",
        "manager_role, college_name)",
        "values (#{managerName,jdbcType=VARCHAR}, #{managerPwd,jdbcType=VARCHAR}, ",
        "#{managerRole,jdbcType=INTEGER}, #{collegeName,jdbcType=VARCHAR})"
    })
    int insert(Manager record);

    int insertSelective(Manager record);

    @Select({
        "select",
        "manager_name, manager_pwd, manager_role, college_name",
        "from manager",
        "where manager_name = #{managerName,jdbcType=VARCHAR}"
    })
    @ResultMap("BaseResultMap")
    Manager selectByPrimaryKey(String managerName);

    int updateByPrimaryKeySelective(Manager record);

    @Update({
        "update manager",
        "set manager_pwd = #{managerPwd,jdbcType=VARCHAR},",
          "manager_role = #{managerRole,jdbcType=INTEGER},",
          "college_name = #{collegeName,jdbcType=VARCHAR}",
        "where manager_name = #{managerName,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKey(Manager record);

    @Select({
            "select",
            "*",
            "from manager",
            "where manager_name = #{0}",
            "and manager_pwd = #{1}",
            "and manager_role = #{2}"
    })
    @ResultMap("BaseResultMap")
    Manager isExist(String userName,String password,int role);



}