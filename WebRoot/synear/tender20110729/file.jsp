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
		FileUploadDir.mkdir(); //�����ϴ��ļ���Ŀ¼
		FileUploadDir1.mkdir();
		String tempPath = tpath;
		DiskFileUpload fu = new DiskFileUpload();
		fu.setHeaderEncoding("gb2312");
	    fu.setSizeMax(100*1024*1024);// ��������ļ��ߴ磬������1M
	      fu.setSizeThreshold(4096);// ���û�������С��������4kb
	      fu.setRepositoryPath(tempPath);												
		  // ������ʱĿ¼��
	      List fileItems = fu.parseRequest(request);
		  System.out.println(fileItems);// �õ����е��ļ���
	      Iterator iter = fileItems.iterator();
	      ArrayList file = new ArrayList();
	      ArrayList size1 = new ArrayList();
	      while (iter.hasNext()) {															// ���δ���ÿһ���ļ���
	        FileItem item = (FileItem) iter.next();	
			//�������������ļ�������б���Ϣ
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
window.alert("�ļ��ϴ��ɹ�!");
window.close();
</script>
<%
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
%>