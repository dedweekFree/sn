<web:page>
  <web:sql>contractsavedit</web:sql>
  <web:sql_type>insert</web:sql_type>
  <web:db>Login</web:db>
  <web:multiValue>accountid,accountperiod,invname,vnote,htbh</web:multiValue>
  <web:successMsg>数据保存成功！</web:successMsg>
  <web:failMsg>数据保存失败！</web:failMsg>
  <web:url>contract.aspx</web:url>
  <web:target>parent</web:target>
  <web:template>template/synear/common/message.vm</web:template>
</web:page>