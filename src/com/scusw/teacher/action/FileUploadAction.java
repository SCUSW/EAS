package com.scusw.teacher.action;  
  
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;   
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;   
import java.text.SimpleDateFormat;   
import java.util.Date;   
import java.util.Random;   
  
import javax.servlet.ServletContext;   
  
import org.apache.commons.io.FileUtils;   
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;   
  
import com.opensymphony.xwork2.ActionSupport;   
  
public class FileUploadAction extends ActionSupport{   
       private File myFile;
       private String myFileFileName;
       private String myFileContentType;
       private String savePath;
       
	public File getMyFile() {
		return myFile;
	}
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}
	public String getMyFileFileName() {
		return myFileFileName;
	}
	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}
	public String getMyFileContentType() {
		return myFileContentType;
	}
	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
     
	public String execute() throws Exception{
		String newFileName = null;
		long  now = new Date().getTime();
		String path = ServletActionContext.getServletContext().getRealPath(savePath);
		File dir = new File(path);
		if(!dir.exists())
			dir.mkdir();
		int index = myFileFileName.lastIndexOf('.');
		
		if(index!=-1)
			newFileName = now + myFileFileName.substring(index);
		else
			newFileName = Long.toString(now);
		
		BufferedOutputStream  bos = null;
		BufferedInputStream bis = null;
		FileInputStream fis = new FileInputStream(myFile);
		bis = new BufferedInputStream(fis);
		FileOutputStream fos = new FileOutputStream(myFile);
		bos = new BufferedOutputStream(fos);
		byte[] buf = new byte[4096];
		int len = -1;
		while((len = bis.read(buf))!=-1){
			bos.write(buf,0,len);
		}
		bos.flush();
		return SUCCESS;
	}
}  