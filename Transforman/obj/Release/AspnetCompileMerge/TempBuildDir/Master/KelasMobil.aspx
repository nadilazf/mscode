<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KelasMobil.aspx.cs" Inherits="Transforman.Master.KelasMobil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Kelas Mobil</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Kelas Mobil
                           
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="DivNoSim" class="form-group">
                                    <label>Kelas Mobil</label>
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
                        List Kelas mobil
                       
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">

                            <table class="table table-striped table-bordered table-hover" id="DataKelas">
                                <thead>
                                    <tr>
                                        <th>Id Kelas</th>
                                        <th>Kelas mobil</th>
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


        var _ListKelas = '<%= _ListKelas %>'

        var oDataKelas = $('#DataKelas').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "Id_Kelas", "bVisible": false },
                { "mDataProp": "Nama" },
                { "mDataProp": "ID" }
                
            ]
        });



        var glbid = "0";  

        var objKelas = (_ListKelas == '' ? [] : jQuery.parseJSON(_ListKelas));

        if (objKelas.length > 0) {


            var Kelas = new Object();

            for (var i = 0; i < objKelas.length; i++) {


                Kelas.Id_Kelas = objKelas[i]["id_Kelas"];
                Kelas.Nama = objKelas[i]["Nama_Kelas"];
                Kelas.ID = "<img src='../css/icons/16/edit.png' title='Edit'  id='" + objKelas[i]["id_Kelas"] + "'  class='edit'/>" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                    "<img src='../css/icons/16/cross.png' title='Hapus'  id='" + objKelas[i]["id_Kelas"] + "'  class='delete'/>";


                oDataKelas.fnAddData(Kelas);
            }


        }



        $('.edit').on('click', function () {

            var id = $(this).attr("id").toString();
            glbid = id;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "KelasMobil.aspx/GetDataKelasById",
                data: "{'Id':'" + id + "'}",
                dataType: "json",
                success: function (data) {


                    var data = JSON.parse(data.d);
                    $('#txtNama').val(data[0]["Nama_Kelas"]);
                    
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
                    url: "KelasMobil.aspx/DeleteKelasById",
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
                url: "KelasMobil.aspx/Save",
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