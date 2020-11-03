function userchecklogin() {
    if($("#sendotp").valid()) {


        var formdata = new FormData();
        formdata.append('mobile', document.getElementById('mobile').value);
        formdata.append('password', document.getElementById('password').value);
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var output = this.response;
                if (output == 'success') {
                    window.location.href = 'searchfurniture1';
                } else {
                    document.getElementById('result').innerHTML = 'Invalid Mobile or Password'
                }

            }
        };
        xml.open('POST', 'userchecklogin', true);
        xml.send(formdata)
    }
}

function userforgotpassword() {
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
        xmlhttp.open('GET','sendforgotsms?mobile='+mobile);
        xmlhttp.send()

    }
}