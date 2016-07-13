<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nomenklatura.aspx.cs" Inherits="WebView.Nomenklatura"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
    <span style="align-content">
        <asp:TextBox runat="server" ID="tbNewName" Width="300px"/>
    </span>
    <span>
        <asp:Button runat="server" ID="bAddNom" Text="Добавить" OnClick="bAddNom_Click"/>
    </span>
        </br>
        
        </br>
        <div>
            <asp:GridView runat="server" ID="dgNomeklatura"
                DataSourceID="dsNomenklatura"
                AutoGenerateColumns="false" Width="300px">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Наименование"/>
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <asp:SqlDataSource runat="server" ID="dsNomenklatura" SelectCommand="select * from Nomenklatura"></asp:SqlDataSource>
</asp:Content>
