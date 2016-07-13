<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebView.Users" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script lang="c#" runat="server">
        //IDataSource source = 

    </script>
    
    <form runat="server" style="align-content:center">
        <span>
            <asp:SqlDataSource ID="dsUsers" runat="server" 
                SelectCommand="select * from Users" ProviderName="System.Data.SqlClient"
                DeleteCommand="delete from users where id=@id"
                ></asp:SqlDataSource>
            <asp:GridView id="gvView"
                   BorderColor="Black"
                   BorderWidth="1px"
                   CellPadding="3"
                   runat="server"
                DataSourceID="dsUsers"
                AutoGenerateColumns="False" Width="921px" >
                   
                 <HeaderStyle BackColor="#00aaaa">
                 </HeaderStyle> 
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="Фамилия"></asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Имя"></asp:BoundField>
                    <asp:BoundField DataField="MiddleName" HeaderText="Отчество"></asp:BoundField>
                    <asp:BoundField DataField="Age" HeaderText="Возраст"></asp:BoundField>
                    <asp:CommandField ShowEditButton="True" ShowHeader="True" />
                    
                </Columns>
              </asp:GridView>    
        </span>
    </form>
</asp:Content>
