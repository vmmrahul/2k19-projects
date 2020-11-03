var loadFile = function (event) {
    var image = document.getElementById('editphoto1').src = URL.createObjectURL(event.target.files[0])

};

function addcategory() {
    if ($("#addcategory").valid()) {
        var formdata = new FormData();
        formdata.append('catname', document.getElementById('name').value);
        formdata.append('description', document.getElementById('description').value);
        formdata.append('photo', document.getElementById('photo').files[0]);
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.status == 200 && this.readyState == 4) {
                var output = this.response;
                alert(output);
                $('#myModal').modal('hide');
                categorydataview();
            }
        };
        xml.open('POST', 'insertcategory', true);
        xml.send(formdata);
    }
}

function categorydataview() {
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var output = JSON.parse(this.response);
            // alert(output);
            s = "";
            for (var i = 0; i < output.length; i++) {
                s += "<tr>";
                s += "<td>" + (i + 1) + "</td>";
                s += "<td>" + output[i]['catname'] + "</td>";
                s += "<td>" + output[i]['description'] + "</td>";
                s += "<td><img src='static/media/" + output[i]['photo'] + "' width='100'></td>";
                s += "<td ><button type='button' class='btn btn-danger' onclick='delcategory(\"" + output[i]['catname'] + "\")'><strong class='fas fa-trash-alt'></strong></button></td>";
                s += "<td><button type='button' class='btn btn-warning' onclick='editcategory(" + JSON.stringify(output[i]) + ")' ><strong class='fas fa-edit'></strong></button></td> ";
                s += "</tr>";
            }
            // console.log(s);
            document.getElementById('categorydataview').innerHTML = s;
        }
    };
    xml.open('GET', 'showcategory', true);
    xml.send();
}

function editcategory(obj) {
    $('#editname').val(obj.catname);
    $('#editdescription').val(obj.description);
    $("#editphoto1").attr('src', '../static/media/' + obj.photo);
    console.log('../static/media/' + obj.photo);
    $('#editmyModal').modal('show');
}

function updatecategory() {
    var formdata = new FormData();
    formdata.append('catname', document.getElementById('editname').value);
    formdata.append('description', document.getElementById('editdescription').value);
    formdata.append('photo', document.getElementById('editphoto').files[0]);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var output = this.response;
            alert(output);
            $('#editmyModal').modal('hide');
            categorydataview();
        }
    };
    xml.open('POST', 'updatecategory', true);
    xml.send(formdata);
}

function delcategory(catname) {
    if (confirm("Are you sure to DELETE?")) {
        var formdata = new FormData();
        formdata.append('catname', catname);
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.status == 200 && this.readyState == 4) {
                var output = this.response;
                categorydataview();
                alert(output);
            }
        };
        xml.open('POST', 'removecategory', true);
        xml.send(formdata);
    }
}