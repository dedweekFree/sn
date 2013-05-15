<%@page contentType="text/html; charset=gb2312" errorPage=""%>
<%
	String id = request.getParameter("id");
	java.io.BufferedInputStream bis=null;
	java.io.BufferedOutputStream  bos=null;
	try{
		//System.out.println(filename);
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-disposition","attachment; filename="+new String(id.getBytes("gb2312"),"iso8859-1"));
		bis =new java.io.BufferedInputStream(new java.io.FileInputStream(request.getRealPath(id)));
		bos=new java.io.BufferedOutputStream(response.getOutputStream()); 
		byte[] buff = new byte[2048];
		int bytesRead;
		while(-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff,0,bytesRead);
		}
	}catch(Exception e){
		out.println(e.getMessage());
	}finally {
	 if (bis != null)bis.close();
	 if (bos != null)bos.close();
	}
%>