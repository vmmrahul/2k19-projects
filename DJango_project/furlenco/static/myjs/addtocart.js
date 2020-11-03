function addtocart() {
    var fid = document.getElementById('fid').value;
    var renttype = document.getElementById('renttype').value;
    var qty = document.getElementById('qty').value;
    var from = document.getElementById('from').value;
    var to = document.getElementById('to').value;
    var day = document.getElementById('day').value;
    var totalprice = document.getElementById('totalprice').value;
    var chosedaymonth = document.getElementById('chosedaymonth').value;
    var data=new FormData();
    data.append('fid',fid);
    data.append('renttype',renttype);
    data.append('qty',qty);
    data.append('from',from);
    data.append('to',to);
    data.append('day',day);
    data.append('chosedaymonth',chosedaymonth);
    data.append('totalprice',totalprice);
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var output = this.response;
            document.getElementById("cart").reset();
            $('#myModal').modal('hide');
            document.getElementById('cartvalue').innerHTML = output;
        }
    };
    xml.open('POST', 'addtocart', true);
    xml.send(data);
}
