function servicesshow() {
    var formdata = new FormData();
    formdata.append('city', document.getElementById('city').value);
    // alert(document.getElementById('city').value);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var output = JSON.parse(this.response);
            alert(output);
            var s = "";
            s += "<div class='row'>";
            for (var i = 0; i < output.length; i++) {
                s += '<div class="card col-sm-4 mt-5">';
                s += '<div class="card-header">';
                s += '<div class="card-title text-center">' + output[i]['catname'] + '</div>';
                s += '</div>';
                s += '<div class="card-body"><img src="static/media/' + output[i]["photo"] + '" width="200"></div>';
                s += '<div class="card-footer">';
                s += '<button class="btn btn-danger">Add To Cart</button>'
                s += "</div></div>";
            }
            s += "</div>";
            alert(s);
            document.getElementById("makecards").innerHTML = s;
        }
    };
    xml.open('POST', 'servicesshow', true);
    xml.send(formdata)
}