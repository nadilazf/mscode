<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAdmin.aspx.cs" Inherits="Transforman.Web.Admin.ListAdmin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

        .ui-dialog {
        left: 50% !important;
        top: 30% !important;
        margin-left: -300px !important; 
        margin-top: -175px !important; 
}
    </style>



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
                            New Order 
                           
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="panel-heading">
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="DataNewOrder">
                                            <thead>
                                                <tr>
                                                    <th>Nama Order</th>
                                                    <th>Tgl_Penjemputan</th>
                                                    <th>Jam Penjemputan</th>
                                                    <th>Jumlah Penumpang</th>
                                                    <th>Pembuat Order</th>
                                                    <th>Nama Approval</th>
                                                    <th>Status</th>
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

        

            <div id="divHistory" style="display: none">


                <div class="row">

                    <div class="panel-body">

                        <div class="col-lg-6">
                            Nama Order : 
                            <label id="lblOrderName"></label>
                        </div>
                    </div>
                </div>




                <table class="table table-striped table-bordered table-hover" id="comment-table">

                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Activity</th>
                            <th>User</th>
                            <th>Comments</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>

            <div id="divdataOrder" style="display: none">



                <div class="row">

                    <div class="panel-body">

                        <div class="col-lg-6">

                            <input type="hidden" id="txtId" />
                            <div class="form-group">
                                <label>Tujuan :</label>
                                <input type="text" id="txtType" class="form-control" disabled />
                            </div>

                            <div class="form-group">
                                <label>Name Order</label>
                                <input type="text" id="txtOrderName" class="form-control" disabled />

                            </div>


                            <div class="form-group">
                                <label>Tgl Penjemputan</label>
                                <div class="input-group">
                                        <input type="text" class="form-control" name="sample-date" id="txtTglPenjemputan" name="sample-date"  />
                                        
                                    </div>
                            </div>


                            <div class="form-group">
                                <label>Jumlah Penumpang</label>
                                <input type="text" id="txtjmlPenumpang" class="form-control" disabled />
                            </div>

                            


                        </div>




                    </div>
                       <div id="divPenumpang" >
                        <div class="form-group">


                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Nama Penumpang
                       
                                </div>

                                <div class="panel-body">


                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="DataPenumpang">
                                            <thead>
                                                <tr>
                                                    <th>No pek</th>
                                                    <th>Nama</th>
                                                    <th>Flight</th>
                                                    <th>Mobil</th>
                                                

                                                </tr>
                                            </thead>
                                        </table>

                                    </div>
                                </div>


                            </div>
                             
                        </div>


                    </div>

                    <div class="form-group">
                        <a class="btn btn-primary" id="btnSimpan">Approve By Admin</a>


                    </div>


                </div>
            </div>



        </div>


    </div>

    <script>


        var ListNewOrder = '<%= ListNewOrder %>'
        

        var Admin = '<%= Admin %>';


        var _DataMobil = '<%= _DataMobil %>'
        var dataMobil = $.parseJSON(_DataMobil);

        var _DataDriver = '<%= _DataDriver %>'
        var dataDriver = $.parseJSON(_DataDriver);







        $("#divdataOrder").dialog({
            autoOpen: false,
            //modal: true,
            width: "850",
            zIndex: "100",
            left: "2000px",
            bFilter: true


        });

     
        


        $("#divHistory").dialog({
            autoOpen: false,
            //modal: true,
            width: "850",
            zIndex: "100",
            bFilter: true


        });


        var oDataNewOrder = $('#DataNewOrder').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": true,
            "bFilter": true,
            "bPaginate": true,
            "aoColumns": [

                { "mDataProp": "NamaOrder", "asSorting": ["desc"]  },
                { "mDataProp": "TglPenjemputan" },
                { "mDataProp": "JamPenjemputan" },
                { "mDataProp": "JumlahPenumpang" },
                { "mDataProp": "PembuatOrder" },
                { "mDataProp": "Approval", "bVisible": false },
                { "mDataProp": "Status", "asSorting": ["asc"]  },
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
                { "mDataProp": "Tgl_Keberangkatan" },
                { "mDataProp": "Mobil" }
         
            ]
        });



        

        var objNewOrder = (ListNewOrder == '' ? [] : jQuery.parseJSON(ListNewOrder));

        if (objNewOrder.length > 0) {


            var NewOrder = new Object();

            for (var i = 0; i < objNewOrder.length; i++) {


                NewOrder.NamaOrder = objNewOrder[i]["Nama_Order"];
                NewOrder.TglPenjemputan = objNewOrder[i]["Tgl_Penjemputan"];
                NewOrder.JamPenjemputan = objNewOrder[i]["Jam_Penjemputan"];
                NewOrder.JumlahPenumpang = objNewOrder[i]["Jumlah_Penumpang"];
                NewOrder.PembuatOrder = objNewOrder[i]["Nama"];
                NewOrder.Approval = objNewOrder[i]["Approval"];
                var status = objNewOrder[i]["Status"];

                var SelectData = "";

                if (status == '-1')
                    NewOrder.Status = 'Reject';
                if (status == '0')
                    NewOrder.Status = 'Revisi';
                if (status == '1')
                    NewOrder.Status = 'Order Baru';
                if (status == '2')
                    NewOrder.Status = 'Approval';
                if (status == '3')
                    NewOrder.Status = 'Cek pos1';

                if (status == '4')
                    NewOrder.Status = 'Cek pos9';



                if (status == '5')
                    NewOrder.Status = 'Complete';


                if (status == '2')
                    NewOrder.ID = "<a class='Approve' title='Detail' href='javascript:void(0)' id='" + objNewOrder[i]["Id_Order"] + "' name='" + objNewOrder[i]["Status"] + "' > Proses</a >" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp'
                        + "<a class='SelectedHistory' title='History' href='javascript:void(0)' id='" + objNewOrder[i]["Id_Order"] + "' name='" + objNewOrder[i]["Nama_Order"] + "' >History</a >";
                else
                    NewOrder.ID = "<a class='SelectedDetail' title='Detail' href='javascript:void(0)' id='" + objNewOrder[i]["Id_Order"] + "' name='" + objNewOrder[i]["Status"] + "' > Detail</a >" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp'
                        + "<a class='SelectedHistory' title='History' href='javascript:void(0)' id='" + objNewOrder[i]["Id_Order"] + "' name='" + objNewOrder[i]["Nama_Order"] + "' >History</a >";







                oDataNewOrder.fnAddData(NewOrder);
            }





        }


      


       

        var oDatacomment = $('#comment-table').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "Date" },
                { "mDataProp": "Activity" },
                { "mDataProp": "User" },
                { "mDataProp": "Comments" }


            ]
        });



        $('.SelectedHistory').on('click', function () {

            $("#divHistory").dialog("open");
            
            var id = $(this).attr("id").toString();
            var order = $(this).attr("name").toString();

            $('#lblOrderName').text(order);

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ListAdmin.aspx/History",
                data: "{'id':'" + id + "'}",
                dataType: "json",
                success: function (data) {
                    var data = JSON.parse(data.d);
                    if (data.length > 0) {

                        for (var i = 0; i < data.length; i++) {



                            NewData = new Object();
                            NewData.Date = data[i]["DateActivity"];
                            NewData.Activity = data[i]["Activity"];
                            NewData.User = data[i]["Nama"];
                            NewData.Comments = data[i]["Comments"];
                            oDatacomment.fnAddData(NewData);
                        }

                    }


                },
                error: function (error) {
                    alert(error);
                }
            });




        });


        $('.SelectedDetail').on('click', function () {


            var id = $(this).attr("id").toString();
            var name = $(this).attr("name").toString();

            top.location.href = "/Web/Costumer/CreateOrder.aspx?Id_Order=" + id + '&Status=' + name + '&Admin=1';





        });



        $('.Approve').on('click', function () {



            $("#divdataOrder").dialog("open");
            var id = $(this).attr("id").toString();
            var name = $(this).attr("name").toString();


            $("#txtId").val(id);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ListAdmin.aspx/Detail",
                data: "{'id':'" + id + "'}",
                dataType: "json",
                success: function (data) {
                    var data = JSON.parse(data.d);
                    if (data[0]["Type_Order"] == 1)
                        $('#txtType').val("Kasim-Sorong-Flight");
                    if (data[0]["Type_Order"] == 2)
                        $('#txtType').val("Kasim-Sorong");

                    if (data[0]["Type_Order"] == 2)
                        $('#txtType').val("Sorong-Kasim");
                    $('#txtOrderName').val(data[0]["Nama_Order"]);
                    $('#txtTglPenjemputan').val(data[0]["Tgl_Penjemputan"]);
                    $('#txtjmlPenumpang').val(data[0]["Jumlah_Penumpang"]);


                    GetDataPenumpangById(id);


                },
                error: function (error) {
                    alert(error);
                }
            });

           
        });



        function GetDataPenumpangById(id) {

            oDataPenumpang.fnClearTable();


           
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ListAdmin.aspx/GetDataPenumpangById",
                data: "{'id' :'" + id + "'}",
                dataType: "json",
                success: function (data) {
                    var data = JSON.parse(data.d);

                    if (data.length > 0) {


                        var NewPenumpang = new Object();

                        for (var i = 0; i < data.length; i++) {
                            NewPenumpang.No_Pek = data[i]["No_Pek"];
                            NewPenumpang.Nama_Penumpang = data[i]["Nama_Penumpang"];
                            NewPenumpang.Tgl_Keberangkatan = data[i]["Tgl_Keberangkatan"];
                            NewPenumpang.Mobil = "<select id='txtMobil" + i + "' ><option value='0'>Pilih Mobil</option> </select>";
                            //NewPenumpang.Sopir = "";
                            oDataPenumpang.fnAddData(NewPenumpang);
                        }



                        GetdataMobil();


                    }


                },
                error: function (error) {
                    alert(error);
                }
            });
        }



        $('#btnSimpan').on('click', function () {

            var oHeader = new Object();
            var aTrs = oDataPenumpang.fnGetData();
            var id_order = $('#txtId').val();

            oHeader.id = id_order
            oHeader.Admin = Admin;

            var PenumpangArray = new Array();


            var ins = $('#DataPenumpang').find("tbody select").map(function () {

                return $(this).find(":selected").text() // get selected text
              

            }).get()
           

            for (var i = 0; i < aTrs.length; i++) {

                var PenumpangRow = new Object();
                
                PenumpangRow.NoPek = aTrs[i]["No_Pek"];
                PenumpangRow.Nama = aTrs[i]["Nama_Penumpang"];
                PenumpangRow.Mobil = ins[i];
;
                PenumpangArray[i] = PenumpangRow;
            }
            
            oHeader.Detail = PenumpangArray;

            var RequestList = { "requestlist": JSON.stringify(oHeader) };

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ListAdmin.aspx/UpdateByAdmin",
                data: JSON.stringify(RequestList),
                dataType: "json",
                success: function (data) {
                    alert("Data telah di approve oleh admin");
                    location.reload();

                },
                error: function (error) {
                    alert(error);
                }
            });

        });

      


        function GetdataMobil() {
          


            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ListAdmin.aspx/GetDataMobil",
                dataType: "json",
                success: function (data) {
                    var data = JSON.parse(data.d);

 
        //            'txtMobil" + i + "'
                    var aTrs = oDataPenumpang.fnGetData();
                    for (var i = 0; i < aTrs.length; i++) {
                        var mobil = $('#txtMobil'+i);

                        $.each(data, function (key, value) {
                            mobil.append('<option value="' + value.No_Polisi + '">' + value.No_Polisi + '</option>');
                        });
                    }

                },
                error: function (error) {
                    alert(error);
                }
            });



        }


        
        //$(document).on('change', '#txtMobil', function () {
        //    var Nopol = this.value;

        //    $.ajax({
        //        type: "POST",
        //        contentType: "application/json; charset=utf-8",
        //        url: "ListAdmin.aspx/GetDataKursiMobil",
        //        data: "{'Nopol' :'" + Nopol + "'}",
        //        dataType: "json",
        //        success: function (data) {
        //            var data = JSON.parse(data.d);

        //            if (data.length > 0) {


        //                var NewData = new Object();
        //                for (var i = 0; i < data.length; i++) {

                           
        //                }

        //            }



        //        },
        //        error: function (error) {
        //            alert(error);
        //        }
        //    });


        //});


        $('#btnPenjemputan').each(function () {
            var target = $(this).data('target-name');
            var t = $('input[name=' + target + ']');
            t.datepicker({
                dateFormat: 'yy-mm-dd',
            });
            $(this).on("click", function () {
                t.datepicker("show");
            });
        });
        $('#txtTglPenjemputan').click(function () {
            var pLeft = '309.969px';
            $('#ui-datepicker-div').css({ 'left': pLeft });
        });
        
        $('#txtTglPenjemputan').datepicker({
            dateFormat: 'dd M yy',
            minDate: 0

        });
      

      



    </script>
</asp:Content>
