package com.demo.dao;

import com.demo.entity.Intention;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.ArrayList;
import java.util.List;

public interface IntentionMapper {
    @Delete({
        "delete from intention",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into intention (id, student_id, ",
        "first_intention, second_intention, ",
        "third_intention, first_opttype, ",
        "second_opttype, third_opttype)",
        "values (#{id,jdbcType=INTEGER}, #{studentId,jdbcType=VARCHAR}, ",
        "#{firstIntention,jdbcType=VARCHAR}, #{secondIntention,jdbcType=VARCHAR}, ",
        "#{thirdIntention,jdbcType=VARCHAR}, #{firstOpttype,jdbcType=INTEGER}, ",
        "#{secondOpttype,jdbcType=INTEGER}, #{thirdOpttype,jdbcType=INTEGER})"
    })
    int insert(Intention record);

    int insertSelective(Intention record);

    @Select({
        "select",
        "id, student_id, first_intention, second_intention, third_intention, first_opttype, ",
        "second_opttype, third_opttype",
        "from intention",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ResultMap("BaseResultMap")
    Intention selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Intention record);

    @Update({
        "update intention",
        "set student_id = #{studentId,jdbcType=VARCHAR},",
          "first_intention = #{firstIntention,jdbcType=VARCHAR},",
          "second_intention = #{secondIntention,jdbcType=VARCHAR},",
          "third_intention = #{thirdIntention,jdbcType=VARCHAR},",
          "first_opttype = #{firstOpttype,jdbcType=INTEGER},",
          "second_opttype = #{secondOpttype,jdbcType=INTEGER},",
          "third_opttype = #{thirdOpttype,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Intention record);

    @Select({
            "select",
            "i.*,s.student_name",
            "from intention i",
            "inner join student s on i.student_id = s.student_id",
            "where i.first_intention = #{0}",
            "or i.second_intention = #{0}",
            "or i.third_intention = #{0}"
    })
    @ResultMap("BaseResultMap")
    ArrayList<Intention> queryIntentionByTeacher(String teacherId);

    @Select({
            "select",
            "*",
            "from intention i",
            "inner join teacher t on i.first_intention = t.teacher_id",
            "or i.second_intention = t.teacher_id",
            "or i.third_intention = t.teacher_id",
            "where i.student_id = #{0}",
    })
    @ResultMap("BaseResultMap")
    List<Intention> findIntention(String studentId);

    @Select({
            "select",
            "*",
            "from intention",
            "where student_id = #{0}"
    })
    @ResultMap("BaseResultMap")
    Intention findIntentionByStudentId(String studentId);

}