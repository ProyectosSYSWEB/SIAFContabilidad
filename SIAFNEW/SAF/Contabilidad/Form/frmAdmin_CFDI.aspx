<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAdmin_CFDI.aspx.cs" Inherits="SAF.Contabilidad.Form.frmAdmin_CFDI" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                Centro Contable
            </div>
            <div class="col-md-10">
                        <asp:DropDownList ID="DDLCentro_Contable" runat="server" Width="100%">
                        </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Tipo Beneficiario
            </div>
            <div class="col-md-2">
                <asp:DropDownList ID="ddlTipo_Beneficiario" runat="server" Width="100%">
                </asp:DropDownList>
            </div>
            <div class="col-md-2 text-right">
                Tipo Gasto
            </div>
            <div class="col-md-2">
                <asp:DropDownList ID="ddlTipo_Gasto" runat="server" Width="100%">
                </asp:DropDownList>
            </div>
             <div class="col-md-2 text-right">
                 Mes</div>
            <div class="col-md-2">
                <asp:DropDownList ID="ddlMes" runat="server" Width="100%">
                    <asp:ListItem Value="00">--TODOS--</asp:ListItem>
                    <asp:ListItem Value="01">ENERO</asp:ListItem>
                    <asp:ListItem Value="02">FEBRERO</asp:ListItem>
                    <asp:ListItem Value="03">MARZO</asp:ListItem>
                    <asp:ListItem Value="04">ABRIL</asp:ListItem>
                    <asp:ListItem Value="05">MAYO</asp:ListItem>
                    <asp:ListItem Value="06">JUNIO</asp:ListItem>
                    <asp:ListItem Value="07">JULIO</asp:ListItem>
                    <asp:ListItem Value="08">AGOSTO</asp:ListItem>
                    <asp:ListItem Value="09">SEPTIEMBRE</asp:ListItem>
                    <asp:ListItem Value="10">OCTUBRE</asp:ListItem>
                    <asp:ListItem Value="11">NOVIEMBRE</asp:ListItem>
                    <asp:ListItem Value="12">DICIEMBRE</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Buscar
            </div>
            <div class="col-md-9">
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="textbuscar" Width="100%" PlaceHolder="Folio/Nombre/UUID"></asp:TextBox>
                </div>
            <div class="col-md-1">
                        <asp:UpdatePanel ID="updPnlBuscar" runat="server">
                            <ContentTemplate>
                                <%--<button runat="server" id="imgbtnBuscar" onserverclick="imgbtnBuscar_Click" class="btn-buscar btn-primary" validationgroup="Buscar">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </button>--%>
                                
                                <asp:ImageButton ID="imgbtnBuscar" runat="server" CausesValidation="False" ImageUrl="http://sysweb.unach.mx/resources/imagenes/buscar.png" OnClick="imgbtnBuscar_Click" Style="text-align: right" title="Buscar" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <asp:UpdateProgress ID="updPrgBuscar" runat="server" AssociatedUpdatePanelID="updPnlBuscar">
                    <ProgressTemplate>
                        <asp:Image ID="imgBuscar" runat="server" Height="50px" ImageUrl="http://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                            Width="50px" AlternateText="Espere un momento, por favor.."
                            ToolTip="Espere un momento, por favor.." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <asp:UpdateProgress ID="UpdateProgress5" runat="server" AssociatedUpdatePanelID="UpdatePanel11">
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
                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grvPolizaCFDI" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="mGrid" ShowFooter="True" Width="100%" OnPageIndexChanging="grvPolizaCFDI_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="Centro_Contable" HeaderText="Centro Contable" />
                                <asp:BoundField DataField="Numero_poliza" HeaderText="# Póliza" />
                                <asp:BoundField DataField="Mes_anio" HeaderText="Mes Anio" />
                                <asp:BoundField DataField="Beneficiario_Tipo" HeaderText="Tipo Beneficiario" />
                                <asp:BoundField DataField="CFDI_Folio" HeaderText="Folio" />
                                <asp:BoundField DataField="CFDI_Fecha" HeaderText="Fecha" />
                                <asp:BoundField DataField="CFDI_Nombre" HeaderText="Nombre" />
                                <asp:BoundField DataField="CFDI_UUID" HeaderText="UUID" />
                                <asp:BoundField DataField="CFDI_Total" HeaderText="Total" DataFormatString="{0:c}" />
                                <asp:BoundField HeaderText="Fecha Registro" DataField="Fecha_Captura" />
                                <asp:BoundField HeaderText="Usuario Registra" DataField="Usuario_Captura" />
                                <asp:TemplateField HeaderText="Archivos">
                                    <FooterTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:ImageButton ID="imgBttnPDF" runat="server" ImageUrl="http://sysweb.unach.mx/resources/imagenes/pdf.png" title="Reporte PDF" OnClick="imgBttnPDF_Click" />
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="imgBttnExcel" runat="server" ImageUrl="http://sysweb.unach.mx/resources/imagenes/excel.png" title="Reporte Excel" OnClick="imgBttnExcel_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="linkArchivoXML" runat="server" NavigateUrl='<%# Bind("Ruta_XML") %>' Target="_blank">XML</asp:HyperLink>
                                        &nbsp;<asp:HyperLink ID="linkArchivoPDF" runat="server" NavigateUrl='<%# Bind("Ruta_PDF") %>' Target="_blank">PDF</asp:HyperLink>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
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
    </div>
</asp:Content>
