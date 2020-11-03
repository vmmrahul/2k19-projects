function rate() {
    if ($('#ratep').valid()) {
        // alert("hello");
        var email = $('#email').val();
        var useremail = $('#useremail').val();
        var business = $('#business').val();
        var description = $('#description').val();
        var rating = $('#rating').val();
        var bid = $('#bid').val();
        alert(bid);
        var formdata = new FormData();
        formdata.append('useremail', useremail);
        formdata.append('email', email);
        formdata.append('business', business);
        formdata.append('description', description);
        formdata.append('rating', rating);
        formdata.append('bid', bid);
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.status == 200 && this.readyState == 4) {
                var output = this.response;
                if (output == "fail") {
                    window.location.href="userloginpage"
                } else {
                    customerrtig(email);
                }
            }
        };
        xml.open('POST', 'rating', true);
        xml.send(formdata);
    }
}

function customerrtig(email) {
    alert(email);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.status==200 && this.readyState==4){
            var output = JSON.parse(this.response);
            s="";
            for (var i=0;i<output.length;i++){
                s+='<span class="font-weight-bold text-info">'+output[i]['useremail']+'</span><br>';
                s+="<span class='font-weight-bold text-warning h5'>"+output[i]['rating']+"</span><br>";
                s+='<span class="font-weight-bold text-dark">'+output[i]['description']+'</span><br>';
            }
           document.getElementById("reviewscus").innerHTML = s;
        }
    };
    xml.open('get','customerreviews?email='+email,true);
    xml.send();
}

// function viewallrating(email) {
//     var xml = new XMLHttpRequest();
//     xml.onreadystatechange = function () {
//         if (this.status == 200 && this.readyState == 4) {
//             var output = JSON.parse(this.response);
//             alert(output);
//             document.getElementById('Customerreviews').innerHTML='<div class="rating text-warning"></div>'
//         }
//     };
//     xml.open('GET', 'viewallrating?email='+email, true);
//     xml.send();
// }