package com.xxs.common.util;

import java.util.Vector;

@SuppressWarnings("rawtypes")
public class WebApp {
	private String sql;
	private Vector sqls;
	private String sqlSplit;
	private String webAppContent;
	private String path;
	private String template;
	private Integer pagesize;
	private String sqlType;
	private String successMsg;
	private String failMsg;
	private String url;
	private String target;
	private String multiValue;
	private String secType;
	private String clear_session;
	private Vector clear_sessions;
	private String djhm;
	private String db;
	private String escape;
	private String code;

	public WebApp(String qryContent, String path) {
		this.path = path;
		setWebAppContent(qryContent);
	}

	public WebApp(String qryContent) {
		path = "c:";
		setWebAppContent(qryContent);
	}

	public String getSql() {
		return this.sql;
	}

	public Vector getSqls() {
		return this.sqls;
	}

	public String getSqlSplit() {
		return this.sqlSplit;
	}

	public String getTemplate() {
		return this.template;
	}

	public int getPagesize() {
		return this.pagesize;
	}

	public String getSqlType() {
		return this.sqlType;
	}

	public String getSuccessMsg() {
		return this.successMsg;
	}

	public String getFailMsg() {
		return this.failMsg;
	}

	public String getUrl() {
		return this.url;
	}

	public String getTarget() {
		return this.target;
	}

	public String getMultiValue() {
		return this.multiValue;
	}

	public String getSecType() {
		return this.secType;
	}

	public void setTemplate(String templ) {
		this.template = templ;
	}

	public String getClear_session() {
		return this.clear_session;
	}

	public Vector getClear_sessions() {
		return this.clear_sessions;
	}

	public String getDjhm() {
		return this.djhm;
	}

	public String getDb() {
		return this.db;
	}

	public String getEscape() {
		return this.escape;
	}

	public String getCode() {
		return this.code;
	}

	public void setWebAppContent(String qryContent) {
		this.webAppContent = qryContent;
		try {
			XmlUtils.skipComments(XmlUtils.getInnerXML(qryContent, "web:page",
					""));
			sql = XmlUtils.getInnerXML(qryContent, "web:sql", "");
			sqlSplit = XmlUtils.getInnerXML(qryContent, "web:sql_split", "##");
			sqls = XmlUtils.split(sql, sqlSplit);
			sqlType = XmlUtils
					.getInnerXML(qryContent, "web:sql_type", "select");
			secType = XmlUtils.getInnerXML(qryContent, "web:secType", "");
			successMsg = XmlUtils.getInnerXML(qryContent, "web:successMsg",
					"操作成功！");
			failMsg = XmlUtils.getInnerXML(qryContent, "web:failMsg", "操作失败！");
			url = XmlUtils.getInnerXML(qryContent, "web:url", "");
			target = XmlUtils.getInnerXML(qryContent, "web:target", "parent");
			pagesize = XmlUtils.StringToInt(XmlUtils.getInnerXML(qryContent,
					"web:pagesize", "0"));
			multiValue = ","
					+ XmlUtils.getInnerXML(qryContent, "web:multiValue", "")
					+ ",";
			template = XmlUtils.getInnerXML(qryContent, "web:template", "");
			clear_session = XmlUtils.getInnerXML(qryContent, "web:clear", "");
			clear_sessions = XmlUtils.split(clear_session, ",");
			djhm = XmlUtils.getInnerXML(qryContent, "web:keyid", "");
			db = XmlUtils.getInnerXML(qryContent, "web:db", "Srv");
			escape = XmlUtils.getInnerXML(qryContent, "web:escape", "");
			code = XmlUtils.getInnerXML(qryContent, "web:code", "");

			if (template == "") {
				template = XmlUtils.getInnerXML(qryContent,
						"web:template_file", "");
				// templateDoc = XmlUtils.openFile(path + "\\template\\" +
				// templateDoc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
