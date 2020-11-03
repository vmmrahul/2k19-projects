function select(value) {
    // alert(value);
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var output = JSON.parse(this.response);
            // alert(output);
            var s = "<table class='table table-hover table-warning'>";
            s += "<tr>";
            s += "<th>Furniture Id</th>";
            s += "<th>Title</th>";
            s += "<th>Category Name</th>";
            s += "<th>Weight</th>";
            s += "<th>Dimensions</th>";
            s += "<th>Cover Photo</th>";
            s += "<th>Quantity Available</th>";
            s += "<th>Per Day Rent</th>";
            s += "<th>Per Year Rent</th>";
            s += "<th>Half Year Rent</th>";
            s += "<th colspan=3 class='text-center'>Action</th>";
            s += "</tr>";
            for (var i = 0; i < output.length; i++) {
                s += "<tr>";
                s += "<td>" + (i + 1) + "</td>";
                s += "<td>" + output[i]['title'] + "</td>";
                s += "<td>" + output[i]['catname'] + "</td>";
                s += "<td>" + output[i]['weight'] + "</td>";
                s += "<td>" + output[i]['dimensions'] + "</td>";
                s += "<td><img src='static/media/" + output[i]['coverphoto'] + "' width='100px'</td>";
                s += "<td>" + output[i]['Qtyavailable'] + "</td>";
                s += "<td>" + output[i]['perdayrent'] + "</td>";
                s += "<td>" + output[i]['permonthrent'] + "</td>";
                s += "<td>" + output[i]['halfyearrent'] + "</td>";
                s += "<td ><button type='button' class='btn btn-danger' onclick='deletefurniture(" + output[i]["furnitureid"] + ")'><strong class='fas fa-trash-alt'></strong></button></td> ";
                s += "<td><button type='button' class='btn btn-warning' onclick='editfurniture(" + JSON.stringify(output[i]) + ")'><strong class='fas fa-edit'></strong></button></td> ";
                s += "<td><a href='addphotos?furnitureid=" + output[i]["furnitureid"] + "'><span class='fa fa-image fa-3x'></span></a>";
                s += "</tr>";
            }
            s += "</table>";
            $('#furnituretable').removeClass('spinner-border');
            document.getElementById("furnituretable").innerHTML = s;
        } else {
            $('#furnituretable').addClass('spinner-border');
        }
    };
    xmlhttp.open("GET", 'viewcategory?catname=' + value, true);
    xmlhttp.send();
}

function editfurniture(obj) {
    $('#furnitureid').val(obj.furnitureid);
    $('#title').val(obj.title);
    $('#catname').val(obj.catname);
    $('#weight').val(obj.weight);
    $('#dimensions').val(obj.dimensions);
    $('#quantity').val(obj.Qtyavailable);
    $('#perdayrent').val(obj.perdayrent);
    $('#permonthrent').val(obj.permonthrent);
    $('#halfyearrent').val(obj.halfyearrent);
    $("#editfurniture").modal('show');
}

function deletefurniture(id) {
    if (confirm("are you sure to delete?")) {
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var output = this.response;
                // alert(output);
                window.location.href = "showfurniture";
            }
        };
        xml.open('GET', 'deleteaction?id=' + id, true);
        xml.send();
    }
}

function editfurnitureaction() {
    var editdata = new FormData();
    editdata.append("furnitureid", document.getElementById('furnitureid').value);
    editdata.append("title", document.getElementById('title').value);
    editdata.append("catname", document.getElementById('catname').value);
    editdata.append("weight", document.getElementById('weight').value);
    editdata.append("dimensions", document.getElementById('dimensions').value);
    editdata.append("coverphoto", document.getElementById('coverphoto').files[0]);
    editdata.append("quantity", document.getElementById('quantity').value);
    editdata.append("perdayrent", document.getElementById('perdayrent').value);
    editdata.append("permonthrent", document.getElementById('permonthrent').value);
    editdata.append("halfyearrent", document.getElementById('halfyearrent').value);
    console.log(editdata);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var output = this.response;
            // alert(output);
            window.location.href = "showfurniture"
        }
    };
    xml.open('POST', 'editdataaction', true);
    xml.send(editdata);
}
