<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterDriver.aspx.cs" Inherits="Transforman.master.MasterDriver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Create Master Driver</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Create Driver
                           
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="DivNoSim" class="form-group">
                                    <label>NO SIM</label>
                                    <input type="text" id="txtNoSim" class="form-control" />

                                </div>

                                <div id="DivNama" class="form-group">
                                    <label>Nama</label>
                                    <input type="text" id="txtNama" class="form-control" />

                                </div>
                                <div id="DivNoHp" class="form-group">
                                    <label>NO HANDPHONE</label>
                                    <input type="text" id="txtNoHp" class="form-control" />

                                </div>

                                <div id="DivIdStatus" class="form-group">
                                    <label>ID Status Drive</label>
                                    <select id="txtStsDrvr" class="form-control">
                                        <option value="1">Active</option>
                                        <option value="0">Non Active</option>
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
                        List Driver
                       
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">

                            <table class="table table-striped table-bordered table-hover" id="DataTbl">
                                <thead>
                                    <tr>
                                        <th>Id Driver</th>
                                        <th>Nomor Sim</th>
                                        <th>Nama Driver</th>
                                        <th>No Hp</th>
                                        <th>Id Status Driver</th>
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

        var _ListDriver = '<%= _ListDriver %>'


        var oDataMobil = $('#DataTbl').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "Id_Driver", "bVisible": false },
                { "mDataProp": "No_Sim" },
                { "mDataProp": "Nama" },
                { "mDataProp": "NoHp" },
                { "mDataProp": "StatusDriver" },
                { "mDataProp": "ID" },


            ]
        });





        var objMobil = (_ListDriver == '' ? [] : jQuery.parseJSON(_ListDriver));

        if (objMobil.length > 0) {


            var mobil = new Object();

            for (var i = 0; i < objMobil.length; i++) {


                mobil.Id_Driver = objMobil[i]["Id_Driver"];
                mobil.No_Sim = objMobil[i]["No_Sim"];
                mobil.Nama = objMobil[i]["Nama"];
                mobil.NoHp = objMobil[i]["No_Hp"];
                
                mobil.StatusDriver = objMobil[i]["StatusDriver"];

                mobil.ID = "<img src='../css/icons/16/edit.png' title='Edit'  id='" + objMobil[i]["Id_Driver"] + "'  class='edit'/>" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                    "<img src='../css/icons/16/cross.png' title='Hapus'  id='" + objMobil[i]["Id_Driver"] + "'  class='delete'/>";


                oDataMobil.fnAddData(mobil);
            }


        }



        $('.edit').on('click', function () {

            var id = $(this).attr("id").toString();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "MasterDriver.aspx/GetDataDriverById",
                data: "{'Id':'" + id + "'}",
                dataType: "json",
                success: function (data) {


                    var data = JSON.parse(data.d);



                    $('#txtNoSim').val(data[0]["No_Sim"]);
                    $('#txtNama').val(data[0]["Nama"]);
                    $('#txtNoHp').val(data[0]["No_Hp"]);
                    var sts = data[0]["StatusDriver"]
                    if (sts == 'true') 
                        $('#txtStsDrvr').val('1');
                    else
                        $('#txtStsDrvr').val('0');
                    
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
                    url: "MasterDriver.aspx/DeleteDriverById",
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


            
            var Driver = new Object();


            Driver.NoSim = $('#txtNoSim').val();
            Driver.Nama = $('#txtNama').val();
            Driver.NoHp = $('#txtNoHp').val();
            Driver.StatusDriver = $('#txtStsDrvr').val();
            var oDriver = { "oDriver": JSON.stringify(Driver) };



            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "MasterDriver.aspx/Save",
                data: JSON.stringify(oDriver),
                dataType: "json",
                success: function () {
                    

                        alert('Data  telah tersimpan.');
                        location.reload();
                    
                },
                error: function () {
                    return false;
                    //alert(error);
                }
            });


        });
    </script>


    
    
</asp:Content>
