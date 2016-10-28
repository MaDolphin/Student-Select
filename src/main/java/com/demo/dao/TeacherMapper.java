package com.demo.dao;

import com.demo.entity.Teacher;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface TeacherMapper {
    @Delete({
        "delete from teacher",
        "where teacher_id = #{teacherId,jdbcType=VARCHAR}"
    })
    int deleteByPrimaryKey(String teacherId);

    @Insert({
        "insert into teacher (teacher_id, teacher_name, ",
        "teacher_pwd, major_id, ",
        "teacher_surplus, teacher_introduction)",
        "values (#{teacherId,jdbcType=VARCHAR}, #{teacherName,jdbcType=VARCHAR}, ",
        "#{teacherPwd,jdbcType=VARCHAR}, #{majorId,jdbcType=VARCHAR}, ",
        "#{teacherSurplus,jdbcType=INTEGER}, #{teacherIntroduction,jdbcType=LONGVARCHAR})"
    })
    int insert(Teacher record);

    int insertSelective(Teacher record);

    @Select({
        "select",
        "teacher_id, teacher_name, teacher_pwd, major_id, teacher_surplus, teacher_introduction",
        "from teacher",
        "where teacher_id = #{teacherId,jdbcType=VARCHAR}"
    })
    @ResultMap("ResultMapWithBLOBs")
    Teacher selectByPrimaryKey(String teacherId);

    int updateByPrimaryKeySelective(Teacher record);

    @Update({
        "update teacher",
        "set teacher_name = #{teacherName,jdbcType=VARCHAR},",
          "teacher_pwd = #{teacherPwd,jdbcType=VARCHAR},",
          "major_id = #{majorId,jdbcType=VARCHAR},",
          "teacher_surplus = #{teacherSurplus,jdbcType=INTEGER},",
          "teacher_introduction = #{teacherIntroduction,jdbcType=LONGVARCHAR}",
        "where teacher_id = #{teacherId,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKeyWithBLOBs(Teacher record);

    @Update({
        "update teacher",
        "set teacher_name = #{teacherName,jdbcType=VARCHAR},",
          "teacher_pwd = #{teacherPwd,jdbcType=VARCHAR},",
          "major_id = #{majorId,jdbcType=VARCHAR},",
          "teacher_surplus = #{teacherSurplus,jdbcType=INTEGER}",
        "where teacher_id = #{teacherId,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKey(Teacher record);

    @Select({
            "select",
            "*",
            "from teacher",
            "where teacher_id = #{0}",
            "and teacher_pwd = #{1}"
    })
    @ResultMap("BaseResultMap")
    Teacher isExist(String userName,String password);

    @Select({
            "select",
            "*",
            "from teacher",
            "where major_id = #{0}"
    })
    @ResultMap("BaseResultMap")
    List<Teacher> teacherInfoByMajorId(String majorId);

}