package com.demo.serviceImpl;

import com.demo.dao.IntentionMapper;
import com.demo.dao.StudentMapper;
import com.demo.entity.Intention;
import com.demo.entity.Student;
import com.demo.service.StudentService;
import org.springframework.stereotype.Service;
import org.w3c.dom.events.EventException;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lenovo on 2016/10/25.
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService{
    @Resource
    private StudentMapper studentDao;
    @Resource
    private IntentionMapper intentionDao;

    public Student isExist(String userName, String password){
        return studentDao.isExist(userName,password);
    }

    public int editPassword(Student student){
        return studentDao.editPassword(student);
    }

    public List<Intention> findIntention(String studentId){
        return intentionDao.findIntention(studentId);
    }

    public void addIntention(Intention intention){
        try {
            intentionDao.insert(intention);
        }catch (EventException e){
            e.printStackTrace();
        }
    }
    public void updateIntention(Intention intention){
        try {
            intentionDao.updateByPrimaryKey(intention);
        }catch (EventException e){
            e.printStackTrace();
        }
    }

    public Intention findIntentionByStudentId(String studentid){
        return intentionDao.findIntentionByStudentId(studentid);
    }

    public Student findStudentByStudentId(String studentId){
        return studentDao.findStudentByStudentId(studentId);
    }

    public void updateStudent(Student student){
        studentDao.updateByPrimaryKey(student);
    }

    public List<Student> findStudentBySwap(){
        return studentDao.findStudentBySwap();
    }
}
