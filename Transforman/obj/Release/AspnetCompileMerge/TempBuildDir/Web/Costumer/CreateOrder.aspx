<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="Transforman.Web.Costumer.CreateOrder" %>

<%@ Register Src="~/Web/Costumer/Comment.ascx" TagPrefix="uc1" TagName="Comment" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .ui-widget .ui-widget {
            font-size: 0em;
        }
    </style>

    <div id="page-wrapper">


        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">Create Order</h3>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Comments
                           
                    </div>
                    <div class="panel-body">

                        <uc1:Comment runat="server" ID="Comment1" />
                    </div>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Create Order
                           
                    </div>
                    <div class="panel-body">



                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="rdbKsf" checked="checked">Kasim-Sorong-Flight
                                        </label>
                                        <label>
                                            <input type="radio" name="optionsRadios" id="rdbKs">Kasim-Sorong
                                        </label>
                                        <label>
                                            <input type="radio" name="optionsRadios" id="rdbSk">Sorong-Kasim
                                        </label>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label>Transaksi Order</label>

                                    <input type="text" id="txtOrder" class="form-control" disabled />
                                </div>

                                <div class="form-group">

                                    <label>Tgl Penjemputan</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="sample-date" id="txtTglPenjemputan" name="sample-date" readonly />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default" data-toggle="datepicker" data-target-name="sample-date" id="btnPenjemputan">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </button>
                                        </span>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label>Jam Penjemputan</label>
                                    <select id="txtJamPenjemputan" class="form-inline">
                                        <option>00</option>
                                        <option>01</option>
                                        <option>02</option>
                                        <option>03</option>
                                        <option>04</option>
                                        <option>05</option>
                                        <option>06</option>
                                        <option>07</option>
                                        <option>08</option>
                                        <option>09</option>
                                        <option>10</option>
                                        <option>11</option>
                                        <option>12</option>

                                        <option>13</option>
                                        <option>14</option>
                                        <option>15</option>
                                        <option>16</option>
                                        <option>17</option>
                                        <option>18</option>
                                        <option>19</option>
                                        <option>20</option>
                                        <option>21</option>
                                        <option>22</option>
                                        <option>23</option>
                                        <option>24</option>

                                    </select>
                                    <label>Menit</label>
                                    <select id="txtMenitPenjemputan" class="form-inline">
                                        <option>00</option>
                                        <option>05</option>
                                        <option>10</option>
                                        <option>15</option>
                                        <option>20</option>
                                        <option>25</option>
                                        <option>30</option>
                                        <option>35</option>
                                        <option>40</option>
                                        <option>45</option>
                                        <option>50</option>
                                        <option>55</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Jumlah Penumpang</label>

                                    <select id="txtjmlPenumpang" class="form-control">
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

                                <%--<div class="form-group">
                                    <label>Comment</label>
                                    <textarea class="form-control" rows="3" id="txtComment"></textarea>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        Nama Penumpang
                       
                    </div>

                    <div class="panel-body">

                        <div class="form-group">
                            <a class="btn btn-success glyphicon-plus" id="btnAdd">Add</a>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="DataTbl">
                                <thead>
                                    <tr>
                                        <th>Jenis Penumpang</th>
                                        <th>No pek</th>
                                        <th>Nama</th>
                                        <th>Pesawat</th>
                                        <th>FlighCode</th>
                                        <th>Tgl Keberangkatan</th>
                                        <th>Tgl Pulang</th>
                                        <th>Jam Flight</th>
                                        <th>Ket</th>
                                        <th>No SIJ</th>

                                    </tr>
                                </thead>

                            </table>

                        </div>


                    </div>
                </div>


                <div class="form-group" id="iscreate">
                    <a class="btn btn-primary" id="btnSimpan">Simpan</a>
                </div>

                <div class="form-group" id="isApprove" style="display: none">
                    <a class="btn btn-success" id="btnApprove">Approve</a>
                    <a class="btn btn-danger" id="btnReject">Reject</a>



                </div>


            </div>

        </div>

    </div>



    <div id="divdata" style="display: none">

        <div>
            <label>Jenis Penumpang</label>
            <select id="SelPenumpang" class="form-control">
                <option value="0">Pilih Jenis Penumpang</option>
                <option value="1">Pekerja</option>
                <option value="2">Tamu</option>
                <option value="3">Mitra Kerja</option>
            </select>
        </div>
        <div id="DivPegawai" class="form-group">
            <label>No Pegawai</label>
            <select id="txtNoPegawai" class="form-control">
                <option value="0">Pilih Pegawai</option>
            </select>


        </div>
        <div id="DivNonPegawai" style="display: none" class="form-group">
            <label>Nama</label>
            <input type="text" id="txtNama" class="form-control" />
        </div>
        <div class="form-group">
            <label>Pesawat</label>
            <select id="selPesawat" class="form-control">
                <option value="0">Pilih Pesawat</option>
            </select>
        </div>

        <div class="form-group">
            <label>Flight Code</label>
            <input type="text" id="txtFlightCode" class="form-control" />
        </div>
        <div class="form-group">
            <label>Jam Flight</label>
            <select id="txtJamFlight" class="form-inline">
                <option>00</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
                <option>05</option>
                <option>06</option>
                <option>07</option>
                <option>08</option>
                <option>09</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
                <option>13</option>
                <option>14</option>
                <option>15</option>
                <option>16</option>
                <option>17</option>
                <option>18</option>
                <option>19</option>
                <option>20</option>
                <option>21</option>
                <option>22</option>
                <option>23</option>
                <option>24</option>

            </select>
            <label>Menit</label>
            <select id="txtMenitFlight" class="form-inline">
                <option>00</option>
                <option>05</option>
                <option>10</option>
                <option>15</option>
                <option>20</option>
                <option>25</option>
                <option>30</option>
                <option>35</option>
                <option>40</option>
                <option>45</option>
                <option>50</option>
                <option>55</option>
            </select>
        </div>

        <div class="form-group">

            <label>Tgl Keberangkatan</label>
            <input type="text" id="txtTglKeberangkatan" class="form-control leftPicker" readonly />



        </div>


        <div class="form-group">
            <label>Tgl Pulang</label>
            <input type="text" id="txtTglPulang" class="form-control leftPicker" readonly />
        </div>


        <div class="form-group">
            <label>Rangka</label>
            <textarea class="form-control" rows="3" id="txtRangka"></textarea>
        </div>
        <div class="form-group">
            <label>NO SIJ/SPD</label>
            <input type="text" id="txtNoSij" class="form-control" />
        </div>






        <button type="submit" id="btnAddpenumpang" data-target="#myModal" class="btn btn-success ">Add Penumpang</button>


    </div>


    <div id="divKet" style="display: none">
        <div class="panel-body">
            <div class="row">
                <div class="col-lg-12">


                    <div class="form-group">
                        <label>Keterangan</label>
                        <input type="hidden" id="txtactivity" />
                        <input type="hidden" id="txtName" />

                        <textarea name="Text1" id="txtKet" cols="40" rows="5" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <a class="btn btn-primary" id="btnSimpanKet">Ok</a>


                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>


        jQuery.blockUI();
        $('#txtTglPenjemputan').datepicker({
            dateFormat: 'dd M yy',
            minDate: 0

        });


        $('#txtTglKeberangkatan').datepicker({
            dateFormat: 'dd M yy',
            minDate: 0

        });


        $('#txtTglPulang').datepicker({
            dateFormat: 'dd M yy',
            minDate: 0


        });





        $('#txtTglKeberangkatan').click(function () {
            var pLeft = '161.969px';
            $('#ui-datepicker-div').css({ 'left': pLeft });
        });


        $('#txtTglPulang').click(function () {
            var pLeft = '161.969px';
            $('#ui-datepicker-div').css({ 'left': pLeft });
        });


        var _Pesawatlist = '<%= _Pesawat %>'
        var request = $.parseJSON(_Pesawatlist);


        var ListNoPegawai = '<%= ListNoPegawai %>'
        var _ListNoPegawai = $.parseJSON(ListNoPegawai);


        var _RequestOrder = '<%= _Id_Order %>'
        var _OrderNumber = '<%= _OrderNumber %>'

        var _ListOrder = '<%= _ListOrder %>'
        var NoPek = '<%= NoPek %>';
        var TypeUser = '<%= TypeUser %>';

        var Status;

        var StatusActivity = '<%= StatusApp %>'

        var IsAdmin = '<%= IsAdmin %>'




        //select data pesawat
        var sel = $('#selPesawat');

        $.each(request, function (key, value) {
            sel.append('<option value="' + value.Nama_Pesawat + '">' + value.Nama_Pesawat + '</option>');
        });

        //===

        $('#txtOrder').val(_OrderNumber);

        var NoPegawai = $('#txtNoPegawai');

        $.each(_ListNoPegawai, function (key, value) {

            NoPegawai.append('<option value="' + value.No_Pek + '">' + value.No_Pek + '-' + value.Nama + '</option>');
        });


        var objorder = (_ListOrder == '' ? [] : jQuery.parseJSON(_ListOrder));

        if (objorder.length > 0) {


            var IdOrder = objorder[0]["Id_Order"]
            var TypeOrder = objorder[0]["Type_Order"];


            Status = parseInt(objorder[0]["Status"])

            if (parseInt(StatusActivity) > 1)
                fromReadonly();
            if (parseInt(StatusActivity) == -1 || parseInt(StatusActivity) == 1 || parseInt(StatusActivity) == 0)
                fromDisabled();


            if (TypeOrder == 1)
                $('#rdbKsf').attr('checked', true);

            if (TypeOrder == 2)
                $('#rdbKs').attr('checked', true);
            if (TypeOrder == 3)
                $('#rdbSk').attr('checked', true);


            $('#txtOrder').val(objorder[0]["Nama_Order"]);
            $('#txtTglPenjemputan').val(objorder[0]["Tgl_Penjemputan"]);
            $('#txtjmlPenumpang').val(objorder[0]["Jumlah_Penumpang"]);
            var jam = objorder[0]["Jam_Penjemputan"];
            var arr = jam.split(':');
            $('#txtJamPenjemputan').val(arr[0]);
            $('#txtMenitPenjemputan').val(arr[1]);


            GetPenumpangByOrderId(IdOrder);


        }





        var oDataTbl = $('#DataTbl').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "JenisPenumpang" },
                { "mDataProp": "NoPek" },
                { "mDataProp": "Nama" },
                { "mDataProp": "Pesawat" },
                { "mDataProp": "FlighCode" },
                { "mDataProp": "tglKeberangkatan" },
                { "mDataProp": "tglPulang" },
                { "mDataProp": "JamFligh" },
                { "mDataProp": "Ket" },
                { "mDataProp": "NoSIJ" }

            ]
        });

        $('#SelPenumpang').on('change', function () {
            var JnsPenumpang = $('#SelPenumpang').val();
            if (JnsPenumpang == "1") {
                $('#DivPegawai').show();
                $('#DivNonPegawai').hide();
            } else {
                $('#DivPegawai').hide();
                $('#DivNonPegawai').show();
            }

        });

        $('#selTransaksi').on('change', function () {
            var IdTransaksi = $('#selTransaksi').val();

            if (IdTransaksi != "0") {
                getdataOrder(IdTransaksi);
            } else {
                $('#txtTglPenjemputan').val("");
                $('#txtjmlPenumpang').val("");
                $('#txtJamPenjemputan').val("");

            }

        });




        $('#btnAddpenumpang').on('click', function () {


            NewData = new Object();

            var CanSave = "";
            var validation = "";

            var JnsPenumpang = $('#SelPenumpang option:selected').text();
            var valJnsPenumpang = $('#SelPenumpang').val();

            var Namapenumpang = "";



            if (valJnsPenumpang == "1") {

                Nopek = $('#txtNoPegawai').val();
                var str = $('#txtNoPegawai option:selected').text();
                var res = str.split("-");
                Namapenumpang = res[1];

            } else {
                Nopek = "";
                Namapenumpang = $('#txtNama').val();


            }

            var Pesawat = $('#selPesawat').val();
            var flightCode = $('#txtFlightCode').val();
            var JamFligh = $('#txtJamFlight').val() + ":" + $('#txtMenitFlight').val();
            var TglKeberangkatan = $('#txtTglKeberangkatan').val();
            var TglPulang = $('#txtTglPulang').val();

            var Rangka = $('#txtRangka').val();
            var NoSij = $('#txtNoSij').val();


            var Nama_Transaksi_Order
            var Tgl_Penjemputan

            var Jam_Penjemputan
            var Jumlah_Penumpang
            var No_Polisi = null;
            var Id_Driver = 0;
            var Status = 1;
            var Id_Transaksi_Order = null;
            if (valJnsPenumpang == "0") {
                validation += "- Pilih Jenis Penumpang \n";
            } else {
                if (valJnsPenumpang == "1") {
                    if (Nopek == "" || Nopek == "0")
                        validation += "- Pilih No pek \n";


                } else {
                    if (Namapenumpang == "")
                        validation += "- Isi Nama Penumpang \n";
                }
            }

            if (flightCode == "")
                validation += "- Silahkan isi Flight Code \n";

            if (JamFligh == "")

                if (TglKeberangkatan == "")
                    validation += "- Silahkan isi Tgl Keberangkatan \n";
            if (TglPulang == "")
                validation += "- Silahkan isi Tgl Pulang \n";
            if (NoSij == "")
                validation += "- Silahkan isi No Sij \n";
            if (validation == "") {

                NewData.JenisPenumpang = JnsPenumpang;
                NewData.NoPek = Nopek;
                NewData.Nama = Namapenumpang;
                NewData.Pesawat = Pesawat;
                NewData.FlighCode = flightCode;
                NewData.JamFligh = JamFligh;
                NewData.tglKeberangkatan = TglKeberangkatan;
                NewData.tglPulang = TglPulang;
                NewData.Ket = Rangka;
                NewData.NoSIJ = NoSij;

                oDataTbl.fnAddData(NewData);
                Clearform();
                $("#divdata").dialog("close");


            } else {
                alert(validation);
            }




        });


        $('#btnAdd').on('click', function () {

            var aTrs = oDataTbl.fnGetData();
            var jml = $('#txtjmlPenumpang').val()

            var validation = "";
            if ($('#txtTglPenjemputan').val() == "")
                validation += "Silahkan isi tgl penjemputan \n"


            if ($('#txtJamPenjemputan').val() == "00")
                validation += "Silahkan isi jam penjemputan \n"

            if ($('#txtjmlPenumpang').val() == "")
                validation += "Silahkan isi jumlah penumpang \n"

            if (jml <= aTrs.length)
                validation += "Nama penumpang  tidak boleh melebihi kapasitas \n"

            if (validation != "") {
                alert(validation)
                return false;

            } else {
                $("#divdata").dialog("open");



                return false;

            }


        });

        $('#btnSimpan').on('click', function () {





            var OrderHeader = new Object();
            var aTrs = oDataTbl.fnGetData();

            var TypeOrder = 0;
            if ($('#rdbKsf').prop('checked') == true)
                TypeOrder = 1
            if ($('#rdbKs').prop('checked') == true)
                TypeOrder = 2

            if ($('#rdbSk').prop('checked') == true)
                TypeOrder = 3

            var validation = "";

            var NamaOrder = $('#txtOrder').val();
            var TglPenjemputan = $('#txtTglPenjemputan').val();
            var JamPenjemputan = $('#txtJamPenjemputan').val() + ':' + $('#txtMenitPenjemputan').val();
            var JumlahPenumpang = $('#txtjmlPenumpang').val();

            if (TglPenjemputan == "")
                validation += 'Silahkan Masukan Tgl Penjemputan. \n';

            if (JamPenjemputan == "")
                validation += 'Silahkan Masukan Jam Penjemputan. \n';
            if (JumlahPenumpang == "")
                validation += 'Silahkan Masukan Jumlah Penumpang. \n';

            if (aTrs.length == 0)

                validation += 'Silahkan Masukan Data Penumpang. \n';





            if (validation == "") {

                jQuery.blockUI();

                // order
                OrderHeader.Id_Order = _RequestOrder
                OrderHeader.Type_Order = TypeOrder;
                OrderHeader.Nama_Order = NamaOrder;
                OrderHeader.Tgl_Penjemputan = TglPenjemputan;
                OrderHeader.Jam_Penjemputan = JamPenjemputan;
                OrderHeader.Jumlah_Penumpang = JumlahPenumpang;
                OrderHeader.No_polisi = null;
                OrderHeader.Id_Driver = null;
                OrderHeader.Status = 1;
                OrderHeader.CreatedBy = NoPek;

                //====


                //penumpang
                var PenumpangArray = new Array();

                for (var i = 0; i < aTrs.length; i++) {

                    var PenumpangRow = new Object();
                    if (aTrs[i]["JenisPenumpang"] == 'Pekerja')
                        PenumpangRow.JenisPenumpang = 1;
                    if (aTrs[i]["JenisPenumpang"] == 'Tamu')
                        PenumpangRow.JenisPenumpang = 2;

                    if (aTrs[i]["JenisPenumpang"] == 'Mitra Kerja')
                        PenumpangRow.JenisPenumpang = 3;


                    PenumpangRow.NoPek = aTrs[i]["NoPek"];
                    PenumpangRow.Nama = aTrs[i]["Nama"];
                    PenumpangRow.Pesawat = aTrs[i]["Pesawat"];
                    PenumpangRow.FlighCode = aTrs[i]["FlighCode"];
                    PenumpangRow.JamFligh = aTrs[i]["JamFligh"];
                    PenumpangRow.tglKeberangkatan = aTrs[i]["tglKeberangkatan"];
                    PenumpangRow.tglPulang = aTrs[i]["tglPulang"];
                    PenumpangRow.Ket = aTrs[i]["Ket"];
                    PenumpangRow.NoSIJ = aTrs[i]["NoSIJ"];
                    //PenumpangRow.IdTransaksiOrder = IdTransaksiOrder;
                    PenumpangArray[i] = PenumpangRow;
                }



                OrderHeader.PenumpangDetail = PenumpangArray;

                var RequestList = { "requestlist": JSON.stringify(OrderHeader) };

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "CreateOrder.aspx/Save",
                    data: JSON.stringify(RequestList),
                    dataType: "json",
                    success: function (response) {
                        alert('Data order telah tersimpan.');


                        //top.location.href = "CreateOrder.aspx?Id_Order=" + response.d

                        top.location.href = "ListOrder.aspx"

                        jQuery.unblockUI();

                    },
                    error: function (error) {
                        alert(error);
                        jQuery.unblockUI();
                    }
                });

            } else {
                alert(validation);
            }

        });


        $('#btnApprove').on('click', function () {

            activity('Approve', StatusActivity)

        });


        $('#btnReject').on('click', function () {
            activity('Reject', StatusActivity)


        });




        $('#btnSimpanKet').on('click', function () {

            if ($("#txtKet").val() == '') {
                alert("Silahkan isi Keterangan ");

            } else {

                var StatusActivity = $("#txtactivity").val();
                var isSubmit = $("#txtName").val();
                var Ket = $("#txtKet").val();
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "CreateOrder.aspx/activity",
                    data: "{'id':'" + _RequestOrder + "','name':'" + isSubmit + "','Approval':'" + NoPek + "','Status':'" + StatusActivity + "','Ket':'" + Ket + "'}",
                    dataType: "json",
                    success: function (data) {
                        alert(data.d);

                        if (StatusActivity == '2')
                            top.location.href = '/Web/Approval/Approval.aspx';
                        if (StatusActivity == '3')
                            top.location.href = '/Web/Admin/ListAdmin.aspx';


                    },
                    error: function (error) {
                        alert(error);
                    }
                });
            }


        });



        function activity(isSubmit, StatusActivity) {


            if (StatusActivity == '2' || StatusActivity == '3') {

                //if (isSubmit == 'Approve') {

                var r;
                if (isSubmit == 'Reject' || isSubmit == 'Revisi') {

                    $("#txtactivity").val(StatusActivity);
                    $("#txtName").val(isSubmit);


                    $("#divKet").dialog("open");



                } else {
                    r = confirm("Apakah Anda Yakin Akan Approve order ini!");
                }

                if (r == true) {
                    var Ket = "";
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "CreateOrder.aspx/activity",
                        data: "{'id':'" + _RequestOrder + "','name':'" + isSubmit + "','Approval':'" + NoPek + "','Status':'" + StatusActivity + "','Ket':'" + Ket + "'}",
                        dataType: "json",
                        success: function (data) {
                            alert(data.d);

                            if (StatusActivity == '2')
                                top.location.href = '/Web/Approval/Approval.aspx';
                            if (StatusActivity == '3')
                                top.location.href = '/Web/Admin/ListAdmin.aspx';


                        },
                        error: function (error) {
                            alert(error);
                        }
                    });
                }
            }
            if (StatusActivity == '4' || StatusActivity == '5') {

                $("#divKet").dialog("open");
                $("#txtactivity").val(StatusActivity);
                $("#txtName").val(isSubmit);

            }


        }


        $("#divdata").dialog({
            autoOpen: false,
            //modal: true,
            width: "850",
            zIndex: "100",
            bFilter: true



        });


        $("#divKet").dialog({
            autoOpen: false,
            //modal: true,
            width: "500",
            zIndex: "70",
            bFilter: true


        });
        function Clearform() {
            $('#selPesawat').val("0");
            $('#txtNoPegawai').val("");
            $('#txtNama').val("");

            $('#txtFlightCode').val("");
            $('#txtTglKeberangkatan').val("");
            $('#txtTglPulang').val("");

            $('#txtRangka').val("");
            $('#txtNoSij').val("");
        }



        function fromReadonly() {

            if (parseInt(StatusActivity) != 2) {



                $('#rdbKsf').attr('disabled', true);
                $('#rdbKs').attr('disabled', true);
                $('#rdbSk').attr('disabled', true);
                $('#txtOrder').attr('readonly', true);
                $('#txtjmlPenumpang').attr('readonly', true);
                $('#txtTglPenjemputan').attr('readonly', true);
                $('#txtJamPenjemputan').attr('disabled', true);
                $('#txtMenitPenjemputan').attr('disabled', true);
            }

            $('#btnAdd').attr('disabled', true);

            if (StatusActivity == "") {

                $('#iscreate').show();
                $('#isApprove').hide();
                $('#btnSimpan').attr('disabled', true);


            } else {
                if (IsAdmin == "") {
                    $('#iscreate').hide();
                    $('#isApprove').show();
                    if (StatusActivity == '3') {
                        $('#btnReject').hide();

                    } else {
                        if (TypeUser == 3) {
                            $('#iscreate').hide();
                            $('#isApprove').hide();
                        }
                    }

                }
                else {

                    $('#iscreate').hide();
                    $('#isApprove').hide();


                }
            }



        }


        function fromDisabled() {

            $('#rdbKsf').attr('disabled', true);
            $('#rdbKs').attr('disabled', true);
            $('#rdbSk').attr('disabled', true);



            $('#txtOrder').attr('readonly', true);
            $('#txtjmlPenumpang').attr('readonly', true);
            $('#txtTglPenjemputan').attr('readonly', true);

            $('#txtJamPenjemputan').attr('disabled', true);


            $('#txtMenitPenjemputan').attr('disabled', true);


            $('#btnAdd').attr('disabled', true);
            $('#isApprove').hide();
            $('#btnSimpan').attr('disabled', true);
            $('#iscreate').hide();
            $('#btnReject').hide();










        }




        function GetPenumpangByOrderId(OrderId) {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "CreateOrder.aspx/GetPenumpangByOrderId",
                data: "{'OrderId' :'" + OrderId + "'}",
                dataType: "json",
                success: function (data) {
                    var data = JSON.parse(data.d);

                    for (var i = 0; i < data.length; i++) {

                        var PenumpangRow = new Object();
                        if (data[i]["Jenis_Penumpang"] == '1')
                            PenumpangRow.JenisPenumpang = 'Pekerja';

                        if (data[i]["Jenis_Penumpang"] == '2')
                            PenumpangRow.JenisPenumpang = 'Tamu';

                        if (data[i]["Jenis_Penumpang"] == '3')
                            PenumpangRow.JenisPenumpang = 'Mitra Kerja';


                        PenumpangRow.NoPek = data[i]["No_Pek"];
                        PenumpangRow.Nama = data[i]["Nama_Penumpang"];
                        PenumpangRow.Pesawat = data[i]["Pesawat"];
                        PenumpangRow.FlighCode = data[i]["Flight_Code"];
                        PenumpangRow.tglKeberangkatan = data[i]["Tgl_Keberangkatan"];
                        PenumpangRow.tglPulang = data[i]["Tgl_Pulang"];
                        PenumpangRow.JamFligh = data[i]["Jam_Flight"];
                        PenumpangRow.Ket = data[i]["Keterangan"];
                        PenumpangRow.NoSIJ = data[i]["NO_SIJ"];
                        // PenumpangRow.Id_Order = IdTransaksiOrder;
                        //PenumpangArray[i] = PenumpangRow;
                        oDataTbl.fnAddData(PenumpangRow);

                    }




                },
                error: function (error) {
                    alert(error);
                }
            });
        }


        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }



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



        jQuery.unblockUI();

    </script>
</asp:Content>
