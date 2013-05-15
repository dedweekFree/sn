var activeMenu = null;
var t;

////////////////////////////////////////////////////////
//If you wan't different colors than default overload these functions...
function menuItemHighlight(el) {
	el.style.background = "highlight";
	el.style.color = "highlighttext";
}

function menuItemNormal(el) {
	el.style.background = "";
	el.style.color = "";
}

function raiseButton(el) {
	el.style.borderTop ="1 solid buttonhighlight";
	el.style.borderLeft ="1 solid buttonhighlight";
	el.style.borderBottom ="1 solid buttonshadow";
	el.style.borderRight ="1 solid buttonshadow";
	el.style.padding ="1";
	el.style.paddingLeft = "7";
	el.style.paddingRight = "7";
}

function normalButton(el) {
	el.style.border = "1 solid buttonface";
	el.style.padding ="1";
	el.style.paddingLeft = "7";
	el.style.paddingRight = "7";
}

function pressedButton(el) {
	el.style.borderTop ="1 solid buttonshadow";
	el.style.paddingTop = "2";
	el.style.borderLeft ="1 solid buttonshadow";
	el.style.paddingLeft = "8";
	el.style.borderBottom ="1 solid buttonhighlight";
	el.style.paddingBottom= "0";
	el.style.borderRight = "1 solid buttonhighlight";
	el.style.paddingRight = "6";
}
//...untill here
////////////////////////////////////////////////////////

function getMenuItem(el) {
	temp = el;
	while ((temp!=null) && (temp.tagName!="TABLE") && (temp.id!="menubar") && (temp.id!="menu") && (temp.id!="handle")) {
		//if ((temp.tagName=="TR") || (temp.className=="root"))
			el = temp;
		temp = temp.parentElement;
	}
	return el;
}

function menuClick() {
	if (event.srcElement == null) return;
	var el=getMenuItem(event.srcElement);
	if (el.id=="handle1") return;
	if (el.id=="help") {
		helpclick();
	}else if (el.id=="exit"){
        window.location.replace("index.jsp");
	}else if (el.id=="pass"){
        view.location.href="server/pass/";
       //view.location.replace("/scroll.htm");
	}else{
	    window.location.replace("Switch?mklx="+el.id);
	}
}

////////////////////////////////////////////////////////
// Used to hide the menu when clicked elsewhere
////////////////////////////////////////////////////////
function menuOver() {
	if ((event.fromElement == null) || (event.toElement == null) || (event.fromElement == event.toElement))	return;
	var fromEl = getMenuItem(event.fromElement);
	var toEl = getMenuItem(event.toElement);
	if (fromEl == toEl)	return;
	if ((toEl.className != "disabled") && (toEl.id != "menubar")){
		if (toEl.className == "root") {
			if (activeMenu) {
				if (toEl.menu != activeMenu) {
					//cleanUpMenuBar();
					pressedButton(toEl);
					toggleMenu(toEl);
				}
			}else {
				raiseButton(toEl);
			}
		}
		else {
			if ((fromEl != toEl) && (toEl.tagName != "TABLE")){
				cleanup(toEl.parentElement.parentElement, false);
				menuItemHighlight(toEl);
				toEl.parentElement.parentElement.activeItem = toEl;
			}
		}
	}
}

function menuOut() {
	if ((event.fromElement == null) || (event.toElement == null) || (event.fromElement == event.toElement))	return;
	var fromEl = getMenuItem(event.fromElement);
	var toEl = getMenuItem(event.toElement);
	if (fromEl == toEl)	return;
	if (fromEl.className == "root"){
		if (activeMenu) {
			if (fromEl.menu != activeMenu)	normalButton(fromEl);
		}else
			normalButton(fromEl);
	}
}

function helpclick(){
   window.open('help/main.htm','help_window','location=no,menubar=no,status=no,titlebar=no,toolbar=no,directories=no,scrollbars=no,resizable=yes');
   return true;
}

/////////////////////////////////////////////////////////////////////////////
// The rest is just for the moving/docking
var dragObject = null;
var ty;
/////////////////////////////////////////////////////////////////////////////
// Fixing sizes and positions
window.onload=fixSize;
window.onresize=fixSize;
function iFrameCheck(){
	var appver=navigator.appVersion;
	return (parseFloat(appver.substr(appver.indexOf('MSIE')+5))>=5.5?1:0);
}
var iFrameCheckOK=iFrameCheck();

function fixSize() {
	menu.style.border = "0 solid ";
	menu.style.width = "100%";
	menu.style.top = 0;
	menu.style.left = 0;
	outerDiv.style.top = menu.offsetHeight;
	if (document.body.clientHeight - menu.offsetHeight >= 1){
		outerDiv.style.height = document.body.clientHeight - menu.offsetHeight;
	}
	else
		outerDiv.style.height = 1;
}
/////////////////////////////////////////////////////////////////////////////
function document.onmousedown() {
	if((window.event.srcElement.id=="handle"||window.event.srcElement.id=="handle1")&& iFrameCheckOK) {
		dragObject = menu;//document.all[window.event.srcElement.getAttribute("for")];
		//Restore();	Hide the menus while While Menu focus moving
		ty = (window.event.clientY - dragObject.style.pixelTop);
		window.event.returnValue = false;
		window.event.cancelBubble = true;
		window.event.srcElement.setCapture(true);
	}
	else {
		dragObject = null;
	}	
}

function document.onmouseup() {
	if(dragObject) {
		dragObject = null;
		document.releaseCapture();
	}
}

function selectstart(){
	window.event.cancelBubble = true;
	window.event.returnValue = false;
	return false;
}

function menuCreate(htmlLogo,cbFun){
	var hMenu,hMenuBar,hGrab,hEnd;

	hMenu=document.createElement('TABLE');
	hMenu.id='menu';
	hMenu.cellSpacing=1;
	hMenu.cellPadding=1;
	hMenu.onselectstart='return false';
	hMenu.onmouseover=menuOver;
	hMenu.onmouseout=menuOut;
	hMenu.onclick=menuClick;

	hMenuBar=hMenu.insertRow(-1);
	hMenuBar.id='menubar';
	
	hGrab=hMenuBar.insertCell(-1);
	hGrab.className='disabled';
	hGrab.style.paddingLeft=0;
	hGrab.style.paddingRight=1;
	hGrab.innerHTML='<div class="disabled" id="handle" style="left: 3; width: 3; height: 100%" title="Move me!"></div>';
	
	hEnd=hMenuBar.insertCell(-1);
	hEnd.id='handle1';
	hEnd.className='disabled';
	hEnd.noWrap=true;
	hEnd.width='100%';
	hEnd.align='right';
	
	document.body.appendChild(hMenu);
	return hMenu;
}

function menuCreatePopup(hMenu,dlzt,menuIcon,menuText){
	var hNewMenu,hMenuPopup;

	hNewMenu=hMenu.rows(0).insertCell(hMenu.rows(0).cells.length-1);
	hNewMenu.noWrap=true;
	hNewMenu.className='root';
	hNewMenu.innerHTML=(menuIcon.length?'<img src="'+menuIcon+'">':'')+'&nbsp;';
	hNewMenu.appendChild(document.createTextNode(menuText));
	hNewMenu.id=dlzt;

	hMenuPopup=document.createElement('TABLE');
	hMenuPopup.cellSpacing=0;
	hMenuPopup.className='menu';
	hMenuPopup.style.visibility='hidden';
	hNewMenu.appendChild(hMenuPopup);
	return hMenuPopup;
}
