function vNumber(event) {
    return (event.keyCode >= 48) && (event.keyCode <= 57);
}

function vString(event) {
    return (event.keyCode <= 47) && (event.keyCode >= 58);
}

function vChar(event, Space, IsTr) {
    return  vCharEng(event) ||
            (IsTr && 
			    (event.keyCode == 286) ||
			    (event.keyCode == 220) ||
			    (event.keyCode == 304) ||
			    (event.keyCode == 350) ||
			    (event.keyCode == 214) ||

			    (event.keyCode == 252) ||
			    (event.keyCode == 287) ||
			    (event.keyCode == 305) ||
			    (event.keyCode == 351) ||
			    (event.keyCode == 231) ||
			    (event.keyCode == 246) ||
			    ((event.keyCode == 32) && Space)
			);
}

function vCharEng(event) {
    return ((event.keyCode >= 65) && (event.keyCode <= 90)) || ((event.keyCode >= 97) && (event.keyCode <= 122));
}

function vEmail(eValue) {
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return emailPattern.test(eValue);
}