




// dom ready to use.
$(function() {


    // crop
    $('#Image1').Jcrop({


        /*aspectRatio: 1,*/ 
        onChange: showPreview,
        onSelect: showPreview,
        setSelect: [0, 0, 50, 50],
        aspectRatio: 16 / 9
        /*,onSelect: updateCoords*/

    });



});


function showPreview(coords) {
    /*var rx = 147 / coords.w;
    var ry = 97 / coords.h;

    var _w = $('#ctl00_ContentPlaceHolder1_imgMain').width();
    var _h = $('#ctl00_ContentPlaceHolder1_imgMain').height();

    $('#ctl00_ContentPlaceHolder1_imgThumb').css({
        width: Math.round(rx * _w) + 'px',
        height: Math.round(ry * _h) + 'px',
        marginLeft: '-' + Math.round(rx * coords.x) + 'px',
        marginTop: '-' + Math.round(ry * coords.y) + 'px'
    });*/
};


function updateCoords(c) {
    /*$('#x').val(c.x);
    $('#y').val(c.y);
    $('#w').val(c.w);
    $('#h').val(c.h);*/
};

function checkCoords() {
    return true;
    /*if (parseInt($('#x').val())) return true;
    alert('Please select a crop region then press submit.');
    return false;*/
};