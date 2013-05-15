// 截获鼠标按下的事件
//if (window.Event) document.captureEvents(Event.MOUSEUP); 

// 屏蔽浏览器显示源码的事件
//function nocontextmenu() 
//{
//	event.cancelBubble = true
//	event.returnValue = false;
//	return false;
//}

// 屏蔽鼠标右击事件
//function norightclick(e) 
//{
//	if (window.Event) 
//	{
//		if (e.which == 2 || e.which == 3)
//		return false;
//	}
//	else	if (event.button == 2 || event.button == 3)
//	{
//		event.cancelBubble = true
//		event.returnValue = false;
//		return false;
//	}
//}

//document.oncontextmenu = nocontextmenu; // for IE5+
//document.onmousedown = norightclick; // for all others
