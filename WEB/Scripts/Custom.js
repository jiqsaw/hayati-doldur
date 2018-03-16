function DateControl(ddlDay, ddlMonth, ddlYear) {
    var Day = document.getElementById(ddlDay).value;
    var Month = document.getElementById(ddlMonth).value;
    var Year = document.getElementById(ddlYear).value;

    if ((Day == "0") || (Month == "0") || (Year == "0")) { return false; }

    switch (Month) {
        case "02":
            if ((Day > 29) || ((Year % 4 != 0) && (Day == 29))) {
                //alert("Lütfen Doğru Tarih Giriniz");
                return false;
            }

        case "04":
            if (Day > 30) {
                //alert("Lütfen Doğru Tarih Giriniz");
                return false;
            }

        case "06":
            if (Day > 30) {
                //alert("Lütfen Doğru Tarih Giriniz");
                return false;
            }

        case "09":
            if (Day > 30) {
                //alert("Lütfen Doğru Tarih Giriniz");
                return false;
            }

        case "11":
            if (Day > 30) {
                //alert("Lütfen Doğru Tarih Giriniz");
                return false;
            }

        default:
            return true;
            break;
    }
}


function PhotoAdd(ActivityID) {
    var wpen = window.open('/PhotoAdd.aspx?j=' + ActivityID, 'HayatiDoldurEtkinlikFotoğraf', 'scrollbars, width=720, height=600, resizable');
    wpen.focus();
}

function NewsOpen(NewsID) {
    var wpen = window.open('/NewsDetail.aspx?j=' + NewsID, 'NewsDetail', 'width=462, height=275');
    wpen.focus();
}