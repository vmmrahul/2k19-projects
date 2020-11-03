function searchcity(catname) {
    var catname1 = new FormData();
    catname1.append('catname', catname);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var output = JSON.parse(this.response);
            // console.log(output);
            s = "";
            for (var i = 0; i < output.length; i++) {
                s += "<option>" + output[i]['city'] + "</option>";
            }
            document.getElementById('city').innerHTML = s;
        }
    };
    xml.open('POST', 'searchcity', true);
    xml.send(catname1);
}

function go() {
    var catname = document.getElementById('catname').value;
    var city = document.getElementById('city').value;
    catname = catname.replace('&', '@');
    catname = catname.replace(' ', '!');
    window.location.href = "searchservice2?catname=" + catname + "&city=" + city+"&index=index";
}