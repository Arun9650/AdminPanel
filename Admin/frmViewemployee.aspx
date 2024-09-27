<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="frmViewemployee.aspx.cs" Inherits="Admin_frmViewemployee" %>
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
                    <h1>CRM Admin View Employee</h1>
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
                                     <h4>View Employee Details</h4>
                                 </a>
                             </div>
                         </div>
                         <div class="panel-body">
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                 <ContentTemplate>
                                     <div class="row">
                                         <div class="col-md-12 form-group">
                                         <asp:GridView ID="gvEmployee" AutoGenerateColumns="False" Width="90%" AllowPaging="True" DataKeyNames="empid" runat="server" OnPageIndexChanging="gvEmployee_PageIndexChanging" OnRowDeleting="gvEmployee_RowDeleting" OnRowEditing="gvEmployee_RowEditing" CssClass="table table-primary table-striped table-hover" >
                                         <Columns>
                                            <asp:TemplateField HeaderText="SL NO">
                                                  <ItemTemplate>  <%#Container.DataItemIndex+1 %> </ItemTemplate>
                                            </asp:TemplateField>   
                                             <asp:BoundField DataField="empname" HeaderText="Name" />
                                             <asp:BoundField DataField="empphoneno" HeaderText="Phone Number" />
                                             <asp:BoundField DataField="empusername" HeaderText="UserName" />
                                             <asp:BoundField DataField="emppassword" HeaderText="Password" />
                                             <asp:BoundField DataField="empemailid" HeaderText="EmailID" />
                                               <asp:BoundField DataField="Status" HeaderText="Status" />
                                             <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-purple btn-xs" />
                                             <asp:CommandField ButtonType="Button" DeleteText="Status" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-xs btn-pink" />
                                         </Columns>
                                             <PagerStyle CssClass="pagination-ys" />
                                         </asp:GridView>
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

