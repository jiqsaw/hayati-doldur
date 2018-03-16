// JScript File
/* ---- :: Left Fonksiyonu :: ------------------------------------------------------------------------- */

function $get(eID) {
    return document.getElementById(eID);
}

/*
str = Kelime
n = Soldan Kaç Karakter ?
*/
function Left(str, n){
	if (n <= 0)
	    return "";
	else if (n > String(str).length)
	    return str;
	else
	    return String(str).substring(0,n);
}



/* ---- :: Right Fonksiyonu :: ------------------------------------------------------------------------ */

/* 
str = Kelime
n = Sağdan Kaç Karakter ?
*/
function Right(str, n){
    if (n <= 0)
       return "";
    else if (n > String(str).length)
       return str;
    else {
       var iLen = String(str).length;
       return String(str).substring(iLen, iLen - n);
    }
}


/* ---- :: Giriş Sayfası Yap Fonksiyonu :: ------------------------------------------------------------------------ */
/* 
this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.link.com')
*/

/* ---- :: Favorilere Ekle Fonksiyonu :: ------------------------------------------------------------------------ */

/* 
Link = Link
Title = Görüntülenen Başlık
*/
function AddFavorites(Link, Title) {
	window.external.AddFavorite(Link, Title)
}


/* ---- :: Randum Numara Üretme :: ------------------------------------------------------------------------ */

/* 
MaxNumber = Kaça kadar bir sayı tutsun 
*/
function RandomNumber(MaxNumber) {
	return Math.floor(Math.random() * MaxNumber +1);
}


function Trim(str, chars) {
    return ltrim(rtrim(str, chars), chars);
}

function Ltrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}

function Rtrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

function RdListSelectedValue(RadiButtonListID) {
	var obj = document.forms[0][RadiButtonListID];
	for (i=0;i<obj.length;i++) {
		if (obj[i].checked) {
			return obj[i].value;
		}
	}
	return -1;
}

function ddlSelectedValue(ddlID) {
    return $get(ddlID).options[$get(ddlID).selectedIndex].value;
}


function ClsChng(eID, ClassName) {
    $get(eID).className = ClassName;
}


/* 
eID = ElementID
*/
function ShowHide(eID) {
    if ($get(eID).style.display == 'none')
        $get(eID).style.display = '';
    else
        $get(eID).style.display = 'none';
}

/* 
eShowID = ElementID
eHideID = ElementID
*/
function ShowHideChng(eShowID, eHideID) {
    $get(eShowID).style.display = '';
    $get(eHideID).style.display = 'none';
}

function txtInitial(eID, ClassName, Text) {
    $get(eID).className = ClassName;
    $get(eID).value = Text;
}

/* 
chListID = CheckBoxList ID
ItemCount = Item Sayısı
*/
function ChListRequired(chListID, ItemCount) {
    for (i = 0; i < ItemCount; i++) {
        if ($get(chListID + '_' + i).checked)
            return true;
    }
    return false;
}

String.prototype.toUpperCaseTr = function() {

    var str = [];
    for (var i = 0; i < this.length; i++) {
        var ch = this.charCodeAt(i);
        var c = this.charAt(i);
        if (ch == 105) str.push('İ');
        else if (ch == 305) str.push('I');
        else if (ch == 287) str.push('Ğ');
        else if (ch == 252) str.push('Ü');
        else if (ch == 351) str.push('Ş');
        else if (ch == 246) str.push('Ö');
        else if (ch == 231) str.push('Ç');
        else if (ch >= 97 && ch <= 122) str.push(c.toUpperCase());
        else str.push(c);
    }
    return str.join('');
}



String.prototype.toLowerCaseEn = function() {

    var str = [];
    for (var i = 0; i < this.length; i++) {
        var ch = this.charCodeAt(i);
        var c = this.charAt(i);
        if (ch == 286) str.push('g');
        else if (ch == 220) str.push('u');
        else if (ch == 350) str.push('s');
        else if (ch == 214) str.push('o');
        else if (ch == 199) str.push('c');
        else str.push(c.toLowerCase());
        //else str.push(c);
    }
    return str.join('');
}


function getWindowHeight() {
    var windowHeight = 0;
    if (typeof (window.innerHeight) == 'number') {
        windowHeight = window.innerHeight;
    }
    else {
        if (document.documentElement && document.documentElement.clientHeight) {
            windowHeight = document.documentElement.clientHeight;
        }
        else {
            if (document.body && document.body.clientHeight) {
                windowHeight = document.body.clientHeight;
            }
        }
    }
    return windowHeight;
}

function setFooter() {
    if (document.getElementById) {
        var windowHeight = getWindowHeight();
        if (windowHeight > 0) {
            var contentHeight = document.getElementById('Container').offsetHeight;
            var footerElement = document.getElementById('Footer');
            var footerHeight = footerElement.offsetHeight;
            if (windowHeight - (contentHeight + footerHeight) >= 0) {
                footerElement.style.top = (windowHeight - (contentHeight + footerHeight)) + 'px';
            }
            else {
                footerElement.style.top = '0px';
            }
            footerElement.style.filter = 'alpha(opacity:100)';
            footerElement.style.opacity = 1;
        }
    }
}

function go(URL) {
    location.href = URL;
}

function CheckChange(eID) {
    $get(eID).checked = !$get(eID).checked;
}

function FormReset() {
    theForm.reset();
    return false;
}

function Show(eID) {
    $get(eID).style.display = 'block';
}

function Hide(eID) {
    $get(eID).style.display = 'none';
}

function Shows(eIDs) {
    if (eIDs.length > 0) {
        var arr = eIDs.split(",");
        for (var i = 0; i < arr.length; i++) {
            Show(arr[i]);
        } 
    }
}

function Hides(eIDs) {
    if (eIDs.length > 0) {
        var arr = eIDs.split(",");
        for (var i = 0; i < arr.length; i++) {
            Hide(arr[i]);
        } 
    }
}

/* 
eID = Elementleri gösterilecek olan elementin id si (örn: ul id si)
ShowTag = elemenlteri gösterilecek tag (li)
*/
function ShowTagElements(eID, ShowTag, SenderID) {

    var nodeList = $get(eID).getElementsByTagName(ShowTag);
    for (var i = 1; i < nodeList.length; i++)        
        nodeList[i].style.display = '';

        Hide(SenderID);
}