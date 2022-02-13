<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterPesawat.aspx.cs" Inherits="Transforman.Master.MasterPesawat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Master Pesawat</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Create Pesawat
                           
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="DivNoSim" class="form-group">
                                    <label>Nama Pesawat</label>
                                    <input type="text" id="txtNama" class="form-control" />

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

                            <table class="table table-striped table-bordered table-hover" id="DataPesawat">
                                <thead>
                                    <tr>
                                        <th>Id Pesawat</th>
                                        <th>Nama Pesawat</th>
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


        var _ListPesawat = '<%= _ListPesawat %>'

        var oDataPesawat = $('#DataPesawat').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "Id_Pesawat", "bVisible": false },
                { "mDataProp": "Nama" },
                { "mDataProp": "ID" }
                
            ]
        });



        var glbid = "0";  

        var objPesawat = (_ListPesawat == '' ? [] : jQuery.parseJSON(_ListPesawat));

        if (objPesawat.length > 0) {


            var Pesawat = new Object();

            for (var i = 0; i < objPesawat.length; i++) {


                Pesawat.Id_Pesawat = objPesawat[i]["Id_Pesawat"];
                Pesawat.Nama = objPesawat[i]["Nama_Pesawat"];

                Pesawat.ID = "<img src='../css/icons/16/edit.png' title='Edit'  id='" + objPesawat[i]["Id_Pesawat"] + "'  class='edit'/>" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                    "<img src='../css/icons/16/cross.png' title='Hapus'  id='" + objPesawat[i]["Id_Pesawat"] + "'  class='delete'/>";


                oDataPesawat.fnAddData(Pesawat);
            }


        }



        $('.edit').on('click', function () {

            var id = $(this).attr("id").toString();
            glbid = id;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "MasterPesawat.aspx/GetDataPesawatById",
                data: "{'Id':'" + id + "'}",
                dataType: "json",
                success: function (data) {


                    var data = JSON.parse(data.d);
                    $('#txtNama').val(data[0]["Nama_Pesawat"]);
                    
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
                    url: "MasterPesawat.aspx/DeletePesawatById",
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
            
           var  nama = $('#txtNama').val();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "MasterPesawat.aspx/Save",
                data: "{'id':'" + glbid + "','Nama':'" + nama + "'}",
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


