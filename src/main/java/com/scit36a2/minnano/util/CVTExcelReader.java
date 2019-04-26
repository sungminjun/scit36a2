package com.scit36a2.minnano.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.scit36a2.minnano.vo.CardVeriTool;

public class CVTExcelReader {

	public List<CardVeriTool> xls2cvtVO(String filePath) {
		List<CardVeriTool> result = new ArrayList<CardVeriTool>();

		FileInputStream fis = null;
		HSSFWorkbook workbook = null;

		try {
			fis = new FileInputStream(filePath);
			// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
			workbook = new HSSFWorkbook(fis);
			// 탐색에 사용할 Sheet, Row, Cell 객체
			HSSFSheet curSheet;
			HSSFRow curRow;
			HSSFCell curCell;
			CardVeriTool vo;

			// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 Sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if (rowIndex > 2) {
						// 현재 row 반환
						curRow = curSheet.getRow(rowIndex);
						vo = new CardVeriTool();
						String value;

						// row의 첫번째 cell값이 비어있지 않은 경우 만 cell탐색
						if (!"".equals(curRow.getCell(0).getStringCellValue())) {

							// cell 탐색 for 문
							for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
								curCell = curRow.getCell(cellIndex);

								if (true) {
									value = "";
									// cell 스타일이 다르더라도 String으로 반환 받음
									// by the version POI 4.0.0, no more CELL_TYPE_ needs
									switch (curCell.getCellType()) {
									case FORMULA:
										value = curCell.getCellFormula();
										break;
									case NUMERIC:
										value = curCell.getNumericCellValue() + "";
										break;
									case STRING:
										value = curCell.getStringCellValue() + "";
										break;
									case BLANK:
										value = curCell.getBooleanCellValue() + "";
										break;
									case ERROR:
										value = curCell.getErrorCellValue() + "";
										break;
									default:
										value = new String();
										break;
									}

									// 현재 column index에 따라서 vo에 입력
									switch (cellIndex) {
									case 0: // seq
										vo.setCvt_seq(Integer.parseInt(value));
										break;

									case 1: // 구분
										vo.setGubun(value);
										break;

									case 2: // 거래일자
										vo.setCvt_date(value);
										break;

									case 3: // 거래시간
										vo.setCvt_time(value);
										break;

									case 4: // 카드사
										vo.setCvt_cardtype1(value);
										break;

									case 5: // 제휴카드사
										vo.setCvt_cardtype2(value);
										break;

									case 6: // 카드번호
										vo.setCvt_cardnum16(value);
										break;

									case 7: // 승인번호
										vo.setCvt_cardverinum(value);
										break;

									case 8: // 승인금액
										vo.setCvt_amount((int) (Double.parseDouble(value)));
										break;

									case 9: // 할부기간
										vo.setCvt_instperiod(value);
										break;

									default:
										break;
									}
								}
							}
							// cell 탐색 이후 vo 추가
							result.add(vo);
						}
					}
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println("File Not Found Exception occured.");
//			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("I/O Exception occured.");
//			e.printStackTrace();
		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null)
					workbook.close();
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				System.out.println("I/O Exception occured.");
//				e.printStackTrace();			
			}
		}
		return result;
	}
}
