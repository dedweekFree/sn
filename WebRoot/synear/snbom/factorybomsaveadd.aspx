<web:page>
  <web:sql>snfactorybomsaveadd</web:sql>
  <web:sql_type>insert</web:sql_type>
  <web:db>Login</web:db>
  <web:multiValue>pk_invbasdoc,bomid,bbomid</web:multiValue>
  <web:successMsg>数据保存成功！</web:successMsg>
  <web:failMsg>数据保存失败！</web:failMsg>
  <web:url>factorybomset.aspx</web:url>
  <web:target>parent</web:target>
  <web:template>template/synear/common/message.vm</web:template>
</web:page>