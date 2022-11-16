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
                                    <asp:ListItem Value="0000">--Todos--</asp:ListItem>
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
                            <div class="col">
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
                                <asp:DropDownList ID="DDLCentro_Contable2" runat="server" CssClass="form-control" OnSelectedIndexChanged="DDLCentro_Contable2_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                Formato
                            </div>
                            <div class="col-md-2">
                                <asp:DropDownList ID="DDLFormato2" runat="server" CssClass="form-control" OnSelectedIndexChanged="DDLFormato2_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="0000">--Todos--</asp:ListItem>
                                    <asp:ListItem>2111</asp:ListItem>
                                    <asp:ListItem>2112</asp:ListItem>
                                    <asp:ListItem>2113</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-1">
                                Cuenta
                            </div>
                            <div class="col-md-8">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLCuenta" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                # Cédula
                            </div>
                            <div class="col-md-11">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLCedula" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                # Póliza
                            </div>
                            <div class="col-md-7">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLPoliza" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                             <div class="col-md-1">
                                Importe
                            </div>
                             <div class="col-md-1">
                                 <asp:TextBox ID="txtImporte" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-1">
                                Fuente Finan
                            </div>
                            <div class="col-md-11">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
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
                        <div class="row">
                            <div class="col-md-1">
                                Beneficiario
                            </div>
                            <div class="col-md-9">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLBeneficiario" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-2">
                                <asp:LinkButton ID="linBttnAgregar" runat="server" CssClass="btn btn-primary" OnClick="linBttnAgregar_Click">Agregar</asp:LinkButton>
                                </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="grdPasivos" runat="server" AutoGenerateColumns="False" Width="100%">
                                            <Columns>
                                                <asp:BoundField HeaderText="CC" />
                                                <asp:BoundField HeaderText="Cuenta" />
                                                <asp:BoundField HeaderText="Fuente" />
                                                <asp:BoundField HeaderText="Proyecto" />
                                                <asp:BoundField HeaderText="Importe" />
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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


    <script type="text/javascript">
        function Autocomplete() {
            $(".select2").select2();
        };            
    </script>
</asp:Content>