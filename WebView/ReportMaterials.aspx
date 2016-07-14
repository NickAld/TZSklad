<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportMaterials.aspx.cs" Inherits="WebView.ReportMeterials" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width:90%">
    <form runat="server">
        <asp:ScriptManager runat="server" ID="smScriptManager"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="90%"
            Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="Report2.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="odsIn" Name="SourceSklad"/>
                    <rsweb:ReportDataSource DataSourceId="odsOut" Name="SourceSklad"/>
                    <rsweb:ReportDataSource DataSourceId="odsSklad" Name="SourceSklad"/>
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource runat="server"  ID="odsIn">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource runat="server"  ID="odsOut">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource runat="server"  ID="odsSklad">
        </asp:ObjectDataSource>
        
    </form>
    </div>
    
</asp:Content>

