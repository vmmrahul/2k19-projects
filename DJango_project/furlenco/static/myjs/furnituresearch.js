function showcard() {
    var title = document.getElementById('title').value;
    console.log(document.getElementById('title').value);
    var data = new FormData();
    data.append('title', title);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var output = JSON.parse(this.response);
            var s = "";
            s += "<div class='row'>";
            for (var i = 0; i < output.length; i++) {
                s += '<div class="card col-sm-4 mt-5">';
                s += '<div class="card-header">';
                s += '<div class="card-title text-center">' + output[i]['title'] + '</div>';
                s += '</div>';
                s += '<div class="card-body"><img src="static/media/' + output[i]["coverphoto"] + '"></div>';
                s+='<div class="card-footer">';
                s+='<a href="searchfurnituredetails1?furnitureid='+output[i]['id']+" &title="+output[i]['title']+'" class="btn btn-danger form-control">Show Detail</a>'
                s += "</div></div>";
            }
            s += "</div>";
            document.getElementById("makecards").innerHTML = s;
        }
    };
    xml.open('POST', 'showcard', true);
    xml.send(data);
}