<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>CRM Admin Panel</title>
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="~/Theme/assets/dist/img/ico/favicon.png" type="image/x-icon"/>
    <!-- Bootstrap -->
    <link href="~/Theme/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>        
    <!-- Pe-icon-7-stroke -->
    <link href="~/Theme/assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet" type="text/css"/>
    <!-- style css -->
    <link href="~/Theme/assets/dist/css/stylecrm.css" rel="stylesheet" type="text/css"/>        
</head>
<body>
    <form id="form1" runat="server">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>   
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <div class="login-wrapper">            
            <div class="container-center">
            <div class="login-area">
                <div class="panel panel-bd panel-custom">
                    <div class="panel-heading">
                        <div class="view-header">
                            <div class="header-icon">
                                <i class="pe-7s-unlock"></i>
                            </div>
                            <div class="header-title">
                                <h3>Admin Login</h3>
                                <small><strong>Please enter your credentials to login.</strong></small>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            <div class="form-group">
                                <asp:Label ID="Label4" CssClass="control-label" runat="server" Text="UserName"></asp:Label>
                                <asp:TextBox ID="txtadmin" MaxLength="50" CssClass="form-control" placeholder="enter user name"  runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate ="txtadmin"></asp:RequiredFieldValidator>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtadmin" FilterType="LowercaseLetters , UppercaseLetters, Numbers" runat="server" />
                                <span class="help-block small">Your unique username to app</span>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="Password"></asp:Label>
                                 <asp:TextBox ID="txtpwd" MaxLength="50" CssClass="form-control" placeholder="*******" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtpwd"></asp:RequiredFieldValidator>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtpwd" FilterType="Numbers, UppercaseLetters, LowercaseLetters"  runat="server" />
                                <span class="help-block small">Your strong password</span>
                            </div>
                            <div>
                                 <asp:Button ID="btnlogin" runat="server" Text="login" CssClass="btn btn-warning" OnClick="btnlogin_Click" />                               
                            </div>                                 
                            </ContentTemplate>
                        </asp:UpdatePanel>                                    
                        </div>
                        </div>
                </div>
            </div>
        </div>
    </form>
         <!-- jQuery -->
        <script src="~/Theme/assets/plugins/jQuery/jquery-1.12.4.min.js" type="text/javascript"></script>
        <!-- bootstrap js -->
        <script src="~/Theme/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
