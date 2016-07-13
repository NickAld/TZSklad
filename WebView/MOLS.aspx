<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MOLS.aspx.cs" Inherits="WebView.MOLS" ViewStateMode="Enabled"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" style="align-content:center">
        <div style="width:100%">
            <div style="padding:10px;width:100%">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsSklad" 
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" 
                    AutoPostBack="True" 
                    ViewStateMode="Enabled" 
                    AppendDataBoundItems="true" >
                        <%--<asp:ListItem Value="0" Selected="True">Все</asp:ListItem>--%>
                </asp:DropDownList>
                <span style="padding-left:30px">
                    <asp:Button runat="server"
                        id="bAddMOL"
                        Text="Добавить ответственного" OnClick="bAddMOL_Click"/>
                </span>
            </div>

            <div style="margin-left:30px;margin-top:10px; margin-bottom:20px">
                <table>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="labelSelectSklad" Visible="false">Выберите склад</asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" id="ListSklad" Visible="false" DataSourceID="dsSklad"                    
                                    AutoPostBack="True" 
                                    ViewStateMode="Enabled" 
                                    AppendDataBoundItems="true" OnSelectedIndexChanged="ListSklad_SelectedIndexChanged" DataValueField="id" DataTextField="Name">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="labelSelectUser" Visible="false">Выберите сотрудника</asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" id="ListUsers" Visible="false" DataSourceID="dsUserList"
                                        AutoPostBack="True" 
                                        AppendDataBoundItems="true" DataValueField="uUserID" DataTextField="UserFIO">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="labelCalStart" Visible="false">Дата начала ответственности</asp:Label>
                        </td>
                        <td>
                            <asp:Calendar runat="server" ID="calStart" Visible="false" ></asp:Calendar>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="labelCalEnd" Visible="false">Дата окончания отвественности</asp:Label>
                        </td>
                        <td>
                            <asp:Calendar runat="server" ID="calEnd" Visible="false"></asp:Calendar>
                        </td>
                    </tr>
                    <tr style="align-content:center">
                        <td colspan="2">
                            <asp:Button runat="server" ID="bSaveNewMOL" Text="Сохранить" OnClick="bSaveNewMOL_Click" Visible="false"/>
                        </td>
                    </tr>
                </table>
            </div>
            
            <div style="width:inherit">
            <asp:GridView id="gvView"
                   BorderColor="Black"
                   BorderWidth="1px"
                   CellPadding="3"
                   runat="server"
                DataSourceID="dsMOL"
                AutoGenerateColumns="False"
                Width="100%">
                   
                 <HeaderStyle BackColor="#ffa23a">
                 </HeaderStyle> 
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Склад"></asp:BoundField>
                    <asp:BoundField DataField="FirstName" HeaderText="Фамилия"></asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Имя"></asp:BoundField>
                    <asp:BoundField DataField="MiddleName" HeaderText="Отчество"></asp:BoundField>
                    <asp:BoundField DataField="dateStart" HeaderText="Действует с..."></asp:BoundField>
                    <asp:BoundField DataField="dateEnd" HeaderText="действует по..."></asp:BoundField>

                </Columns>
              </asp:GridView>
            </div>

            <asp:SqlDataSource ID="dsSklad" runat="server" 
                SelectCommand="select * from Sklad" ProviderName="System.Data.SqlClient"
                ></asp:SqlDataSource>
            <asp:SqlDataSource ID="dsMOL" runat="server" 
                ProviderName="System.Data.SqlClient"
                DeleteCommand="delete from users where id=@id"
                ></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsUserList" runat="server"
                ProviderName="System.Data.SqlClient"
                ></asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
