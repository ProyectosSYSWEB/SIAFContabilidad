<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FRMCuentas_contables.aspx.cs" Inherits="SAF.Rep.FRMCuentas_contables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../../Scripts/DataTables/jquery.dataTables.min.js"></script>
    <link href="../../Content/DataTables/css/jquery.dataTables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row alert alert-danger">
            <div class="col">
                <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <%--                        </div>--%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                Centro Contable
            </div>
            <div class="col-md-10">
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DDLCentro_Contable" runat="server"
                            OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged1" CssClass="form-control">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Cuenta Mayor
            </div>
            <div class="col-md-9">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlCuenta_Mayor" runat="server" 
                            OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged" CssClass="form-control">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-1">
                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                    <ContentTemplate>
                <asp:Button ID="bttnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="DDLCentro_Contable_SelectedIndexChanged1"/>
                        </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row alert alert-warning">
            <div class="col-md-9">
                Actualizar cuentas con leyenda REVISAR, de acuerdo a la matriz COG.   
            </div>
            <div class="col-md-1">
                <asp:LinkButton ID="linkBttnActualizar" runat="server" CssClass="btn btn-warning" OnClick="linkBttnActualizar_Click">ACTUALIZAR</asp:LinkButton>
            </div>
            <div class="col-md-2">
                <asp:UpdatePanel ID="updPnlCatCOG" runat="server">
                    <ContentTemplate>
                        <asp:LinkButton ID="linkBttnCat" runat="server" CssClass="btn btn-blue-grey" OnClick="linkBttnCat_Click">VER CATÁLOGO</asp:LinkButton>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <asp:UpdateProgress ID="updPgrCatCOG" runat="server"
                    AssociatedUpdatePanelID="updPnlCatCOG">
                    <ProgressTemplate>
                        <asp:Image ID="imgCatCOG" runat="server"
                            AlternateText="Espere un momento, por favor.." Height="50px"
                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                            ToolTip="Espere un momento, por favor.." Width="50px" Style="text-align: center" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <asp:UpdateProgress ID="UpdateProgress1" runat="server"
                    AssociatedUpdatePanelID="UpdatePanel13">
                    <ProgressTemplate>
                        <asp:Image ID="imgBuscar" runat="server"
                            AlternateText="Espere un momento, por favor.." Height="50px"
                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                            ToolTip="Espere un momento, por favor.." Width="50px" Style="text-align: center" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <asp:UpdateProgress ID="UpdateProgress2" runat="server"
                    AssociatedUpdatePanelID="UpdatePanel3">
                    <ProgressTemplate>
                        <asp:Image ID="Image1q" runat="server"
                            AlternateText="Espere un momento, por favor.." Height="50px"
                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                            ToolTip="Espere un momento, por favor.." Width="50px" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <asp:UpdateProgress ID="UpdateProgress4" runat="server"
                    AssociatedUpdatePanelID="UpdatePanel9">
                    <ProgressTemplate>
                        <asp:Image ID="Image1q0" runat="server"
                            AlternateText="Espere un momento, por favor.." Height="50px"
                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                            ToolTip="Espere un momento, por favor.." Width="50px" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:MultiView ID="MultiViewcuentas_contables" runat="server">
                    <asp:View ID="View1" runat="server">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-2">
                                    <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="Label15" runat="server" Text="Subdependencia"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-md-10">
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="DDLSubdependencia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLSubdependencia_SelectedIndexChanged"
                                                Width="100%">
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="row note note-warning">
                                <div class="col-md-2">
                                    <p>Cuenta Contable</p>
                                </div>
                                <div class="col-md-10">

                                    <asp:TextBox ID="txtcuenta_contable" runat="server" MaxLength="22"
                                        Width="420px" Visible="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    Nivel1
                                </div>
                                <div class="col-md-4">
                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txt1" runat="server" Enabled="False" MaxLength="4"
                                                OnTextChanged="txt1_TextChanged" CssClass="form-control">0000</asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-md-2">
                                    Nivel2
                                </div>
                                <div class="col-md-4">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txt2" runat="server" Enabled="False" MaxLength="5"
                                                OnTextChanged="txt2_TextChanged" CssClass="form-control">00000</asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    Nivel 3
                                </div>
                                <div class="col-md-4">
                                    <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txt3" runat="server" OnTextChanged="TextBox3_TextChanged"
                                                Enabled="False" MaxLength="5" CssClass="form-control">00000</asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-md-2">
                                    Nivel 4
                                </div>
                                <div class="col-md-4">
                                    <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txt4" runat="server" Enabled="False" MaxLength="5"
                                                OnTextChanged="txt4_TextChanged" AutoPostBack="True" CssClass="form-control">00000</asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    Descripción
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtdescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <asp:Label ID="Label5" runat="server" Text="Tipo"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="txttipo" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged"
                                        Enabled="False" CssClass="form-control">
                                        <asp:ListItem Value="AF">AFECTABLE</asp:ListItem>
                                        <asp:ListItem Value="AC">ACUMULABLE</asp:ListItem>
                                    </asp:DropDownList>

                                </div>

                                <div class="col-md-2">
                                    <asp:Label ID="Label9" runat="server" Text="Status:"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlstatus" runat="server"
                                        OnSelectedIndexChanged="ddlMayor_SelectedIndexChanged" Enabled="False" CssClass="form-control">
                                        <asp:ListItem Value="A">ALTA</asp:ListItem>
                                        <asp:ListItem Value="B">BAJA</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <asp:Label ID="Label12" runat="server" Text="Clasificación"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlclasificacion" runat="server" AutoPostBack="True" CssClass="form-control">
                                                <asp:ListItem Value="DET">DETALLE</asp:ListItem>
                                                <asp:ListItem Value="ESP">ESPECIFICA</asp:ListItem>
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>

                                <div class="col-md-2">

                                    <asp:Label ID="Label13" runat="server" Text="Nivel:"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:UpdatePanel ID="UpdatePanel150" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlnivel" runat="server" AutoPostBack="True"
                                                Enabled="False"
                                                OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged" CssClass="form-control">
                                                <asp:ListItem Value="1">NIVEL 1</asp:ListItem>
                                                <asp:ListItem Value="2">NIVEL 2</asp:ListItem>
                                                <asp:ListItem Value="3">NIVEL 3</asp:ListItem>
                                                <asp:ListItem Value="4">NIVEL 4</asp:ListItem>
                                                <asp:ListItem Value="5">NIVEL 5</asp:ListItem>
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-right">
                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="BTN_Guardar" runat="server" OnClick="BTN_Guardar_Click"
                                                Text="Guardar" CssClass="btn btn-primary" />
                                            &nbsp;
                                    <asp:Button ID="BTN_continuar" runat="server" OnClick="BTN_continuar_Click"
                                        Text="Guardar y Continuar" Visible="False" CssClass="btn btn-info" />
                                            &nbsp;
                                    <asp:Button ID="BTN_Cancelar" runat="server" OnClick="BTN_Cancelar_Click"
                                        Text="Cancelar" CssClass="btn btn-blue-grey" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center">
                                    <asp:UpdateProgress ID="UpdateProgress3" runat="server"
                                        AssociatedUpdatePanelID="UpdatePanel8">
                                        <ProgressTemplate>
                                            <asp:Image ID="Image2q" runat="server"
                                                AlternateText="Espere un momento, por favor.." Height="50px"
                                                ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                ToolTip="Espere un momento, por favor.." Width="50px" />
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <%--<div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label10" runat="server" Text="Buscar"></asp:Label>
                        </div>
                        <div class="col-md-10">
                            <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                <ContentTemplate>
                                    <div class="input-group mb-3">
                                        <asp:TextBox ID="TXTbuscar" runat="server" CssClass="form-control"></asp:TextBox>
                                        <div class="input-group-append">
                                            <asp:ImageButton ID="BTNbuscar" runat="server" class="" Height="38px"
                                                ImageUrl="https://sysweb.unach.mx/resources/imagenes/buscar.png" OnClick="BTNbuscar_Click" Width="39px" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>--%>
                        <div class="row">
                            <div class="col text-center">
                                <asp:UpdateProgress ID="UpdateProgress5" runat="server"
                                    AssociatedUpdatePanelID="UpdatePanel2">
                                    <ProgressTemplate>
                                        <asp:Image ID="Image1q1" runat="server"
                                            AlternateText="Espere un momento, por favor.." Height="50px"
                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                            ToolTip="Espere un momento, por favor.." Width="50px" Style="text-align: center" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="grdcuentas_contables" runat="server" Width="100%"
                                            AutoGenerateColumns="False"
                                            BorderStyle="None" CellPadding="4"
                                            GridLines="Vertical"
                                            OnPageIndexChanging="grdcuentas_contables_PageIndexChanging" CssClass="mGrid" EmptyDataText="No hay registros para mostrar" ShowHeaderWhenEmpty="True">
                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="ID" />
                                                <asp:BoundField DataField="CENTRO_CONTABLE" HeaderText="CENTRO CONTABLE">
                                                    <ItemStyle Width="7%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="cuenta_contable" HeaderText="CUENTA" />
                                                <asp:BoundField DataField="descripcion" HeaderText="DESCRIPCIÓN" />
                                                <asp:BoundField DataField="natura" HeaderText="NATURALEZA" />
                                                <asp:BoundField DataField="nivel" HeaderText="NIVEL">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle Font-Bold="True" Font-Size="14px" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                                            <ContentTemplate>
                                                                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Editar</asp:LinkButton>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtnagregar" runat="server" OnClick="lbtnagregar_Click">Agregar</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" OnClientClick="return confirm('¿En realidad desea Eliminar este registro?');">Eliminar</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Button ID="bttnAgregarCtaContab" runat="server" CssClass="btn btn-blue-grey" OnClick="bttnAgregarCtaContab_Click" Text="Agregar" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                                            <ContentTemplate>
                                                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Visible='<%# Bind("bandera") %>'>Ver Polizas</asp:LinkButton>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                        <div class="row">
                            <div class="col text-right">
                                <asp:ImageButton ID="BTNver_reporte" runat="server"
                                    ImageUrl="http://sysweb.unach.mx/resources/imagenes/pdf.png" OnClick="BTNver_reporte_Click" />
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                            <ContentTemplate>
                                <%--                                <div class="row">
                                    <div class="col-md-2">
                                        <asp:Label ID="lblBuscar" runat="server" Text="# de Póliza/Concepto"></asp:Label>
                                    </div>
                                    <div class="col-md-9">                                       
                                        <asp:TextBox ID="txtBuscar0" runat="server" AutoPostBack="True" OnTextChanged="txtBuscar0_TextChanged" CssClass="form-control" Width="100%"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1">
                                        <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                            <ContentTemplate>
                                                <asp:ImageButton ID="imgbtnBuscar" runat="server" CausesValidation="False" Height="38px" ImageUrl="https://sysweb.unach.mx/resources/imagenes/buscar.png" OnClick="imgbtnBuscar_Click" Width="39px" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col text-center">
                                        <asp:UpdateProgress ID="UpdateProgress6" runat="server" AssociatedUpdatePanelID="UpdatePanel13">
                                            <ProgressTemplate>
                                                <asp:Image ID="Image2q0" runat="server" AlternateText="Espere un momento, por favor.." Height="50px" ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif" ToolTip="Espere un momento, por favor.." Width="50px" />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </div>
                                </div>--%>

                                <div class="row">
                                    <div class="col">
                                        <asp:GridView ID="grvPolizas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EmptyDataText="No hay registros para mostrar" Font-Size="11px" ForeColor="Black" GridLines="Vertical" Width="100%" OnPageIndexChanging="grvPolizas_PageIndexChanging" CssClass="mGrid">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="IdPoliza" />
                                                <asp:BoundField DataField="CENTRO_CONTABLE" HeaderText="CENTRO CONTABLE" />
                                                <asp:BoundField DataField="NUMERO_POLIZA" HeaderText="# PÓLIZA" />
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
                                                        <asp:LinkButton ID="linkBttnImprimir" runat="server" OnClick="linkBttnImprimir_Click">Imprimir</asp:LinkButton>
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
                                </div>
                                <div class="row text-right">
                                    <div class="col">
                                        <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" Text="Regresar" CssClass="btn btn-primary" />
                                    </div>
                                </div>
                                <%--                        </div>--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>



    <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
    <div class="modal fade" id="modalCOG" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modCOG">Matriz COG</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="scroll_monitor">
                        <div class="container">
                            <div class="row">
                                <div class="col text-center">
                                    <asp:UpdateProgress ID="updPgrGridCatCOG" runat="server" AssociatedUpdatePanelID="UpdatePanel10">
                                        <ProgressTemplate>
                                            <asp:Image ID="imgCOG" runat="server" ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif" AlternateText="Espere un momento, por favor.."
                                                ToolTip="Espere un momento, por favor.." Width="50px" Height="50px" />
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col font-weight-bold">
                                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="grdCatCOG" runat="server" AutoGenerateColumns="False" CssClass="mGrid" Width="100%" OnRowCancelingEdit="grdCatCOG_RowCancelingEdit" OnRowEditing="grdCatCOG_RowEditing" OnRowUpdating="grdCatCOG_RowUpdating">
                                                <Columns>
                                                    <asp:BoundField HeaderText="MAYOR" DataField="cuenta_mayor" ReadOnly="True" />
                                                    <asp:BoundField HeaderText="COG" DataField="natura" ReadOnly="True" />
                                                    <asp:BoundField HeaderText="NOMBRE" DataField="descripcion" ReadOnly="True">
                                                        <ItemStyle Width="75%" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="STATUS">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtStatus" runat="server" Width="50px" Text='<%# Bind("status") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:CommandField ShowEditButton="True" />
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
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">       
        function CuentasContables() {
            //$('input[type=search]').val('');
            $('#<%= grdcuentas_contables.ClientID %>').prepend($("<thead></thead>").append($('#<%= grdcuentas_contables.ClientID %>').find("tr:first"))).DataTable({
                "destroy": true,
                "stateSave": true,
                "ordering": false,
                "lengthMenu": [[15, 30, 45, -1], [15, 30, 45, "All"]]
            });
        };

        function CuentasContablesInicio() {
            //$('input[type=search]').val('');
            $('#<%= grdcuentas_contables.ClientID %>').prepend($("<thead></thead>").append($('#<%= grdcuentas_contables.ClientID %>').find("tr:first"))).DataTable({
                "destroy": true,
                "stateSave": false,
                "ordering": false,
                "lengthMenu": [[15, 30, 45, -1], [15, 30, 45, "All"]]
            });
        };

        function CatCOG() {
            $('#<%= grdCatCOG.ClientID %>').prepend($("<thead></thead>").append($('#<%= grdCatCOG.ClientID %>').find("tr:first"))).DataTable({
                "destroy": true,
                "ordering": false,
                "bStateSave": false,
                "lengthMenu": [[7, 14, 21, -1], [7, 14, 21, "All"]]
            });
        };
        function Polizas() {
            //$('input[type=search]').val('');
            $('#<%= grvPolizas.ClientID %>').prepend($("<thead></thead>").append($('#<%= grvPolizas.ClientID %>').find("tr:first"))).DataTable({
                "destroy": true,
                "stateSave": true,
                "ordering": false
            });
        };
    </script>
</asp:Content>
