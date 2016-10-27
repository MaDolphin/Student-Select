package com.demo.dao;

import com.demo.entity.Intention;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
}