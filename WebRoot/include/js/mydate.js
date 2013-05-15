var dateidCtrlSave;
var swjgselect;

function followControl(idCtrl, idDiv){
	idDiv.style.position='absolute';
	idDiv.style.left=idCtrl.getBoundingClientRect().left+document.body.scrollLeft;
	idDiv.style.top=idCtrl.getBoundingClientRect().bottom+document.body.scrollTop;
}

function dateClick(){
	dateidCtrlSave.value=''+datePicker.year+'-'+datePicker.month+'-'+datePicker.day;
	datePicker.style.display='none';
	/*if (swjgselect!=null)
	{
		swjgselect.style.display='';
	}
    */
}
function dateShow(idCtrl,idswjg){
	datePicker.style.display='block';
	dateidCtrlSave=idCtrl;
	swjgselect=idswjg;
	/*
	if (idswjg!=null)
	{
		idswjg.style.display='none';
	}*/
	followControl(idCtrl,datePicker);
	//idCtrl.value=formatDateString(new Date())
}
document.write('<div id=datePicker style="behavior:url(\'/include/js/calendar.htc\');width:220;height:200;border:0px solid black;display:none" onchange="dateClick()"></div>');