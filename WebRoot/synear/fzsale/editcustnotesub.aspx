<web:page>
  <web:sql>updatecustnote</web:sql>
  <web:sql_type>update</web:sql_type>
  <web:multiValue>itemcode,itemdesc,itemspec,nnum,sty,nty,twe,oth,ttop,pk_invcl</web:multiValue>
  <web:db>Login</web:db>
  <web:successMsg>数据保存成功！</web:successMsg>
  <web:failMsg>数据保存失败！</web:failMsg>
  <web:url>custnote.aspx</web:url>
  <web:target>parent</web:target>
  <web:template>template/synear/common/custnotesave.vm</web:template>
</web:page>