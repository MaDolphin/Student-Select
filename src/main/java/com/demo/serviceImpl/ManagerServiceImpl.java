package com.demo.serviceImpl;

import com.demo.dao.MajorMapper;
import com.demo.dao.ManagerMapper;
import com.demo.dao.StudentMapper;
import com.demo.dao.TeacherMapper;
import com.demo.entity.Major;
import com.demo.entity.Student;
import com.demo.entity.Teacher;
import com.demo.service.ManagerService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2016/10/25.
 */
@Service("managerService")
public class ManagerServiceImpl implements ManagerService {
    @Resource
    private ManagerMapper managerDao;

    @Resource
    private StudentMapper studentDao;
    @Resource
    private TeacherMapper teacherDao;
    @Resource
    private MajorMapper majorDao;

    public int isExist(String userName,String password,int role){
        return managerDao.isExist(userName,password,role);
    }

    @Override
    public boolean uploadFileToDB(MultipartFile file) {
        Workbook wb = null;
        try{
            FileInputStream fi = (FileInputStream) file.getInputStream();
            String fileName=file.getName();
            String prefix=fileName.substring(fileName.lastIndexOf(".")+1);
            if (prefix.toLowerCase().endsWith(".xls")) {
                wb = new HSSFWorkbook(fi);
            }else if(prefix.toLowerCase().endsWith(".xlsx")) {
                wb = new XSSFWorkbook(fi);
            }

            if(checkExcelSheet(wb,0) && checkExcelSheet(wb,1) && checkExcelSheet(wb,2)){
                // add student
                Sheet sheet = wb.getSheetAt(0);
                int rowNum = sheet.getLastRowNum()+1;
                List studentList = new ArrayList<Student>();
                //i 从1开始表示第一行为标题 不包含在数据中
                for(int i=1;i<rowNum;i++){
                    Student student = new Student();
                    Row row = sheet.getRow(i);
                    int cellNum = row.getLastCellNum();
                    for(int j=0;j<cellNum;j++){
                        Cell cell = row.getCell(j);
                        String cellValue = null;
                        switch(cell.getCellType()){ //判断excel单元格内容的格式，并对其进行转换，以便插入数据库
                            case 0 : cellValue = String.valueOf((int)cell.getNumericCellValue()); break;
                            case 1 : cellValue = cell.getStringCellValue(); break;
                            case 2 : cellValue = String.valueOf(cell.getDateCellValue()); break;
                            case 3 : cellValue = ""; break;
                            case 4 : cellValue = String.valueOf(cell.getBooleanCellValue()); break;
                            case 5 : cellValue = String.valueOf(cell.getErrorCellValue()); break;
                        }

                        switch(j){//通过列数来判断对应插如的字段
                            //数据中不应该保护ID这样的主键记录
                            //case 0 : user.setId(Integer.valueOf(cellValue));break;
                            case 0 : student.setStudentId(cellValue);break;
                            case 1 : student.setStudentName(cellValue);break;
                            case 2 : student.setPersonId(cellValue);
                                student.setStudentPwd(cellValue.substring(12,18));
                                break;
                            case 3 : student.setStudentSex(cellValue);break;
                            case 4 : student.setStudentBirthday(cellValue);break;
                            case 5 : student.setMajorId(cellValue);break;
                            case 6 : student.setStudentTel(cellValue);break;
                        }
                    }
                    studentList.add(student);
                }

                // add teacher
                sheet = wb.getSheetAt(1);
                rowNum = sheet.getLastRowNum()+1;
                List teacherList = new ArrayList<Teacher>();
                //i 从1开始表示第一行为标题 不包含在数据中
                for(int i=1;i<rowNum;i++){
                    Teacher teacher = new Teacher();
                    Row row = sheet.getRow(i);
                    int cellNum = row.getLastCellNum();
                    for(int j=0;j<cellNum;j++){
                        Cell cell = row.getCell(j);
                        String cellValue = null;
                        switch(cell.getCellType()){ //判断excel单元格内容的格式，并对其进行转换，以便插入数据库
                            case 0 : cellValue = String.valueOf((int)cell.getNumericCellValue()); break;
                            case 1 : cellValue = cell.getStringCellValue(); break;
                            case 2 : cellValue = String.valueOf(cell.getDateCellValue()); break;
                            case 3 : cellValue = ""; break;
                            case 4 : cellValue = String.valueOf(cell.getBooleanCellValue()); break;
                            case 5 : cellValue = String.valueOf(cell.getErrorCellValue()); break;
                        }

                        switch(j){//通过列数来判断对应插如的字段
                            //数据中不应该保护ID这样的主键记录
                            //case 0 : user.setId(Integer.valueOf(cellValue));break;
                            case 0 : teacher.setTeacherId(cellValue);break;
                            case 1 : teacher.setTeacherName(cellValue);break;
                            case 2 : teacher.setMajorId(cellValue);break;
                            case 3 : teacher.setTeacherPwd(cellValue);break;
                            case 4 : teacher.setTeacherIntroduction(cellValue);break;
                            case 5 : teacher.setTeacherSurplus(Integer.valueOf(cellValue));break;
                        }
                    }
                    teacherList.add(teacher);
                }

                // add major
                sheet = wb.getSheetAt(2);
                rowNum = sheet.getLastRowNum()+1;
                List majorList = new ArrayList<Major>();
                //i 从1开始表示第一行为标题 不包含在数据中
                for(int i=1;i<rowNum;i++){
                    Major major = new Major();
                    Row row = sheet.getRow(i);
                    int cellNum = row.getLastCellNum();
                    for(int j=0;j<cellNum;j++){
                        Cell cell = row.getCell(j);
                        String cellValue = null;
                        switch(cell.getCellType()){ //判断excel单元格内容的格式，并对其进行转换，以便插入数据库
                            case 0 : cellValue = String.valueOf((int)cell.getNumericCellValue()); break;
                            case 1 : cellValue = cell.getStringCellValue(); break;
                            case 2 : cellValue = String.valueOf(cell.getDateCellValue()); break;
                            case 3 : cellValue = ""; break;
                            case 4 : cellValue = String.valueOf(cell.getBooleanCellValue()); break;
                            case 5 : cellValue = String.valueOf(cell.getErrorCellValue()); break;
                        }

                        switch(j){//通过列数来判断对应插如的字段
                            //数据中不应该保护ID这样的主键记录
                            //case 0 : user.setId(Integer.valueOf(cellValue));break;
                            case 0 : major.setMajorId(cellValue);break;
                            case 1 : major.setMajorName(cellValue);break;
                            case 2 : major.setCollegeName(cellValue);break;
                        }
                    }
                    majorList.add(major);
                }

                studentIntoDB(studentList);
                teacherIntoDB(teacherList);
                majorIntoDB(majorList);
                return true;
            }
            else {
                return false;
            }

        }catch(IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean checkExcelSheet(Workbook wb,int sheetNum) {
        //判断表头是否相同
        Sheet sheetTitle = wb.getSheetAt(sheetNum);
        Row rowTitle = sheetTitle.getRow(0);
        int colNumTitle = rowTitle.getPhysicalNumberOfCells();
        switch (sheetNum){
            case 0:
                if(colNumTitle == 7){
                    if( rowTitle.getCell(0).getStringCellValue().equals("准考证号") == false){
                        return false;
                    }
                    if( rowTitle.getCell(1).getStringCellValue().equals("姓名") == false){
                        return false;
                    }
                    if( rowTitle.getCell(2).getStringCellValue().equals("身份证") == false){
                        return false;
                    }
                    if( rowTitle.getCell(3).getStringCellValue().equals("性别") == false){
                        return false;
                    }
                    if( rowTitle.getCell(4).getStringCellValue().equals("出生年月") == false){
                        return false;
                    }
                    if( rowTitle.getCell(5).getStringCellValue().equals("报考专业") == false){
                        return false;
                    }
                    if( rowTitle.getCell(5).getStringCellValue().equals("联系方式") == false){
                        return false;
                    }
                    else {
                        return true;
                    }
                }else {
                    return false;
                }
            case 1:
                if(colNumTitle == 6){
                    if( rowTitle.getCell(0).getStringCellValue().equals("工号") == false){
                        return false;
                    }
                    if( rowTitle.getCell(1).getStringCellValue().equals("姓名") == false){
                        return false;
                    }
                    if( rowTitle.getCell(2).getStringCellValue().equals("专业编号") == false){
                        return false;
                    }
                    if( rowTitle.getCell(3).getStringCellValue().equals("密码") == false){
                        return false;
                    }
                    if( rowTitle.getCell(4).getStringCellValue().equals("教师介绍") == false){
                        return false;
                    }
                    if( rowTitle.getCell(5).getStringCellValue().equals("剩余名额") == false){
                        return false;
                    }
                    else {
                        return true;
                    }
                }else {
                    return false;
                }
            case 2:
                if(colNumTitle == 3){
                    if( rowTitle.getCell(0).getStringCellValue().equals("专业编号") == false){
                        return false;
                    }
                    if( rowTitle.getCell(1).getStringCellValue().equals("专业名") == false){
                        return false;
                    }
                    if( rowTitle.getCell(2).getStringCellValue().equals("学院名") == false){
                        return false;
                    }
                    else {
                        return true;
                    }
                }else {
                    return false;
                }
            default:
                return false;
        }
    }

    @Override
    public void studentIntoDB(List<Student> studentList) {
        int num = studentList.size();
        for(int i=0; i<num; i++){
            studentDao.insert(studentList.get(i));
        }
    }

    @Override
    public void teacherIntoDB(List<Teacher> teacherList) {
        int num = teacherList.size();
        for(int i=0; i<num; i++){
            teacherDao.insert(teacherList.get(i));
        }
    }

    @Override
    public void majorIntoDB(List<Major> majorList) {
        int num = majorList.size();
        for(int i=0; i<num; i++){
            majorDao.insert(majorList.get(i));
        }
    }
}
