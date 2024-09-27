<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="frmChangepassword.aspx.cs" Inherits="Admin_frmChangepassword" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="header-icon">
                <i class="fa fa-dashboard"></i>
                </div>
                <div class="header-title">
                    <h1>CRM Admin Change Password </h1>
                    <small>very detailed & featured admin.</small>
                </div> 
        </section>
        <section class="content">
             <div class="row">
                 <div class="col-sm-12">
                     <div class="panel panel-primary lobidisable">
                         <div class="panel-heading">
                             <div class="btn btn-group" id="buttonexport">
                                 <a href="#">
                                     <h4>Change Password</h4>
                                 </a>
                             </div>
                         </div>
                         <asp:UpdatePanel ID="mypanel" runat="server">
                             <ContentTemplate>
                         <div class="panel-body">
                             <div class="row">
                                 <div class="col-md-4 form-group">
                                    <asp:Label ID="Label1" CssClass="label-primary" runat="server" Text="Old Password"></asp:Label><br />
                                    <asp:TextBox ID="txtold" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtold" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                     <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtold" FilterType="Numbers, UppercaseLetters, LowercaseLetters"  />
                                </div> 
                                 <div class="col-md-4 form-group">
                                    <asp:Label ID="Label2" CssClass="label-primary" runat="server" Text="New Password"></asp:Label><br />
                                    <asp:TextBox ID="txtnew" CssClass="form-control"  TextMode="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtnew" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtnew" FilterType="Numbers, UppercaseLetters, LowercaseLetters"  />
                                </div>
                                 <div class="col-md-4 form-group">
                                    <asp:Label ID="Label3" CssClass="label-primary" runat="server" Text="Conform Password"></asp:Label><br />
                                    <asp:TextBox ID="txtconform" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtconform" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtconform" FilterType="Numbers, UppercaseLetters, LowercaseLetters"  />
                                </div>  
                             </div>
                             <div class="row pull-right">
                                 <div class="col-md-12">
                                     <asp:Button ID="btnsubmit" OnClick="btnsubmit_Click" CssClass="btn btn-warning" runat="server" Text="Submit" />
                                 </div>
                                 <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
                             </div>
                         </div>
                             </ContentTemplate>
                         </asp:UpdatePanel>
                     </div>
                 </div>
             </div>
         </section>
    </div>
</asp:Content>

