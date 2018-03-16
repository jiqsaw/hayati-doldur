window.onload = function() {
    setFooter();
}
window.onresize = function() {
    setFooter();
}

function Video(swfDivID, Video, Photo, Title, Url) {
//    Video = 'bWVkaWEvdmlkZW8vdmlkZW8yLmZsdg==';
//    Photo = 'bWVkaWEvaW1hZ2VzL3RodW1icy8wMS5qcGc=';
//    Title = 'TG9yZW0gSXBzdW0gRG9sb3I=';
//    Url = 'TG9yZW0gSXBzdW0gRG9sb3I=';

    if ((Video != '') && (Photo != '') && (Title != '') && (Url != '')) {
        Video = "../" + Video;
        so = new SWFObject("Swf/Video.swf", "mymovie", "202", "185", "8", "#000");
        so.addParam('allowfullscreen', 'true');
        so.addVariable("vid", Video);
        so.addVariable("pic", Photo);
        so.addVariable("title", Title);
        so.addVariable("url", Url);
        if (document.getElementById(swfDivID) != null) so.write(swfDivID);
    }
}