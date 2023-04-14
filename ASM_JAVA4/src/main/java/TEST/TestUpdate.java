package TEST;

import static org.testng.Assert.assertFalse;

import java.io.File;
import java.io.FileOutputStream;
import java.time.Duration;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import org.apache.batik.bridge.UserAgent;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import org.testng.annotations.DataProvider;
import Utils.ExcelUtils;
import DAO.UserDao;
import Entity.User;

public class TestUpdate {
	WebDriver driver;
	Map<String, Object[]> TestNGResults;
	Map<String, Object[]> TestNGDefects;
	Map<String, Object[]> TestNGResultsTitle;
	Map<String, Object[]> TestNGDefectsTitle;
	HSSFWorkbook workbook;
	HSSFSheet sheet;
	HSSFSheet sheet2;
	public static String driverPath = "E:\\KiemThuNangCao\\chromedriver_win32\\chromedriver.exe";
	private int rownum = 0, rownumD = 0;
	private String result;
	private String userName;
	private String passWord;
	private String fullName;
	private String eMail;
	private String role;
	User user = new User();
	UserDao userDao = new UserDao();

	@BeforeClass(alwaysRun = true)
	public void suiteSetUp() {
		workbook = new HSSFWorkbook();
		sheet = workbook.createSheet("TestNg Result Sumary");
		sheet2 = workbook.createSheet("TestNG Defects");
		TestNGResultsTitle = new LinkedHashMap<String, Object[]>();
		TestNGDefectsTitle = new LinkedHashMap<String, Object[]>();
		TestNGResults = new LinkedHashMap<String, Object[]>();
		TestNGDefects = new LinkedHashMap<String, Object[]>();
		TestNGResultsTitle.put("1", new Object[] { "Test Step No.", "Action", "UserName", "PassWord", "FullName",
				"Email", "Role", "Actual Output" });
		TestNGDefectsTitle.put("1", new Object[] { "Test Step No.", "Action", "UserName", "PassWord", "FullName",
				"Email", "Role", "Actual Output" });

		Set<String> keyset = TestNGResultsTitle.keySet();
		for (String key : keyset) {
			Row row = sheet.createRow(rownum++);
			Object[] objArr = TestNGResultsTitle.get(key);
			int cellnum = 0;
			for (Object obj : objArr) {
				Cell cell = row.createCell(cellnum++);
				if (obj instanceof Date)
					cell.setCellValue((Date) obj);
				else if (obj instanceof Boolean)
					cell.setCellValue((Boolean) obj);
				else if (obj instanceof String)
					cell.setCellValue((String) obj);
				else if (obj instanceof Double)
					cell.setCellValue((Double) obj);
			}
		}

		Set<String> keyset2 = TestNGDefectsTitle.keySet();
		for (String key : keyset2) {
			Row row = sheet2.createRow(rownumD++);
			Object[] objArr = TestNGDefectsTitle.get(key);
			int cellnum = 0;
			for (Object obj : objArr) {
				Cell cell = row.createCell(cellnum++);
				if (obj instanceof Date)
					cell.setCellValue((Date) obj);
				else if (obj instanceof Boolean)
					cell.setCellValue((Boolean) obj);
				else if (obj instanceof String)
					cell.setCellValue((String) obj);
				else if (obj instanceof Double)
					cell.setCellValue((Double) obj);
			}
		}
		// Browser
		try {
			System.setProperty("webdriver.chrome.driver", driverPath);
			driver = new ChromeDriver();
//			driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
			driver.get("http://localhost:8080/ASM_JAVA4/views/quanlyUser");
			driver.manage().window().maximize();
		} catch (Exception e) {
			// TODO: handle exception
			Assert.assertTrue(false);
		}
	}

	@Test(dataProvider = "Authentication", description = "Test Update")
	public void FillUpdateDetails(String sUserName, String sPassword, String sFullname, String sEmail, String sRole)
			throws Exception {
		try {
			user = userDao.findbyId(sUserName);
			userName = sUserName;
			driver.findElement(By.id("id")).sendKeys(sUserName);
			driver.findElement(By.id("password")).sendKeys(sPassword);
			driver.findElement(By.id("fullname")).sendKeys(sFullname);
			driver.findElement(By.id("email")).sendKeys(sEmail);
			if (sRole.equals("Admin")) {
				driver.findElement(By.id("admin1")).click();
			} else {
				driver.findElement(By.id("admin2")).click();
			}
			driver.findElement(By.className("updateU")).click();
			Thread.sleep(3000);
			driver.findElement(By.className("rsU")).click();

				passWord = sPassword;
				user.setPassword(sPassword);
				fullName = sFullname;
				user.setFullname(sFullname);
				eMail = sEmail;
				user.setEmail(sEmail);
				role = sRole;
				user.setAdmin(Boolean.parseBoolean(sRole));
				userDao.update(user);
			
			this.result = user.getFullname();
			User expected = userDao.findbyId(sUserName);
			System.out.println("" + result + "     " + expected.getFullname());
			Assert.assertEquals(result, expected.getFullname());
		} catch (Exception e) {
			// TODO: handle exception
			Assert.assertTrue(false);
		}
	}

//	@Test(description = "Perform", priority = 3)
//	public void DoLogin() throws Exception {
//		try {
//			
//			Thread.sleep(1000);
//			TestNGResults.put("4",
//					new Object[] { 3d, "Click Login and verify welcome  message", "Login success", "Pass" });
//		} catch (Exception e) {
//			// TODO: handle exception
//			TestNGResults.put("4",
//					new Object[] { 3d, "Click Login and verify welcome  message", "Login success", "Fail" });
//			Assert.assertTrue(false);
//		}
//	}

	@DataProvider
	public Object[][] Authentication() throws Exception {
		Object[][] testObjArray = ExcelUtils.getTableArrayUpdate("E:\\Java4\\ASM_JAVA4\\TestDataUpdate.xlsx", "Sheet2");
		return (testObjArray);
	}

	@AfterClass
	public void suiteTearDown() {
		try {
			FileOutputStream out = new FileOutputStream(new File("ResultToUpdate.xlsx"));
			workbook.write(out);
			out.close();
			System.out.println("Successfully saved Selenium WebDriver TestNG result to Excel File !!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		driver.close();
		driver.quit();
	}

	void exportResult(Map<String, Object[]> TestNGResult) {
		Set<String> keyset = TestNGResults.keySet();
		for (String key : keyset) {
			Row row = sheet.createRow(rownum++);
			Object[] objArr = TestNGResults.get(key);
			int cellnum = 0;
			for (Object obj : objArr) {
				Cell cell = row.createCell(cellnum++);
				if (obj instanceof Date)
					cell.setCellValue((Date) obj);
				else if (obj instanceof Boolean)
					cell.setCellValue((Boolean) obj);
				else if (obj instanceof String)
					cell.setCellValue((String) obj);
				else if (obj instanceof Double)
					cell.setCellValue((Double) obj);
			}
		}
	}

	void exportDefect(Map<String, Object[]> TestNGDefects) {
		Set<String> keyset = TestNGDefects.keySet();
		for (String key : keyset) {
			Row row = sheet2.createRow(rownumD++);
			Object[] objArr = TestNGDefects.get(key);
			int cellnum = 0;
			for (Object obj : objArr) {
				Cell cell = row.createCell(cellnum++);
				if (obj instanceof Date)
					cell.setCellValue((Date) obj);
				else if (obj instanceof Boolean)
					cell.setCellValue((Boolean) obj);
				else if (obj instanceof String)
					cell.setCellValue((String) obj);
				else if (obj instanceof Double)
					cell.setCellValue((Double) obj);
			}
		}
	}

	@AfterMethod
	public void afterMethod(ITestResult result) {
		try {
			if (result.getStatus() == ITestResult.SUCCESS) {
				TestNGResults.put("1", new Object[] { String.valueOf(rownum), "Sign Up " + rownum, userName, passWord,
						fullName, eMail, role, "Pass" });
				exportResult(TestNGResults);
			} else if (result.getStatus() == ITestResult.FAILURE) {
				TestNGResults.put("1", new Object[] { String.valueOf(rownum), "Sign Up " + rownum, userName, passWord,
						fullName, eMail, role, "Fail" });
				TestNGDefects.put("1", new Object[] { String.valueOf(rownumD), "Sign Up " + rownumD, userName, passWord,
						fullName, eMail, role, "Fail" });
				exportResult(TestNGResults);
				exportDefect(TestNGDefects);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
