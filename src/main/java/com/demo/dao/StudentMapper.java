package com.demo.dao;

import com.demo.entity.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface StudentMapper {
    @Delete({
        "delete from student",
        "where student_id = #{studentId,jdbcType=VARCHAR}"
    })
    int deleteByPrimaryKey(String studentId);

    @Insert({
        "insert into student (student_id, person_id, ",
        "student_name, student_pwd, ",
        "student_sex, student_birthday, ",
        "major_id, student_tel, ",
        "teacher_id, student_comment)",
        "values (#{studentId,jdbcType=VARCHAR}, #{personId,jdbcType=VARCHAR}, ",
        "#{studentName,jdbcType=VARCHAR}, #{studentPwd,jdbcType=VARCHAR}, ",
        "#{studentSex,jdbcType=VARCHAR}, #{studentBirthday,jdbcType=VARCHAR}, ",
        "#{majorId,jdbcType=VARCHAR}, #{studentTel,jdbcType=VARCHAR}, ",
        "#{teacherId,jdbcType=VARCHAR}, #{studentComment,jdbcType=LONGVARCHAR})"
    })
    int insert(Student record);

    int insertSelective(Student record);

    @Select({
        "select",
        "student_id, person_id, student_name, student_pwd, student_sex, student_birthday, ",
        "major_id, student_tel, teacher_id, student_comment",
        "from student",
        "where student_id = #{studentId,jdbcType=VARCHAR}"
    })
    @ResultMap("ResultMapWithBLOBs")
    Student selectByPrimaryKey(String studentId);

    int updateByPrimaryKeySelective(Student record);

    @Update({
        "update student",
        "set person_id = #{personId,jdbcType=VARCHAR},",
          "student_name = #{studentName,jdbcType=VARCHAR},",
          "student_pwd = #{studentPwd,jdbcType=VARCHAR},",
          "student_sex = #{studentSex,jdbcType=VARCHAR},",
          "student_birthday = #{studentBirthday,jdbcType=VARCHAR},",
          "major_id = #{majorId,jdbcType=VARCHAR},",
          "student_tel = #{studentTel,jdbcType=VARCHAR},",
          "teacher_id = #{teacherId,jdbcType=VARCHAR},",
          "student_comment = #{studentComment,jdbcType=LONGVARCHAR}",
        "where student_id = #{studentId,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKeyWithBLOBs(Student record);

    @Update({
        "update student",
        "set person_id = #{personId,jdbcType=VARCHAR},",
          "student_name = #{studentName,jdbcType=VARCHAR},",
          "student_pwd = #{studentPwd,jdbcType=VARCHAR},",
          "student_sex = #{studentSex,jdbcType=VARCHAR},",
          "student_birthday = #{studentBirthday,jdbcType=VARCHAR},",
          "major_id = #{majorId,jdbcType=VARCHAR},",
          "student_tel = #{studentTel,jdbcType=VARCHAR},",
          "teacher_id = #{teacherId,jdbcType=VARCHAR}",
        "where student_id = #{studentId,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKey(Student record);

    @Select({
            "select",
            "*",
            "from student",
            "where student_id = #{0}",
            "and student_pwd = #{1}"
    })
    @ResultMap("BaseResultMap")
    Student isExist(String userName,String password);

    @Update({
            "update student",
            "set student_pwd = #{1}",
            "where student_id = #{0}"
    })
    void editPassword(String studentId,String newPassword);

    @Select({
            "select",
            "*",
            "from student",
            "where student_id = #{0}"
    })
    @ResultMap("BaseResultMap")
    Student findStudentByStudentId(String studentId);

    @Select({
            "select",
            "*",
            "from student",
            "where student_id = '0' OR s.teacher_id is null"
    })
    @ResultMap("BaseResultMap")
    List<Student> findStudentBySwap();

    @Select({
//            "SELECT m.college_name,s.student_id,s.student_name,t.* FROM (student s INNER JOIN major m ON s.major_id = m.major_id)",
//            "INNER JOIN teacher t where t.major_id in ",
//            "(select major_id  from major)",
//            "WHERE m.college_name = #{0}",
//            "andd t.teacher_surplus > 0 and (s.teacher_id = '0' OR s.teacher_id is null)"

           "SELECT m.college_name,s.student_id,s.student_name,t.* FROM",
            "(student s INNER JOIN major m ON m.major_id = s.major_id )",
            "INNER JOIN teacher t WHERE t.major_id IN",
            "(select major_id from major",
            "WHERE college_name = #{0})",
            "AND m.college_name = #{0}",
            "and t.teacher_surplus > 0 and (s.teacher_id = '0' OR s.teacher_id is null)"
    })
    @ResultMap("BaseResultMap")
    List<Student> findSwapStudentByCollegeName(String collegeName);
//    List<Student> findSwapStudentByCollegeName(String collegeName);

    @Select({
            "select",
            "*",
            "from student s",
            "inner join major m on s.major_id = m.major_id"
    })
    @ResultMap("BaseResultMap")
    List<Student> findAllStudent();
}