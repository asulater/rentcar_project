package common.rent.manage;

import java.io.FileInputStream;

import java.io.InputStream;

import com.opensymphony.xwork2.Action;

public class FileDownloadAction implements Action {

	String dir; // struts.xml���� �Ѿ���� ������ ����
	String fileName; // ��û�Ķ���� �̸��� ��ġ�� ��
	InputStream inputStream;
	// �� �������� struts.xml�� <param name="inputName">���� ���ǵ�

	public String execute() throws Exception {
		inputStream = new FileInputStream(dir + "/" + fileName);
		return SUCCESS;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public String getFileName() {
		return this.fileName;
	}

}