//1.�ж�selectѡ���� �Ƿ����Value="paraValue"��Item
//2.��selectѡ���� ����һ��Item
//3.��selectѡ���� ɾ��һ��Item
//4.�޸�selectѡ���� value="paraValue"��textΪ"paraText"
//5.����select��text="paraText"�ĵ�һ��ItemΪѡ��
//6.����select��value="paraValue"��ItemΪѡ��
//7.�õ�select�ĵ�ǰѡ�����value
//8.�õ�select�ĵ�ǰѡ�����text
//9.�õ�select�ĵ�ǰѡ�����Index
//10.���select����
//1.�ж�selectѡ���� �Ƿ����Value="paraValue"��Item
//-------------------------------------------
function jsSelectIsExitItem(objSelect,objItemValue)
{
     var isExit = false;
     for(var i=0;i<objSelect.options.length;i++)
     {
         if(objSelect.options[i].value == objItemValue)
         {
             isExit = true;
             break;
         }
     }      
     return isExit;
}

//2.��selectѡ���� ����һ��Item
function jsAddItemToSelect(objSelect,objItemText,objItemValue)
{
     //�ж��Ƿ����
     if(jsSelectIsExitItem(objSelect,objItemValue))
     {
         alert("��Item��Valueֵ�Ѿ�����");
     }
     else
     {
         var varItem = new Option(objItemText,objItemValue);
//       objSelect.options[objSelect.options.length] = varItem;
         objSelect.options.add(varItem);
         alert("�ɹ�����");
     }    
}

//3.��selectѡ���� ɾ��һ��Item
function jsRemoveItemFromSelect(objSelect,objItemValue)
{
     //�ж��Ƿ����
     if(jsSelectIsExitItem(objSelect,objItemValue))
     {
         for(var i=0;i<objSelect.options.length;i++)
         {
             if(objSelect.options[i].value == objItemValue)
             {
                 objSelect.options.remove(i);
                 break;
             }
         }        
         alert("�ɹ�ɾ��");            
     }
     else
     {
         alert("��select�� �����ڸ���");
     }    
}

//4.�޸�selectѡ���� value="paraValue"��textΪ"paraText"
function jsUpdateItemToSelect(objSelect,objItemText,objItemValue)
{
     //�ж��Ƿ����
     if(jsSelectIsExitItem(objSelect,objItemValue))
     {
         for(var i=0;i<objSelect.options.length;i++)
         {
             if(objSelect.options[i].value == objItemValue)
             {
                 objSelect.options[i].text = objItemText;
                 break;
             }
         }        
         alert("�ɹ��޸�");            
     }
     else
     {
         alert("��select�� �����ڸ���");
     }    
}
        
//5.����select��text="paraText"�ĵ�һ��ItemΪѡ��
function jsSelectItemByValue(objSelect,objItemText)
{    
     //�ж��Ƿ����
     var isExit = false;
     for(var i=0;i<objSelect.options.length;i++)
     {
         if(objSelect.options[i].text == objItemText)
         {
             objSelect.options[i].selected = true;
             isExit = true;
             break;
         }
     }      
     //Show�����
     if(isExit)
     { 
         alert("�ɹ�ѡ��");            
     }
     else
     {
         alert("��select�� �����ڸ���");
     }    
}

//6.����select��value="paraValue"��ItemΪѡ��
//document.all.objSelect.value = objItemValue;

//7.�õ�select�ĵ�ǰѡ�����value
//var currSelectValue = document.all.objSelect.value;

//8.�õ�select�ĵ�ǰѡ�����text
//var currSelectText = document.all.objSelect.options[document.all.objSelect.selectedIndex].text;

//9.�õ�select�ĵ�ǰѡ�����Index
//var currSelectIndex = document.all.objSelect.selectedIndex;

//10.���select����
// document.all.objSelect.options.length = 0; 


������ת���������Ӫ��http://www.xrss.cn/Dev/Other/200781615714.Html