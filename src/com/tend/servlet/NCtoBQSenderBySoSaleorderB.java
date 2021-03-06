package com.tend.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NCtoBQSenderBySoSaleorderB extends BaseDao implements Runnable {

	public NCtoBQSenderBySoSaleorderB() {
		System.out.println("NCtoBQSenderBySoSaleorderB 无参构造函数");
	}

	/**
	 * 自动执行的run方法
	 */
	public void run() {
		try {
			DateLoop("2013-03-02", "2013-03-05",1);
			System.out.println("订单辅表数据抽取完成");
		} catch (Exception e) {
			System.out.println("订单辅表抽取数据异常");
			e.printStackTrace();
		}
	}
	/**
	 * 循环调用的方法
	 * @throws Exception 
	 */
	public void DateLoop(String begindate,String enddate,int days) throws Exception{
		FormatDate mm = new FormatDate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sdf.parse(begindate);
		Date date2 = sdf.parse(enddate);
		Date datetemp = mm.getDateAfterDay(date1, days);
		System.out.println("订单辅表时间区间："+sdf.format(date1)+" to "+sdf.format(datetemp));
		NCtoBQ(sdf.format(date1), sdf.format(datetemp));
		while(mm.dateCompare(datetemp , date2)){
			datetemp = mm.getDateAfterDay(datetemp, days);
			if(mm.dateCompare(date2  ,datetemp )){
				System.out.println("订单辅表时间区间："+sdf.format(mm.getDateAfterDay(datetemp, -days))+" to "+sdf.format(date2));
				NCtoBQ(sdf.format(mm.getDateAfterDay(datetemp, -days)), sdf.format(date2));
			}else{
				System.out.println("订单辅表时间区间："+sdf.format(mm.getDateAfterDay(datetemp, -days))+" to "+sdf.format(datetemp));
				NCtoBQ(sdf.format(mm.getDateAfterDay(datetemp, -days)), sdf.format(datetemp));
			}
		}
	}
	/**
	 * 抽取数据
	 * 
	 * @throws Exception
	 */
	public void NCtoBQ(String beginDate,String endDate) throws Exception {
		Connection conNC = null;
		PreparedStatement pstNC = null;
		ResultSet restNC = null;
		Connection conBQ = null;
		PreparedStatement pstBQ = null;
		ResultSet restBQ = null;
		System.out.println("订单辅表开始抽取数据................");
		System.out.println("开始时间为"+new Timestamp(new Date().getTime()));
		try {
			System.out.println("订单辅表获取连接");
			conNC = this.getConForNC();
			conBQ = this.getConForBQ();
			System.out.println("订单辅表获取连接成功");
			StringBuilder sql = new StringBuilder();
			sql.append("select ");
			sql.append("  BBINDFLAG               ,");
			sql.append("  BDERICTTRANS            ,");
			sql.append("  BLARGESSFLAG            ,");
			sql.append("  BOOSFLAG                ,");
			sql.append("  BRETURNPROFIT           ,");
			sql.append("  BSAFEPRICE              ,");
			sql.append("  BSUPPLYFLAG             ,");
			sql.append("  CADVISECALBODYID        ,");
			sql.append("  CBATCHID                ,");
			sql.append("  CBODYWAREHOUSEID        ,");
			sql.append("  CBOMORDERID             ,");
			sql.append("  CCHANTYPEID             ,");
			sql.append("  CCONSIGNCORPID          ,");
			sql.append("  CCURRENCYTYPEID         ,");
			sql.append("  CFACTORYID              ,");
			sql.append("  CFREEZEID               ,");
			sql.append("  CINVBASDOCID            ,");
			sql.append("  CINVENTORYID            ,");
			sql.append("  CINVENTORYID1           ,");
			sql.append("  CLARGESSROWNO           ,");
			sql.append("  COPERATORID             ,");
			sql.append("  CORDER_BID              ,");
			sql.append("  CPACKUNITID             ,");
			sql.append("  CPRICECALPROC           ,");
			sql.append("  CPRICEITEMID            ,");
			sql.append("  CPRICEITEMTABLE         ,");
			sql.append("  CPRICEPOLICYID          ,");
			sql.append("  CPROLINEID              ,");
			sql.append("  CPROVIDERID             ,");
			sql.append("  CQUOTEUNITID            ,");
			sql.append("  CRECADDRNODE            ,");
			sql.append("  CRECCALBODYID           ,");
			sql.append("  CRECEIPTAREAID          ,");
			sql.append("  CRECEIPTCORPID          ,");
			sql.append("  CRECEIPTTYPE            ,");
			sql.append("  CRECWAREID              ,");
			sql.append("  CROWNO                  ,");
			sql.append("  CSALEID                 ,");
			sql.append("  CSOURCEBILLBODYID       ,");
			sql.append("  CSOURCEBILLID           ,");
			sql.append("  CT_MANAGEBID            ,");
			sql.append("  CT_MANAGEID             ,");
			sql.append("  CUNITID                 ,");
			sql.append("  DCONSIGNDATE            ,");
			sql.append("  DDELIVERDATE            ,");
			sql.append("  FBATCHSTATUS            ,");
			sql.append("  FROWNOTE                ,");
			sql.append("  FROWSTATUS              ,");
			sql.append("  NASTRETPROFNUM          ,");
			sql.append("  NASTTALDCNUM            ,");
			sql.append("  NDISCOUNTMNY            ,");
			sql.append("  NDISCOUNTRATE           ,");
			sql.append("  NEXCHANGEOTOBRATE       ,");
			sql.append("  NITEMDISCOUNTRATE       ,");
			sql.append("  NMNY                    ,");
			sql.append("  NNETPRICE               ,");
			sql.append("  NNUMBER                 ,");
			sql.append("  NORGQTNETPRC            ,");
			sql.append("  NORGQTPRC               ,");
			sql.append("  NORGQTTAXNETPRC         ,");
			sql.append("  NORGQTTAXPRC            ,");
			sql.append("  NORIGINALCURDISCOUNTMNY ,");
			sql.append("  NORIGINALCURMNY         ,");
			sql.append("  NORIGINALCURNETPRICE    ,");
			sql.append("  NORIGINALCURPRICE       ,");
			sql.append("  NORIGINALCURSUMMNY      ,");
			sql.append("  NORIGINALCURTAXMNY      ,");
			sql.append("  NORIGINALCURTAXNETPRICE ,");
			sql.append("  NORIGINALCURTAXPRICE    ,");
			sql.append("  NPACKNUMBER             ,");
			sql.append("  NPRICE                  ,");
			sql.append("  NQTNETPRC               ,");
			sql.append("  NQTORGNETPRC            ,");
			sql.append("  NQTORGPRC               ,");
			sql.append("  NQTORGTAXNETPRC         ,");
			sql.append("  NQTORGTAXPRC            ,");
			sql.append("  NQTPRC                  ,");
			sql.append("  NQTTAXNETPRC            ,");
			sql.append("  NQTTAXPRC               ,");
			sql.append("  NQUOTEUNITNUM           ,");
			sql.append("  NQUOTEUNITRATE          ,");
			sql.append("  NRETPROFMNY             ,");
			sql.append("  NRETPROFNUM             ,");
			sql.append("  NRETURNTAXRATE          ,");
			sql.append("  NSUMMNY                 ,");
			sql.append("  NTALDCMNY               ,");
			sql.append("  NTALDCNUM               ,");
			sql.append("  NTAXMNY                 ,");
			sql.append("  NTAXNETPRICE            ,");
			sql.append("  NTAXPRICE               ,");
			sql.append("  NTAXRATE                ,");
			sql.append("  PK_CORP                 ,");
			sql.append("  TCONSIGNTIME            ,");
			sql.append("  TDELIVERTIME            ,");
			sql.append("  TS                      ,");
			sql.append("  VEDITREASON             ,");
			sql.append("  VRECEIVEADDRESS,           ");
			sql.append("  DR           ");
			sql.append("  from so_saleorder_b sb");
			sql.append("  where sb.csaleid in (select s.csaleid from so_sale s ");
			sql.append("  where s.ts >= '").append(beginDate+"'");
			sql.append("  and s.ts <= '").append(endDate+"'");
			sql.append("  and s.pk_corp != '1020'");
			sql.append("  and s.pk_corp != '1021'");
			sql.append("  and s.pk_corp != '1023'");
			sql.append("  and s.pk_corp != '1024'");
			sql.append("  and s.pk_corp != '1032' )");
			//System.out.println("查询sql:"+sql);
			pstNC = conNC.prepareStatement(sql.toString());
			restNC = pstNC.executeQuery();
			ResultSetMetaData rsmd = restNC.getMetaData();
			int resultcount = rsmd.getColumnCount();
			
			while(restNC.next()){
				StringBuilder insetSql = new StringBuilder();
				insetSql.append("insert into ODS_SO_SALEORDER_B ( ");
				insetSql.append("  BBINDFLAG               ,");
				insetSql.append("  BDERICTTRANS            ,");
				insetSql.append("  BLARGESSFLAG            ,");
				insetSql.append("  BOOSFLAG                ,");
				insetSql.append("  BRETURNPROFIT           ,");
				insetSql.append("  BSAFEPRICE              ,");
				insetSql.append("  BSUPPLYFLAG             ,");
				insetSql.append("  CADVISECALBODYID        ,");
				insetSql.append("  CBATCHID                ,");
				insetSql.append("  CBODYWAREHOUSEID        ,");
				insetSql.append("  CBOMORDERID             ,");
				insetSql.append("  CCHANTYPEID             ,");
				insetSql.append("  CCONSIGNCORPID          ,");
				insetSql.append("  CCURRENCYTYPEID         ,");
				insetSql.append("  CFACTORYID              ,");
				insetSql.append("  CFREEZEID               ,");
				insetSql.append("  CINVBASDOCID            ,");
				insetSql.append("  CINVENTORYID            ,");
				insetSql.append("  CINVENTORYID1           ,");
				insetSql.append("  CLARGESSROWNO           ,");
				insetSql.append("  COPERATORID             ,");
				insetSql.append("  CORDER_BID              ,");
				insetSql.append("  CPACKUNITID             ,");
				insetSql.append("  CPRICECALPROC           ,");
				insetSql.append("  CPRICEITEMID            ,");
				insetSql.append("  CPRICEITEMTABLE         ,");
				insetSql.append("  CPRICEPOLICYID          ,");
				insetSql.append("  CPROLINEID              ,");
				insetSql.append("  CPROVIDERID             ,");
				insetSql.append("  CQUOTEUNITID            ,");
				insetSql.append("  CRECADDRNODE            ,");
				insetSql.append("  CRECCALBODYID           ,");
				insetSql.append("  CRECEIPTAREAID          ,");
				insetSql.append("  CRECEIPTCORPID          ,");
				insetSql.append("  CRECEIPTTYPE            ,");
				insetSql.append("  CRECWAREID              ,");
				insetSql.append("  CROWNO                  ,");
				insetSql.append("  CSALEID                 ,");
				insetSql.append("  CSOURCEBILLBODYID       ,");
				insetSql.append("  CSOURCEBILLID           ,");
				insetSql.append("  CT_MANAGEBID            ,");
				insetSql.append("  CT_MANAGEID             ,");
				insetSql.append("  CUNITID                 ,");
				insetSql.append("  DCONSIGNDATE            ,");
				insetSql.append("  DDELIVERDATE            ,");
				insetSql.append("  FBATCHSTATUS            ,");
				insetSql.append("  FROWNOTE                ,");
				insetSql.append("  FROWSTATUS              ,");
				insetSql.append("  NASTRETPROFNUM          ,");
				insetSql.append("  NASTTALDCNUM            ,");
				insetSql.append("  NDISCOUNTMNY            ,");
				insetSql.append("  NDISCOUNTRATE           ,");
				insetSql.append("  NEXCHANGEOTOBRATE       ,");
				insetSql.append("  NITEMDISCOUNTRATE       ,");
				insetSql.append("  NMNY                    ,");
				insetSql.append("  NNETPRICE               ,");
				insetSql.append("  NNUMBER                 ,");
				insetSql.append("  NORGQTNETPRC            ,");
				insetSql.append("  NORGQTPRC               ,");
				insetSql.append("  NORGQTTAXNETPRC         ,");
				insetSql.append("  NORGQTTAXPRC            ,");
				insetSql.append("  NORIGINALCURDISCOUNTMNY ,");
				insetSql.append("  NORIGINALCURMNY         ,");
				insetSql.append("  NORIGINALCURNETPRICE    ,");
				insetSql.append("  NORIGINALCURPRICE       ,");
				insetSql.append("  NORIGINALCURSUMMNY      ,");
				insetSql.append("  NORIGINALCURTAXMNY      ,");
				insetSql.append("  NORIGINALCURTAXNETPRICE ,");
				insetSql.append("  NORIGINALCURTAXPRICE    ,");
				insetSql.append("  NPACKNUMBER             ,");
				insetSql.append("  NPRICE                  ,");
				insetSql.append("  NQTNETPRC               ,");
				insetSql.append("  NQTORGNETPRC            ,");
				insetSql.append("  NQTORGPRC               ,");
				insetSql.append("  NQTORGTAXNETPRC         ,");
				insetSql.append("  NQTORGTAXPRC            ,");
				insetSql.append("  NQTPRC                  ,");
				insetSql.append("  NQTTAXNETPRC            ,");
				insetSql.append("  NQTTAXPRC               ,");
				insetSql.append("  NQUOTEUNITNUM           ,");
				insetSql.append("  NQUOTEUNITRATE          ,");
				insetSql.append("  NRETPROFMNY             ,");
				insetSql.append("  NRETPROFNUM             ,");
				insetSql.append("  NRETURNTAXRATE          ,");
				insetSql.append("  NSUMMNY                 ,");
				insetSql.append("  NTALDCMNY               ,");
				insetSql.append("  NTALDCNUM               ,");
				insetSql.append("  NTAXMNY                 ,");
				insetSql.append("  NTAXNETPRICE            ,");
				insetSql.append("  NTAXPRICE               ,");
				insetSql.append("  NTAXRATE                ,");
				insetSql.append("  PK_CORP                 ,");
				insetSql.append("  TCONSIGNTIME            ,");
				insetSql.append("  TDELIVERTIME            ,");
				insetSql.append("  TS                      ,");
				insetSql.append("  VEDITREASON             ,");
				insetSql.append("  VRECEIVEADDRESS        , ");
				insetSql.append("  DR        ) values (    ");
					for (int i = 1; i <= resultcount; i++) {
						
						if(rsmd.getColumnType(i)==1 ||rsmd.getColumnType(i)==12){
							if(null == restNC.getString(i) || restNC.getString(i).isEmpty()){
								insetSql.append("''");
							}else{
								insetSql.append("'").append(restNC.getString(i)).append("'");
							}
							if(i<resultcount){
								insetSql.append(",");
							}
						}else{
							insetSql.append(restNC.getDouble(i));
							if(i<resultcount){
								insetSql.append(",");
							}
						}
					}
					insetSql.append(")");
					//System.out.println(insetSql);
					try {
						//执行存入数据
						pstBQ = conBQ.prepareStatement(insetSql.toString());
						boolean result = pstBQ.execute();
						if(!result){
							//System.out.println("保存成功");
						}else{
							//System.out.println("保存失败");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						try{
							if(pstBQ!=null){
								pstBQ.close();
							}
						}catch(Exception e){
							e.printStackTrace();
						}
					}
			 }                                                         
			System.out.println("订单辅表数据抽取完毕");
			System.out.println("结束时间为"+new Timestamp(new Date().getTime()));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("订单辅表NC connection close");
			BaseDao.closeAll(pstNC, restNC, conNC);
			System.out.println("订单辅表NC connection closed");
			
			System.out.println("订单辅表BQ connection close");
			BaseDao.closeAll(pstBQ, restBQ, conBQ);
			System.out.println("订单辅表BQ connection closed");
		}

	}
}
