<%@ Page Title="" Language="C#" MasterPageFile="~/Blank.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Transforman.Login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Silahkan Log In</h3>
                    </div>
                    <div class="panel-body">
                                <div class="form-group">
                                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
                               
                                    </div>
                               
                                      
                     
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Silahkan Log In</h3>
                    </div>
                    <div class="panel-body" accesskey="*">
                        <fieldset>
                            <div class="form-group">
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">

                                <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>

                            </div>
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-lg btn-success btn-block" OnClick="btnLogin_Click" />

                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
