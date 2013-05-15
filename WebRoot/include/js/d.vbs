Dim dx1,dx2
dx1=Null
dx2=Null

Function d(obj1)
  If obj1.style.display="" Then
    obj1.style.display="none"
  Else
    obj1.style.display=""
  End If
End Function

Function di(obj1,obj2)
  If obj1.style.display="" Then
    obj1.style.display="none"
    obj2.src="images/tree/close.gif"
  Else
    obj1.style.display=""
    obj2.src="images/tree/open.gif"
	'obj1.style.color="#ff0000"
  End If
End Function

Function dli(obj1,obj2)
	If isNull(dx1) Then
		di obj1,obj2
		Set dx1=obj1
		Set dx2=obj2		
	Else
		If obj1.id=dx1.id Then
			di obj1,obj2
			Set dx1=obj1
			Set dx2=obj2
		Else
			dx1.style.display="none"
			dx2.src="images/tree/close.gif"
			Set dx1=obj1
			Set dx2=obj2
			obj1.style.display=""
			obj2.src="images/tree/open.gif"
		End If
	End If 
End Function