<web:page>
  <web:sql>snsendmanagersavedit</web:sql>
  <web:sql_type>insert</web:sql_type>
  <web:db>Login</web:db>
  <web:multiValue>ordercode,receiptaddress,drivertype,nnumber,drivercorp,csaleid,taudittime,custname</web:multiValue>
  <web:successMsg>数据保存成功！</web:successMsg>
  <web:failMsg>数据保存失败！</web:failMsg>
  <web:url>snsendmanager.aspx</web:url>
  <web:target>parent</web:target>
  <web:template>template/synear/common/messagedriver.vm</web:template>
</web:page>