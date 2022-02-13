<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="Transforman.Web.Admin.UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">User Management</h1>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        User Management
						   
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="hidden" id="txtId" />
                                <div  class="form-group">
                                    <label>User Name</label>
                                    <input type="text" id="txtUserName" class="form-control" />

                                </div>
                                <div  class="form-group">
                                    <label>No Pegawai</label>
                                    <input type="text" id="txtNoPek" class="form-control" />

                                </div>
                                <div  class="form-group">
                                    <label>Password</label>
                                   <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"  ></asp:TextBox>


                                </div>
                                <div class="form-group">
                                    <label>Nama Lengkap</label>
                                    <input type="text" id="txtFullName" class="form-control" />
                                    
                                </div>

                                <div class="form-group">
                                    <label>Type User</label>
                                    <select id="txtType" class="form-control">
                                        <option value="1">Admin</option>
                                        <option value="2">Approval</option>
                                        <option value="3">Pegawai</option>
                                        <option value="4">Posko 1</option>
                                        <option value="5">Posko 9</option>


                                    </select>
                                </div>

                               
                                <button type="submit" id="btnSave" class="btn btn-success">Simpan</button>
                                <button type="reset" class="btn btn-danger">Hapus</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        List User
					   
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">

                            <table class="table table-striped table-bordered table-hover" id="DataTblUser">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>User Name</th>
                                        <th>No Pegawai</th>
                                        <th>Password</th>
                                        <th>Nama Lengkap</th>
                                        <th>Type User</th>
                                        <th>Action</th>

                                        
                                    </tr>
                                </thead>

                            </table>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>


        function validateEmail(email) {
            var re = /\S+@\S+\.\S+/;
            return re.test(email);
        }

        var _ListUser = '<%= _ListUser %>'




       

        var oDataUser = $('#DataTblUser').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "Id_User", "bVisible": false },
                { "mDataProp": "User_Name" },
                { "mDataProp": "No_Pegawai" },
                { "mDataProp": "Password", "bVisible": false },
                { "mDataProp": "Nama" },
                { "mDataProp": "Type" },
                { "mDataProp": "ID" },

         
            ]
        });


        var objUser = (_ListUser == '' ? [] : jQuery.parseJSON(_ListUser));

        if (objUser.length > 0) {


            var User = new Object();
            
            for (var i = 0; i < objUser.length; i++) {


                User.Id_User = objUser[i]["Id_User"];
                User.User_Name = objUser[i]["User_Name"];
                User.No_Pegawai = objUser[i]["No_Pegawai"];
                User.Password = objUser[i]["Password"];
                User.Nama = objUser[i]["Nama"];
                var typeuser = objUser[i]["Type"];

               
                if (typeuser == '1')
                    User.Type = "Admin";
                if (typeuser == '2')
                    User.Type = "Approval";
                if (typeuser == '3')
                    User.Type = "Pegawai";
                if (typeuser == '4')
                    User.Type = "Posko 1";
                if (typeuser == '5')
                    User.Type = "Posko 9";








                User.ID = "<img src='/css/icons/16/edit.png' title='Edit'  id='" + objUser[i]["Id_User"] + "'  class='edit'/>" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                    "<img src='/css/icons/16/cross.png' title='Hapus'  id='" + objUser[i]["Id_User"] + "'  class='delete'/>";

                
                oDataUser.fnAddData(User);
            }

            
        }


       

        $('.edit').on('click', function () {

            var id = $(this).attr("id").toString();
            $("#txtId").val(id);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "UserManagement.aspx/GetDataUserById",
                data: "{'Id':'" + id +"'}",
                dataType: "json",
                success: function (data) {


                    var data = JSON.parse(data.d);

                    $('#txtUserName').val(data[0]["User_Name"]);
                    $('#txtNoPek').val(data[0]["No_Pegawai"]);
                    $('#<%=txtPassword.ClientID%>').val(data[0]["Password"])
                    $('#txtFullName').val(data[0]["Nama"]);
                    $('#txtType').val(data[0]["Type"]);
                    
                },
                error: function () {
                    return false;
                    //alert("Error");
                }
            });





        });

        $('.delete').on('click', function () {

            var txt;
            var r = confirm("Apakah Anda Yakin Akan Menghapus ini!");
            if (r == true) {

                var id = $(this).attr("id").toString();
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "UserManagement.aspx/DeleteUser",
                    data: "{'Id':'" + id + "'}",
                    dataType: "json",
                    success: function (data) {
                        alert("Data Sudah Terhapus.")
                        location.reload();

                        

                    },
                    error: function () {
                        return false;
                        //alert("Error");
                    }
                });


            } 




        });
        
        $('#btnSave').on('click', function () {

            var User = new Object();

            var validation = "";
            var userid = $("#txtId").val();
            var Username = $('#txtUserName').val();
            var Pass = $('#<%=txtPassword.ClientID%>').val();
            var Name = $('#txtFullName').val();
            var Type = $('#txtType').val();
            var Nopek = $('#txtNoPek').val();
          

            if (Username == "")
                validation += "Silahkan isi User name \n";

            if (Pass == "")
                validation += "Silahkan isi Password \n";
            if (Name == "")
                validation += "Silahkan isi Nama lengkap \n";


            if (Type != 4 ) {

                if (Nopek == "")
                    validation += "Silahkan isi No Pegawai \n";

            }

            if (Type == "")
                validation += "Silahkan isi Type User \n";

            
            if (Type == 1 || Type == 2 || Type == 3 ){
                if (validateEmail(Username) == false)
                    validation += "Untuk User Admin,Approval dan Pegawai gunakan alamat Email \n";
            }

              




            if (validation == "") {

            User.Id_User = userid;
            User.User_Name = $('#txtUserName').val();
            User.No_Pegawai = $('#txtNoPek').val();
            User.Password = $('#<%=txtPassword.ClientID%>').val();
            User.Nama = $('#txtFullName').val();
            User.Type = $('#txtType').val();
                var oUser = { "User": JSON.stringify(User) };



                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "UserManagement.aspx/Save",
                    data: JSON.stringify(oUser),
                    dataType: "json",
                    success: function () {

                        alert("Data Pegawai Telah Tersimpan.");
                        location.reload();
                    },
                    error: function () {
                        return false;
                        //alert("Error");
                    }
                });
            } else {

                alert(validation);
                return false;
            }

        });
    </script>


</asp:Content>
