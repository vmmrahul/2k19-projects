function cardshow(output) {
    s = "";
    for (var i = 0; i < output.length; i++) {
        s += "<div class='col-sm-3 mt-3'><div class='card'>";
        s += "<div class='card-header'>";
        s += "<div class='card-title text-center'>" + output[i]['title'] + "</div>";
        s += "</div>";
        s += "<div class='card-body text-center'>";
        s += "<img src='static/media/" + output[i]['photo'] + "' width='200' height='250'>";
        s += "</div>";
        s += "<div class='card-footer'><a href='showgenrebooksapmle?tid=" + output[i]['bookid'] + "' class='btn btn-danger form-control'>view Detail</a>";
        s += "</div></div></div>";
    }
    document.getElementById("ready").innerHTML = s;
}

function viewbooksincard(search) {
    var formdata = new FormData();
    formdata.append('search', search);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var output = JSON.parse(this.response);
            if (output[0]['result']!='no') {
                cardshow(output);
            }else{
                document.getElementById('ready').innerHTML="<h1>No Data Found</h1>"
            }
        }
    };
    xml.open('POST', 'viewallbooks', true);
    xml.send(formdata);
}