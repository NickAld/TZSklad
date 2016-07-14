<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductsOut.aspx.cs" Inherits="WebView.ProductsOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
    <table  class="col-md-pull-10">
        <tr>
            <td>
                <label class="label-info">Выберите склад</label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlListSklad" DataSourceID="dsSklad"
                    DataValueField="id" DataTextField="Name" AutoPostBack="true"
                    ></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <label class="label-info">Выберите товар</label> 
            </td>
            <td>
                 <asp:DropDownList runat="server" ID="ddlListNom" DataSourceID="dsNom"
                    DataValueField="idNomenklatura" DataTextField="Name">
                </asp:DropDownList>
            </td>
    
        </tr>
        
        <tr>
            <br />
            <td>
                <label class="label-info">Ответственное лицо</label>
            </td>
            <td>
               <asp:DropDownList runat="server" ID="ddlMOL" DataSourceID="dsMOL"
                    DataValueField="idMOL" DataTextField="USERNAME"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <label class="label-info">Укажите количество</label> 
            </td>
            <td style="align-content:inherit">
                <asp:TextBox ID="tbCount" TextMode="Number" runat="server" min="0" max="20" step="1" Width="30%" Text="0">

                </asp:TextBox>

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
        <tr>

            <td></td>
            <td>
                <asp:TextBox runat="server" ID="tbResultAdd" Visible="false" Text=""></asp:TextBox>
            </td>
        </tr>
    </table>
    </form>
    <asp:SqlDataSource runat="server" ID="dsSklad" ConnectionString="<%$ConnectionStrings:TZSklad%>"
        SelectCommand="select * from Sklad"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="dsNom" ConnectionString="<%$ConnectionStrings:TZSklad%>"
        SelectCommand="select * from ProductsOstatokOnSklads2(@idS) where DISCOUNT>0 order by Name">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlListSklad" PropertyName="SelectedValue" Name="idS"/>
                </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="dsMOL" ConnectionString="<%$ConnectionStrings:TZSklad%>"
        SelectCommand="select A.idMOL,A.idUser, CONCAT(U.FirstName,' ', U.LastName, ' ', U.MiddleName) 'USERNAME' from (select m.id 'idMOL',m.idUser from MOL m inner join Sklad s on (m.idSklad=s.id) where m.idSklad=@idS) A 
	inner join Users U on(A.idUser=U.id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlListSklad" PropertyName="SelectedValue" Name="idS"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="dsMatIn" ConnectionString="<%$ConnectionStrings:TZSklad%>"
        SelectCommand="select * from Materials_In"></asp:SqlDataSource>
</asp:Content>
