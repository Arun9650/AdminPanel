<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="frmEmpdetails.aspx.cs" Inherits="Admin_frmEmpdetails" %>

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
                    <h1>CRM Admin Add Employee</h1>
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
                                     <h4>Enter Employee Details</h4>
                                 </a>
                             </div>
                         </div>
                         <div class="panel-body">
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                 <ContentTemplate>
                                     <div class="row">
                                         <div class="col-md-6 form-group">
                                             <asp:Label ID="Label1" CssClass="label-primary" runat="server" Text="Employee Name"></asp:Label><br />
                                             <asp:TextBox ID="txtempname" MaxLength="50" CssClass="form-control" runat="server"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtempname"></asp:RequiredFieldValidator>
                                             <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" TargetControlID="txtempname" FilterMode="ValidChars" ValidChars=" " FilterType="Custom,LowercaseLetters,UppercaseLetters" runat="server" />
                                         </div>
                                         <div class="col-md-6 form-group">
                                             <asp:Label ID="Label2" CssClass="label-primary" runat="server" Text="Employee Phone Number"></asp:Label><br />
                                             <asp:TextBox ID="txtempnumber" MaxLength="10" CssClass="form-control" runat="server"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtempnumber"></asp:RequiredFieldValidator>
                                             <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtempnumber" FilterType="Numbers" runat="server" />
                                         </div>
                                     </div>
                                     <div class="row">
                                         <div class="col-md-6 form-group">
                                             <asp:Label ID="Label3" CssClass="label-primary" runat="server" Text="Employee UserName"></asp:Label><br />
                                             <asp:TextBox ID="txtusername" MaxLength="50" CssClass="form-control" runat="server"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtusername"></asp:RequiredFieldValidator>
                                             <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtusername" FilterMode="ValidChars" ValidChars=" " FilterType="Custom,LowercaseLetters,UppercaseLetters,Numbers" runat="server" />
                                         </div>
                                         <div class="col-md-6 form-group">
                                             <asp:Label ID="Label4" CssClass="label-primary" runat="server" Text="Employee password"></asp:Label><br />
                                             <asp:TextBox ID="txtemppwd" MaxLength="50" CssClass="form-control" runat="server"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtemppwd"></asp:RequiredFieldValidator>
                                             <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" TargetControlID="txtemppwd" FilterType="LowercaseLetters,UppercaseLetters,Numbers" runat="server" />
                                         </div>
                                     </div>
                                      <div class="row">
                                         <div class="col-md-6 form-group">
                                             <asp:Label ID="Label5" CssClass="label-primary" runat="server" Text="Employee Email"></asp:Label><br />
                                             <asp:TextBox ID="txtempemail" MaxLength="50" CssClass="form-control" runat="server"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtempemail" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage = "*"/>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" TargetControlID="txtempemail"  FilterMode="ValidChars" ValidChars="@."  FilterType="Custom,LowercaseLetters,Numbers" runat="server" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtempemail"></asp:RequiredFieldValidator>                                            
                                         </div>
                                         <div class="col-md-6 form-group">
                                             <br />
                                             <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" CssClass="btn btn-warning pull-right" />
                                         </div>
                                          <asp:Label ID="lblerror" runat="server"></asp:Label>
                                     </div> 
                                 </ContentTemplate>
                             </asp:UpdatePanel>
                         </div>
                      </div>                         
                   </div>
                </div>
            </section>
    </div>
</asp:Content>

