<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListOrder.aspx.cs" Inherits="Transforman.Web.Costumer.ListOrder" %>

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
                            New Order 
                           
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                
                                <div class="panel-heading">
                                </div>
                               
                                <div class="panel-body">
                                    
                                 <div class="form-group">

                                    <a class="btn btn-success glyphicon-plus" id="btnAdd">Create Order</a>
                                
                                </div>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="DataNewOrder">
                                            <thead>
                                                <tr>
                                                    <th>Nama Order</th>
                                                    <th>Tgl_Penjemputan</th>
                                                    <th>Jam Penjemputan</th>
                                                    <th>Jumlah Penumpang</th>
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
        </div>
       

       
    </div>

     <script>


         var ListNewOrder = '<%= _List %>'

         var oDataApproval = $('#DataNewOrder').dataTable({
             "sPaginationType": "full_numbers",
             "bSort": true,
             "bFilter": true,
             "bPaginate": false,
             "aoColumns": [

                 { "mDataProp": "NamaOrder", "asSorting": ["desc"] },
                 { "mDataProp": "TglPenjemputan" },
                 { "mDataProp": "JamPenjemputan" },
                 { "mDataProp": "JumlahPenumpang" },
                 { "mDataProp": "Status" },
                 { "mDataProp": "ID" }

             ]
         });


         var objApprval = (ListNewOrder == '' ? [] : jQuery.parseJSON(ListNewOrder));

         if (objApprval.length > 0) {


             var PenumpangRow = new Object();

             for (var i = 0; i < objApprval.length; i++) {


                 PenumpangRow.NamaOrder = objApprval[i]["Nama_Order"];
                 PenumpangRow.TglPenjemputan = objApprval[i]["Tgl_Penjemputan"];
                 PenumpangRow.JamPenjemputan = objApprval[i]["Jam_Penjemputan"];
                 PenumpangRow.JumlahPenumpang = objApprval[i]["Jumlah_Penumpang"];
                 PenumpangRow.Status = objApprval[i]["NamaStatus"];
                 PenumpangRow.ID = "<a class='SelectedDetail' title='Detail' href='javascript:void(0)' id='" + objApprval[i]["Id_Order"] + "' name ='" + objApprval[i]["Status"] + "' >Detail</a >" 

                 oDataApproval.fnAddData(PenumpangRow);
             }





         }

         $('#btnAdd').on('click', function () {

             top.location.href = "CreateOrder.aspx"
         });

         $('.SelectedDetail').on('click', function () {


             var id = $(this).attr("id").toString();
             var name = $(this).attr("name").toString();

             
             top.location.href = "/Web/Costumer/CreateOrder.aspx?Id_Order=" + id + '&Status=' + name

            

         });


    </script>


</asp:Content>
