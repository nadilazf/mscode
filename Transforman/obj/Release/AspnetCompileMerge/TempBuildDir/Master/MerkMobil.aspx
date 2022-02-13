<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MerkMobil.aspx.cs" Inherits="Transforman.Master.MerkMobil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Merk Mobil</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Merk Mobil                           
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="DivNoSim" class="form-group">
                                    <label>Nama Merk</label>
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

                            <table class="table table-striped table-bordered table-hover" id="DataMerk">
                                <thead>
                                    <tr>
                                        <th>Id Merk</th>
                                        <th>Nama Merk</th>
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


        var _ListMerk = '<%= _ListMerk %>'

        var oDataMerk = $('#DataMerk').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "Id_Merk", "bVisible": false },
                { "mDataProp": "Nama" },
                { "mDataProp": "ID" }
                
            ]
        });



        var glbid = "0";  

        var objMerk = (_ListMerk == '' ? [] : jQuery.parseJSON(_ListMerk));

        if (objMerk.length > 0) {


            var Merk = new Object();

            for (var i = 0; i < objMerk.length; i++) {


                Merk.Id_Merk = objMerk[i]["Id_Merk"];
                Merk.Nama = objMerk[i]["Nama_Merk"];

                Merk.ID = "<img src='../css/icons/16/edit.png' title='Edit'  id='" + objMerk[i]["Id_Merk"] + "'  class='edit'/>" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                    "<img src='../css/icons/16/cross.png' title='Hapus'  id='" + objMerk[i]["Id_Merk"] + "'  class='delete'/>";


                oDataMerk.fnAddData(Merk);
            }


        }



        $('.edit').on('click', function () {

            var id = $(this).attr("id").toString();
            glbid = id;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "MerkMobil.aspx/GetDataMerkById",
                data: "{'Id':'" + id + "'}",
                dataType: "json",
                success: function (data) {


                    var data = JSON.parse(data.d);
                    $('#txtNama').val(data[0]["Nama_Merk"]);
                    
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
                    url: "MerkMobil.aspx/DeleteMerkById",
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
                url: "MerkMobil.aspx/Save",
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








