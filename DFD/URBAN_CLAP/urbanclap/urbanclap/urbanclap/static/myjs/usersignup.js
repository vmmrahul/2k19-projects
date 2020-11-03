function sendotp() {
    var mobile = document.getElementById("mobile").value;
    alert(mobile);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var output = this.response;
            alert(output);
            document.getElementById('confirmotp').style.display = "block"

        }
    };
    xml.open('GET', 'sendotpmobile?mobile=' + mobile, true);
    xml.send()
}

function verifyotp() {
    var otp = document.getElementById("sendotp").value;
    alert(otp);
    var fromdata = new FormData();
    fromdata.append('sendotp', document.getElementById('sendotp').value);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var output = this.response;
            alert(output);
            //document.getElementById('')
            window.location.href = 'usersignup2?mobile=' + mobile
        }

    };
    xml.open('POST', 'verifyotp', true);
    xml.send(fromdata)

}

function usersignup() {
    var formdata = new FormData();
    formdata.append('mobile', document.getElementById('mobile').value);
    formdata.append('email', document.getElementById('email').value);
    formdata.append('address', document.getElementById('address').value);
    formdata.append('city', document.getElementById('city').value);
    formdata.append('photo', document.getElementById('photo').files[0]);
    // formdata.append('password', document.getElementById('password').value);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var output = this.response;
            if (output == 'fail') {
                window.location.href = 'usersignup1'
            } else {
                window.location.href = 'userloginpage'
            }
        }
    };
    xml.open('POST', 'insertuser', true);
    xml.send(formdata)
}

function userlogin() {
    var formdata = new FormData();
    formdata.append('email', document.getElementById('email').value);
    formdata.append('password', document.getElementById('password').value);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var output = this.response;
            if (output == 'success') {
                alert(output);
                window.location.href = '/'
            } else {
                document.getElementById('result').innerHTML = 'Invalid Email or Password'
            }
        }
    };
    xml.open('POST', 'userlogin', true);
    xml.send(formdata)
}

function userforgotpassword() {
    $("#myModal").modal("show")
}

function userforgotsms() {
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
        xml.open('GET', 'senduserforgotsms?smsmobile=' + smsmobile, true);
        xml.send()
    }

}



