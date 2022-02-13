<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Approval.aspx.cs" Inherits="Transforman.Web.Approval.Approval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default">


        <div id="page-wrapper">


            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">List Approval</h3>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Approval list 
                           
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
                                                    <th>Nama Order</th>
                                                    <th>Tgl_Penjemputan</th>
                                                    <th>Jam Penjemputan</th>
                                                    <th>Jumlah Penumpang</th>
                                                    <th>Pembuat Order</th>
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
        </div>
         <div id="divKet" style="display: none">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">

                            
                            <div class="form-group">
                                <label>Keterangan</label>
                                <input type="hidden" id="txtId" />
                                <input type="hidden" id="txtName" />

                                <textarea name="Text1" id="txtKet" cols="40" rows="5" class="form-control" ></textarea>
                            </div>
                            <div class="form-group">
                                <a class="btn btn-primary" id="btnSimpan">Ok</a>


                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </div>
    <script>


        var _ListApproval = '<%= _ListApproval %>'
        var Approval = '<%= Approve %>';








        var oDataApproval = $('#DataApproval').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": true,
            "bFilter": true,
            "bPaginate": true,
            "aoColumns": [

                { "mDataProp": "NamaOrder" },
                { "mDataProp": "TglPenjemputan" },
                { "mDataProp": "JamPenjemputan" },
                { "mDataProp": "JumlahPenumpang" },
                { "mDataProp": "PembuatOrder" },
                { "mDataProp": "ID" }
           
            ]
        });


        var objApprval = (_ListApproval == '' ? [] : jQuery.parseJSON(_ListApproval));

        if (objApprval.length > 0) {


            var PenumpangRow = new Object();
           
            for (var i = 0; i < objApprval.length; i++) {

               
                PenumpangRow.NamaOrder = objApprval[i]["Nama_Order"];
                PenumpangRow.TglPenjemputan = objApprval[i]["Tgl_Penjemputan"];
                PenumpangRow.JamPenjemputan = objApprval[i]["Jam_Penjemputan"];
                PenumpangRow.JumlahPenumpang = objApprval[i]["Jumlah_Penumpang"];
                PenumpangRow.PembuatOrder = objApprval[i]["Nama"];


                
                PenumpangRow.ID = "<a class='SelectedValue' title='Approve' href='javascript:void(0)' id='" + objApprval[i]["Id_Order"] + "' name = 'Approve' >Approve</a >" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp'
                    + "<a class='SelectedValue' title='Reject' href='javascript:void(0)' id='" + objApprval[i]["Id_Order"] + "' name='Reject' >Reject</a >" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp'
                    + "<a class='SelectedDetail' title='Detail' href='javascript:void(0)' id='" + objApprval[i]["Id_Order"] + "' name='Detail' >Detail</a >";

                oDataApproval.fnAddData(PenumpangRow);
            }

           

            

        }



        $("#divKet").dialog({
            autoOpen: false,
            //modal: true,
            width: "500",
            zIndex: "70",
            bFilter: true


        });

        
        $('.SelectedValue').on('click', function () {

          
            var id = $(this).attr("id").toString();
             $("#txtId").val(id);
             var name = $(this).attr("name").toString();
             $("#txtName").val(name);
             var Ket = "";
            var txt;
            var r ;
            if (name == 'Reject' || name == 'Revisi') {
                $("#divKet").dialog("open");
               

            } else {
                 r = confirm("Apakah Anda Yakin Akan " + name + " order ini!");
            }

            if (r == true) {

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Approval.aspx/Save",
                    data: "{'id':'" + id + "','name':'" + name + "','Approval':'" + Approval + "','Ket':'" + Ket + "'}",
                    dataType: "json",
                    success: function (data) {
                        alert(data.d);
                        location.reload();
                        //var data = JSON.parse(data.d);

                    },
                    error: function (error) {
                        alert(error);
                    }
                });

            }

        });

        
       
        $('.SelectedDetail').on('click', function () {


            var id = $(this).attr("id").toString();
            
            top.location.href = "/Web/Costumer/CreateOrder.aspx?Id_Order=" + id+'&Status=2'

          



        });

        
        $('#btnSimpan').on('click', function () {
            
            if ($("#txtKet").val() == '') {
                alert("Silahkan isi Keterangan ");

            } else {


                var id = $("#txtId").val();
                var name = $("#txtName").val();
                var Ket = $("#txtKet").val();

                $("#divKet").dialog("close");

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Approval.aspx/Save",
                    data: "{'id':'" + id + "','name':'" + name + "','Approval':'" + Approval + "','Ket':'" + Ket + "'}",
                    dataType: "json",
                    success: function (data) {
                        alert(data.d);
                        location.reload();
                        //var data = JSON.parse(data.d);

                    },
                    error: function (error) {
                        alert(error);
                    }
                });

            }

        });
    </script>

</asp:Content>
