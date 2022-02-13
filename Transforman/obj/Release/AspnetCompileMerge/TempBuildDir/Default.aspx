<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Transforman.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Dashboard</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-automobile fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <label id="lblTotal"></label>
                                </div>
                                <div>
                                    <label id="lblTotalDesc"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="viewTotal">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right " ></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><label id="lblTotalSelesai"></label></div>
                                <div><label id="lblTotalSelesaiDesc"></label></div>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="viewTotalSelesai">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-shopping-cart fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><label id="lblTotalInprogress"></label></div>
                                <div><label id="lblTotalInprogressDecs"></label></div>
                            </div>
                        </div>
                    </div>
                    <a href="#"class="viewTotalProgress">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-support fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><label id="lblTotalReject"></label></div>
                                <div><label id="lblTotalRejectDesc"></label></div>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="viewTotalReject">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-8">

                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                               <i class="fa fa-book   fa-fw"></i>Activity
                    
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="Datalist">
                                            <thead>
                                                <tr>
                                                    <th>Nama Order</th>
                                                    <th>Date activity</th>
                                                    <th>Activity</th>
                                                    
                                                </tr>
                                            </thead>

                                        </table>

                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div id="morris-bar-chart"></div>
                            </div>
                            <!-- /.col-lg-8 (nested) -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->

                <!-- /.panel -->
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bell fa-fw"></i>Notifications Orders
                       
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                           <table class="table table-striped table-bordered table-hover" id="DataStatus">
                                            <thead>
                                                <tr>
                                                    <th>Nama Order</th>
                                                    <th>Status</th>
                                                    
                                                </tr>
                                            </thead>

                                        </table>

                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>


            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->
    </div>

    <script>

        $('#lblTotal').text('<%= Total %>');
        $('#lblTotalDesc').text('<%= TotalDesc %>');


        $('#lblTotalSelesai').text('<%= TotalSelesai %>');
        $('#lblTotalSelesaiDesc').text('<%= TotalSelesaiDesc %>');


        $('#lblTotalInprogress').text('<%= TotalInProgress %>');
        $('#lblTotalInprogressDecs').text('<%= TotalInProgressDesc %>');



        $('#lblTotalReject').text('<%= TotalReject %>');
        $('#lblTotalRejectDesc').text('<%= TotalRejectDesc %>');

        

        var ListData = '<%= ListData %>'
        var listStatus = '<%= listStatus %>'
        var TypeUser = '<%= TypeUser %>'
        






        var oDatalist = $('#Datalist').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": true,
            "bFilter": true,
            "bPaginate": true,
            "aoColumns": [

                { "mDataProp": "Nama_Order", "asSorting": ["desc"]  },
                { "mDataProp": "DateActivity" },
                { "mDataProp": "Activity" }
            ]
        });


        var oDataStatus = $('#DataStatus').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": true,
            "bFilter": true,
            "bPaginate": true,
            "aoColumns": [

                { "mDataProp": "Nama", "asSorting": ["desc"] },
                { "mDataProp": "Status" }
            

            ]
        });

        


        var objListData = (ListData == '' ? [] : jQuery.parseJSON(ListData));

        if (objListData.length > 0) {


            var NewData = new Object();

            for (var i = 0; i < objListData.length; i++) {


                NewData.Nama_Order = objListData[i]["Nama_Order"];
                NewData.DateActivity = objListData[i]["DateActivity"];
                NewData.Activity = objListData[i]["Activity"];
                oDatalist.fnAddData(NewData);
            }


        }



        var objListSts = (listStatus == '' ? [] : jQuery.parseJSON(listStatus));

        if (objListSts.length > 0) {


            var NewStatus = new Object();

            for (var i = 0; i < objListSts.length; i++) {


                NewStatus.Nama = objListSts[i]["Nama_Order"];
                var status = objListSts[i]["Status"]

                if (status == '-1')
                    NewStatus.Status = 'Reject';
                if (status == '0')
                    NewStatus.Status = 'Revisi';
                if (status == '1')
                    NewStatus.Status = 'Order Baru';
                if (status == '2')
                    NewStatus.Status = 'Approval';
                if (status == '3')
                    NewStatus.Status = 'Cek pos1';

                if (status == '4')
                    NewStatus.Status = 'Cek pos9';



                if (status == '5')
                    NewStatus.Status = 'Complete';

                oDataStatus.fnAddData(NewStatus);
            }


        }


        $('.viewTotal').on('click', function () {

            Link();
        });

        $('.viewTotalSelesai').on('click', function () {
            Link();
        });

        $('.viewTotalProgress').on('click', function () {
            Link();
        });

        $('.viewTotalReject').on('click', function () {
            Link();
        });


        function Link() {

            if (TypeUser == '1')
                top.location.href = "/Web/Admin/ListAdmin.aspx";

            if (TypeUser == '2')
                top.location.href = "/Web/Approval/Approval.aspx";


            if (TypeUser == '3')
            top.location.href = "/Web/Costumer/ListOrder.aspx";


                if (TypeUser == '4')
                    top.location.href = "/Web/Costumer/Pos1.aspx";

            if (TypeUser == '5')
                top.location.href = "/Web/Costumer/Pos9.5.aspx";


        }



    </script>
</asp:Content>
