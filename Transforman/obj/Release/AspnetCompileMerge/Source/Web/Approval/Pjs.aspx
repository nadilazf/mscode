<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pjs.aspx.cs" Inherits="Transforman.Web.Approval.Pjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">PJS</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Pjs
                           
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>No Pegawai</label>
                                    <select id="txtNoPegawai" class="form-control">
                                        <option value="0">Pilih Pegawai</option>
                                    </select>

                                </div>

                                <button type="submit" id="btnSave" class="btn btn-success">Simpan</button>
                                <button type="reset" class="btn btn-danger">Default</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

<script>

    var ListNoPegawai = '<%= ListNoPegawai %>'
    var _ListNoPegawai = $.parseJSON(ListNoPegawai);

    var NoPegawai = $('#txtNoPegawai');

    $.each(_ListNoPegawai, function (key, value) {

        NoPegawai.append('<option value="' + value.No_Pek + '">' + value.No_Pek + '-' + value.Nama + '</option>');
    });

</script>

    </asp:Content>
