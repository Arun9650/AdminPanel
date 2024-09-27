<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="frmViewenquires.aspx.cs" Inherits="Admin_frmViewenquires" %>
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
                    <h1>CRM Admin View Enquiry</h1>
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
                                     <h4>View Enquiry Details</h4>
                                 </a>
                             </div>
                         </div>
                         <div class="panel-body">
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                 <ContentTemplate>                                     
                                     <div class="row">
                                         <div class="col-md-3 form-group">
                                             <asp:Label ID="Label1" runat="server" CssClass="label-primary" Text="FromDate"></asp:Label><br />
                                             <asp:TextBox ID="txtfrom" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
                                              <ajaxToolkit:CalendarExtender ID="CalendarExtender2" TargetControlID="txtfrom" Format="yyyy-MM-dd" runat="server" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtfrom" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="search"></asp:RequiredFieldValidator>
                                         </div>
                                          <div class="col-md-3 form-group">
                                             <asp:Label ID="Label2" runat="server" CssClass="label-primary" Text="ToDate"></asp:Label><br />
                                             <asp:TextBox ID="txtto" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
                                              <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtto" Format="yyyy-MM-dd" runat="server" />
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtto" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="search"></asp:RequiredFieldValidator>
                                         </div>
                                         <div class="col-md-3 form-group">
                                             <br />
                                             <asp:Button ID="btndatesearch" runat="server" Text="Search" CssClass="btn btn-warning pull-left" OnClick="btndatesearch_Click" ValidationGroup="search" />
                                         </div>
                                         <div class="col-md-3 form-group">
                                             <asp:Label ID="Label3" runat="server" Text="Employee" CssClass="label-primary"></asp:Label><br />
                                             <asp:DropDownList ID="ddlemp" runat="server" CssClass="form-control"  OnSelectedIndexChanged="ddlemp_SelectedIndexChanged" DataTextField="empusername" DataValueField="empid" AutoPostBack="true"> 
                                             </asp:DropDownList>
                                         </div>  
                                         </div>                                     
                                     <div class="row">
                                         <div class="col-md-12 form-group">
                                             <asp:Label ID="lblload" runat="server" Text="Page Is Loading Please Wait...." Visible="false" CssClass="form-control"></asp:Label>
                                         </div>
                                     </div>
                                     <div class="row">
                                         <div class="col-md-12 form-group">
                                             <asp:GridView ID="gvenquiry" Width="90%" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10"  DataKeyNames="enquiryid" OnPageIndexChanging="gvenquiry_PageIndexChanging"  CssClass="table table-primary table-striped table-hover">
                                                 <Columns>
                                                       <asp:TemplateField HeaderText="SL NO">
                                                        <ItemTemplate>  <%#Container.DataItemIndex+1 %> </ItemTemplate>
                                                     </asp:TemplateField>   
                                                     <asp:BoundField HeaderText="Customer Name" DataField="custname" />
                                                     <asp:BoundField HeaderText="Customer PhoneNumber" DataField="custphoneno" />
                                                     <asp:BoundField HeaderText="DOB" DataField="dob" />
                                                     <asp:BoundField HeaderText="Email ID" DataField="custemailid" />
                                                     <asp:BoundField HeaderText="Address" DataField="custaddress" />
                                                     <asp:BoundField HeaderText="Entry Time" DataField="entrytime" />
                                                     <asp:BoundField HeaderText="Employee Name" DataField="empname" /> 
                                                      <asp:TemplateField HeaderText="MAP">
                                                        <ItemTemplate>
                                                             <a href="https://maps.google.com/?q=<%# Eval("latitude")%>,<%# Eval("longitude")%>"    target="_blank" class="fa fa-map-marker" style="font-size:30px; padding:5px"> </a>
                                                        </ItemTemplate>
                                                     </asp:TemplateField>   
                                                 </Columns>
                                                 <PagerStyle CssClass="pagination-ys"/>
                                             </asp:GridView>
                                         </div>
                                         <asp:Label ID="lblerror" runat="server"></asp:Label>
                                     </div>
                                     </ContentTemplate>
                                 </asp:UpdatePanel>
                      <asp:Button ID="Button1" runat="server" Text="Export To Excel" OnClick="Button1_Click" CssClass="btn btn-warning pull-right" />
                            </div>
                     </div>
                 </div>
             </div>
          </section>
    </div>
</asp:Content>

