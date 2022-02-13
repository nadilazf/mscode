<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterApprovalPekerja.aspx.cs" Inherits="Transforman.Master.MasterApprovalPekerja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Create Master Approval</h1>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Create Approval
                           
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="form-group">
                                    <div id="DivNoPek" class="form-group">
                                        <label>No Pekerja</label>
                                        <input type="text" id="txtNoPek" class="form-control" />

                                    </div>
                                    <div id="DivNama" class="form-group">
                                        <label>Nama Pekerja</label>
                                        <input type="text" id="txtNamaPek" class="form-control" />

                                    </div>

                                    <div id="DivMess" class="form-group">
                                        <label>Mess</label>
                                        <input type="text" id="txtmess" class="form-control" />

                                    </div>
                                    <div id="DivNoHp" class="form-group">
                                        <label>No Handphone</label>
                                        <input type="text" id="txtNoHp" class="form-control" />

                                    </div>

                                    <div id="DivEmail" class="form-group">
                                        <label>Email</label>
                                        <input type="text" id="txtEmail" class="form-control" />

                                    </div>

                                    <div class="form-group">
                                        <label>Fungsi</label>
                                        <select id="txtFungsi" class="form-control">
                                        <option value="0">Pilih</option>
                                    </select>


                                    </div>

                                    

                                    <button type="submit" id="btnSave" class="btn btn-success">Simpan</button>
                                    <button type="reset" class="btn btn-danger">Hapus</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            List Approval
                       
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">

                                <table class="table table-striped table-bordered table-hover" id="DataTblPegawai">
                                    <thead>
                                        <tr>
                                            <th>Nomor Pekerja</th>
                                            <th>Nama Pekerja</th>
                                            <th>Email</th>
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
        
    </div>
    <script>


        function validateEmail(email) {
            var re = /\S+@\S+\.\S+/;
            return re.test(email);
        }

        var _ListPegawai = '<%= _ListPegawai %>'

        var _Fungsi = '<%= _Fungsi %>'
        var iFungsi = $.parseJSON(_Fungsi);




        var _App = '<%= _App %>'
        var iTransaksi = $.parseJSON(_App);


        var selFungsi = $('#txtFungsi');
        
        $.each(iFungsi, function (key, value) {
            selFungsi.append('<option value="' + value.id + '">' + value.Nama_Fungsi + '</option>');
        });

       

        var oDataPegawai = $('#DataTblPegawai').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "NoPek" },
                { "mDataProp": "Nama" },
                { "mDataProp": "Email" },
                { "mDataProp": "ID" },


            ]
        });


        var objPegawai = (_ListPegawai == '' ? [] : jQuery.parseJSON(_ListPegawai));

        if (objPegawai.length > 0) {


            var Pegawai = new Object();

            for (var i = 0; i < objPegawai.length; i++) {


                Pegawai.NoPek = objPegawai[i]["No_Pek"];
                Pegawai.Nama = objPegawai[i]["Nama"];
                Pegawai.Email = objPegawai[i]["Email"];
                Pegawai.ID = "<img src='../css/icons/16/edit.png' title='Edit'  id='" + objPegawai[i]["No_Pek"] + "'  class='edit'/>" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                    "<img src='../css/icons/16/cross.png' title='Hapus'  id='" + objPegawai[i]["No_Pek"] + "'  class='delete'/>";


                oDataPegawai.fnAddData(Pegawai);
            }


        }




        $('.edit').on('click', function () {

            //alert($(this).attr("id").toString());
            var id = $(this).attr("id").toString();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "MasterApprovalPekerja.aspx/GetDataPegawaiById",
                data: "{'NoPek':'" + id + "'}",
                dataType: "json",
                success: function (data) {


                    var data = JSON.parse(data.d);

                    $('#txtNoPek').val(data[0]["No_Pek"]);
                    $('#txtNamaPek').val(data[0]["Nama"]);
                    $('#txtNoHp').val(data[0]["No_Hp"]);
                    $('#txtmess').val(data[0]["Mess"]);
                    $('#txtEmail').val(data[0]["Email"]);
                    $('#txtFungsi').val(data[0]["Fungsi"]);
                    
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
                    url: "MasterApprovalPekerja.aspx/DeletePegawaiById",
                    data: "{'NoPek':'" + id + "'}",
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

            var Pegawai = new Object();

            var validation = "";

            var noPek = $('#txtNoPek').val();
            var Nama = $('#txtNamaPek').val();
            var NoHp = $('#txtNoHp').val();
            var Mess = $('#txtmess').val();
            var Email = $('#txtEmail').val();
            var Fungsi = $('#txtFungsi').val();
            var Approval = $('#txtApproval').val();



            if (noPek == "")
                validation += "Silahkan isi No Pekerja \n";

            if (Nama == "")
                validation += "Silahkan isi Nama Pekerja \n";
            if (NoHp == "")
                validation += "Silahkan isi No Hp \n";
            if (Email == "")
                validation += "Silahkan isi Alamat Email \n";

            else
                if (validateEmail(Email) == false)
                    validation += "Format email salah \n";

            


            if (validation == "") {
                Pegawai.Nopek = $('#txtNoPek').val();
                Pegawai.NamaPekerja = $('#txtNamaPek').val();
                Pegawai.NoHp = $('#txtNoHp').val();
                Pegawai.Mess = $('#txtmess').val();
                Pegawai.Email = $('#txtEmail').val();
                Pegawai.Fungsi = $('#txtFungsi').val();
                Pegawai.Approval = 0;
                Pegawai.Position = 2;
                var oPegawai = { "oPegawai": JSON.stringify(Pegawai) };



                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "MasterApprovalPekerja.aspx/Save",
                    data: JSON.stringify(oPegawai),
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

