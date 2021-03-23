﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmConciliacionBancaria.aspx.cs" Inherits="SAF.Contabilidad.Form.frmConciliacionBancaria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../../Scripts/select2/js/select2.min.js"></script>
    <link href="../../Scripts/select2/css/select2.min.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        Centro Contable
                    </div>
                    <div class="col-md-9">
                        <asp:DropDownList ID="DDLCentro_Contable1" runat="server" Width="100%">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DDLCentro_Contable1" ErrorMessage="*Centro Contable" InitialValue="00000" ValidationGroup="Nuevo">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-1">
                        <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="http://sysweb.unach.mx/resources/imagenes/nuevo.png" OnClick="btnNuevo_Click" title="Nuevo" ValidationGroup="Nuevo" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        Periodo Inicial
                    </div>
                    <div class="col-md-4">
                        <asp:UpdatePanel ID="UpdatePanel23" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlFecha_Ini1" runat="server" AutoPostBack="True" onChange="CambiaFechaFin(this.value);">
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
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlFecha_Ini1" ErrorMessage="* Periodo Inicial" ValidationGroup="Buscar">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-2">
                        Periodo Final
                    </div>
                    <div class="col-md-3">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlFecha_Fin1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFecha_Fin1_SelectedIndexChanged">
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
                                    <asp:ListItem Value="12" Selected="True">Diciembre</asp:ListItem>
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col-md-1">

                        <asp:ImageButton ID="imgbtnBuscar1" runat="server" CausesValidation="False" ImageUrl="http://sysweb.unach.mx/resources/imagenes/buscar.png" OnClick="imgbtnBuscar1_Click" Style="text-align: right" title="Buscar" ValidationGroup="Buscar" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Campos Requeridos:" ValidationGroup="Nuevo" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <%--<asp:UpdatePanel ID="updPnlGrid" runat="server">
                            <ContentTemplate>--%>
                        <asp:GridView ID="grdConciliacion" runat="server" AutoGenerateColumns="False" CssClass="mGrid" EmptyDataText="No se encontraron datos." Width="100%" OnRowDeleting="grdConciliacion_RowDeleting" OnSelectedIndexChanged="grdConciliacion_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="grdConciliacion_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="Centro_contable" HeaderText="CENTRO CONTABLE" />
                                <asp:BoundField DataField="Desc_Cuenta_Contable" HeaderText="CTA. CONT." />
                                <asp:BoundField DataField="Fecha_inicial" HeaderText="PERIODO INICIAL" />
                                <asp:BoundField DataField="Fecha_final" HeaderText="PERIODO FINAL" />
                                <asp:BoundField DataField="Elaboro_nombre" HeaderText="ELABORO" />
                                <asp:BoundField DataField="Vb_nombre" HeaderText="VB" />
                                <asp:TemplateField HeaderText="EDO CTA">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="linkBttnAdj" runat="server" CssClass="btn btn-mdb-color" OnClick="linkBttnAdj_Click" Text='<%# Bind("TotAdj") %>'><i class="fa fa-upload fa-2x" aria-hidden="true"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-mdb-color"><%--<i class="fa fa-pencil-square-o" aria-hidden="true"></i>--%>Editar</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="linkReporteEnc" runat="server" CssClass="btn btn-mdb-color" OnClick="linkReporteEnc_Click"><%--<i class="fa fa-print" aria-hidden="true"></i>--%>PDF</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-mdb-color" OnClientClick="return confirm('¿Desea eliminar el registro?');"><%--<i class="fa fa-trash" aria-hidden="true"></i>--%>Eliminar</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Cuenta_Contable" />
                                <asp:BoundField DataField="IdEnc" />
                            </Columns>
                            <FooterStyle CssClass="enc" />
                            <PagerStyle CssClass="enc" HorizontalAlign="Center" />
                            <SelectedRowStyle CssClass="sel" />
                            <HeaderStyle CssClass="enc" />
                            <AlternatingRowStyle CssClass="alt" />
                        </asp:GridView>
                        <%-- </ContentTemplate>
                        </asp:UpdatePanel>--%>
                    </div>
                </div>
                <asp:HiddenField ID="hddnEdoCta" runat="server" />
                <ajaxToolkit:ModalPopupExtender ID="modalAdj" runat="server" TargetControlID="hddnEdoCta" PopupControlID="pnlDoctos" BackgroundCssClass="modalBackground_Proy">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel ID="pnlDoctos" runat="server" CssClass="TituloModalPopupMsg">
                    <div class="container">
                        <div class="row">
                            <div class="col alert alert-warning alert-dismissible fade show">
                                <i class="fa fa-cloud-upload" aria-hidden="true"></i>ESTADO DE CUENTA
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                    <ContentTemplate>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">PDF</span>
                                            </div>
                                            <div class="custom-file">
                                                <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" Height="40px" Width="100%" />
                                            </div>
                                            <div class="input-group-append">
                                                <asp:Button ID="bttnAdjuntar" runat="server" Text="Agregar" OnClick="bttnAdjuntar_Click" CssClass="btn btn-mdb-color" OnClientClick="mostrar_spinner( )" ValidationGroup="XLS" Style="left: 0px; top: 0px" />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Archivo incorrecto, debe ser un PDF" ValidationExpression="(.*?)\.(pdf|PDF)$" ValidationGroup="PDF"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Archivo XML" ControlToValidate="FileUpload1" Text="*" ValidationGroup="XLS"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="bttnAdjuntar" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:UpdatePanel ID="UpdatePanel37" runat="server">
                                    <ContentTemplate>
                                        <div class="izquierda">
                                            <asp:GridView ID="grdDoctos" runat="server" AutoGenerateColumns="False" CssClass="mGrid" Width="100%" OnRowDeleting="grdDoctos_RowDeleting">
                                                <Columns>
                                                    <asp:BoundField DataField="NombreArchivoPDF" HeaderText="Archivo" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="linkArchivoPDF" runat="server" NavigateUrl='<%# Bind("Ruta_PDF") %>' Target="_blank">Ver</asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="linkBttnEliminarAdj" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" OnClientClick="return confirm('¿Desea eliminar el registro?');"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                        <div class="row">
                            <div class="col text-right">
                                <asp:Button ID="btnCancelarAdj" runat="server" CausesValidation="False" CssClass="btn btn-blue-grey" OnClick="btnCancelarAdj_Click" Text="Cancelar" />
                                &nbsp;&nbsp;<asp:Button ID="btnGuardarAdj" runat="server" CssClass="btn btn-primary" OnClick="btnGuardarAdj_Click" Text="Guardar" ValidationGroup="Guardar" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <ajaxToolkit:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="1" CssClass="ajax__myTab" Width="100%" ScrollBars="Vertical">
                            <ajaxToolkit:TabPanel ID="TabPanel111" runat="server" HeaderText="TabPanel1">
                                <HeaderTemplate>
                                    Encabezado
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-2">
                                                Mes Inicial
                                            </div>
                                            <div class="col-md-3">
                                                <asp:UpdatePanel ID="updPnlFIni" runat="server">
                                                    <ContentTemplate>
                                                        <asp:DropDownList ID="ddlFecha_Ini" runat="server" AutoPostBack="True" onChange="CambiaFechaFin2(this.value);">
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
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-md-3">
                                                Mes Final
                                            </div>
                                            <div class="col-md-4">
                                                <asp:UpdatePanel ID="updPnlFFin" runat="server">
                                                    <ContentTemplate>
                                                        <asp:DropDownList ID="ddlFecha_Fin" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFecha_Fin_SelectedIndexChanged">
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
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                Centro Contable
                                            </div>
                                            <div class="col-md-10">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <asp:DropDownList ID="DDLCentro_Contable" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged" Width="100%">
                                                        </asp:DropDownList>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDLCentro_Contable" ErrorMessage="* Centro Contable" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                Cuenta Contable
                                            </div>
                                            <div class="col-md-10">
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                        <asp:DropDownList ID="DDLCuenta_Contable" runat="server" AutoPostBack="True" CssClass="select2" Font-Size="XX-Small" Width="100%">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DDLCuenta_Contable" ErrorMessage="* Cuenta Contable" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>

                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="card-deck">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Quien Elaboró</h5>
                                                            <p class="card-text">
                                                                Nombre:
                                                                                    <asp:TextBox ID="txtElaboroNombre" runat="server" Width="100%" onkeypress="if (event.keyCode==13) return false;"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtElaboroNombre" ErrorMessage="*Nombre quien elaboro (pestaña encabezado)" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                                                            </p>
                                                            <p class="card-text">
                                                                Puesto:                                                                                            
                                                                                    <asp:TextBox ID="txtElaboroPuesto" runat="server" Width="100%" onkeypress="if (event.keyCode==13) return false;"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtElaboroPuesto" ErrorMessage="*Puesto Elaboro (pestaña encabezado)" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Visto Bueno</h5>
                                                            <p class="card-text">
                                                                Nombre:
                                                                                    <asp:TextBox ID="txtVB_Nombre" runat="server" Width="100%" onkeypress="if (event.keyCode==13) return false;"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtVB_Nombre" ErrorMessage="*Nombre visto bueno  (pestaña encabezado)" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                                                            </p>
                                                            <p class="card-text">
                                                                Puesto:
                                                                                    <asp:TextBox ID="txtVB_Puesto" runat="server" Width="100%" onkeypress="if (event.keyCode==13) return false;"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtVB_Puesto" ErrorMessage="*Puesto visto bueno  (pestaña encabezado)" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </ajaxToolkit:TabPanel>
                            <ajaxToolkit:TabPanel ID="TabPanel100" runat="server" HeaderText="TabPanel1">
                                <HeaderTemplate>
                                    Detalle
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlCtaCheques" runat="server" Visible="False" Width="100%">
                                    </asp:DropDownList>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-3">
                                                Tipo
                                            </div>
                                            <div class="col-md-7">
                                                <asp:UpdatePanel ID="updPnlTipo" runat="server">
                                                    <ContentTemplate>
                                                        <asp:DropDownList ID="ddlTipo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged" TabIndex="1">
                                                        </asp:DropDownList>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlTipo" ErrorMessage="* Tipo" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-2">
                                                <asp:UpdateProgress ID="updPgrTipo" runat="server" AssociatedUpdatePanelID="updPnlTipo">
                                                    <ProgressTemplate>
                                                        <asp:Image ID="img5" runat="server" AlternateText="Espere un momento, por favor.." Height="50px" ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif" ToolTip="Espere un momento, por favor.." />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </div>
                                        </div>
                                        <asp:UpdatePanel ID="updPnlPolizas" runat="server">
                                            <ContentTemplate>
                                                <div id="trowPoliza" class="row" runat="server">
                                                    <div class="col-md-3">
                                                        # de Póliza
                                                    </div>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="txtNumPoliza" runat="server" TabIndex="2" onkeypress="if (event.keyCode==13) return false;"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                        <asp:UpdatePanel ID="updPnlCheque" runat="server">
                                            <ContentTemplate>
                                                <div id="trowCheque" class="row" runat="server">
                                                    <div class="col-md-3"># de Cheque</div>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="txtNumCheque" runat="server" TabIndex="3" onkeypress="if (event.keyCode==13) return false;"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>


                                        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                            <ContentTemplate>
                                                <div id="trowFecha" class="row" runat="server">
                                                    <div class="col-md-3">
                                                        Fecha
                                                    </div>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="txtFecha" runat="server" CssClass="box" Width="95px" TabIndex="4" onkeypress="if (event.keyCode==13) return false;"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtenderFecha" runat="server" BehaviorID="_content_CalendarExtenderFecha" PopupButtonID="imgCalendario" TargetControlID="txtFecha" />
                                                        <asp:ImageButton ID="imgCalendario" runat="server" ImageUrl="https://sysweb.unach.mx/resources/imagenes/calendario.gif" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFecha" ErrorMessage="* Fecha Inicial" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>



                                        <div class="row">
                                            <div class="col-md-3">Importe</div>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtImporte" runat="server" TabIndex="5" onkeyup="mascara(this,'C');" onkeypress="if (event.keyCode==13) return false;"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtImporte" ErrorMessage="* Importe" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="lblConcepto" runat="server" Text="Concepto"></asp:Label>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-md-9">
                                                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                                    <ContentTemplate>
                                                        <asp:TextBox ID="txtConcepto" runat="server" Width="100%" TabIndex="6" onkeypress="if (event.keyCode==13) return false;"></asp:TextBox>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="lblObservaciones" runat="server" Text="Observaciones"></asp:Label>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-md-8">
                                                <asp:UpdatePanel ID="updPnlDescripcion" runat="server">
                                                    <ContentTemplate>
                                                        <asp:TextBox ID="txtDescripcion" runat="server" Height="58px" TextMode="MultiLine" TabIndex="7" onkeypress="if (event.keyCode==13) return false;"></asp:TextBox>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-md-1">
                                                <asp:Button ID="bttnAgregar" runat="server" CssClass="btn btn-info" OnClick="bttnAgregar_Click" Text="Agregar" Font-Size="X-Small" ValidationGroup="Agregar" TabIndex="7" Style="height: 33px" SkinID="8" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="grdDetalle" runat="server" AutoGenerateColumns="False" CssClass="mGrid" OnRowDeleting="grdDetalle_RowDeleting" Width="100%" OnRowEditing="grdDetalle_RowEditing" OnRowUpdating="grdDetalle_RowUpdating" AllowPaging="True" OnRowCancelingEdit="grdDetalle_RowCancelingEdit" OnPageIndexChanging="grdDetalle_PageIndexChanging">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>
                                                                <asp:BoundField DataField="CveTipo" ReadOnly="True">
                                                                    <ItemStyle Font-Bold="True" ForeColor="#3366CC" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="DescTipo" HeaderText="Descripción" ReadOnly="True">
                                                                    <ItemStyle Font-Bold="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Tipo" HeaderText="Tipo" ReadOnly="True" />
                                                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" />
                                                                <asp:BoundField DataField="Numero_Poliza" HeaderText="# Póliza" ReadOnly="True" />
                                                                <asp:BoundField DataField="Numero_Cheque" HeaderText="# Cheque" ReadOnly="True" />
                                                                <asp:TemplateField HeaderText="Importe">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtImporteAgr" runat="server" Text='<%# Bind("Importe") %>' onkeyup="mascara(this,'C2');"></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblImporteAgr" runat="server" Text='<%# Bind("Importe", "{0:c}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Concepto" HeaderText="Concepto" />
                                                                <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" ReadOnly="True" />
                                                                <asp:CommandField ShowEditButton="True" />
                                                                <asp:TemplateField ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar el registro?');" Text="Eliminar"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <FooterStyle CssClass="enc" />
                                                            <HeaderStyle CssClass="enc" />
                                                            <PagerStyle CssClass="enc" HorizontalAlign="Center" />
                                                            <SelectedRowStyle CssClass="sel" />
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>

                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </ajaxToolkit:TabPanel>
                        </ajaxToolkit:TabContainer>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="CAMPOS REQUERIDOS:" ValidationGroup="Guardar" Width="100%" />
                    </div>
                </div>
                <div class="row">
                    <div class="col text-right">

                        <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" CssClass="btn btn-blue-grey" OnClick="btnCancelar_Click" Text="Cancelar" />
                        &nbsp;&nbsp;<asp:Button ID="btnGuardar_Continuar" runat="server" CssClass="btn btn-primary" OnClick="btnGuardar_Continuar_Click" Text="Guardar" ValidationGroup="Guardar" />

                    </div>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>

    <script type="text/javascript">
        function CambiaText() {
            alert("paso");
        };


        this.CambiaFechaFin = function (fechaIni) {
            $("#ctl00_MainContent_ddlFecha_Fin1").val(fechaIni);
        };


        this.CambiaFechaFin2 = function (fechaIni) {
            $("#ctl00_MainContent_TabContainer2_TabPanel111_ddlFecha_Fin").val(fechaIni);
        };


        function Autocomplete() {
            $(".select2").select2();
        };


        function mascara(e, campo) {
            var Valor;
            if (campo == "C") {
                Valor = document.getElementById("ctl00_MainContent_TabContainer2_TabPanel100_txtImporte").value.toString().replace(/,/g, "");
                Valor = Valor.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                document.getElementById("ctl00_MainContent_TabContainer2_TabPanel100_txtImporte").value = Valor;
            }
            else {
                Valor = e.value.toString().replace(/,/g, "");
                Valor = Valor.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                e.value = Valor;
            }
        }
    </script>
</asp:Content>
