<web:page>
  <web:sql>insertAreaFeeApply</web:sql>
  <web:sql_type>insert</web:sql_type>
  <web:db>Login</web:db>
  <web:multiValue>F_deptcode,F_prodpk,F_pfee,F_pmemo</web:multiValue>
  <web:successMsg>数据保存成功！</web:successMsg>
  <web:failMsg>数据保存失败！</web:failMsg>
  <web:url>areafeeapplyok.aspx</web:url>
  <web:target>parent</web:target>
  <web:template>template/synear/common/message.vm</web:template>
</web:page>