/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import dal.QuestionDAO;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import model.Question;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Admin
 */
public class ExcelHelper {

    public void importQuestion(String path) throws Exception {
        String content = "";
        String category = "";
        String status = "";
        String level = "";
        String option1 = "";
        String option2 = "";
        String option3 = "";
        String option4 = "";
        String optionCorrect = "";
        InputStream ips = new FileInputStream(new File(path));
        Workbook wb = getWorkbook(ips, path);
        Sheet sheet = wb.getSheetAt(0);
        Iterator<Row> iterator = sheet.iterator();
        while (iterator.hasNext()) {
            Row nextRow = iterator.next();
            if (nextRow.getRowNum() == 0) {
                continue;
            }
            Iterator<Cell> cellIterator = nextRow.cellIterator();
            while (cellIterator.hasNext()) {
                Cell cell = cellIterator.next();
                Object cellValue = getCellValue(cell);
                if (cellValue == null || cellValue.toString().isEmpty()) {
                    continue;
                }
                int columnIndex = cell.getColumnIndex();
                switch (columnIndex) {
                    case 0:
                        content = (String) getCellValue(cell);
                        break;
                    case 1:
                        category = (String) getCellValue(cell);
                        break;
                    case 2:
                        status = (String) getCellValue(cell);
                        break;
                    case 3:
                        level = (String) getCellValue(cell);
                        break;
                    case 4:
                        option1 = (String) getCellValue(cell);
                        break;
                    case 5:
                        option2 = (String) getCellValue(cell);
                        break;
                    case 6:
                        option3 = (String) getCellValue(cell);
                        break;
                    case 7:
                        option4 = (String) getCellValue(cell);
                        break;
                    case 8:
                        optionCorrect = (String) getCellValue(cell);
                        break;
                }
            }
            QuestionDAO qdao = new QuestionDAO();
            qdao.insertQuestion(new Question(content, category, status, level, option1, option2, option3, option4, optionCorrect));
        }
    }

    private Workbook getWorkbook(InputStream inputStream, String excelFilePath) throws Exception {
        Workbook workbook = null;
        if (excelFilePath.endsWith("xlsx")) {
            workbook = new XSSFWorkbook(inputStream);
        } else if (excelFilePath.endsWith("xls")) {
            workbook = new HSSFWorkbook(inputStream);
        } else {
            throw new IllegalArgumentException("The specified file is not Excel file");
        }

        return workbook;
    }

    private Object getCellValue(Cell cell) {
        CellType cellType = cell.getCellTypeEnum();
        Object cellValue = null;
        switch (cellType) {
            case BOOLEAN:
                cellValue = cell.getBooleanCellValue();
                break;
            case FORMULA:
                Workbook workbook = cell.getSheet().getWorkbook();
                FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
                cellValue = evaluator.evaluate(cell).getNumberValue();
                break;
            case NUMERIC:
                cellValue = cell.getNumericCellValue();
                break;
            case STRING:
                cellValue = cell.getStringCellValue();
                break;
            case _NONE:
            case BLANK:
            case ERROR:
                break;
            default:
                break;
        }

        return cellValue;
    }
}