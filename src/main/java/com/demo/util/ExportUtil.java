package com.demo.util;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.demo.entity.Teacher;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.HSSFColor.RED;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Created by lenovo on 2016/10/30.
 */
public class ExportUtil {

    public void exportExcelForHealthInfo(String title, List<String> headersList, List<List<String>> dataset, OutputStream out) {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet(title);
        sheet.setDefaultColumnWidth((short) 20);

        HSSFCellStyle style = workbook.createCellStyle();
        style.setFillForegroundColor(HSSFColor.WHITE.index); // 设置单元格背景颜色
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); // 设置单元格填充样式
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格底部边框
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN); // 设置单元格左部边框
        style.setBorderRight(HSSFCellStyle.BORDER_THIN); // 设置单元格右部边框
        style.setBorderTop(HSSFCellStyle.BORDER_THIN); // 设置单元格顶部边框
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 设置单元格文字位置（居中）
        HSSFFont font = workbook.createFont();
        // font.setColor(HSSFColor.VIOLET.index);
        // font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 设置单元格字体加粗
        style.setFont(font);

        //设置header以下部分的单元格属性
        HSSFCellStyle style1 = workbook.createCellStyle();
        style1.setFillForegroundColor(HSSFColor.WHITE.index);
        style1.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格底部边框
        style1.setBorderLeft(HSSFCellStyle.BORDER_THIN); // 设置单元格左部边框
        style1.setBorderRight(HSSFCellStyle.BORDER_THIN); // 设置单元格右部边框
        style1.setBorderTop(HSSFCellStyle.BORDER_THIN); // 设置单元格顶部边框
        style1.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font1 = workbook.createFont();
        font1.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        style1.setFont(font1);

        HSSFCellStyle style2 = workbook.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.WHITE.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font2 = workbook.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        //font2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//加粗

        style2.setFont(font2);

        // 设置若值为红色所在的单元格的属性（背景色为红色）
        HSSFCellStyle style3 = workbook.createCellStyle();
        style3.setFillForegroundColor(HSSFColor.RED.index);
        style3.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style3.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style3.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style3.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style3.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style3.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font3 = workbook.createFont();
        font3.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        style3.setFont(font3);

        // 设置若值为黄色所在的单元格的属性（背景色为黄色）
        HSSFCellStyle style4 = workbook.createCellStyle();
        style4.setFillForegroundColor(HSSFColor.YELLOW.index);
        style4.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style4.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style4.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style4.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style4.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style4.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font4 = workbook.createFont();
        font4.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        style4.setFont(font4);

        // 设置若值为绿色所在的单元格的属性（背景色为绿色）
        HSSFCellStyle style5 = workbook.createCellStyle();
        style5.setFillForegroundColor(HSSFColor.GREEN.index);
        style5.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style5.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style5.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style5.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style5.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style5.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font5 = workbook.createFont();
        font5.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        style5.setFont(font5);

        HSSFCellStyle style6 = workbook.createCellStyle();
        style6.setFillForegroundColor(HSSFColor.WHITE.index);
        style6.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style6.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style6.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style6.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style6.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style6.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font6 = workbook.createFont();
        //font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        font6.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//加粗
        font6.setColor(HSSFFont.COLOR_RED);//问号红色

        style6.setFont(font6);

        HSSFRow row = sheet.createRow(0);
        for (short i = 0; i < headersList.size(); i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            HSSFRichTextString text = new HSSFRichTextString(headersList.get(i));
            cell.setCellValue(text);
        }



        Iterator<List<String>> it = dataset.iterator();
        int index = 0;
        while (it.hasNext()) {
            index++;
            row = sheet.createRow(index);
            List<String> t = (List<String>) it.next();

            for (short i = 0; i < t.size(); i++) {
                HSSFCell cell = row.createCell(i);
                HSSFCell cell1;
                try {
                    String textValue = "";
                    textValue = t.get(i);
                    HSSFRichTextString richString = new HSSFRichTextString(textValue);
                    //合并单元格

//                    int first;
//                    int last = 0;
//                    for (int j=0;j<teacherList.size();j++) {
////            for(int j=0;j<teacherList.get(i).getStudent().size();j++){
//                        System.out.print(teacherList.size());
//                        first = last;
//                        last = last + teacherList.get(j).getStudent().size();
//                        if(j == 0){
//                            sheet.addMergedRegion(new Region(
//                                    1, //first row (0-based)
//                                    (short)0, //first column  (0-based)
//                                    last, //last row (0-based)
//                                    (short)0  //last column  (0-based)
//                            ));
//
//                            sheet.addMergedRegion(new Region(
//                                    1, //first row (0-based)
//                                    (short)1, //first column  (0-based)
//                                    last, //last row (0-based)
//                                    (short)1  //last column  (0-based)
//                            ));
//
//                            sheet.addMergedRegion(new Region(
//                                    1, //first row (0-based)
//                                    (short)2, //first column  (0-based)
//                                    last, //last row (0-based)
//                                    (short)2  //last column  (0-based)
//                            ));
//
//                            sheet.addMergedRegion(new Region(
//                                    1, //first row (0-based)
//                                    (short)3, //first column  (0-based)
//                                    last, //last row (0-based)
//                                    (short)3  //last column  (0-based)
//                            ));
//                            cell.setCellStyle(style1);
//                        }
//                        if(j != 0){
//                            sheet.addMergedRegion(new Region(
//                                    first+1, //first row (0-based)
//                                    (short)0, //first column  (0-based)
//                                    last, //last row (0-based)
//                                    (short)0  //last column  (0-based)
//                            ));
//
//                            sheet.addMergedRegion(new Region(
//                                    first+1, //first row (0-based)
//                                    (short)1, //first column  (0-based)
//                                    last, //last row (0-based)
//                                    (short)1  //last column  (0-based)
//                            ));
//
//                            sheet.addMergedRegion(new Region(
//                                    first+1, //first row (0-based)
//                                    (short)2, //first column  (0-based)
//                                    last, //last row (0-based)
//                                    (short)2  //last column  (0-based)
//                            ));
//
//                            sheet.addMergedRegion(new Region(
//                                    first+1, //first row (0-based)
//                                    (short)3, //first column  (0-based)
//                                    last, //last row (0-based)
//                                    (short)3  //last column  (0-based)
//                            ));
//                            cell.setCellStyle(style1);
//                        }
//                        cell1 = sheet.getRow(j+1).getCell(0);
//                        cell1.setCellStyle(style1);
//                        cell1 = sheet.getRow(j+1).getCell(1);
//                        cell1.setCellStyle(style1);
//                        cell1 = sheet.getRow(j+1).getCell(2);
//                        cell1.setCellStyle(style1);
//                        cell1 = sheet.getRow(j+1).getCell(3);
//                        cell1.setCellStyle(style1);
//                    }

                    cell.setCellStyle(style1);
                    cell.setCellValue(richString);

                } catch (SecurityException e) {
                    e.printStackTrace();
                } finally {
                }
            }


        }
        try {
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
