/* ---- :: Opener ListBox a değer ekle :: ------------------------------------------------------------------------ */

/* 
ElementType = Atama yapılacak kontorlün bilgil  "Text" or "List"
ListBoxId = Item ı Alınacak Listbox Id
OpenerListBoxId = Atama Yapılacak Openerdaki Listbox Id 
*/

function OpenerListInsert(ElementType,ListBoxId,ElementId) {
	if (window.opener && !window.opener.closed)
	{
		
		if (document.getElementById(ListBoxId).selectedIndex>-1) {
		    for (var j = 0; j<document.getElementById(ListBoxId).length; j++) {
		    
		        if (document.getElementById(ListBoxId).options[j].selected) {		        
		
			            var lbText = document.getElementById(ListBoxId).options[j].text
			            var lbValue = document.getElementById(ListBoxId).options[j].value
            			
			            if (lbValue=='(all)') {
            			    
                            for (var i = 1; i<document.getElementById(ListBoxId).length; i++) {
                                opener.SetValue(ElementType,ElementId,document.getElementById(ListBoxId).options[i].text,document.getElementById(ListBoxId).options[i].value);
                            }
            			    
			            }
			            else {
			                opener.SetValue(ElementType,ElementId,lbText,lbValue);
			            }
			            		            
                }//(document.getElementById(ListBoxId).options[j].selected)
    			
		    }//for(var j = 0; i<document.getElementById(ListBoxId).length; j++)
						
            alert("Seçtiğiniz Ürünler Listeye Eklendi!");
						
		} //(document.getElementById(ListBoxId).selectedIndex>-1)
		else
		{
			alert("Lütfen Kayıt Seçiniz")
		}    	
		
	}
}

function SwapItem(SourceID, DestinationID, TextBoxID, Limit) {	
	if (document.getElementById(SourceID).selectedIndex>-1) {
	    for (var j = 0; j<document.getElementById(SourceID).length; j++) {
	    
	        if (document.getElementById(SourceID).options[j].selected) {		        
	
		        var lbText = document.getElementById(SourceID).options[j].text;
		        var lbValue = document.getElementById(SourceID).options[j].value;

                if ((lbValue.indexOf('_||') != -1) && (document.getElementById(DestinationID).length > 0)) {
                    if (!PositionControl(DestinationID, Left(lbValue, 1))) {
                        alert("Lütfen seçtiğiniz pozisyonlara uygun bir pozisyon seçiniz");
                        return false;
                    }
                }

                if (Limit != null) {
                    if (document.getElementById(DestinationID).length >= Limit) { 
                        alert("En çok " + Limit + " kayıt ekleyebilirsiniz");
                        return false;
                    }
                }

                var NewItem = new Option(lbText,lbValue);
                document.getElementById(DestinationID).options[document.getElementById(DestinationID).length] = NewItem;

            }
			
	    }
	    
	    RemoveSelected(SourceID);
	}
	else if ((document.getElementById(TextBoxID)!=null) && (document.getElementById(TextBoxID).value.length > 0)) {
	    var NewItem = new Option(document.getElementById(TextBoxID).value,"__" + document.getElementById(TextBoxID).value);
        document.getElementById(DestinationID).options[document.getElementById(DestinationID).length] = NewItem;
        document.getElementById(TextBoxID).value = '';
	}
	else {
		alert("Lütfen Kayıt Seçiniz")
	}
}

function PositionControl(DestinationID, Type) {
    if (Left(document.getElementById(DestinationID).options[0].value, 1) != Type) {
        return false;
    }
    return true;
}

function RemoveSelected(SourceID) {
    for (var j = 0; j<document.getElementById(SourceID).length; j++) {
        if (document.getElementById(SourceID).options[j].selected) {
            document.getElementById(SourceID).remove(j);
            j = j - 1;
        }
    }
    return true;
}



/* ---- :: ListBox a popuptan gelen değerleri ekle :: ------------------------------------------------------------------------ */

/* 
ListBoxId = Değer atılacak ListBoxId
Text = Item Texti
Value = Item Value
*/

function SetValue(ElementType,ElementId,Text,Value) {
	
	var AddCtrl = true
	
	if (ElementType=="Text") {
    	document.getElementById(ElementId).value = Value
	}
	else if (ElementType=="List") {        
	    
	    for (var i = 0; i<document.getElementById(ElementId).length; i++) {
	    
	        if (document.getElementById(ElementId).options[i].value == Value) {
	            AddCtrl = false;
	        }
	        
	    }
	    
	    if (AddCtrl) {
            var yeni = new Option(Text,Value);
            document.getElementById(ElementId).options[document.getElementById(ElementId).length] = yeni;
	    }	    
	    //document.getElementById(ElementId).options[document.getElementById(ElementId).length-1].selected = true;		    	    
	}	
}



/* ---- :: ListBoxtakilerin tümünü seç :: ------------------------------------------------------------------------ */

function SelectAllListBox(ListBoxIds) {
    var arr = new Array();
    var ListBoxId = "";
    
    arr = ListBoxIds.split(",");
    for (x=0; x<arr.length; x++) {
        ListBoxId = arr[x];
        for (i=0;i<document.getElementById(ListBoxId).length;i++) {
            document.getElementById(ListBoxId).options[i].selected = true;
        }
    }
    return false;
}


/* ---- :: ListBoxtaki seçili satırları çıkar :: ------------------------------------------------------------------------ */

/* 
ListBoxId = İşlem Yapılacak ListBoxId
*/
function RemoveItems(ListboxId) {

	for (i=0; i<document.getElementById(ListboxId).length; i++) {
		if (document.getElementById(ListboxId).options[i].selected) {
			document.getElementById(ListboxId).remove(i);
			i = i-1;
		}
	}
	
}

function OtherDown (ddlID, OtherID) {
    var ddl =  $get(ddlID);
    for (var j = 0; j<ddl.length; j++) {
        if (ddl.options[j].value == OtherID) {
            TmpItem = ddl.options[j];
            ddl.remove(j);
            j = j - 1;
        }
    }
    ddl.options[ddl.length] = TmpItem;
}