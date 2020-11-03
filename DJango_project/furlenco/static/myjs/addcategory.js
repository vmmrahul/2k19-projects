var loadFile=function (event) {
    var image=document.getElementById('editcatphoto').src=URL.createObjectURL(event.target.files[0])
};
var addloadFile=function (event) {
    var image=document.getElementById('addcategoryimg').src=URL.createObjectURL(event.target.files[0])
};

function addcategory() {
    if ($("#addcategory").valid()) {
        var formdata = new FormData();
        formdata.append('catname', document.getElementById('catname').value);
        formdata.append('description', document.getElementById('description').value);
        formdata.append('photo', document.getElementById('photo').files[0]);


        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var output = this.response;
                //alert(output);
                $('#myModal').modal('hide');
                categorydataview();
            }
        };
        xmlhttp.open('POST', 'insertcategory', true);
        xmlhttp.send(formdata);
    }
}

function categorydataview() {
    //alert("hello");
    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200)
        {
            var output = JSON.parse(this.response);
            //alert(output);
            var s = "";
            for (var i = 0; i < output.length; i++)
            {
                s += "<tr>";
                s += "<td>" + (i + 1) + "</td>";
                s += "<td>" + output[i]['catname'] + "</td>";
                s += "<td>" + output[i]['description'] + "</td>";
                s += "<td><img src='static/media/" + output[i]['photo'] + "' width='100'></td>";
                s +="<td> <button type='button' class='btn btn-danger' onclick='delcategory(\""+output[i]['catname']+"\")'><strong class='fas fa-trash-alt'></strong></button></td>";
                s +="<td><button type='button' class='btn btn-warning' onclick='editcategory(" + JSON.stringify(output[i]) + ")'><strong class='fas fa-edit'></strong></button></td> ";


                s += "</tr>";
            }
        }
        //console.log(s);
        document.getElementById('categorydataview').innerHTML = s;
    };
    xml.open('GET','showcategory',true);
    xml.send();
}


function editcategory(obj) {
    alert(obj);
    console.log('static/media/'+obj.photo);
    $('#editcatname').val(obj.catname);
    $('#editdescription').val(obj.description);
    $('#editcatphoto').attr('src','static/media/' +obj.photo);
    $('#editcatmyModal').modal('show');
}

function savecategory() {
    alert("in save")
    var formdata = new FormData();
    formdata.append('editcatname', document.getElementById('editcatname').value);
    formdata.append('editdescription', document.getElementById('editdescription').value);
    formdata.append('editphoto', document.getElementById('editphoto').files[0]);

    var xml = new XMLHttpRequest();
    xml.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var output = this.response;
            alert(output);
            $('#editcatmyModal').modal('hide');
            categorydataview();
        }
    };
    xml.open('POST', 'savecategory', true);
    xml.send(formdata);
}

function delcategory(catname) {
    if(confirm("Do you really want to delete?"))
    {
        var formdata=new FormData();
        formdata.append('catname',catname);
        var xml=new XMLHttpRequest();
        xml.onreadystatechange=function () {
            if(this.readyState==4 & this.status==200){
                var output=this.response;
                categorydataview();
                alert(output);
            }
        };
        xml.open('POST','removecategory',true);
        xml.send(formdata);
    }
}