var loadFile = function (event) {
    var image = document.getElementById('editphoto').src = URL.createObjectURL(event.target.files[0])
};

function signup() {
    var email = $("#email").val();
    console.log(email);
    if ($("#serviceprovidersignup").valid()) {
        var formdata = new FormData();
        formdata.append('email', $("#email").val());
        formdata.append('name', $("#name").val());
        formdata.append('mobile', $("#mobile").val());
        // formdata.append('password', document.getElementById('password').value);
        formdata.append('business', $("#business").val());
        formdata.append('catname', $("#catname").val());
        formdata.append('city', $("#city").val());
        formdata.append('address', $("#address").val());
        formdata.append('timings', $("#timings").val());
        formdata.append('fees', $("#fees").val());
        formdata.append('area', $("#area").val());
        formdata.append('photo', document.getElementById('photo').files[0]);
        var xml = new XMLHttpRequest();
        // alert("hello1");
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var output = this.responseText;
                alert(output);
                if (output == "success") {
                    window.location.href = "serviceproviderlogin";
                } else if (output == "duplicate") {
                    document.getElementById('ans').innerHTML = "<h3>Duplicate User</h3>"

                }
            }
        };
        xml.open('POST', 'insertserviceprovider', true);
        xml.send(formdata);
    }
}

function serviceproviderlogin() {
    if ($("#serviceproviderlogin").valid()) {
        var formdata = new FormData();
        formdata.append('email', document.getElementById('email').value);
        formdata.append('password', document.getElementById('password').value);
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var output = this.response;
                alert(output);
                if (output == 'sucess') {
                    window.location.href = 'spDashboard'
                } else {
                    document.getElementById('result').innerHTML = 'Invalid Email or Password'
                }
            }
        };
        xml.open('POST', 'checkserviceproviderlogin', true);
        xml.send(formdata)
    }
}

function spforgotpassword() {
    $("#myModal").modal("show")
}

function forgotsms() {
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
        xml.open('GET', 'sendforgotsms?smsmobile=' + smsmobile, true);
        xml.send()
    }
}

// function spdataview()
// {
//     alert("hello");
//     var xml = new XMLHttpRequest();
//     xml.onreadystatechange = function () {
//         if (this.status == 200 && this.readyState == 4) {
//             var output = JSON.parse(this.response);
//             alert(output);
//             s = "";
//             for (var i = 0; i < output.length; i++) {
//                 s += "<tr>";
//                 s += "<td>" + (i + 1) + "</td>";
//                 s += "<td>" + output[i]['name'] + "</td>";
//                 s += "<td>" + output[i]['mobile'] + "</td>";
//                 s += "<td>" + output[i]['type'] + "</td>";
//                 s += "<td><button type='button' class='btn btn-danger' onclick='deladmin(\"" + output[i]['email'] + "\")' ><strong class='fas fa-trash-alt'></strong></button></td> ";
//                 s += "<td><button type='button' class='btn btn-warning' onclick='editadmin(" + JSON.stringify(output[i]) + ")' ><strong class='fas fa-edit'></strong></button></td> ";
//                 s += "</tr>";
//             }
//              console.log(s);
//             document.getElementById('admindataview').innerHTML = s;
//         }
//     };
//     xml.open('GET', 'viewadmin', true);
//     xml.send();
// }

