function addadmin() {
    if ($("#addadmin").valid()) {
        var formdata = new FormData();
        formdata.append('email', document.getElementById('email').value);
        formdata.append('password', document.getElementById('password').value);
        formdata.append('type', document.getElementById('type').value);
        formdata.append('mobile', document.getElementById('mobile').value);

        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var output = this.response;
                alert(output);
                // $('#myModal').modal('hide');
                // categorydataview();
            }
        };
        xmlhttp.open('POST', 'insertadmin', true);
        xmlhttp.send(formdata);
    }
}

function admindataview() {
    //alert("hello")
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var output = JSON.parse(this.response);
            //alert(output);
            var s = "";
            for (var i = 0; i < output.length; i++) {
                s += "<tr>";
                s += "<td>" + (i + 1) + "</td>";
                s += "<td>" + output[i]['email'] + "</td>";
                s += "<td>" + output[i]['type'] + "</td>";
                s += "<td>" + output[i]['mobile'] + "</td>";
                s += "<td> <button type='button' class='btn btn-danger' onclick='deladmin(\"" + output[i]['email'] + "\")'><strong class='fas fa-trash-alt'></strong></button></td>";
                s += "<td><button type='button' class='btn btn-warning' onclick='editadmin(" + JSON.stringify(output[i]) + ")'><strong class='fas fa-edit'></strong></button></td> ";

                s += "</tr>";
            }
        }
        document.getElementById('admindataview').innerHTML = s;
    };
    xml.open('GET', 'viewadmin', true);
    xml.send();
}

function deladmin(email) {
    if (confirm("Do you really want to delete?")) {
        var formdata = new FormData();
        formdata.append('email', email);
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 & this.status == 200) {
                var output = this.response;
                admindataview();
                alert(output);
            }
        };
        xml.open('POST', 'removeadmin', true);
        xml.send(formdata);
    }

}


function editadmin(obj) {
    alert(obj);
    //console.log('static/media/'+obj.photo);
    $('#editemail').val(obj.email);
    $('#editpassword').val(obj.password);
    $('#edittype').val(obj.type);
    $('#editmobile').val(obj.mobile);
    $('#editadminmyModal').modal('show');
}

function saveadmin() {
    if (($("#addadmin").valid())) {

        var formdata = new FormData();
        formdata.append('editemail', document.getElementById('editemail').value);
        formdata.append('editpassword', document.getElementById('editpassword').value);
        formdata.append('edittype', document.getElementById('edittype').value);
        formdata.append('editmobile', document.getElementById('editmobile').value);

        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var output = this.response;
                //alert(output);
                $('#editadminmyModal').modal('hide');
                admindataview();
            }
        };
        xml.open('POST', 'saveadmin', true);
        xml.send(formdata);

    }
}

function adminforgotpassword() {
    $("#forgot").modal("show")
}

function forgotsms() {
    if ($("#userforgot").valid()) {
        var mobile = document.getElementById("mobile").value;
        {
            alert(mobile);
        }
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var output = this.response;
                document.getElementById('msg').innerHTML = output;
            }
        };
        xmlhttp.open('GET', 'adminforgotsms?mobile=' + mobile);
        xmlhttp.send()

    }
}

