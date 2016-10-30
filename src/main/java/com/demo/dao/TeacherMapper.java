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
        "teacher_surplus, collage_surplus, teacher_introduction)",
        "values (#{teacherId,jdbcType=VARCHAR}, #{teacherName,jdbcType=VARCHAR}, ",
        "#{teacherPwd,jdbcType=VARCHAR}, #{majorId,jdbcType=VARCHAR}, ",
        "#{teacherSurplus,jdbcType=INTEGER}, #{collageSurplus,jdbcType=INTEGER}, #{teacherIntroduction,jdbcType=LONGVARCHAR})"
    })
    int insert(Teacher record);

    int insertSelective(Teacher record);

    @Select({
        "select",
        "teacher_id, teacher_name, teacher_pwd, major_id, teacher_surplus, collage_surplus, teacher_introduction",
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
          "collage_surplus = #{collageSurplus,jdbcType=INTEGER},",
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
          "collage_surplus = #{collageSurplus,jdbcType=INTEGER},",
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
            "from teacher t inner join major m",
            "on t.major_id = m.major_id",
            "where t.major_id = #{0}"
//            "and t.teacher_surplus > 0",
//
//            "SELECT m.college_name,s.student_id,s.student_name,t.* FROM",
//            "(student s INNER JOIN major m ON m.major_id = s.major_id )",
//            "INNER JOIN teacher t WHERE t.major_id IN",
//            "(select major_id from major",
//            "WHERE college_name = #{0})",
//            "AND m.college_name = #{0}",
//            "and t.teacher_surplus > 0 and (s.teacher_id = '0' OR s.teacher_id is null)"
    })
    @ResultMap("BaseResultMap")
    List<Teacher> teacherInfoByMajorId(String majorId);

    @Select({
            "select",
            "*",
            "from teacher"
    })
    @ResultMap("BaseResultMap")
    List<Teacher> teacher();

    @Select({
            "select",
            "*",
            "from teacher t inner join major m",
            "on t.major_id = m.major_id",
            "INNER JOIN student s ON t.teacher_id = s.teacher_id",
            "where m.college_name = #{0}"
    })
    @ResultMap("BaseResultMap")
    List<Teacher> exportVoluntaryInfoByCollegeName(String collegeName);

    @Select({
            "select",
            "*",
            "from teacher t inner join major m",
            "on t.major_id = m.major_id",
            "INNER JOIN student s ON t.teacher_id = s.teacher_id"
    })
    @ResultMap("BaseResultMap")
    List<Teacher> exportVoluntaryInfo();

    @Select({
            "select",
            "*",
            "from teacher t",
            "inner join major m on t.major_id = m.major_id"
    })
    @ResultMap("BaseResultMap")
    List<Teacher> findAllTeacher();
}