﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPolizas.aspx.cs" Inherits="SAF.Form.frmPolizas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="https://sysweb.unach.mx/INGRESOS/Scripts/select2/css/select2.min.css" type="text/css" rel="stylesheet" />
    <script src="https://sysweb.unach.mx/INGRESOS/Scripts/select2/js/select2.min.js"></script>


    <style type="text/css">
        .style14 {
        }

        .style16 {
            width: 12%;
        }

        .style17 {
            width: 236px;
        }

        .style19 {
            width: 18%;
            text-align: left;
        }

        .style20 {
            width: 23%;
        }

        .overlay {
            position: fixed;
            z-index: 98;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            background-color: #aaa;
            filter: alpha(opacity=80);
            opacity: 0.8;
        }

        .overlayContent {
            z-index: 99;
            margin: 250px auto;
            width: 80px;
            height: 80px;
        }

            .overlayContent h2 {
                font-size: 18px;
                font-weight: bold;
                color: #000;
            }

            .overlayContent img {
                width: 30px;
                height: 30px;
            }

        .scroll_monitor {
            height: 320px;
            overflow: auto;
        }
    </style>


    <script type="text/javascript">


        function FiltCtasContables() {
            $(".select2").select2();
        };

        function enter_cargo(e) {

            if (typeof e == 'undefined' && window.event) { e = window.event; }
            if (e.keyCode == 13) {

                document.getElementById('ctl00_MainContent_TabContainer1_TabPanel2_txtCargo').focus();
                return true;
            }
            else {
                return false;
            }
        };

        function enter_abono(e) {
            if (typeof e == 'undefined' && window.event) { e = window.event; }
            if (e.keyCode == 13) {
                document.getElementById('ctl00_MainContent_TabContainer1_TabPanel2_txtAbono').focus();
                return true;
            }
        };

        function enter_boton(e) {
            if (typeof e == 'undefined' && window.event) { e = window.event; }
            if (e.keyCode == 13) {
                document.getElementById("ctl00_MainContent_TabContainer1_TabPanel2_bttnAgregar").focus();
                return true;
            }
        };

        function Ejercicio_Usuario() {
            var MyDate = new Date();
            var MyDateString;

            MyDate.setDate(MyDate.getDate() + 20);

            MyDateString = '01' + '/'
                + ('0' + (MyDate.getMonth() + 1)).slice(-2) + '/'
                + document.getElementById('ctl00_txtEjercicio').value;
            document.getElementById('ctl00_MainContent_txtFecha_Ini').value = MyDateString;
            document.getElementById('ctl00_MainContent_lblRFecha_Ini').innerHTML = "Para cambiar la fecha click en botón";

        };

        function Ejercicio_Usuario_Final() {
            var MyDate = new Date();
            var MyDateString;

            MyDate.setDate(MyDate.getDate() + 20);

            MyDateString = ('0' + MyDate.getDate()).slice(-2) + '/'
                + ('0' + (MyDate.getMonth() + 1)).slice(-2) + '/'
                + document.getElementById('ctl00_txtEjercicio').value;
            document.getElementById('ctl00_MainContent_txtFecha_Fin').value = MyDateString;
            document.getElementById('ctl00_MainContent_lblRFecha_Fin').innerHTML = "Para cambiar la fecha click en botón";
        };

        function ValidaFecha() {
            var MyDate = new Date();
            var MyDateString;

            MyDate.setDate(MyDate.getDate() + 20);

            MyDateString = '01' + '/'
                + ('0' + (MyDate.getMonth() + 1)).slice(-2) + '/'
                + document.getElementById("ctl00_txtEjercicio").value;

            document.getElementById("ctl00_MainContent_txtFecha").value = MyDateString;
            document.getElementById("ctl00_MainContent_lblRFecha").innerHTML = "Para cambiar la fecha click en botón";
        };

        function ValidaFechaPolizaCopia() {
            var MyDate = new Date();
            var MyDateString;

            MyDate.setDate(MyDate.getDate() + 20);

            MyDateString = '01' + '/'
                + ('0' + (MyDate.getMonth() + 1)).slice(-2) + '/'
                + document.getElementById("ctl00_txtEjercicio").value;

            document.getElementById("ctl00_MainContent_txtFecha_Copia").value = MyDateString;
            document.getElementById("ctl00_MainContent_lblRFecha_Copia").innerHTML = "Para cambiar la fecha click en botón";
        };

        function Calendario() {
            $("#ctl00_MainContent_txtFecha").datepicker();
        };

        function mascara(e, tipo) {
            if (tipo = "C") {
                var Valor = document.getElementById("ctl00_MainContent_TabContainer1_TabPanel2_txtCargo").value.toString().replace(/,/g, "");
                Valor = Valor.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                document.getElementById("ctl00_MainContent_TabContainer1_TabPanel2_txtCargo").value = Valor;
            }

            if (tipo = "A") {
                var Valor = document.getElementById("ctl00_MainContent_TabContainer1_TabPanel2_txtAbono").value.toString().replace(/,/g, "");
                Valor = Valor.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                document.getElementById("ctl00_MainContent_TabContainer1_TabPanel2_txtAbono").value = Valor;
            }

        };

        function ClientValidate(source, arguments) {
            var Valor
            Valor = arguments.Value;
            //Valor = Valor.substr(3);
            if (Valor.length = 4) {
                if (Valor > "4999") {
                    arguments.IsValid = false;
                } else {
                    arguments.IsValid = true;
                }
            }
        };

        function VerificarLongitud(sender, args) {
            var Valor = args.Value.toUpperCase();
            var n = Valor.search("CANCELADO");
            if (n == -1) {
                if (Valor.length < 100) {
                    args.IsValid = false;
                }
            }
            else {
                args.IsValid = true;
            }
        };

        //function MascaraNumPoliza(e, textFecha) {
        //    var Valor = e.value;
        //    var Valor2 = e.value;
        //    var Clasificacion;

        //    document.getElementById(e.id).value = "";
        //    if (textFecha == "1") {
        //        Clasificacion = document.getElementById('ctl00_MainContent_TabContainer1_TabPanel1_ddlClasifica').value;
        //        var Mes = document.getElementById('ctl00_MainContent_txtFecha').value;
        //    }
        //    else {
        //        Clasificacion = document.getElementById('ctl00_MainContent_ddlClasificaCopia').value;
        //        var Mes = document.getElementById('ctl00_MainContent_txtFecha_Copia').value;
        //    }

        //    Mes = Mes.substr(3, 2);

        //    if (Valor.length > 3) {
        //        Valor = Valor.substr(3);
        //    }
        //    else {
        //        Valor = "";
        //    }
        //    var NumPoliza = Mes + Clasificacion + Valor;
        //    if (NumPoliza.length <= 7) {
        //        document.getElementById(e.id).value = NumPoliza;
        //    }
        //    else {
        //        document.getElementById(e.id).value = Valor2.substr(0, 7);
        //    }

        //};
        function MascaraNumPoliza(e, textFecha) {
            var Valor = e.value;
            var Valor2 = e.value;
            var Clasificacion;

            document.getElementById(e.id).value = "";
            if (textFecha == "1") {
                Clasificacion = document.getElementById('ctl00_MainContent_TabContainer1_TabPanel1_ddlClasifica').value;
                var Mes = document.getElementById('ctl00_MainContent_txtFecha').value;
            }
            else {
                Clasificacion = document.getElementById('ctl00_MainContent_ddlClasificaCopia').value;
                var Mes = document.getElementById('ctl00_MainContent_txtFecha_Copia').value;
            }

            //Mes = Mes.substr(3, 2);


            var NumPoliza = Valor;
            if (NumPoliza.length <= 4) {
                document.getElementById(e.id).value = NumPoliza;
            }
            else {
                document.getElementById(e.id).value = Valor2.substr(0, 4);
            }

        };


        $('select').live('keypress', function (e) {
            var p = e.which;
            if (p == 13) {
                alert('enter was pressed');
            }
        });

    </script>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <asp:UpdatePanel ID="UpdatePanel47" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="pnlPrincipal" runat="server">
                            <div class="row" id="filaCentroContable" runat="server">
                                <div class="col-sm-2">
                                    Centro Contable
                                </div>
                                <div class="col-sm-9">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="DDLCentro_Contable" runat="server" Width="100%"
                                                AutoPostBack="True"
                                                OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged" ValidationGroup="Nuevo">
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                        ControlToValidate="DDLCentro_Contable" ErrorMessage="*Requerido"
                                        InitialValue="00000" ValidationGroup="Nuevo"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-sm-1 col-sm-1 text-right">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <%--<asp:LinkButton ID="linkBttnNuevo" runat="server" CssClass="btn btn-mdb-color" OnClick="linkBttnNuevo_Click"><i class="fa fa-plus" aria-hidden="true"></i> Nuevo</asp:LinkButton>--%>
                                            <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="http://sysweb.unach.mx/resources/imagenes/nuevo.png" OnClick="btnNuevo_Click" title="Nuevo" ValidationGroup="Nuevo" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="row" id="filaFechas" runat="server" visible="false">
                                <div class="col-md-2">Fecha</div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtFecha" runat="server" AutoPostBack="True"
                                        CssClass="box" Width="95px" OnTextChanged="txtFecha_TextChanged"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtenderFecha" runat="server" TargetControlID="txtFecha" PopupButtonID="imgCalendario" BehaviorID="_content_CalendarExtenderFecha" />
                                    <asp:ImageButton ID="imgCalendario" runat="server" ImageUrl="https://sysweb.unach.mx/resources/imagenes/calendario.gif" />
                                    <asp:Label ID="lblRFecha" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                                <div class="col-md-1">
                                    Tipo
                                </div>
                                <div class="col-md-2">
                                    <asp:UpdatePanel ID="UpdatePanel24" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlTipo0" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlTipo0_SelectedIndexChanged">
                                                <asp:ListItem Value="E">Egreso</asp:ListItem>
                                                <asp:ListItem Value="I">Ingreso</asp:ListItem>
                                                <asp:ListItem Value="D">Diario</asp:ListItem>
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-md-1">
                                    <asp:UpdateProgress ID="updPrgTipo" runat="server"
                                        AssociatedUpdatePanelID="UpdatePanel24">
                                        <ProgressTemplate>
                                            <asp:Image ID="imgPreTipo" runat="server"
                                                AlternateText="Espere un momento, por favor.." Height="50px"
                                                ImageUrl="http://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                ToolTip="Espere un momento, por favor.." Width="50px" />
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblStatus0" runat="server" Text="Status" Visible="False"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlStatus0" runat="server" Visible="False" Width="100%">
                                        <asp:ListItem Value="A">Aplicado</asp:ListItem>
                                        <asp:ListItem Value="N">No Aplicado</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" id="filaFechasBusqueda" runat="server">
                                <div class="col-sm-2">Mes Inicial</div>
                                <div class="col-sm-2">
                                    <asp:UpdatePanel ID="UpdatePanel23" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlFecha_Ini" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlFecha_Ini_SelectedIndexChanged" Width="100%">
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
                                            <br />
                                            <asp:Label ID="lblRFecha_Ini" runat="server" ForeColor="Red"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-sm-1">
                                    Mes Final
                                </div>
                                <div class="col-md-2">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlFecha_Fin" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlFecha_Fin_SelectedIndexChanged1" Width="100%">
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
                                            <br />
                                            <asp:Label ID="lblRFecha_Fin" runat="server" ForeColor="Red"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-md-1">
                                    <asp:Label ID="lblTipo1" runat="server" Text="Tipo"></asp:Label>
                                </div>
                                <div class="col-md-1">
                                    <asp:UpdatePanel ID="UpdatePanel41" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlTipo2" runat="server" AutoPostBack="True" Width="100%"
                                                OnSelectedIndexChanged="ddlTipo2_SelectedIndexChanged">
                                                <asp:ListItem Value="T">Todos</asp:ListItem>
                                                <asp:ListItem Value="E">Egreso</asp:ListItem>
                                                <asp:ListItem Value="I">Ingreso</asp:ListItem>
                                                <asp:ListItem Value="D">Diario</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlTipo2" ErrorMessage="*Requerido" InitialValue="T" ValidationGroup="RepLotes"></asp:RequiredFieldValidator>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-md-1">
                                    <asp:Label ID="lblStatus2" runat="server" Text="Status"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:UpdatePanel ID="UpdatePanel42" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlStatus2" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlStatus2_SelectedIndexChanged" Width="100%">
                                                <asp:ListItem Value="T">Todos</asp:ListItem>
                                                <asp:ListItem Value="A">Aplicado</asp:ListItem>
                                                <asp:ListItem Value="N">No Aplicado</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlStatus2" ErrorMessage="*Requerido" InitialValue="T" ValidationGroup="RepLotes"></asp:RequiredFieldValidator>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="row" id="filaBusqueda" runat="server">
                                <div class="col-md-2">Tipo Captura</div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlTipo_CapturaInicio" runat="server" Width="100%">
                                        <asp:ListItem Value="T">--Todos--</asp:ListItem>
                                        <asp:ListItem Value="MG">Manual Generada</asp:ListItem>
                                        <asp:ListItem Value="MC">Manual Capturada</asp:ListItem>
                                        <asp:ListItem Value="AC">Automática de Cédula</asp:ListItem>
                                        <asp:ListItem Value="AN">Automática de Nómina</asp:ListItem>
                                        <asp:ListItem Value="AP">Automática de Presupuesto</asp:ListItem>
                                        <asp:ListItem Value="AA">Automática de Adecuación</asp:ListItem>
                                        <asp:ListItem Value="AI">Automática de CHIP</asp:ListItem>
                                        <asp:ListItem Value="AT">Aplicada Automatica</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-1">Clasificación</div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlClasificaIni" runat="server" Width="100%">
                                        <asp:ListItem Value="T">--Todos--</asp:ListItem>
                                        <asp:ListItem Value="MG">Manual Generada</asp:ListItem>
                                        <asp:ListItem Value="MC">Manual Capturada</asp:ListItem>
                                        <asp:ListItem Value="AC">Automática de Cédula</asp:ListItem>
                                        <asp:ListItem Value="AN">Automática de Nómina</asp:ListItem>
                                        <asp:ListItem Value="AP">Automática de Presupuesto</asp:ListItem>
                                        <asp:ListItem Value="AA">Automática de Adecuación</asp:ListItem>
                                        <asp:ListItem Value="AI">Automática de CHIP</asp:ListItem>
                                        <asp:ListItem Value="AT">Aplicada Automatica</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-5">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" PlaceHolder="# de Póliza/Concepto"></asp:TextBox>
                                        <div class="input-group-prepend">
                                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                <ContentTemplate>
                                                    <asp:LinkButton ID="linkBttnBuscar" runat="server" OnClick="linkBttnBuscar_Click" CssClass="btn btn-primary" ValidationGroup="Nuevo"><i class="fa fa-search" aria-hidden="true"></i> Buscar</asp:LinkButton>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center">
                                    <asp:UpdateProgress ID="updPrgBuscar" runat="server" AssociatedUpdatePanelID="UpdatePanel9">
                                        <ProgressTemplate>
                                            <div class="overlay">
                                                <div class="overlayContent">
                                                    <asp:Image ID="img3" runat="server" Height="100px" ImageUrl="~/images/loader2.gif" Width="100px" />
                                                </div>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center">
                                    <asp:UpdateProgress ID="UpdateProgress5" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                        <ProgressTemplate>
                                            <asp:Image ID="Image7" runat="server" Height="50px" ImageUrl="http://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                Width="50px" AlternateText="Espere un momento, por favor.."
                                                ToolTip="Espere un momento, por favor.." />
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center">
                                    <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel10">
                                        <ProgressTemplate>
                                            <div class="overlay">
                                                <div class="overlayContent">
                                                    <asp:Image ID="img1" runat="server" Height="100px" ImageUrl="~/images/loader2.gif" Width="100px" />
                                                </div>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center">
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                            <div class="overlay">
                                                <div class="overlayContent">
                                                    <asp:Image ID="img2" runat="server" Height="100px" ImageUrl="~/images/loader2.gif" Width="100px" />
                                                </div>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <asp:MultiView ID="MultiView1" runat="server">
                            <asp:View ID="View1" runat="server">
                                <div class="container-fluid">
                                    <%--<div class="row enc">
                                        <div class="col text-right">
                                            <asp:LinkButton ID="linkBttnNuevo" runat="server" CssClass="btn btn-mdb-color" OnClick="linkBttnNuevo_Click"><i class="fa fa-plus" aria-hidden="true"></i> Nuevo</asp:LinkButton>
                                            </div>
                                         </div>--%>
                                    <div class="scroll_monitor">
                                        <div class="row">
                                            <div class="col">
                                                <asp:GridView ID="grvPolizas" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="mGrid" EmptyDataText="No hay registros para mostrar" GridLines="Vertical" OnPageIndexChanging="grvPolizas_PageIndexChanging" OnRowDeleting="grvPolizas_RowDeleting" OnSelectedIndexChanged="grvPolizas_SelectedIndexChanged" PageSize="25" Width="100%" ShowHeaderWhenEmpty="True">
                                                    <Columns>
                                                        <asp:BoundField DataField="IdPoliza" />
                                                        <asp:BoundField DataField="CENTRO_CONTABLE" HeaderText="CENTRO CONTABLE" />
                                                        <asp:BoundField DataField="NUMERO_POLIZA" HeaderText="# PÓLIZA" />
                                                        <asp:BoundField DataField="Cedula_numero" HeaderText="# CEDULA" />
                                                        <asp:BoundField DataField="TIPO" HeaderText="TIPO" />
                                                        <asp:BoundField DataField="FECHA" DataFormatString="{0:d}" HeaderText="FECHA" />
                                                        <asp:BoundField DataField="STATUS" HeaderText="STATUS" />
                                                        <asp:BoundField DataField="CONCEPTO" HeaderText="CONCEPTO" />
                                                        <asp:BoundField DataField="TOT_CARGO" DataFormatString="{0:c}" HeaderText="CARGO">
                                                            <HeaderStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="TOT_ABONO" DataFormatString="{0:c}" HeaderText="ABONO">
                                                            <HeaderStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="linkBttnEditar" runat="server" CommandName="Select" Visible='<%# Bind("Opcion_Modificar") %>' CssClass="btn_grid btn-mdb-color">Editar</asp:LinkButton>
                                                                <asp:LinkButton ID="lblEditar" runat="server" Visible='<%# Bind("Opcion_Modificar2") %>' CssClass="btn_grid btn-secondary btn_grid-lg disabled">Editar</asp:LinkButton>
                                                                <%--<asp:Label ID="lblEditar" runat="server" ForeColor="#6B696B" Text="Editar" Visible='<%# Bind("Opcion_Modificar2") %>' CssClass="btn btn-blue-grey"></asp:Label>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="linkBttnEliminar" runat="server" CssClass="btn_grid btn-mdb-color" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar la Póliza?');" Visible='<%# Bind("Opcion_Eliminar") %>'>Borrar</asp:LinkButton>
                                                                <asp:LinkButton ID="lblEliminar" runat="server" Visible='<%# Bind("Opcion_Eliminar2") %>' CssClass="btn_grid btn-secondary btn-lg disabled">Borrar</asp:LinkButton>
                                                                <%--<asp:Label ID="lblEliminar" runat="server" ForeColor="#6B696B" Text="Borrar" Visible='<%# Bind("Opcion_Eliminar2") %>' CssClass="btn btn-blue-grey"></asp:Label>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="linkBttnImprimir" runat="server" OnClick="linkBttnImprimir_Click" CssClass="btn_grid btn-mdb-color">Imprimir</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="linkBttnCopiar" runat="server" CssClass="btn_grid btn-mdb-color" OnClick="linkBttnCopiar_Click" ToolTip="Permite clonar una Póliza" Visible='<%# Bind("Opcion_Copiar") %>'>Copiar</asp:LinkButton>
                                                                <asp:LinkButton ID="lblCopiar" runat="server" Visible='<%# Bind("Opcion_Copiar2") %>' CssClass="btn_grid btn-secondary btn-lg disabled">Copiar</asp:LinkButton>
                                                                <%--<asp:Label ID="lblCopiar" runat="server" ForeColor="#6B696B" Text="Copiar" Visible='<%# Bind("Opcion_Copiar2") %>' CssClass="btn btn-secondary btn-lg disabled"></asp:Label>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="linkBttnCFDI" runat="server" Visible='<%# Bind("Opcion_CFDI") %>' CssClass="btn_grid btn-mdb-color" Width="75px" OnClick="linkBttnCFDI_Click"><%# Eval("Desc_Tipo_Documento") %></asp:LinkButton>
                                                                <asp:LinkButton ID="linkBttnCFDI2" runat="server" Visible='<%# Bind("Opcion_CFDI2") %>' CssClass="btn_grid btn-secondary disabled" Width="75px">S/N</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Image ID="imgCFDI" runat="server" ImageUrl="~/images/Activo.PNG" Visible='<%# Bind("Tiene_CFDI") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Mes_Cerrado" />
                                                        <asp:BoundField DataField="Mes_anio" />
                                                        <asp:BoundField DataField="Cheque_numero" />
                                                        <asp:BoundField DataField="Cheque_importe" />
                                                        <asp:BoundField DataField="Tipo_Documento" />
                                                    </Columns>
                                                    <EmptyDataRowStyle ForeColor="#CC9900" />
                                                    <FooterStyle CssClass="enc" />
                                                    <PagerStyle CssClass="enc" HorizontalAlign="Center" />
                                                    <SelectedRowStyle CssClass="sel" />
                                                    <HeaderStyle CssClass="enc" />
                                                    <AlternatingRowStyle CssClass="alt" />
                                                </asp:GridView>
                                                <%--<asp:HiddenField ID="hddnModalOficios" runat="server" />--%>
                                                <asp:HiddenField ID="hddnModalCopia" runat="server" />
                                                <%--<ajaxToolkit:ModalPopupExtender ID="modalOficios" runat="server" TargetControlID="hddnModalOficios" BackgroundCssClass="modalBackground_Proy" PopupControlID="pnlOficios" CancelControlID="bttnSalirModal"></ajaxToolkit:ModalPopupExtender>--%>
                                                <ajaxToolkit:ModalPopupExtender ID="modalCopia" runat="server" TargetControlID="hddnModalCopia" BackgroundCssClass="modalBackground_Proy" PopupControlID="pnlCopiaPoliza" CancelControlID="btnCancelarCopia"></ajaxToolkit:ModalPopupExtender>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col text-right">
                                            <asp:ImageButton ID="ImageButton1" runat="server"
                                                ImageUrl="http://sysweb.unach.mx/resources/imagenes/pdf.png" OnClick="imgBttnPdf" title="Reporte PDF" />
                                            &nbsp;<asp:ImageButton ID="ImageButton4" runat="server"
                                                ImageUrl="http://sysweb.unach.mx/resources/imagenes/pdf2.png" OnClick="ImageButton4_Click" title="Reporte/Lote" ValidationGroup="RepLotes" />
                                            &nbsp;<asp:ImageButton ID="ImageButton3" runat="server"
                                                ImageUrl="http://sysweb.unach.mx/resources/imagenes/excel.png" OnClick="imgBttnExcel" title="Reporte Excel" />
                                            &nbsp;<asp:ImageButton ID="imgBttnExcelLotes" runat="server" ImageUrl="http://sysweb.unach.mx/resources/imagenes/EXCEL2.png" OnClick="imgBttnExcelLotes_Click" title="Reporte Excel" ValidationGroup="RepLotes" />
                                        </div>
                                    </div>
                                </div>
                                <asp:Panel ID="pnlCopiaPoliza" runat="server" CssClass="TituloModalPopupMsg">
                                    <asp:UpdatePanel ID="UpdatePanel44" runat="server">
                                        <ContentTemplate>
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h7 class="modal-title">
                                                        <asp:Label ID="lblMsjPolizaCopia" CssClass="font-weight-bold" runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="lblMsjErrPolizaCopia" runat="server" ForeColor="Red"></asp:Label>

                        </h7>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="card wizard-card ct-wizard-orange">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-2">Nueva Fecha</div>
                                                                <div class="col-md-10">
                                                                    <asp:TextBox ID="txtFecha_Copia" runat="server" AutoPostBack="True"
                                                                        CssClass="box" Width="95px" OnTextChanged="txtFecha_Copia_TextChanged"></asp:TextBox>
                                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtenderFechaCopia" runat="server" TargetControlID="txtFecha_Copia" PopupButtonID="imgCalendarioCopia" BehaviorID="_content_CalendarExtenderFecha" />
                                                                    <asp:ImageButton ID="imgCalendarioCopia" runat="server" ImageUrl="https://sysweb.unach.mx/resources/imagenes/calendario.gif" />
                                                                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>

                                                                    <%--  <asp:TextBox ID="txtFecha_Copia" runat="server"
                                                                        Width="95px" OnTextChanged="txtFecha_Copia_TextChanged"
                                                                        AutoPostBack="True"></asp:TextBox>--%>

                                                                    <%--                                                                    <img alt="Ver calendario"
                                                                        onclick="new CalendarDateSelect( $(this).previous(), {year_range:0} );"
                                                                        src="http://sysweb.unach.mx/resources/imagenes/calendario.gif" style="cursor: pointer" />
                                                                    <asp:Label ID="lblRFecha_Copia" runat="server" ForeColor="Red"></asp:Label>--%>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-2">Clasificación</div>
                                                                <div class="col-md-3">
                                                                    <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                                                                        <ContentTemplate>
                                                                            <asp:DropDownList ID="ddlClasificaCopia" runat="server" OnSelectedIndexChanged="ddlClasificaCopia_SelectedIndexChanged" AutoPostBack="True">
                                                                                <asp:ListItem Value="X">--SELECCIONAR--</asp:ListItem>
                                                                                <asp:ListItem Value="F">FEDERAL</asp:ListItem>
                                                                                <asp:ListItem Value="E">ESTATAL</asp:ListItem>
                                                                                <asp:ListItem Value="I">INGRESOS PROPIOS</asp:ListItem>
                                                                                <asp:ListItem Value="N">NÓMINA</asp:ListItem>
                                                                                <asp:ListItem Value="C">CANCELACIÓN</asp:ListItem>
                                                                                <asp:ListItem Value="B">BAJAS</asp:ListItem>
                                                                                <asp:ListItem Value="R">RECLASIFICACIÓN</asp:ListItem>
                                                                                <asp:ListItem Value="P">PASIVOS</asp:ListItem>
                                                                                <asp:ListItem Value="O">OTROS</asp:ListItem>
                                                                                <asp:ListItem Value="A">APERTURA</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>

                                                                </div>
                                                                <div class="col-md-1">
                                                                    <asp:RequiredFieldValidator ID="reqClasificaCopia" runat="server" ControlToValidate="ddlClasificaCopia" ErrorMessage="*Clasificación" ValidationGroup="Poliza" InitialValue="X">*Requerido</asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-md-2">Nuevo # de Póliza</div>
                                                                <div class="col-md-4">
                                                                    <div class="input-group mb-3">
                                                                        <span class="input-group-text" id="basic-addon1">
                                                                            <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                                                                <ContentTemplate>
                                                                                    <asp:Label ID="lblIniPolizaCopia" runat="server" Text=""></asp:Label>
                                                                                    <asp:HiddenField ID="hddnMesCopia" runat="server" />
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </span>
                                                                        <asp:TextBox ID="txtNumero_Poliza_Copia" runat="server"
                                                                            Width="30%"></asp:TextBox>
                                                                        <%-- <asp:TextBox ID="TextBox2" runat="server"
                                                                        onkeyup="MascaraNumPoliza(this,2);" Width="80px"></asp:TextBox>--%>
                                                                    </div>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNumero_Poliza_Copia" ErrorMessage="*El # de póliza debe ser de 7 Digitos" ValidationExpression="^[\s\S]{4,4}$" ValidationGroup="Poliza"></asp:RegularExpressionValidator>
                                                                    <asp:RequiredFieldValidator ID="reqPolizaCopia" runat="server" ControlToValidate="txtNumero_Poliza_Copia" ErrorMessage="*Número de Poliza" ValidationGroup="Poliza">*Requerido</asp:RequiredFieldValidator>
                                                                    <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="ClientValidate" ControlToValidate="txtNumero_Poliza_Copia" ErrorMessage="*Número Reservado" ValidationGroup="Poliza"></asp:CustomValidator>

                                                                    <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator105"
                                                                        runat="server" ControlToValidate="txtNumero_Poliza_Copia"
                                                                        ErrorMessage="*7 Digitos" ValidationExpression="^[\s\S]{7,7}$"
                                                                        ValidationGroup="PolizaCopia"></asp:RegularExpressionValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                                                                        ControlToValidate="txtNumero_Poliza_Copia"
                                                                        ErrorMessage="*Requerido" ValidationGroup="PolizaCopia"></asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:CustomValidator ID="ValidatorNumPolizaCopia" runat="server"
                                                                        ClientValidationFunction="ClientValidate"
                                                                        ControlToValidate="txtNumero_Poliza_Copia" ErrorMessage="*Número Reservado"
                                                                        ValidationGroup="PolizaCopia"></asp:CustomValidator>--%>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col text-right">
                                                                    <asp:Button ID="btnCancelarCopia" runat="server"
                                                                        OnClick="btnCancelarCopia_Click" Text="Cancelar" CssClass="btn btn-blue-grey" />
                                                                    &nbsp;<asp:Button ID="btnCopiar" runat="server" OnClick="btnCopiar_Click"
                                                                        Text="Copiar" ValidationGroup="PolizaCopia" CssClass="btn btn-primary" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                                <%--<asp:Panel ID="pnlOficios" runat="server" CssClass="TituloModalPopupMsg">
                                    <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Oficios</h5>
                                                    <asp:LinkButton ID="linkBttnCerrarModal" runat="server" OnClick="linkBttnCerrarModal_Click"><span aria-hidden="true">&times;</span></asp:LinkButton>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="card wizard-card ct-wizard-orange">
                                                        <br />
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-md-2">
                                                                    # Oficio
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <asp:TextBox ID="txtOficio" runat="server" Width="80px"></asp:TextBox>
                                                                </div>
                                                                <div class="col-md-2">
                                                                    Fecha
                                                                </div>
                                                                <div class="col-md-5">
                                                                    <asp:TextBox ID="txtFechaOficio" runat="server" Enabled="False" Width="80%"></asp:TextBox>
                                                                    <ajaxToolkit:CalendarExtender ID="CalendarFecha_Oficio" runat="server" TargetControlID="txtFechaOficio" PopupButtonID="imgCalendarioOficio" />
                                                                    <asp:ImageButton ID="imgCalendarioOficio" runat="server" ImageUrl="https://sysweb.unach.mx/resources/imagenes/calendario.gif" />


                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-10">
                                                                    <div class="custom-file">
                                                                        <asp:FileUpload ID="FileOficio" runat="server" class="form-control" Height="40px" Width="100%" />
                                                                    </div>

                                                                </div>
                                                                <div class="col-md-2">

                                                                    <asp:Button ID="bttnAgregarOficio" runat="server" Text="Agregar" CssClass="btn btn-blue-grey" OnClick="bttnAgregarOficio_Click" />

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col text-center">
                                                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                                        <ContentTemplate>
                                                                            <asp:GridView ID="grdOficios" runat="server" AutoGenerateColumns="False" CssClass="mGrid" Width="100%" EmptyDataText="No existen oficios para esta póliza." ShowFooter="True" ShowHeaderWhenEmpty="True" OnRowDeleting="grdOficios_RowDeleting">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="numero_oficio" HeaderText="# de Oficio" />
                                                                                    <asp:BoundField DataField="fecha_oficio" HeaderText="Fecha Oficio" />
                                                                                    <asp:HyperLinkField HeaderText="Oficio" />
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <asp:HyperLink ID="linkArchivoOficio" runat="server" NavigateUrl='<%# Bind("Ruta_Oficio") %>' Target="_blank">Ver</asp:HyperLink>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:CommandField ShowDeleteButton="True" />
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
                                                            <div class="row">
                                                                <div class="col alert alert-danger">
                                                                    <asp:Label ID="lblMjErrorOficio" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                            <br />
                                                        </div>


                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <asp:Button ID="bttnSalirModal" runat="server" Text="Salir" CssClass="btn btn-blue-grey" />
                                                    &nbsp;<asp:Button ID="bttnGuardarOficio" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="bttnGuardarOficio_Click" />

                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="bttnAgregarOficio" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </asp:Panel>--%>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col">
                                            <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                                CssClass="ajax__myTab" Width="100%">
                                                <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                                                    <HeaderTemplate>
                                                        Información Gral.   
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row" id="rowCFDI" runat="server">
                                                                <div class="col-md-2">
                                                                    Documento
                                                                </div>
                                                                <div class="col-md-5">
                                                                    <asp:DropDownList ID="ddlTipoDocto" runat="server" Width="100%">
                                                                        <asp:ListItem>CHEQUE</asp:ListItem>
                                                                        <asp:ListItem>TRANSFERENCIA</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <asp:RequiredFieldValidator ID="reqTipoDocto" runat="server" ControlToValidate="ddlTipoDocto" ErrorMessage="*Tipo Docto" InitialValue="X" ValidationGroup="Poliza">*Requerido</asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="row" id="rowEgreso3" runat="server">
                                                                <div class="col-md-2">
                                                                    # de Cta. de Cheques
                                                                </div>
                                                                <div class="col-md-10">
                                                                    <asp:DropDownList ID="ddlCheque_Cuenta" runat="server" Width="100%"></asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row" id="rowEgreso" runat="server">
                                                                <div class="col-md-2">
                                                                    Forma Pago
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <asp:DropDownList ID="ddlFormaPago" runat="server" Enabled="False">
                                                                        <asp:ListItem>TRANSFERENCIA</asp:ListItem>
                                                                        <asp:ListItem Selected="True">CHEQUE</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    # de Cheque
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <asp:TextBox ID="txtCheque_Numero" runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <asp:RequiredFieldValidator ID="RFVCheque_Numero" runat="server" ControlToValidate="txtCheque_Numero" ErrorMessage="*Número de Cheque" ValidationGroup="Poliza">*Requerido</asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    Importe
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <asp:TextBox ID="txtCheque_Importe" runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <asp:RequiredFieldValidator ID="RFVCheque_Importe" runat="server" ControlToValidate="txtCheque_Importe" ErrorMessage="*Importe del Cheque" ValidationGroup="Poliza">*Requerido</asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="row" id="rowEgreso2" runat="server">
                                                                <div class="col-md-2">Beneficiario</div>
                                                                <div class="col-md-9">
                                                                    <asp:TextBox ID="txtBeneficiario" runat="server" Width="100%"></asp:TextBox>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <asp:RequiredFieldValidator ID="RFVBeneficiario" runat="server" ControlToValidate="txtBeneficiario" ErrorMessage="*Beneficiario" ValidationGroup="Poliza">*Requerido</asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-2"># de Cédula/Adecuación</div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtCedula_Numero" runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="col-md-2">Clasificación</div>
                                                                <div class="col-md-3">
                                                                    <asp:DropDownList ID="ddlClasifica" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlClasifica_SelectedIndexChanged">
                                                                        <asp:ListItem Value="X">--SELECCIONAR--</asp:ListItem>
                                                                        <asp:ListItem Value="F">FEDERAL</asp:ListItem>
                                                                        <asp:ListItem Value="E">ESTATAL</asp:ListItem>
                                                                        <asp:ListItem Value="I">INGRESOS PROPIOS</asp:ListItem>
                                                                        <asp:ListItem Value="N">NÓMINA</asp:ListItem>
                                                                        <asp:ListItem Value="C">CANCELACIÓN</asp:ListItem>
                                                                        <asp:ListItem Value="B">BAJAS</asp:ListItem>
                                                                        <asp:ListItem Value="R">RECLASIFICACIÓN</asp:ListItem>
                                                                        <asp:ListItem Value="P">PASIVOS</asp:ListItem>
                                                                        <asp:ListItem Value="O">OTROS</asp:ListItem>
                                                                        <asp:ListItem Value="A">APERTURA</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <asp:RequiredFieldValidator ID="reqClasifica" runat="server" ControlToValidate="ddlClasifica" ErrorMessage="*Clasificación" ValidationGroup="Poliza" InitialValue="X">*Requerido</asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="row" id="rowPrograma" runat="server">
                                                                <div class="col-md-2">
                                                                    <asp:Label ID="lbprograma" runat="server" Text="Programa" Visible="False"></asp:Label>
                                                                </div>
                                                                <div class="col-md-7">
                                                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                                        <ContentTemplate>
                                                                            <asp:DropDownList ID="ddlprograma" runat="server" AutoPostBack="True" Visible="False">
                                                                                <asp:ListItem Value="0">Seleccione Un Programa.....</asp:ListItem>
                                                                                <asp:ListItem Value="1">No Aplica</asp:ListItem>
                                                                                <asp:ListItem>12104_SANEAMIENTO_FINANCIERO_2017</asp:ListItem>
                                                                                <asp:ListItem>12106_RECONOCIMIENTO_PLANTILLA_2017</asp:ListItem>
                                                                                <asp:ListItem>12109_FAM_2014</asp:ListItem>
                                                                                <asp:ListItem>12109_FAM_2015</asp:ListItem>
                                                                                <asp:ListItem>12109_FAM_2016</asp:ListItem>
                                                                                <asp:ListItem>12109_FAM_2017</asp:ListItem>
                                                                                <asp:ListItem>12111_CARRERA_DOCENTE_2017</asp:ListItem>
                                                                                <asp:ListItem>12118_PROEXOEES_2014</asp:ListItem>
                                                                                <asp:ListItem>12118_PROEXOEES_2015</asp:ListItem>
                                                                                <asp:ListItem>12118_PROEXOEES_2016</asp:ListItem>
                                                                                <asp:ListItem>12118_PROEXOEES_2017</asp:ListItem>
                                                                                <asp:ListItem>12119_FONSUR_2016</asp:ListItem>
                                                                                <asp:ListItem>12122_FORTALECIMIENTO_FINANCIERO_2017</asp:ListItem>
                                                                                <asp:ListItem>12123_INCLUSION_Y_EQUIDAD_2016</asp:ListItem>
                                                                                <asp:ListItem>13103_PROFOCIE_2014</asp:ListItem>
                                                                                <asp:ListItem>13103_PROFOCIE_2015</asp:ListItem>
                                                                                <asp:ListItem>13103_PROFOCIE_2016</asp:ListItem>
                                                                                <asp:ListItem>13103_PFCE_2017</asp:ListItem>
                                                                                <asp:ListItem>13104_PRODEP_2014</asp:ListItem>
                                                                                <asp:ListItem>13104_PRODEP_2015</asp:ListItem>
                                                                                <asp:ListItem>13104_PRODEP_2016</asp:ListItem>
                                                                                <asp:ListItem>13104_PRODEP_2017</asp:ListItem>
                                                                                <asp:ListItem>12107_FECES_2014</asp:ListItem>
                                                                                <asp:ListItem>12112_FAFEF_2013</asp:ListItem>
                                                                                <asp:ListItem>12112_FAFEF_2013</asp:ListItem>
                                                                                <asp:ListItem>13104_PRODEP_2018</asp:ListItem>
                                                                                <asp:ListItem>12109_FAM_2018</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="val_programa" runat="server" ControlToValidate="ddlprograma" ErrorMessage="*Programa" InitialValue="0">*Requerido</asp:RequiredFieldValidator>

                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-2">Tipo de Captura</div>
                                                                <div class="col-md-2">
                                                                    <asp:DropDownList ID="ddlTipo_Captura" runat="server" Enabled="False" Width="100%">
                                                                        <asp:ListItem Value="MG">Manual Generada</asp:ListItem>
                                                                        <asp:ListItem Value="AC">Automática de Cédula</asp:ListItem>
                                                                        <asp:ListItem Value="AR">Automática de Reclasificación</asp:ListItem>
                                                                        <asp:ListItem Value="MC">Manual Capturada</asp:ListItem>
                                                                        <asp:ListItem Value="AN">Automática de Nómina</asp:ListItem>
                                                                        <asp:ListItem Value="AP">Automática de Presupuesto</asp:ListItem>
                                                                        <asp:ListItem Value="AA">Automática de Adecuación</asp:ListItem>
                                                                        <asp:ListItem Value="AI">Automática de CHIP</asp:ListItem>
                                                                        <asp:ListItem Value="AT">Aplicada Automatica</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <asp:RequiredFieldValidator ID="reqTipoCap" runat="server" ControlToValidate="ddlTipo_Captura" ErrorMessage="*Tipo de Captura" ValidationGroup="Poliza">*Requerido</asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-md-1 text-right">
                                                                    # de Póliza
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="input-group mb-3">
                                                                        <span class="input-group-text" id="basic-addon1">
                                                                            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                                                                <ContentTemplate>
                                                                                    <asp:Label ID="lblIniPoliza" runat="server" Text=""></asp:Label>
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </span>
                                                                        <asp:TextBox ID="txtNumero_Poliza" runat="server" Width="80px" MaxLength="4"></asp:TextBox>
                                                                    </div>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator101" runat="server" ControlToValidate="txtNumero_Poliza" ErrorMessage="*El # de póliza debe ser de 7 Digitos" ValidationExpression="^[\s\S]{4,4}$" ValidationGroup="Poliza"></asp:RegularExpressionValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtNumero_Poliza" ErrorMessage="*Número de Poliza" ValidationGroup="Poliza">*Requerido</asp:RequiredFieldValidator>
                                                                    <asp:CustomValidator ID="ValidatorNumPoliza" runat="server" ClientValidationFunction="ClientValidate" ControlToValidate="txtNumero_Poliza" ErrorMessage="*Número Reservado" ValidationGroup="Poliza"></asp:CustomValidator>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-2">
                                                                    <asp:Label ID="lblConcepto1" runat="server" Text="Concepto"></asp:Label>
                                                                </div>
                                                                <div class="col-md-10">
                                                                    <asp:TextBox ID="txtConcepto" runat="server" Height="94px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                                                    <br />
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtConcepto" ErrorMessage="*Concepto" ValidationGroup="Poliza">*Requerido</asp:RequiredFieldValidator>
                                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="VerificarLongitud" ControlToValidate="txtConcepto" ErrorMessage="*Concepto, longitud minima de 100 caracteres" ValidationGroup="Poliza"></asp:CustomValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </ajaxToolkit:TabPanel>
                                                <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="Detalle">
                                                    <HeaderTemplate>
                                                        Detalle
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-2">
                                                                    Cuenta Contable
                                                                </div>
                                                                <div class="col-md-10">
                                                                    <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True"
                                                                        onkeyup="RefreshUpdatePanel();"
                                                                        OnTextChanged="txtSearch_TextChanged" Width="98%"></asp:TextBox>
                                                                    <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                                                                        <ContentTemplate>
                                                                            <asp:ListBox ID="ddlCuentas_Contables" runat="server"
                                                                                onkeypress="if (event.keyCode==13) return false;"
                                                                                Width="98%"></asp:ListBox>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="txtSearch"></asp:AsyncPostBackTrigger>
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                                                        ControlToValidate="ddlCuentas_Contables" ErrorMessage="*Cuenta Contable"
                                                                        ValidationGroup="Detalle">*Requerido</asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                                        ControlToValidate="ddlCuentas_Contables" ErrorMessage="*Cuenta Contable"
                                                                        ValidationGroup="Detalle">*Requerido</asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-2">Cargo</div>
                                                                <div class="col-md-2">
                                                                    <asp:TextBox ID="txtCargo" runat="server" onKeyDown="return enter_abono(event);" onkeyup="mascara(this,'C');">0</asp:TextBox>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCargo" ErrorMessage="*Cargo" ValidationGroup="Detalle">*Requerido</asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator104" runat="server" ControlToValidate="txtCargo" SetFocusOnError="True" ValidationExpression="^-?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9]{0,2})?$" ValidationGroup="Detalle">*Formato (999,999,999.99)</asp:RegularExpressionValidator>
                                                                </div>
                                                                <div class="col-md-2">
                                                                    Abono
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <asp:TextBox ID="txtAbono" runat="server" onKeyDown="return enter_boton(event);" onkeyup="mascara(this,'A');" OnTextChanged="txtAbono_TextChanged">0</asp:TextBox>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAbono" ErrorMessage="*Abono" ValidationGroup="Detalle">*Requerido</asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtAbono" SetFocusOnError="True" ValidationExpression="^-?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9]{0,2})?$" ValidationGroup="Detalle">*Formato (999,999,999.99) 
                                                                                                                    Números</asp:RegularExpressionValidator>
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <asp:Button ID="bttnAgregar" runat="server" CssClass="btn btn-info" OnClick="bttnAgregar_Click" Text="Agregar" />
                                                                </div>
                                                            </div>
                                                            <div class="row alert alert-warning">
                                                                <div class="col-md-6 text-center">
                                                                    <asp:Label ID="lblLeyTotal_Cargos" runat="server" Font-Bold="True" Text="TOTAL CARGOS:"></asp:Label>
                                                                    <asp:Label ID="lblFormatoTotal_Cargos" runat="server" Font-Bold="True" Font-Size="Large" Text="0"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="lblTotal_Cargos" runat="server" Visible="False"></asp:Label>
                                                                </div>
                                                                <div class="col-md-6 text-center">
                                                                    <asp:Label ID="lblLeyTotal_Abonos" runat="server" Font-Bold="True" Text="TOTAL ABONOS:"></asp:Label>
                                                                    <asp:Label ID="lblFormatoTotal_Abonos" runat="server" Font-Bold="True" Font-Size="Large" Text="0"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="lblTotal_Abonos" runat="server" Visible="False"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row" style="height: 500px; overflow-y: scroll;">
                                                                <div class="col">
                                                                    <asp:GridView ID="grvPolizas_Detalle" runat="server" AutoGenerateColumns="False" CssClass="mGrid table table-striped" OnRowCancelingEdit="grvPolizas_Detalle_RowCancelingEdit" OnRowDeleting="grvPolizas_Detalle_RowDeleting" OnRowEditing="grvPolizas_Detalle_RowEditing" OnRowUpdating="EditaRegistro" OnSelectedIndexChanged="grvPolizas_Detalle_SelectedIndexChanged" Width="100%">
                                                                        <AlternatingRowStyle CssClass="alt" />
                                                                        <Columns>
                                                                            <asp:BoundField DataField="IdCuenta_Contable" HeaderText="IdCuenta_Contable" ReadOnly="True" />
                                                                            <asp:TemplateField HeaderText="# Movto">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblNumero_Movimiento_Aut" runat="server" Text="<%# (grvPolizas_Detalle.PageSize * grvPolizas_Detalle.PageIndex) + Container.DisplayIndex + 1 %>"></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="DescCuenta_Contable" HeaderText="Cuenta Contable" ReadOnly="True" />
                                                                            <asp:BoundField DataField="Cargo" ReadOnly="True" />
                                                                            <asp:BoundField DataField="Abono" ReadOnly="True" />
                                                                            <asp:BoundField DataField="Cargo" DataFormatString="{0:c}" HeaderText="Cargo" />
                                                                            <asp:BoundField DataField="Abono" DataFormatString="{0:c}" HeaderText="Abono" />
                                                                            <asp:CommandField ShowDeleteButton="True" />
                                                                            <asp:CommandField ShowEditButton="True" />
                                                                        </Columns>
                                                                        <FooterStyle CssClass="enc" />
                                                                        <HeaderStyle CssClass="enc" />
                                                                        <PagerStyle CssClass="enc" HorizontalAlign="Center" />
                                                                        <SelectedRowStyle CssClass="sel" />
                                                                    </asp:GridView>
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
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Los siguientes campos son requeridos:" ValidationGroup="Poliza" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col text-right">
                                            <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" CssClass="btn btn-blue-grey" OnClick="btnCancelar_Click" Text="Cancelar" />
                                            &nbsp;<asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click1" Text="Guardar" ValidationGroup="Poliza" />
                                            <asp:HiddenField ID="hhdnGuardar" runat="server" />
                                            <ajaxToolkit:ModalPopupExtender ID="modalGuardar" runat="server" BackgroundCssClass="modalBackground_Proy" PopupControlID="pnlGuardar" TargetControlID="hhdnGuardar">
                                            </ajaxToolkit:ModalPopupExtender>
                                        </div>
                                    </div>

                                    <asp:Panel ID="pnlGuardar" runat="server" CssClass="TituloModalPopupMsg"
                                        Width="25%">
                                        <table width="100%">
                                            <tr>
                                                <td align="center" colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:UpdateProgress ID="UpdateProgress6" runat="server"
                                                        AssociatedUpdatePanelID="UpdatePanel7">
                                                        <ProgressTemplate>
                                                            <asp:Image ID="Image8" runat="server"
                                                                AlternateText="Espere un momento, por favor.." Height="50px"
                                                                ImageUrl="http://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                                ToolTip="Espere un momento, por favor.." Width="50px" />
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnSi" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                                                OnClick="btnSi_Click" Text="SI" />
                                                            &nbsp;<asp:Button ID="btnNo" runat="server" CausesValidation="False" CssClass="btn btn-blue-grey"
                                                                OnClick="btnNo_Click" Text="NO" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <br />
                                                    &nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/images/Simbolo_Msg.png" />
                                                    <br />
                                                </td>
                                                <td align="left">
                                                    <asp:UpdatePanel ID="UpdatePanel40" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblMsg_Confirmacion" runat="server" Font-Bold="True"
                                                                Text="La poliza no esta cuadrada ¿desea guardar?"></asp:Label>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </div>
                            </asp:View>
                            <asp:View ID="View3" runat="server">
                            </asp:View>
                            <asp:View ID="View4" runat="server">
                                <div class="card wizard-card ct-wizard-orange">
                                    <div class="container-fluid">
                                        <div class="row alert alert-dark">
                                            <div class="col-md-4">
                                                <asp:UpdatePanel ID="UpdatePanel50" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="lblNumPolizaCFDI" runat="server" CssClass="font-weight-bold"></asp:Label>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:UpdatePanel ID="updPnlNumCheque" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="lblNumCheque" runat="server" CssClass="font-weight-bold"></asp:Label>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:UpdatePanel ID="updPnlTotCheque" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="lblTotCheque" runat="server" CssClass="font-weight-bold"></asp:Label>
                                                        <asp:HiddenField ID="hddnTotCheque" runat="server" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <br />

                                        <div class="row">
                                            <div class="col-md-3">
                                                Tipo de Beneficiario
                                            </div>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="ddlTipo_Beneficiario" runat="server" Width="100%">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-3">
                                                Tipo de Gasto
                                            </div>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="ddlTipo_Gasto" runat="server" Width="100%">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlTipo_Beneficiario" ErrorMessage="* Tipo de Beneficiario" InitialValue="0" ValidationGroup="CFDI">* Requerido</asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlTipo_Gasto" ErrorMessage="* Tipo de Gasto" InitialValue="0" ValidationGroup="CFDI">* Requerido</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5">
                                                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                                    <ContentTemplate>
                                                        <div class="input-group mb-3">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text">XML</span>
                                                            </div>
                                                            <div class="custom-file" style="width: 70%">
                                                                <asp:FileUpload ID="FileFactura" runat="server" class="form-control" Height="40px" Width="100%" />

                                                            </div>
                                                            <div class="input-group-append">
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileFactura" ErrorMessage="Archivo incorrecto, debe ser un XML" ValidationExpression="(.*?)\.(xml|XML)$" ValidationGroup="CFDI"></asp:RegularExpressionValidator>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Archivo XML" ControlToValidate="FileFactura" Text="* Requerido" ValidationGroup="CFDI"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="bttnAgregaFactura" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-md-5">
                                                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                                    <ContentTemplate>
                                                        <div class="input-group mb-3">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text">PDF</span>
                                                            </div>
                                                            <div class="custom-file" style="width: 70%">
                                                                <asp:FileUpload ID="FileFacturaPDF" runat="server" class="form-control" Height="40px" Width="100%" />
                                                            </div>
                                                            <div class="input-group-append">
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator107" runat="server" ControlToValidate="FileFacturaPDF" ErrorMessage="Archivo incorrecto, debe ser un PDF" ValidationExpression="(.*?)\.(pdf|PDF)$" ValidationGroup="CFDI"></asp:RegularExpressionValidator>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="bttnAgregaFactura0" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button ID="bttnAgregaFactura" runat="server" CssClass="btn btn-blue-grey" OnClick="bttnAgregaFactura_Click" Text="Agregar" ValidationGroup="CFDI" Visible="false" />
                                                <asp:Button ID="bttnAgregaFactura0" runat="server" CssClass="btn btn-primary" OnClick="bttnAgregaFactura0_Click" Text="Agregar" ValidationGroup="CFDI" />
                                            </div>
                                        </div>
                                        <%--<div class="row">
                                        <div class="col text-center">
                                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Los siguientes campos son requeridos:" ValidationGroup="CFDI" />
                                            <asp:Button ID="bttnAgregaFactura" runat="server" CssClass="btn btn-blue-grey" Font-Size="Smaller" OnClick="bttnAgregaFactura_Click" Text="Agregar" Width="100px" Style="left: 618px; top: 72px" ValidationGroup="CFDI" />
                                        </div>
                                    </div>--%>

                                        <div class="row">
                                            <div class="col">
                                                <div class="scroll_monitor">
                                                <asp:UpdatePanel ID="UpdatePanel49" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="grvPolizaCFDI" runat="server" AutoGenerateColumns="False" CssClass="mGrid table table-striped" EmptyDataText="No existen documentos." OnPageIndexChanging="grvPolizaCFDI_PageIndexChanging" OnRowDeleting="grvPolizaCFDI_RowDeleting" ShowHeaderWhenEmpty="True" Width="100%" ShowFooter="True">
                                                            <Columns>
                                                                <asp:BoundField DataField="Beneficiario_Tipo" HeaderText="Tipo" />
                                                                <asp:BoundField DataField="Tipo_Gasto" HeaderText="Tipo Gasto" />
                                                                <asp:BoundField DataField="CFDI_Folio" HeaderText="CFDI_Folio" />
                                                                <asp:BoundField DataField="CFDI_UUID" HeaderText="CFDI_UUID" />
                                                                <asp:BoundField DataField="CFDI_Fecha" HeaderText="CFDI_Fecha" />
                                                                <asp:BoundField DataField="CFDI_Nombre" HeaderText="CFDI_Nombre" />
                                                                <asp:BoundField DataField="CFDI_RFC" HeaderText="CFDI_RFC" />
                                                                <asp:TemplateField HeaderText="CFDI_Total">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CFDI_Total") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblGranTotal" runat="server" Text="0" Font-Size="Medium" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="lblGranTotalInt" runat="server" Text="0" Visible="False"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CFDI_Total") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="XML">
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="linkArchivoXML" runat="server" NavigateUrl='<%# Bind("Ruta_XML") %>' Target="_blank">Ver</asp:HyperLink>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="PDF">
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="linkArchivoPDF" runat="server" NavigateUrl='<%# Bind("Ruta_PDF") %>' Target="_blank">Ver</asp:HyperLink>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" OnClientClick="return confirm('¿Desea eliminar el registro?');"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Fecha_Captura" />
                                                                <asp:BoundField DataField="Usuario_Captura" />
                                                                <asp:BoundField DataField="Id_CFDI" />
                                                            </Columns>
                                                            <%--<FooterStyle CssClass="enc" />
                                                            <HeaderStyle CssClass="enc" />
                                                            <PagerStyle CssClass="enc" HorizontalAlign="Center" />
                                                            <SelectedRowStyle CssClass="sel" />--%>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col text-center">
                                                <asp:UpdateProgress ID="updPgrCFDI" runat="server" AssociatedUpdatePanelID="updPnlGuardarCFDI">
                                                    <ProgressTemplate>
                                                        <asp:Image ID="imgCFDI" runat="server" Height="50px" ImageUrl="http://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                            Width="50px" AlternateText="Espere un momento, por favor.."
                                                            ToolTip="Espere un momento, por favor.." />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col text-right">
                                                <asp:UpdatePanel ID="updPnlGuardarCFDI" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Button ID="btnCancelarCFDI" runat="server" CausesValidation="False" CssClass="btn btn-blue-grey" OnClick="btnCancelarCFDI_Click" Text="Regresar" />
                                                        &nbsp;<asp:Button ID="btnGuardarCFDI" runat="server" CssClass="btn btn-primary" OnClick="btnGuardarCFDI_Click" Text="Guardar" ValidationGroup="Poliza" Visible="False" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="hddnErrorCFDI" runat="server" />
                                        <ajaxToolkit:ModalPopupExtender ID="modalErrorCFDI" runat="server" PopupControlID="pnlErrorCFDI" TargetControlID="hddnErrorCFDI" BackgroundCssClass="modalBackground_Proy"></ajaxToolkit:ModalPopupExtender>
                                        <asp:Panel ID="pnlErrorCFDI" runat="server" CssClass="TituloModalPopupMsg">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <div class="row">
                                                            <div class="col alert alert-warning">
                                                                El total de los CFDI´s es menor al total del cheque, si le das click en BORRAR TODO, se borraran los cfdi&#39;s.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col">
                                                                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:Label ID="lblErrorEliminarCFDIS" runat="server" Text=""></asp:Label>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col text-right ">
                                                                <asp:Button ID="bttnCancelarCFDI" CssClass="btn btn-danger" runat="server" Text="Borrar todo" OnClick="bttnCancelarCFDI_Click" />
                                                                <asp:Button ID="bttnRegresarCFDI" runat="server" CssClass="btn btn-primary" Text="Regresar y corregir" OnClick="bttnRegresarCFDI_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                        </asp:Panel>

                                        <br />
                                        <br />
                                    </div>
                                </div>
                            </asp:View>
                            <asp:View ID="View5" runat="server">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <br />
                                        <div class="container-fluid">
                                            <div class="row">

                                                <div class="col-md-2">
                                                    # Oficio
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="txtOficio" runat="server" Width="80px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Requerido" ControlToValidate="txtOficio" ValidationGroup="GuardarOficio"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-md-2">
                                                    Fecha
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="txtFechaOficio" runat="server" Width="80px"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarFecha_Oficio" runat="server" TargetControlID="txtFechaOficio" PopupButtonID="imgCalendarioOficio" />
                                                    <asp:ImageButton ID="imgCalendarioOficio" runat="server" ImageUrl="https://sysweb.unach.mx/resources/imagenes/calendario.gif" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Requerido" ControlToValidate="txtFechaOficio" ValidationGroup="GuardarOficio"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-2">
                                                    Importe
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="txtImporte" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtImporte" ErrorMessage="*Requerido" ValidationGroup="GuardarOficio"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator108" runat="server" ControlToValidate="txtImporte" SetFocusOnError="True" ValidationExpression="^-?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9]{0,2})?$" ValidationGroup="Detalle">*Formato (999,999,999.99)</asp:RegularExpressionValidator>
                                                </div>

                                                <div class="col-md-2">
                                                    Tipo Docto
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:UpdatePanel ID="updPnlTipoDocto" runat="server">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="DDLTipoDoctoOficio" runat="server" Width="100%" OnSelectedIndexChanged="DDLTipoDoctoOficio_SelectedIndexChanged" AutoPostBack="True">
                                                            </asp:DropDownList>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:RequiredFieldValidator ID="reqTipoDoctoOficio" runat="server" ControlToValidate="DDLTipoDoctoOficio" ErrorMessage="*Requerido" ValidationGroup="GuardarOficio" InitialValue="X"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:UpdateProgress ID="updPgrTipoDocto" runat="server"
                                                                    AssociatedUpdatePanelID="updPnlTipoDocto">
                                                                    <ProgressTemplate>
                                                                        <asp:Image ID="imgBuscarTipoDocto" runat="server"
                                                                            AlternateText="Espere un momento, por favor.." Height="50px"
                                                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                                            ToolTip="Espere un momento, por favor.." />
                                                                    </ProgressTemplate>
                                                                </asp:UpdateProgress>
                                                </div>
                                            </div>

                                            <div class="alert alert-dark" id="rowEmpleado" runat="server" visible="false">

                                                <div class="row">
                                                    <div class="col-md-10"><h6 class="font-weight-bold">IMPORTANTE:</h6><h6>Para realizar la busqueda de un empleado, dar click en el botón BUSCAR, y la busqueda la deberás realizar por el nombre y primer apellido sin acentos.</h6></div>
                                                    <div class="col-md-2 text-right">
                                                        <asp:LinkButton ID="linkBttnAgregarEmpleado" runat="server" CssClass="btn btn-primary" OnClick="linkBttnAgregarEmpleado_Click"><i class="fa fa-search"></i> Buscar</asp:LinkButton>
                                                    </div>
                                                </div>
                                                <div class="row" style="font-size: 14px">
                                                    <div class="col-md-8 font-weight-bold">
                                                        Nombre completo
                                                    </div>
                                                    <div class="col-md-2 font-weight-bold">
                                                        Tipo de Personal
                                                    </div>
                                                    <div class="col-md-2 font-weight-bold">
                                                        # Plaza
                                                    </div>
                                                </div>
                                                <hr />
                                                <div class="row" style="font-size: 13px">
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="lblNombreEmp" runat="server" CssClass="disabled" Width="100%" Enabled="False"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqTipoDoctoOficio0" runat="server" ControlToValidate="lblNombreEmp" ErrorMessage="*Requerido" ValidationGroup="GuardarOficio"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="lblTipoPersonal" runat="server" Enabled="False" Width="100%"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqTipoPer" runat="server" ControlToValidate="lblTipoPersonal" ErrorMessage="*Requerido" ValidationGroup="GuardarOficio"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="lblNumPlaza" runat="server" Enabled="False" Width="100%"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqNumPlaza" runat="server" ControlToValidate="lblNumPlaza" ErrorMessage="*Requerido" ValidationGroup="GuardarOficio"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:HiddenField ID="hddnCatEmpleados" runat="server" />
                                            <ajaxToolkit:ModalPopupExtender ID="modalCatEmpleados" runat="server" PopupControlID="pnlCatEmpleados" TargetControlID="hddnCatEmpleados" BackgroundCssClass="modalBackground_Proy" CancelControlID="bttnSalirCatEmp"></ajaxToolkit:ModalPopupExtender>
                                            <asp:Panel ID="pnlCatEmpleados" runat="server" CssClass="TituloModalPopupMsg" Height="250px">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        Empleados
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <asp:TextBox ID="txtNombre" runat="server" Width="100%" placeholder="Nombre(s)"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="reqNombre" runat="server" ErrorMessage="*Nombre requerido" Text="* Requerido" ValidationGroup="buscaEmpleado" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <asp:TextBox ID="txtPaterno" runat="server" Width="100%" placeholder="Primer Apellido"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="reqPaterno" runat="server" ErrorMessage="*Primer apellido requerido" Text="* Requerido" ValidationGroup="buscaEmpleado" ControlToValidate="txtPaterno"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <asp:TextBox ID="txtMaterno" runat="server" Width="100%" placeholder="Segundo Apellido"></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <asp:UpdatePanel ID="updPnlBuscarEmp" runat="server">
                                                                    <ContentTemplate>
                                                                <asp:LinkButton ID="linkBttnBuscarEmpleado" runat="server" CssClass="btn btn-primary" OnClick="linkBttnBuscarEmpleado_Click" ValidationGroup="buscaEmpleado" Width="100%"><i class="fa fa-search"></i> Buscar</asp:LinkButton>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                            </div>
                                                            <div class="col-md-1">
                                                            <asp:Button ID="bttnSalirCatEmp" runat="server" CssClass="btn btn-blue-grey" Text="Salir" />
                                                                </div>

                                                        </div>
                                                        <div class="row">                                                            
                                                            <div class="col text-center">
                                                                <asp:UpdateProgress ID="updPgrBuscarEmp" runat="server"
                                                                    AssociatedUpdatePanelID="updPnlBuscarEmp">
                                                                    <ProgressTemplate>
                                                                        <asp:Image ID="imgBuscarEmp" runat="server"
                                                                            AlternateText="Espere un momento, por favor.." Height="50px"
                                                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                                            ToolTip="Espere un momento, por favor.." />
                                                                    </ProgressTemplate>
                                                                </asp:UpdateProgress>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <asp:UpdateProgress ID="updPgrGridEmp" runat="server"
                                                                    AssociatedUpdatePanelID="UpdatePanel14">
                                                                    <ProgressTemplate>
                                                                        <asp:Image ID="imgGridEmp" runat="server"
                                                                            AlternateText="Espere un momento, por favor.." Height="50px"
                                                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                                            ToolTip="Espere un momento, por favor.." />
                                                                    </ProgressTemplate>
                                                                </asp:UpdateProgress>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="scroll_monitor">
                                                                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:GridView ID="grdCatEmpleados" Width="100%" runat="server" AutoGenerateColumns="False" CssClass="mGrid table table-striped" OnSelectedIndexChanged="grdCatEmpleados_SelectedIndexChanged" EmptyDataText="No se encontraron datos...">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="Dependencia" HeaderText="Dependencia" />
                                                                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                                                                <asp:BoundField DataField="Tipo_Personal" HeaderText="Tipo Personal" />
                                                                                <asp:BoundField DataField="Numero_Plaza" HeaderText="Plaza" />
                                                                                <asp:CommandField ShowSelectButton="True" />
                                                                            </Columns>
                                                                            <%--<FooterStyle CssClass="enc" />
                                                                            <HeaderStyle CssClass="enc" />
                                                                            <PagerStyle CssClass="enc" HorizontalAlign="Center" />
                                                                            <SelectedRowStyle CssClass="sel" />--%>
                                                                        </asp:GridView>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                                    </div>
                                                            </div>
                                                        </div>
                                                        <%--<div class="row">
                                                            <div class="col text-right" style="left: 0px; top: -2px">
                                                                <asp:Button ID="bttnSalirCatEmp" runat="server" CssClass="btn btn-blue-grey" Text="Salir" />
                                                                <asp:Button ID="bttnAgregarEmp" runat="server" CssClass="btn btn-primary" Text="Agregar Empleado" />
                                                            </div>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                            </asp:Panel>

                                            <div class="row" id="rowProveedor" runat="server" visible="false">
                                                <div class="col-md-2">
                                                    Proveedor
                                                </div>
                                                <div class="col-md-7">
                                                    <asp:UpdatePanel ID="updPnlProveedor" runat="server">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="ddlProveedor" runat="server" Width="100%" OnSelectedIndexChanged="ddlProveedor_SelectedIndexChanged" AutoPostBack="True" CssClass="select2"></asp:DropDownList>
                                                            <asp:TextBox ID="txtProveedor" runat="server" Width="100%" Visible="False" AutoPostBack="True" PlaceHolder="Nombre del Proveedor"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:RequiredFieldValidator ID="reqProveedor" runat="server" ControlToValidate="ddlProveedor" ErrorMessage="*Requerido" ValidationGroup="GuardarOficio" InitialValue="Z"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-md-1">
                                                    RFC
                                                </div>
                                                <div class="col-md-2">
                                                    <asp:TextBox ID="txtRFC" runat="server" AutoPostBack="True" Width="100%"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="reqRFC" runat="server" ControlToValidate="txtRFC" ErrorMessage="*Requerido" ValidationGroup="GuardarOficio"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-10">
                                                    <asp:UpdatePanel ID="updPnlOficio" runat="server">
                                                        <ContentTemplate>
                                                            <div class="custom-file">
                                                                <asp:FileUpload ID="FileOficio" runat="server" class="form-control" Height="40px" Width="100%" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="bttnAgregarOficio" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="FileOficio" ErrorMessage="*Archivo" Text="* Requerido" ValidationGroup="GuardarOficio"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-md-2">
                                                    <asp:Button ID="bttnAgregarOficio" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="bttnAgregarOficio_Click" ValidationGroup="GuardarOficio" />
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col text-center">
                                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                        <ContentTemplate>
                                                            <asp:GridView ID="grdOficios" runat="server" AutoGenerateColumns="False" CssClass="mGrid table table-striped" Width="100%" EmptyDataText="No existen oficios para esta póliza." ShowFooter="True" ShowHeaderWhenEmpty="True" OnRowDeleting="grdOficios_RowDeleting" OnSelectedIndexChanged="grdOficios_SelectedIndexChanged">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Tipo_Docto_Oficio" HeaderText="Tipo Docto" />
                                                                    <asp:BoundField DataField="numero_oficio" HeaderText="# de Oficio" />
                                                                    <asp:BoundField DataField="Fecha_Oficio" HeaderText="Fecha Oficio" />
                                                                    <asp:BoundField DataField="Importe_Oficio" HeaderText="Importe" />
                                                                    <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" />
                                                                    <asp:BoundField DataField="RFC" HeaderText="RFC" />
                                                                    <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>
                                                                    <asp:BoundField HeaderText="Tipo Personal" DataField="Tipo_Personal" />
                                                                    <asp:BoundField HeaderText="# Plaza" DataField="Numero_Plaza" />
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="linkArchivoOficio" runat="server" NavigateUrl='<%# Bind("Ruta_Oficio") %>' Target="_blank">Ver</asp:HyperLink>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:CommandField ShowDeleteButton="True" />
                                                                </Columns>
                                                                <%--<FooterStyle CssClass="enc" />--%>
                                                                <%--<HeaderStyle CssClass="enc" />--%>
                                                                <%--<PagerStyle CssClass="enc" HorizontalAlign="Center" />
                                                                <SelectedRowStyle CssClass="sel" />--%>
                                                            </asp:GridView>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col alert alert-danger">
                                                    <asp:Label ID="lblMjErrorOficio" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>

                                            <br />
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="row">
                                            <div class="col text-center">
                                                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="updPnlGuardarOficio">
                                                    <ProgressTemplate>
                                                        <asp:Image ID="imgOficio" runat="server" Height="50px" ImageUrl="http://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                            Width="50px" AlternateText="Espere un momento, por favor.."
                                                            ToolTip="Espere un momento, por favor.." />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col text-right">
                                                <asp:UpdatePanel ID="updPnlGuardarOficio" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Button ID="bttnSalirModal" runat="server" Text="Salir" CssClass="btn btn-blue-grey" OnClick="bttnSalirModal_Click" />
                                                        &nbsp;<asp:Button ID="bttnGuardarOficio" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="bttnGuardarOficio_Click" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:View>
                        </asp:MultiView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function Autocomplete() {
            $(".select2").select2();
        };

        function msg() {
            bootbox.confirm("¿Desea eliminar el registro?", function (result) {
                if (result == true) {
                    return true;
                }
                else {
                    return false;
                }
            });
        }

    </script>
</asp:Content>
