<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Positions.aspx.cs" Inherits="WebView.Positions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" style="align-content:center">
        <asp:sqldatasource runat="server" ID="dsPosition" SelectCommand="select * from Positions">
        </asp:sqldatasource>
        <div style="margin:10px;">
            <asp:Button runat="server" Text="Добавить"></asp:Button>
        </div>
        <div style="margin:20px">
            <asp:GridView runat="server" ID="gvPos"
                            BorderColor="Black"
                            BorderWidth="1px"
                            CellPadding="3"
                            DataSourceID="dsPosition"
                            AutoGenerateColumns="false">
                                    <HeaderStyle BackColor="#00aaaa"></HeaderStyle> 
                <Columns>
                    <asp:BoundField DataField="PositionName" HeaderText="Должность"/>
                </Columns>

            </asp:GridView>
        </div>
    </form>
    
</asp:Content>
