<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRegBeneficiarios_Pasivo.aspx.cs" Inherits="SAF.Contabilidad.Form.frmRegBeneficiarios_Pasivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../../Scripts/select2/js/select2.min.js"></script>
    <link href="../../Scripts/select2/css/select2.min.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-2">
                                Centro Contable
                            </div>
                            <div class="col-md-10">
                                <asp:DropDownList ID="DDLCentro_Contable" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                Formato
                            </div>
                            <div class="col-md-2">
                                <asp:DropDownList ID="DDLFormato" runat="server" CssClass="form-control">
                                    <%--<asp:ListItem Value="0000">--Todos--</asp:ListItem>--%>
                                    <asp:ListItem>2111</asp:ListItem>
                                    <asp:ListItem>2112</asp:ListItem>
                                    <asp:ListItem>2113</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2">
                                Fuente de Financiamiento
                            </div>
                            <div class="col-md-6">
                                <asp:DropDownList ID="DDLFuente" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                Proyecto
                            </div>
                            <div class="col-md-10">
                                <asp:DropDownList ID="DDLProyecto" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <asp:UpdatePanel ID="updPnlBsucar" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-2">
                                        Filtrar
                                    </div>
                                    <div class="col-md-10">
                                        <div class="input-group">

                                            <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:LinkButton ID="linkBttnBuscar" CssClass="btn btn-grey" runat="server">Ver Beneficiarios</asp:LinkButton>
                                            <asp:LinkButton ID="linkBttnAgregar" CssClass="btn btn-primary" runat="server" OnClick="linkBttnAgregar_Click"><i class="fa fa-plus-circle" aria-hidden="true"></i> Agregar</asp:LinkButton>

                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="row">
                            <div class="col text-center">
                                <asp:UpdateProgress ID="updPgrBsucar" runat="server"
                                    AssociatedUpdatePanelID="updPnlBsucar">
                                    <ProgressTemplate>
                                        <asp:Image ID="Image2q" runat="server"
                                            AlternateText="Espere un momento, por favor.." Height="30px"
                                            ImageUrl="~/images/ajax_loader_gray_512.gif"
                                            ToolTip="Espere un momento, por favor.." Width="30px" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-1">
                                CC
                            </div>
                            <div class="col-md-11">
                                <asp:UpdatePanel ID="updPnlCC2" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLCentro_Contable2" runat="server" CssClass="form-control" OnSelectedIndexChanged="DDLCentro_Contable2_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                Cédula
                            </div>
                            <div class="col-md-11">
                                <asp:UpdatePanel ID="updPnlCedula" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLCedula" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DDLCedula_SelectedIndexChanged"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                Póliza
                            </div>
                            <div class="col-md-11">
                                <asp:UpdatePanel ID="updPnlPoliza" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLPoliza" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DDLPoliza_SelectedIndexChanged"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row" runat="server" visible="false" id="rowNumPol">
                            <div class="col-md-1">
                                # Póliza
                            </div>
                            <div class="col-md-2">
                                <asp:UpdatePanel ID="updPnlAddPoliza" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtNumPoliza" runat="server" CssClass="form-control"></asp:TextBox>
                                        <%--<asp:LinkButton ID="linkBttnAgregarPoliza" runat="server" CssClass="btn btn-primary" OnClick="linkBttnAgregarPoliza_Click">Agregar</asp:LinkButton>--%>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-9 fa-text-height">
                                La póliza debe ser de 7 digitos
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                Formato
                            </div>
                            <div class="col-md-2">
                                <asp:UpdatePanel ID="updPnlFormato2" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLFormato2" runat="server" CssClass="form-control" OnSelectedIndexChanged="DDLFormato2_SelectedIndexChanged" AutoPostBack="True">
                                            <asp:ListItem>2111</asp:ListItem>
                                            <asp:ListItem>2112</asp:ListItem>
                                            <asp:ListItem>2113</asp:ListItem>
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-1">
                                Cuenta
                            </div>
                            <div class="col-md-5">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLCuenta" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DDLCuenta_SelectedIndexChanged"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-1">
                                Importe
                            </div>
                            <div class="col-md-2">
                                <asp:UpdatePanel ID="updPnlImporte" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtImporte" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                Fuente
                            </div>
                            <div class="col-md-11">
                                <asp:UpdatePanel ID="updPnlFuente2" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLFuente2" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                Proyecto
                            </div>
                            <div class="col-md-11">
                                <asp:UpdatePanel ID="updPnlProyecto" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLProyecto2" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row" id="rowBenef" runat="server">
                            <div class="col-md-1">
                                Beneficiario
                            </div>
                            <div class="col-md-9">
                                <asp:UpdatePanel ID="updPnlBeneficiario" runat="server">
                                    <ContentTemplate>
                                        <%--<asp:Label ID="lblBeneficiario" runat="server" Text=""></asp:Label>--%>
                                        <asp:DropDownList ID="DDLBeneficiario" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                             <div class="col-md-2">
                                <asp:LinkButton ID="linBttnAgregar" runat="server" CssClass="btn btn-primary" OnClick="linBttnAgregar_Click">Agregar</asp:LinkButton>
                            </div>
                           <%-- <div class="col-md-2">
                                <asp:LinkButton ID="linkBttnBuscaEmp" runat="server" CssClass="btn btn-blue-pastel" OnClick="linkBttnBuscaEmp_Click">Buscar</asp:LinkButton>
                            </div>--%>
                        </div>
                        <div class="row" id="rowProveedor" runat="server">
                            <div class="col-md-1">
                                Proveedor
                            </div>
                            <div class="col-md-9">
                                <asp:UpdatePanel ID="updPnlProveedor" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLProveedor" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-2">
                                <asp:LinkButton ID="linBttnAgregar2" runat="server" CssClass="btn btn-primary" OnClick="linBttnAgregar_Click">Agregar</asp:LinkButton>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col text-center">
                                <asp:UpdateProgress ID="updPgrCC2" runat="server" AssociatedUpdatePanelID="updPnlCC2">
                                    <ProgressTemplate>
                                        <asp:Image ID="img1" runat="server" Height="50px" ImageUrl="http://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                            Width="50px" AlternateText="Espere un momento, por favor.."
                                            ToolTip="Espere un momento, por favor.." />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <asp:UpdateProgress ID="updPgrFormato2" runat="server" AssociatedUpdatePanelID="updPnlFormato2">
                                    <ProgressTemplate>
                                        <asp:Image ID="img2" runat="server" Height="50px" ImageUrl="http://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                            Width="50px" AlternateText="Espere un momento, por favor.."
                                            ToolTip="Espere un momento, por favor.." />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <asp:UpdateProgress ID="updPgrCedula" runat="server" AssociatedUpdatePanelID="updPnlCedula">
                                    <ProgressTemplate>
                                        <asp:Image ID="img3" runat="server" Height="50px" ImageUrl="http://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                            Width="50px" AlternateText="Espere un momento, por favor.."
                                            ToolTip="Espere un momento, por favor.." />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <asp:UpdateProgress ID="updPgrPoliza" runat="server" AssociatedUpdatePanelID="updPnlPoliza">
                                    <ProgressTemplate>
                                        <asp:Image ID="img4" runat="server" Height="50px" ImageUrl="http://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                            Width="50px" AlternateText="Espere un momento, por favor.."
                                            ToolTip="Espere un momento, por favor.." />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:UpdatePanel ID="updPnlGridPasivos2" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="grdPasivos" runat="server" AutoGenerateColumns="False" Width="100%" OnRowDeleting="grdPasivos_RowDeleting">
                                            <Columns>
                                                <asp:BoundField HeaderText="CC" DataField="centro_contable" />
                                                <asp:BoundField HeaderText="Cédula" DataField="id_cedula" />
                                                <asp:BoundField HeaderText="Póliza" DataField="id_poliza" />
                                                <asp:BoundField HeaderText="Formato" DataField="formato" />
                                                <asp:BoundField HeaderText="cuenta" DataField="cuenta" />
                                                <asp:BoundField HeaderText="Importe" DataField="importe" />
                                                <asp:BoundField HeaderText="Beneficiario" DataField="beneficiario" />                                                
                                                <asp:CommandField ShowEditButton="True" />
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-right">
                                <asp:LinkButton ID="linkBttnSalir" runat="server" CssClass="btn btn-grey" OnClick="linkBttnSalir_Click">Salir</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal" tabindex="-1" role="dialog" id="modalEmpleados">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Empleados</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-2">
                            Buscar
                        </div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:LinkButton ID="linkBttnBuscaNombreEmp" runat="server" CssClass="btn btn-blue-grey" OnClick="linkBttnBuscaNombreEmp_Click">Buscar</asp:LinkButton></div>
                                </ContentTemplate>
                            </asp:UpdatePanel>                            
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="grdEmpleados" runat="server">
                                        <Columns>
                                            <asp:BoundField HeaderText="Empleado" DataField="Nombre" />
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">Agregar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function Autocomplete() {
            $(".select2").select2();
        };
        function CatEmpleados() {
            $('#<%= grdEmpleados.ClientID %>').prepend($("<thead></thead>").append($('#<%= grdEmpleados.ClientID %>').find("tr:first"))).DataTable({
                "destroy": true,
                "stateSave": true
            })
        };
    </script>
</asp:Content>
