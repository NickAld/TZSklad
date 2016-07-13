<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sklads.aspx.cs" Inherits="WebView.Sklads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" style="align-content:center">
        <div>
            <asp:SqlDataSource ID="dsSklads" runat="server" 
                SelectCommand="select * from Sklad" ProviderName="System.Data.SqlClient"
                ></asp:SqlDataSource>
            <asp:GridView id="gvView"
                   BorderColor="Black"
                   BorderWidth="1px"
                   CellPadding="3"
                   runat="server"
                DataSourceID="dsSklads"
                AutoGenerateColumns="False" Width="921px" >
                   
                 <HeaderStyle BackColor="#00aaaa">
                 </HeaderStyle> 
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Название"></asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="Адрес"></asp:BoundField>
                </Columns>
              </asp:GridView>    
        </div>
    </form>
</asp:Content>
