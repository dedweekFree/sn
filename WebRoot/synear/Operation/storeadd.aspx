
<web:page>
  <web:sql>insertstore</web:sql>
  <web:sql_type>insert</web:sql_type>
  <web:db>Login</web:db>
   <web:multiValue>storename,storeid,pk_corp,custnameid</web:multiValue>
  <web:successMsg>数据保存成功！</web:successMsg>
  <web:failMsg>数据保存失败！</web:failMsg>
 
  <web:template>template/synear/Operation/store.vm</web:template>
</web:page>