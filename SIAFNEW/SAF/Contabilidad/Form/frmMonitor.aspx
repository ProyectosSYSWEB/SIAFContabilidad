﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMonitor.aspx.cs" Inherits="SAF.Contabilidad.Form.frmMonitor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<div class="mensaje">
        <asp:UpdatePanel ID="UpdatePanel100" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>--%>
    <div class="container">
        <div class="row">
            <div class="col">
                <asp:UpdateProgress ID="UpdateProgress5" runat="server" AssociatedUpdatePanelID="UpdatePanel11">
                    <ProgressTemplate>
                        <asp:Image ID="Image7" runat="server" Height="30px" ImageUrl="~/images/ajax_loader_gray_512.gif"
                            Width="30px" AlternateText="Espere un momento, por favor.."
                            ToolTip="Espere un momento, por favor.." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                Centro Contable
            </div>
            <div class="col-md-12">
                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DDLCentro_Contable" runat="server" Width="80%"
                            AutoPostBack="True"
                            OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged" CssClass="auto-style1">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="scroll">
                            <asp:GridView ID="grvMonitorCont" runat="server"
                                BorderStyle="None" CellPadding="4" Width="100%"
                                GridLines="Vertical" AutoGenerateColumns="False" OnPageIndexChanging="grvMonitorCont_PageIndexChanging"
                                PageSize="15" CssClass="mGrid" EmptyDataText="No hay registros para mostrar">
                                <Columns>
                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                                </Columns>
                                <FooterStyle CssClass="enc" />
                                <PagerStyle CssClass="enc" HorizontalAlign="Center" />
                                <SelectedRowStyle CssClass="sel" />
                                <HeaderStyle CssClass="enc" />
                                <AlternatingRowStyle CssClass="alt" />
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
