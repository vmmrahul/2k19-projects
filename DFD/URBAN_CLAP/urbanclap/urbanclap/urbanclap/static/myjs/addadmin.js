function adminlogin() {
    if ($("#form1").valid()) {
        var formdata = new FormData();
        formdata.append('email', document.getElementById('email').value);
        formdata.append('password', document.getElementById('password').value);
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var output = this.response;
                if (output == 'success') {
                    alert(output);
                    window.location.href = 'addcategory'
                } else {
                    document.getElementById('result').innerHTML = 'Invalid Email or Password'
                }
            }
        };
        xml.open('POST', 'checkadminlogin', true);
        xml.send(formdata)
    }
}

function addadmin() {
    if ($("#addadmin").valid()) {
        var formdata = new FormData();
        formdata.append('email', document.getElementById('email').value);
        formdata.append('password', document.getElementById('password').value);
        formdata.append('mobile', document.getElementById('mobile').value);
        formdata.append('type', document.getElementById('type').value);

        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.status == 200 && this.readyState == 4) {
                var output = this.response;
                alert(output);
                $('#myModal').modal('hide');
                admindataview();
            }
        };
        xml.open('POST', 'insertadmin', true);
        xml.send(formdata);
    }
}

function admindataview() {
    // alert("hello");
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var output = JSON.parse(this.response);
            // alert(output);
            s = "";
            for (var i = 0; i < output.length; i++) {
                s += "<tr>";
                s += "<td>" + (i + 1) + "</td>";
                s += "<td>" + output[i]['email'] + "</td>";
                s += "<td>" + output[i]['mobile'] + "</td>";
                s += "<td>" + output[i]['type'] + "</td>";
                s += "<td><button type='button' class='btn btn-danger' onclick='deladmin(\"" + output[i]['email'] + "\")' ><strong class='fas fa-trash-alt'></strong></button></td> ";
                s += "<td><button type='button' class='btn btn-warning' onclick='editadmin(" + JSON.stringify(output[i]) + ")' ><strong class='fas fa-edit'></strong></button></td> ";
                s += "</tr>";
            }
            // console.log(s);
            document.getElementById('admindataview').innerHTML = s;
        }
    };
    xml.open('GET', 'viewadmin', true);
    xml.send();
}

function editadmin(obj) {
    $('#editemail').val(obj.email);
    $('#editmobile').val(obj.mobile);
    alert(obj.type);
    $("#edittype").val(obj.type);
    $('#editmyModal').modal('show');
}

function updateadmin() {
    var formdata = new FormData();
    formdata.append('editemail', document.getElementById('editemail').value);
    formdata.append('editmobile', document.getElementById('editmobile').value);
    formdata.append('edittype', document.getElementById('edittype').value);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var output = this.response;
            alert(output);
            $('#editmyModal').modal('hide');
            admindataview();
        }
    };
    xml.open('POST', 'saveadmin', true);
    xml.send(formdata);
}

function deladmin(email) {
    alert(email)
    if (confirm("Are you sure to DELETE?")) {
        var formdata = new FormData();
        formdata.append('email', email);
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.status == 200 && this.readyState == 4) {
                var output = this.response;
                admindataview();
                alert(output);
            }
        };
        xml.open('POST', 'removeadmin', true);
        xml.send(formdata);
    }
}
function adminforgotpassword() {
    $("#myModal").modal("show")
}

function adminforgotsms() {
    if ($("#forgot").valid()) {
        var smsmobile = document.getElementById("smsmobile").value;
        alert(smsmobile);
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var output = this.response;
                $('#check').removeClass('spinner-border');
                $('#myModal').modal('hide')
            } else {
                $('#check').addClass('spinner-border');
            }
        };
        xml.open('GET', 'sendadminforgotsms?smsmobile=' + smsmobile, true);
        xml.send()
    }

}