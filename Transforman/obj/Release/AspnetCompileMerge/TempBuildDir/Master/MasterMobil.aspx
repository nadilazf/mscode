<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterMobil.aspx.cs" Inherits="Transforman.master.MasterMobil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Create Master Mobil</h1>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Create Mobil
						   
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">

                                <div id="DivNoPol" class="form-group">
                                    <label>No Polisi</label>
                                    <input type="text" id="txtNoPol" class="form-control" />

                                </div>
                               
                                <div class="form-group">
                                    <label>Type dan Merk Mobil</label>
                                    <select id="JnsMbl" class="form-control">
                                        <option value="0">Pilih</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Kelas Mobil</label>
                                    <select id="KlsMbl" class="form-control">
                                        <option value="0">Pilih</option>
                                    </select>
                                </div>

                                <div id="DivIdDriver1" class="form-group">
                                    <label>ID Driver 1</label>
                                    <select id="txtIdDrvr1" class="form-control">
                                        <option value="0">Pilih</option>

                                    </select>


                                </div>
                                <div id="DivIdDriver2" class="form-group">
                                    <label>ID Driver 2</label>
                                    <select id="txtIdDrvr2" class="form-control">
                                        <option value="0">Pilih</option>

                                    </select>

                                </div>


                                <div  class="form-group">
                                    <label>Kapasitas</label>
                                    <select id="txtKapasitas" class="form-control">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>

                                    </select>


                                </div>


                                <div class="form-group">
                                    <label>Status Mobil</label>
                                    <select id="txtIdSttsMbl" class="form-control">
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
                        List Mobil
					   
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">

                            <table class="table table-striped table-bordered table-hover" id="DataMobil">
                                <thead>
                                    <tr>
                                        <th>Nomor Polisi</th>
                                        <th>Merk Dan Type </th>
                                        <th>Kelas Mobil</th>
                                        <th> Driver 1</th>
                                        <th> Driver 2</th>
                                        <th>Kapasitas</th>

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
        var _ListMobil = '<%= _ListMobil %>'
        var _ListDriver = '<%= _ListDriver %>'
        var _ListJenis = '<%= _ListJenis %>'
        var _ListKelas = '<%= _ListKelas %>'


        var iTransaksi = $.parseJSON(_ListDriver);
        var iListJenis = $.parseJSON(_ListJenis);
        var iListKelas = $.parseJSON(_ListKelas);




        var seltxtDriver1 = $('#txtIdDrvr1');
        var seltxtDriver2 = $('#txtIdDrvr2');

        var selJenis = $('#JnsMbl');
        var selKelas = $('#KlsMbl');



        $.each(iListJenis, function (key, value) {
            selJenis.append('<option value="' + value.Id_Merk + '">' + value.Nama_Merk + '</option>');
        });


        $.each(iListKelas, function (key, value) {
            selKelas.append('<option value="' + value.id_Kelas + '">' + value.Nama_Kelas + '</option>');
        });




        $.each(iTransaksi, function (key, value) {

            seltxtDriver1.append('<option value="' + value.Id_Driver + '">' + value.Nama + '</option>');
        });


        $.each(iTransaksi, function (key, value) {

            seltxtDriver2.append('<option value="' + value.Id_Driver + '">' + value.Nama + '</option>');
        });




        var oDataMobil = $('#DataMobil').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "NoPol" },
                { "mDataProp": "JnsMbl" },
                { "mDataProp": "KlsMbl" },
                { "mDataProp": "IdDriver1" },
                { "mDataProp": "IdDriver2" },
                { "mDataProp": "Kapasitas" },
                { "mDataProp": "ID" },


            ]
        });





        var objMobil = (_ListMobil == '' ? [] : jQuery.parseJSON(_ListMobil));

        if (objMobil.length > 0) {


            var mobil = new Object();

            for (var i = 0; i < objMobil.length; i++) {


                mobil.NoPol = objMobil[i]["No_Polisi"];
                mobil.JnsMbl = objMobil[i]["Nama_Merk"];
                mobil.KlsMbl = objMobil[i]["Nama_Kelas"]
                mobil.IdDriver1 = objMobil[i]["driver1"];
                var JnsPenumpang = $('#SelPenumpang option:selected').text();
                mobil.IdDriver2 = objMobil[i]["driver2"];
                mobil.Kapasitas = objMobil[i]["Kapasitas"];


                mobil.ID = "<img src='../css/icons/16/edit.png' title='Edit'  id='" + objMobil[i]["No_Polisi"] + "'  class='edit'/>" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                    "<img src='../css/icons/16/cross.png' title='Hapus'  id='" + objMobil[i]["No_Polisi"] + "'  class='delete'/>";


                oDataMobil.fnAddData(mobil);
            }


        }


        $('.edit').on('click', function () {

            var id = $(this).attr("id").toString();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "MasterMobil.aspx/GetDataMobilById",
                data: "{'NoPolisi':'" + id + "'}",
                dataType: "json",
                success: function (data) {


                    var data = JSON.parse(data.d);



                    $('#txtNoPol').val(data[0]["No_Polisi"]);
                    $('#JnsMbl').val(data[0]["Jenis"]);
                    $('#KlsMbl').val(data[0]["Kelas_Mobil"]);
                    $('#txtIdDrvr1').val(data[0]["Id_Driver1"]);
                    $('#txtIdDrvr2').val(data[0]["Id_Driver2"]);
                    $('#txtKapasitas').val(data[0]["Kapasitas"]);


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
                    url: "MasterMobil.aspx/DeleteMobilById",
                    data: "{'NoPolisi':'" + id + "'}",
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

            var Mobil = new Object();


            var validation = "";
            var NoPol = $('#txtNoPol').val();
            var Merk = "";
            var JnsMbl = $('#JnsMbl').val();
            var KlsMbl = $('#KlsMbl').val();
            var IdDriver1 = $('#txtIdDrvr1').val();
            var IdDriver2 = $('#txtIdDrvr2').val();
            var Kapasitas = $('#txtKapasitas').val();




            if (NoPol == "")
                validation += "Silahkan isi No Polisi \n";

            if (JnsMbl == "")
                validation += "Silahkan isi Jenis Mobil \n";
            if (KlsMbl == "")
                validation += "Silahkan isi Kelas Mobil \n";

            if (IdDriver1 == "")
                validation += "Silahkan isi Driver 1 \n";
            if (IdDriver2 == "")
                validation += "Silahkan isi Driver 2 \n";

            if (Kapasitas == "")
                validation += "Silahkan isi Kapasitas 2 \n";




            if (validation == "") {




                Mobil.NoPol = $('#txtNoPol').val();
                Mobil.Merk = "";
                Mobil.JnsMbl = $('#JnsMbl').val();
                Mobil.KlsMbl = $('#KlsMbl').val();
                Mobil.IdDriver1 = $('#txtIdDrvr1').val();
                Mobil.IdDriver2 = $('#txtIdDrvr2').val();
                Mobil.Kapasitas = $('#txtKapasitas').val();

                Mobil.IdStatus = 1;
                var oMobil = { "oMobil": JSON.stringify(Mobil) };



                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "MasterMobil.aspx/Save",
                    data: JSON.stringify(oMobil),
                    dataType: "json",
                    success: function () {
                        alert('Data order telah tersimpan.');
                        location.reload();

                    },
                    error: function () {
                        return false;
                        //alert(error);
                    }
                });
            } else {
                alert(validation);
            }


        });
    </script>



</asp:Content>
