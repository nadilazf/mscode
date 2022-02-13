<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pos1.aspx.cs" Inherits="Transforman.Web.Costumer.Pos1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default">
        <div id="page-wrapper">


            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">List Order</h3>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="panel-heading">
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="DataApproval">
                                            <thead>
                                                <tr>
                                                    <th>No Polisi</th>
                                                    <th>Nama Driver</th>
                                                    <th>Tgl_Penjemputan</th>
                                                    <th>Jumlah Penumpang</th>
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

          





            <div id="divdataPenumpang" style="display: none">

                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="form-group">
                                Nama Order :
                                <label id="lblOrder"></label>


                            </div>

                        </div>
                         <input type="hidden" id="txtId" />
                        <div class="panel-body">


                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="DataPenumpang">
                                    <thead>
                                        <tr>
                                            <th>No pek</th>
                                            <th>Nama Penumpang</th>
                                            <th>Nama Order</th>
                                            <th>Tgl Keberangkatan</th>
                                            <th>Jam Flight</th>



                                        </tr>
                                    </thead>
                                </table>

                            </div>
                        </div>
                    </div>
                    <label>Keterangan</label>
                    <textarea name="Text1" id="txtKet" cols="40" rows="5" class="form-control"></textarea>

                </div>
                <br />
                <div class="form-group">
                        <a class="btn btn-primary" id="btnSimpan">Approve</a>


                    </div>





            </div>


        </div>

    </div>
    <script>


        var _ListApproval = '<%= _ListApproval %>'
        var Approval = '<%= Approve %>';

        var oDataApproval = $('#DataApproval').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": true,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "NoPol" },
                { "mDataProp": "Nama" },
                { "mDataProp": "TglPenjemputan" },
                { "mDataProp": "JumlahPenumpang" },
                { "mDataProp": "ID" }

            ]
        });


        var oDataPenumpang = $('#DataPenumpang').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [


                { "mDataProp": "No_Pek" },
                { "mDataProp": "Nama_Penumpang" },
                { "mDataProp": "Id_Order" },
                { "mDataProp": "Tgl_Keberangkatan" },
                { "mDataProp": "Jam_Flight" }
               




            ]
        });


        var objApprval = (_ListApproval == '' ? [] : jQuery.parseJSON(_ListApproval));

        if (objApprval.length > 0) {


            var PenumpangRow = new Object();

            for (var i = 0; i < objApprval.length; i++) {


                PenumpangRow.NoPol = objApprval[i]["No_polisi"];
                PenumpangRow.Nama = objApprval[i]["NamaDriver"]
                PenumpangRow.TglPenjemputan = objApprval[i]["Tgl_Penjemputan"];
                PenumpangRow.JumlahPenumpang = objApprval[i]["Jumlah_Penumpang"];



                PenumpangRow.ID = "<a class='SelectedDetail' title='Detail' href='javascript:void(0)' id='" + objApprval[i]["No_polisi"] + "' name='" + objApprval[i]["No_polisi"] + "' >Detail</a >";
                //"<a class='SelectedValue' title='Approve' href='javascript:void(0)' id='" + objApprval[i]["Id_Order"] + "' name = 'Approve' >Approve</a >" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp'

                oDataApproval.fnAddData(PenumpangRow);
            }





        }


       

        $("#divdataPenumpang").dialog({
            autoOpen: false,
            //modal: true,
            width: "600",
            zIndex: "80",
            bFilter: true


        });




       


        $('.SelectedDetail').on('click', function () {



            oDataPenumpang.fnClearTable();

            var id = $(this).attr("id").toString();
            var name = $(this).attr("name").toString();
           

            $("#lblOrder").text(name);
            //top.location.href = "/Web/Costumer/CreateOrder.aspx?Id_Order=" + id + '&Status=4'
            $("#divdataPenumpang").dialog("open");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Pos1.aspx/GetDataPenumpangById",
                data: "{'id' :'" + id + "'}",
                dataType: "json",
                success: function (data) {
                    var data = JSON.parse(data.d);

                    if (data.length > 0) {
                        var NewPenumpang = new Object();
                        for (var i = 0; i < data.length; i++) {
                            NewPenumpang.No_Pek = data[i]["No_Pek"];
                            NewPenumpang.Nama_Penumpang = data[i]["Nama_Penumpang"];
                            NewPenumpang.Id_Order = data[i]["Id_Order"];
                            NewPenumpang.Tgl_Keberangkatan = data[i]["Tgl_Keberangkatan"];
                            NewPenumpang.Jam_Flight = data[i]["Jam_Flight"];
                            
                            oDataPenumpang.fnAddData(NewPenumpang);
                        }





                    }


                },
                error: function (error) {
                    alert(error);
                }
            });







        });

        $('#btnSimpan').on('click', function () {

            var aTrs = oDataPenumpang.fnGetData();

            for (var i = 0; i < aTrs.length; i++) {

                var count = i;
                var id = aTrs[i]["Id_Order"];
                if ($("#txtKet").val() == "") {
                    alert("Silahkan isi keterangan sebelum melakukan approval.")
                } else {
                    var ket = $("#txtKet").val();

                   
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Pos1.aspx/Save",
                        data: "{'id':'" + id + "','Approval':'" + Approval + "','Ket':'" + ket + "'}",
                        dataType: "json",
                        success: function (data) {
                            //var data = JSON.parse(data.d);

                        },
                        error: function (error) {
                            alert(error);
                        }
                    });
                    if (count == aTrs.length - 1) {
                        alert("Approve Telah Dilakukan");
                        location.reload();
                    }


                }
            }

        });


    </script>
</asp:Content>
