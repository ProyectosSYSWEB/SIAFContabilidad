<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Analitico.aspx.cs" Inherits="SAF.Form.Analitico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.7.1/modernizr.min.js"></script>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="https://google-code-prettify.googlecode.com/svn/loader/prettify.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="Label9" runat="server" Text="Mayor" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-10">
                        <asp:DropDownList ID="ddlMayor" runat="server" Visible="False" Style="height: 22px">
                            <asp:ListItem Value="1 ACTIVO">1 ACTIVO</asp:ListItem>
                            <asp:ListItem>2 PASIVO</asp:ListItem>
                            <asp:ListItem>3 PATRIMONIO</asp:ListItem>
                            <asp:ListItem>4 INGRESOS</asp:ListItem>
                            <asp:ListItem>5 GASTOS</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="Label2" runat="server" Text="Centro Contable"></asp:Label>
                    </div>
                    <div class="col-md-9">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DDLCentro_Contable" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged" Width="100%">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="valCtaCont" runat="server" ControlToValidate="DDLCentro_Contable" ErrorMessage="RequiredFieldValidator" InitialValue="00000" ValidationGroup="Reporte">*Requerido</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="Label10" runat="server" EnableViewState="true" Text="A Centro Contable" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-9">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DDLCentro_Contable0" runat="server" Width="100%" Visible="False">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="lblNivel" runat="server" Text="Nivel" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-10">
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlnivel" runat="server" Visible="False" Width="169px">
                                    <asp:ListItem Value="1">NIVEL 1</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="2">NIVEL 2</asp:ListItem>
                                    <asp:ListItem Value="3">NIVEL 3</asp:ListItem>
                                    <asp:ListItem Value="4">NIVEL 4</asp:ListItem>
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <asp:UpdateProgress ID="UpdateProgress3" runat="server"
                            AssociatedUpdatePanelID="UpdatePanel4">
                            <ProgressTemplate>
                                <asp:Image ID="Image2q" runat="server"
                                    AlternateText="Espere un momento, por favor.." Height="30px"
                                    ImageUrl="~/images/ajax_loader_gray_512.gif"
                                    ToolTip="Espere un momento, por favor.." Width="30px" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="Label3" runat="server" Text="Cuenta Contable"></asp:Label>
                    </div>
                    <div class="col-md-9">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddl_cuentas" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddl_cuentas_SelectedIndexChanged" Width="100%">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="Label12" runat="server" Text="A Cuenta Contable"></asp:Label>
                    </div>
                    <div class="col-md-9">
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddl_cuentas0" runat="server" AutoPostBack="True" Width="100%">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="Label4" runat="server" Text="Cuenta de Mayor" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-9">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlCuenta_Mayor" runat="server" AutoPostBack="True"
                                    Height="22px"
                                    OnSelectedIndexChanged="ddlCuenta_Mayor_SelectedIndexChanged" Width="100%" Visible="False">
                                    <asp:ListItem Value="0">0000--UNACH</asp:ListItem>
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row" id="rowCtaMayor" runat="server" visible="false">
                    <div class="col-md-2">
                        A Cuenta de Mayor
                    </div>
                    <div class="col-md-9">
                        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlCuenta_Mayor0" runat="server" Height="21px" Visible="False" Width="100%">
                                    <asp:ListItem Value="0">0000--UNACH</asp:ListItem>
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row" id="rowTipo" runat="server" visible="false">
                    <div class="col-md-2">
                        Reporte
                    </div>
                    <div class="col-md-9">
                        <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlTipo" runat="server" AutoPostBack="True" Width="100%">
                                    <asp:ListItem Value="3262.0">Transferencias 3262</asp:ListItem>
                                    <asp:ListItem Value="3220.5">Transferencias 3220 (5000)</asp:ListItem>
                                    <asp:ListItem Value="3220.6">Transferencias 3220 (6000)</asp:ListItem>
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row" id="rowNivel" runat="server" visible="false">
                    <div class="col-md-2">
                        Tipo de Reporte                            
                    </div>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddlNivelReporte" runat="server" Width="100%">
                            <asp:ListItem Value="1">Detalle</asp:ListItem>
                            <asp:ListItem Value="G">Resumen</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2" id="colFechaIni" runat="server" visible="False">
                        Mes Inicial
                    </div>
                    <div class="col-md-4" id="colFechaIni2" runat="server" visible="False">
                        <asp:DropDownList ID="txtmes_inicial" runat="server" OnSelectedIndexChanged="txtmes_inicial_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2" id="colFechaFin" runat="server" visible="False">
                        Mes Final
                    </div>
                    <div class="col-md-4" id="colFechaFin2" runat="server" visible="False">
                        <asp:DropDownList ID="txtmes_final" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <%--<div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="lbl_f_fin" runat="server" Text="Mes Final" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-10">
                        <asp:DropDownList ID="txtmes_final" runat="server" Visible="False">
                        </asp:DropDownList>
                    </div>
                </div>--%>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="Label6" runat="server" Text="Numero de poliza" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtpoliza" runat="server" Visible="False"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="Label7" runat="server" Text="Subsistema" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddlsistemas" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged"
                            Visible="False" Width="100%">
                            <asp:ListItem Value="T">TODO</asp:ListItem>
                            <asp:ListItem Value="E">EGRESOS</asp:ListItem>
                            <asp:ListItem Value="I">INGRESOS</asp:ListItem>
                            <asp:ListItem Value="F">FONDOS</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="Label5" runat="server" Text="Tipo" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-10">
                        <asp:DropDownList ID="txttipo" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged"
                            Visible="False" Width="300px">
                            <asp:ListItem Value="D">DIARIO</asp:ListItem>
                            <asp:ListItem Value="I">INGRESO</asp:ListItem>
                            <asp:ListItem Value="E">EGRESO</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <asp:UpdateProgress ID="UpdateProgress4" runat="server"
                            AssociatedUpdatePanelID="UpdatePanel6">
                            <ProgressTemplate>
                                <asp:Image ID="Image3q" runat="server"
                                    AlternateText="Espere un momento, por favor.." Height="30px"
                                    ImageUrl="~/images/ajax_loader_gray_512.gif"
                                    ToolTip="Espere un momento, por favor.." Width="30px" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <asp:UpdateProgress ID="UpdateProgress5" runat="server"
                            AssociatedUpdatePanelID="UpdatePanel5">
                            <ProgressTemplate>
                                <asp:Image ID="Image4q" runat="server"
                                    AlternateText="Espere un momento, por favor.." Height="30px"
                                    ImageUrl="~/images/ajax_loader_gray_512.gif"
                                    ToolTip="Espere un momento, por favor.." Width="30px" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-11 text-right">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:ImageButton ID="btnAceptar" runat="server" Height="53px" ImageUrl="~/images/pdf.jpg" OnClick="btnAceptar_Click" ValidationGroup="Reporte" Width="49px" />
                                &nbsp;
                            <asp:ImageButton ID="ImageButton3" runat="server" Height="53px" ImageUrl="../../images/excel2.jpg" OnClick="imgBttnExcel" Visible="False" Width="49px" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                            <ProgressTemplate>
                                <asp:Image ID="Image1q" runat="server" AlternateText="Espere un momento, por favor.." Height="30px" ImageUrl="~/images/ajax_loader_gray_512.gif" ToolTip="Espere un momento, por favor.." Width="30px" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
