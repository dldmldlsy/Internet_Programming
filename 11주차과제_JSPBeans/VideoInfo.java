package myBean;

public class VideoInfo {
	
	
 private String tit; //동영상 제목
 private String id; //작성자id
 private String menu;//게시판메뉴이름
 private String pwd; //비밀번호
private String info; //동영상 설명
 private String upload_time; //업로드시간

 
 public VideoInfo() {
	 
 }
public String getTit() {
	return tit;
}
public void setTit(String tit) {
	this.tit = tit;
}

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}

public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}

public String getMenu() {
	return menu;
}
public void setMenu(String menu) {
	this.menu= menu;
}

public String getInfo() {
	return info;
}
public void setInfo(String info) {
	this.info = info;
}

public String getUpload_time() {
	return upload_time;
}
public void setUpload_time(String upload_time) {
	this.upload_time = upload_time;
}
 
 
}
