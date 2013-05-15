<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%
	try{
		String formname=request.getParameter("formname");
		String picurl=request.getParameter("picurl");
		String names = "";
		String path = request.getRealPath("/");
		String syspath = "/fileupload/file/";
		path += syspath;
		String tpath = path +"temp/";
		String file1 = "";
		File FileUploadDir=new File(path);
		File FileUploadDir1=new File(tpath);
		FileUploadDir.mkdir(); //生成上传文件的目录
		FileUploadDir1.mkdir();
		String tempPath = tpath;
		DiskFileUpload fu = new DiskFileUpload();
		fu.setHeaderEncoding("gb2312");
	    fu.setSizeMax(100*1024*1024);// 设置最大文件尺寸，这里是1M
	      fu.setSizeThreshold(4096);// 设置缓冲区大小，这里是4kb
	      fu.setRepositoryPath(tempPath);												
		  // 设置临时目录：
	      List fileItems = fu.parseRequest(request);
		  System.out.println(fileItems);// 得到所有的文件：
	      Iterator iter = fileItems.iterator();
	      ArrayList file = new ArrayList();
	      ArrayList size1 = new ArrayList();
	      while (iter.hasNext()) {															// 依次处理每一个文件：
	        FileItem item = (FileItem) iter.next();	
			//忽略其他不是文件域的所有表单信息
	        if (!item.isFormField()) {
	          names = item.getName();
	          long size = item.getSize();
	          if ( (names == null || names.equals("")) && size == 0) {
	            continue;
	          }
	          names = names.replace('\\', '-');
	          names = names.substring((names.lastIndexOf("-")+1),names.length());
	          item.write(new File(path+"/"+names));
	          size = size/(1024);
	          String s = size+"K";
	          file.add(names);
	          size1.add(s);
	          file1 = syspath+file.get(0);
	        }else{
	        }
	       }
	      out.print("<script>window.opener.document."+formname+"."+picurl+".value='"+file1+"'</script>");
%>
<script language="javascript">
window.alert("文件上传成功!");
window.close();
</script>
<%
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
%>