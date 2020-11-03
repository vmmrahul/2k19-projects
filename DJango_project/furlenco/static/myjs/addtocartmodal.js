function GetDays() {
    var dropdt = new Date(document.getElementById("to").value);
    var pickdt = new Date(document.getElementById("from").value);
    var s = (parseInt((dropdt - pickdt) / (24 * 3600 * 1000)));
    document.getElementById('day').value = s;
}

function displayblog(obj) {
    if (obj == "perdayrent") {
        $('#dateday').show();
        $('#chosedays').hide();
    } else if (obj == "permonthrent") {
        var s = "";
        for (var i = 1; i <= 12; i++) {
            s += "<option>" + i + "</option>"
        }
        $('#dateday').hide();
        $('#chosedays').show();
        document.getElementById('chosedaymonth').innerHTML = s;
    } else {
        $('#dateday').hide();
        $('#chosedays').hide();
    }
}

function qtychange() {
    var renttype = document.getElementById('renttype').value;
    if (renttype) {
        findprice();
        // console.log(price);
    }
}

function findprice() {
    var fid = document.getElementById('fid').value;
    var renttype = document.getElementById('renttype').value;
    var qty = document.getElementById('qty').value;
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var output = this.response;
            if (renttype == "halfyearrent") {
                document.getElementById('totalprice').value = parseInt(output) * parseInt(qty);
            } else if (renttype == "permonthrent") {
                var chosedaymonth = document.getElementById('chosedaymonth').value;
                document.getElementById('totalprice').value = parseInt(output) * parseInt(qty) * parseInt(chosedaymonth);
            }
            else{
                var day=document.getElementById('day').value;
                if (parseInt(day)==0){
                    document.getElementById('totalprice').value = parseInt(output) * parseInt(qty);
                }else {
                    document.getElementById('totalprice').value = parseInt(output) * parseInt(qty) * parseInt(day);
                }
            }
        }
    };
    xml.open('GET', 'findprice?fid=' + fid + '&renttype=' + renttype, true);
    xml.send();
}