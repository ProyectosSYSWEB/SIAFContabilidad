<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmHabilitaCta.aspx.cs" Inherits="SAF.Contabilidad.Form.frmHabilitaCta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <asp:UpdatePanel ID="updPnlDisponibles" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdCCDisponibles" runat="server" CssClass="mGrid" AutoGenerateColumns="False" EmptyDataText="No hay centros contables disponibles." ShowHeaderWhenEmpty="True">
                            <Columns>
                                <asp:BoundField DataField="Centro_Contable" HeaderText="Cve" />
                                <asp:BoundField DataField="Desc_Centro_Contable" HeaderText="Centro Contable" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" CssClass="btn btn-primary">Agregar</asp:LinkButton>
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
            <div class="col-md-2"></div>
            <div class="col-md-5">
                <asp:UpdatePanel ID="updPnlAsignados" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdCCAsignados" runat="server" AutoGenerateColumns="False" CssClass="mGrid" EmptyDataText="No hay centros contables asignados.">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="linkBttnEliminar" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" CssClass="btn btn-danger">Eliminar</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Centro_Contable" HeaderText="Cve" />
                                <asp:BoundField DataField="Desc_Centro_Contable" HeaderText="Centro Contable" />
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
</asp:Content>
