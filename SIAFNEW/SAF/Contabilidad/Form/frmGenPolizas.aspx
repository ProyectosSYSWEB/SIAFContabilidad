<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmGenPolizas.aspx.cs" Inherits="SAF.Contabilidad.Form.frmGenPolizas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <h4>
                    <asp:Label ID="lblTitulo" runat="server" Text=""></asp:Label></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-1">
                Tipo
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control">
                    <asp:ListItem Value="01">Pólizas de Ingresos</asp:ListItem>
                    <asp:ListItem Value="02">Pólizas de Rendimientos</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-1">
                Mes
            </div>
            <div class="col-md-2">
                <asp:DropDownList ID="ddlMes" runat="server" CssClass="form-control" ValidationGroup="valMes">
                    <asp:ListItem Value="00">--Seleccionar--</asp:ListItem>
                    <asp:ListItem Value="01">Enero</asp:ListItem>
                    <asp:ListItem Value="02">Febrero</asp:ListItem>
                    <asp:ListItem Value="03">Marzo</asp:ListItem>
                    <asp:ListItem Value="04">Abril</asp:ListItem>
                    <asp:ListItem Value="05">Mayo</asp:ListItem>
                    <asp:ListItem Value="06">Junio</asp:ListItem>
                    <asp:ListItem Value="07">Julio</asp:ListItem>
                    <asp:ListItem Value="08">Agosto</asp:ListItem>
                    <asp:ListItem Value="09">Septiembre</asp:ListItem>
                    <asp:ListItem Value="10">Octubre</asp:ListItem>
                    <asp:ListItem Value="11">Noviembre</asp:ListItem>
                    <asp:ListItem Value="12">Diciembre</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2">
                <asp:UpdatePanel ID="updPnlGenPolizas" runat="server">
                    <ContentTemplate>
                        <asp:LinkButton ID="linkBttnGenPolizas" runat="server" CssClass="btn btn-primary" OnClick="linkBttnGenPolizas_Click" ValidationGroup="valMes">Generar Pólizas</asp:LinkButton>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-8">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="valMes" InitialValue="00" Text="* Seleccionar el mes" ControlToValidate="ddlMes"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <asp:UpdateProgress ID="updPgrGenPolizas" runat="server"
                    AssociatedUpdatePanelID="updPnlGenPolizas">
                    <ProgressTemplate>
                        <span>
                            <img height="26" src="https://www.sysweb.unach.mx/Ingresos/Imagenes/load.gif" width="222" />
                        </span><span class="loading">Generando pólizas…
                        </span>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
        <div class="row alert alert-warning">
            <div class="col">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblMsjError" runat="server" Text=""></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grvPolizas" runat="server" AutoGenerateColumns="False" CssClass="mGrid" Width="100%">
                            <Columns>
                                <asp:BoundField HeaderText="ID" DataField="IdPoliza"  />
                                <asp:BoundField HeaderText="CC" DataField="CENTRO_CONTABLE" />
                                <asp:BoundField HeaderText="# PÓL	" DataField="NUMERO_POLIZA" />
                                <asp:BoundField HeaderText="TIPO" DataField="TIPO" />
                                <asp:BoundField HeaderText="FECHA" DataField="FECHA" />
                                <asp:BoundField HeaderText="STATUS" DataField="STATUS" />
                                <asp:BoundField HeaderText="CONCEPTO" DataField="CONCEPTO" />
                                <asp:BoundField HeaderText="CARGO" DataField="TOT_CARGO" />
                                <asp:BoundField HeaderText="ABONO" DataField="TOT_ABONO" />
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                            <FooterStyle CssClass="enc" />
                            <PagerStyle CssClass="enc" HorizontalAlign="Center" />
                            <SelectedRowStyle CssClass="sel" />
                            <HeaderStyle CssClass="enc" />
                            <AlternatingRowStyle CssClass="alt" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
