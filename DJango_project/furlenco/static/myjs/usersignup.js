function sendotp() {
    //if($('#sendotp').valid()){
    var mobile = document.getElementById("mobile").value;
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var output = this.response;
            alert(output);
            document.getElementById('confirmotp').style.display = "block"

        }

    };
    xml.open('GET', 'sendotp?mobile=' + mobile, true);
    xml.send()
    //}

}

function verifyotp() {
    var formdata = new FormData();
    formdata.append('sendotp', document.getElementById('sendotp').value);
    var mobile = document.getElementById("mobile").value;
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var output = this.response;
            alert(output);
            window.location.href = 'usersignup2';
        }
    };
    xml.open('POST', 'verifyotp', true);
    xml.send(formdata)

}


function usersignup() {
    alert("hello1");
    if ($("#form").valid()) {
        var formdata = new FormData();
        formdata.append('mobile', document.getElementById('mobile').value);
        formdata.append('name', document.getElementById('name').value);
        formdata.append('email', document.getElementById('email').value);
        formdata.append('address', document.getElementById('address').value);
        formdata.append('landmark', document.getElementById('landmark').value);
        formdata.append('remarks', document.getElementById('remarks').value);
        formdata.append('password', document.getElementById('password').value);
        formdata.append('userphoto', document.getElementById('userphoto').files[0]);
        formdata.append('pan', document.getElementById('pan').value);
        formdata.append('adhaar', document.getElementById('adhaar').value);
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                // window.location.href='userlogin'
                var output = this.response;
                alert(this.response);
                if (output == "success") {
                    window.location.href = 'userlogin';
                } else if (output == "duplicate") {
                    document.getElementById('ans').innerHTML = "<h3>Duplicate User</h3>"

                }
            }
        };
        xml.open('POST', 'insertuser', true);
        xml.send(formdata)
    }
}