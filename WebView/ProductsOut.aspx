<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductsOut.aspx.cs" Inherits="WebView.ProductsOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
    <table  class="col-md-pull-10">
        <tr>
            <td>
                <label class="label-info">Выберите товар</label> 
            </td>
            <td>
                <%--<asp:DropDownList runat="server" ID="ddlListNom" DataSourceID="dsNom"
                    DataValueField="id" DataTextField="Name">--%> 
                    
                </asp:DropDownList>
            </td>
    
        </tr>
        <tr>
            <br />
            <td>
                <label class="label-info">Выберите склад</label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlListSklad" DataSourceID="dsSklad"
                    DataValueField="id" DataTextField="Name"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <br />
            <td>
                <label class="label-info">Ответственное лицо</label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlMOL" DataSourceID="dsMOL"
                    DataValueField="id" DataTextField="Name"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <label class="label-info">Укажите количество</label> 
            </td>
            <td style="align-content:inherit">
                <asp:TextBox ID="tbCount" TextMode="Number" runat="server" min="0" max="20" step="1" Width="30%" Text="0"/>
            </td>
        </tr>
        <tr>
            <td>
                <label class="label-info">Дата выдачи</label> 
            </td>
            <td style="align-content:inherit">
                <asp:Calendar runat="server" ID="calendar"></asp:Calendar>
            </td>
        </tr>

        <tr>

            <td></td>
            <td>
                <asp:Button runat="server" ID="bAddNomOut" Text="Сохранить" OnClick="bAddNomOut_Click"/>
            </td>
        </tr>
    </table>
    </form>
    <asp:SqlDataSource runat="server" ID="dsSklad" ConnectionString="<%$ConnectionStrings:TZSklad%>"
        SelectCommand="select * from Sklad"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="dsNom" ConnectionString="<%$ConnectionStrings:TZSklad%>"
        SelectCommand="select * from Nomenklatura"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="dsMOL" ConnectionString="<%$ConnectionStrings:TZSklad%>"
        SelectCommand="select * from MOL where idSklad=@idS">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlListSklad" PropertyName="SelectedValue" Name="idS"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="dsMatIn" ConnectionString="<%$ConnectionStrings:TZSklad%>"
        SelectCommand="select * from Materials_In"></asp:SqlDataSource>
</asp:Content>
