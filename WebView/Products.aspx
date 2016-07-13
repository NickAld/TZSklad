<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebView.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" style="align-content:center">
    <div style="width:100%">
        <asp:DropDownList ID="ListSklad" runat="server" DataSourceID="dsSklad" 
                    AutoPostBack="True" 
                    ViewStateMode="Enabled" 
                    OnSelectedIndexChanged="ListSklad_SelectedIndexChanged"
                    AppendDataBoundItems="true" DataValueField="id" DataTextField="Name">
                </asp:DropDownList>
    </div>
    <div style="padding-top:10px">
        <label>
            Тип выборки
        </label>
    </div>
    <div style="padding-top:10px">
        <asp:RadioButtonList runat="server" ID="rblGroup" OnSelectedIndexChanged="rblGroup_SelectedIndexChanged">
            <asp:ListItem Text="Все" Value="0" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Период" Value="1"></asp:ListItem>
        </asp:RadioButtonList>
    </div>

    <asp:GridView id="gvViewProducts"
                   BorderColor="Black"
                   BorderWidth="1px"
                   CellPadding="3"
                   runat="server"
                    
                    AutoGenerateColumns="false"
                    Width="100%"
                    >
                <HeaderStyle BackColor="#ffa23a">
                 </HeaderStyle> 
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Товар"></asp:BoundField>
            <asp:BoundField DataField="sum_in" HeaderText="Общее поступление"></asp:BoundField>
            <asp:BoundField DataField="sum_out" HeaderText="Общий расход"></asp:BoundField>
            <asp:BoundField DataField="result" HeaderText="Общий остаток"></asp:BoundField>
        </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="dsSklad" runat="server" 
                SelectCommand="select * from Sklad" ProviderName="System.Data.SqlClient"
                ></asp:SqlDataSource>
        </form>
</asp:Content>
