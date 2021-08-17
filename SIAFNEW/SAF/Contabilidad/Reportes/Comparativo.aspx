<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comparativo.aspx.cs" Inherits="SAF.Contabilidad.Reportes.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="izquierda">
                                <asp:Label ID="Label3" runat="server" Text="Cuenta Contable:"></asp:Label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddl_cuentas" runat="server"
                                            OnSelectedIndexChanged="ddl_cuentas_SelectedIndexChanged" Width="296px">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="izquierda">
                                <asp:Label ID="lbl_f_ini" runat="server" Style="text-align: right"
                                    Text="Mes Inicial:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="txtmes_inicial" runat="server"
                                    OnSelectedIndexChanged="txtmes_inicial_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="cuadro_botones">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:ImageButton ID="btnAceptar" runat="server"
                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/pdf.png" OnClick="btnAceptar_Click" Width="51px" />
                                        <asp:ImageButton ID="xls" runat="server"
                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/excel.png"
                                            Style="text-align: center" Width="49px" OnClick="xls_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:UpdateProgress ID="UpdateProgress2" runat="server"
                                    AssociatedUpdatePanelID="UpdatePanel3">
                                    <ProgressTemplate>
                                        <asp:Image ID="Image1q" runat="server"
                                            AlternateText="Espere un momento, por favor.." Height="30px"
                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                            ToolTip="Espere un momento, por favor.." Width="30px" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <table style="width: 100%;">
                                <tr>
                                    <td>&nbsp;
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cuadro_botones">&nbsp; &nbsp; &nbsp;
                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="ImageButton3" runat="server"
                                                ImageUrl="https://sysweb.unach.mx/resources/imagenes/excel.png" OnClick="imgBttnExcel"
                                                Style="text-align: center" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;
                                    </td>
                                    <td style="text-align: center">&nbsp;
                                    <asp:UpdateProgress ID="UpdateProgress3" runat="server"
                                        AssociatedUpdatePanelID="UpdatePanel6">
                                        <ProgressTemplate>
                                            <asp:Image ID="Image1q0" runat="server"
                                                AlternateText="Espere un momento, por favor.." Height="30px"
                                                ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                ToolTip="Espere un momento, por favor.." Width="30px" />
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <div class="container">
                                <div class="row">
                                    <div class="col text-center">
                                        <asp:UpdateProgress ID="UpdateProgress4" runat="server"
                                            AssociatedUpdatePanelID="UpdatePanel8">
                                            <ProgressTemplate>
                                                <asp:Image ID="Image1q1" runat="server"
                                                    AlternateText="Espere un momento, por favor.." Height="30px"
                                                    ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                                    ToolTip="Espere un momento, por favor.." Width="30px" />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        Fecha Inicial
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlMes_inicial" runat="server"
                                            OnSelectedIndexChanged="txtmes_inicial_SelectedIndexChanged">
                                            <asp:ListItem Value="00">APERTURA</asp:ListItem>
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
                                            <asp:ListItem Value="13">CIERRE</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-2">Fecha Final</div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlMes_final" runat="server"
                                            OnSelectedIndexChanged="txtmes_inicial_SelectedIndexChanged">
                                            <asp:ListItem Value="00">APERTURA</asp:ListItem>
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
                                            <asp:ListItem Value="13">CIERRE</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="lblCentro_Contable" runat="server" Text="Centro Contable"
                                                    Visible="False"></asp:Label>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <div class="col-md-10">
                                        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                            <ContentTemplate>
                                                <asp:DropDownList ID="DDLCentro_Contable" runat="server" Visible="False"
                                                    Width="100%" AutoPostBack="True"
                                                    OnSelectedIndexChanged="DDLCentro_Contable_SelectedIndexChanged1">
                                                </asp:DropDownList>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>          
                                    </div>
                                <div class="row">
                                    <div class="col-md-1">
                                        <asp:UpdateProgress ID="UpdateProgress9" runat="server" AssociatedUpdatePanelID="UpdatePanel10">
                                            <ProgressTemplate>
                                                <asp:Image ID="Image1q6" runat="server" AlternateText="Espere un momento, por favor.." Height="30px" ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif" ToolTip="Espere un momento, por favor.." Width="30px" />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <asp:Label ID="lblcuenta1" runat="server" Text="Cuenta Contable"
                                            Visible="False"></asp:Label>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:DropDownList ID="ddlcuenta1" runat="server" Visible="False" Width="100%">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col text-right">
                                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                            <ContentTemplate>
                                                <asp:ImageButton ID="btnAceptar0" runat="server" ImageUrl="https://sysweb.unach.mx/resources/imagenes/pdf.png" OnClick="btnAceptar0_Click" />
                                                <asp:ImageButton ID="btn_excel" runat="server" ImageUrl="https://sysweb.unach.mx/resources/imagenes/excel.png" OnClick="btn_excel_Click" Style="text-align: center" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-2">
                                Centro Contable
                            </div>
                            <div class="col-md-10">
                                <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DDLCentro_Contable_v" runat="server"
                                            OnSelectedIndexChanged="DDLCentro_Contable_v_SelectedIndexChanged"
                                            Width="100%" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <asp:UpdateProgress ID="UpdateProgress6" runat="server"
                                    AssociatedUpdatePanelID="UpdatePanel12">
                                    <ProgressTemplate>
                                        <asp:Image ID="Image1q3" runat="server"
                                            AlternateText="Espere un momento, por favor.." Height="30px"
                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                            ToolTip="Espere un momento, por favor.." Width="30px" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                Mes
                            </div>
                            <div class="col-md-3">
                                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddlmes" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="txtmes_inicial_SelectedIndexChanged" Width="100%">
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
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-1">
                                <asp:UpdateProgress ID="UpdateProgress7" runat="server"
                                    AssociatedUpdatePanelID="UpdatePanel13">
                                    <ProgressTemplate>
                                        <asp:Image ID="Image1q4" runat="server"
                                            AlternateText="Espere un momento, por favor.." Height="30px"
                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                            ToolTip="Espere un momento, por favor.." Width="30px" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                            <div class="col-md-1">
                                Tipo
                            </div>
                            <div class="col-md-4">
                                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddltipo" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddltipo_SelectedIndexChanged" Width="100%">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-1">
                                <asp:UpdateProgress ID="UpdateProgress8" runat="server"
                                    AssociatedUpdatePanelID="UpdatePanel14">
                                    <ProgressTemplate>
                                        <asp:Image ID="Image1q5" runat="server"
                                            AlternateText="Espere un momento, por favor.." Height="30px"
                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                            ToolTip="Espere un momento, por favor.." Width="30px" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                # Poliza
                            </div>
                            <div class="col-md-10">
                                <asp:DropDownList ID="ddlnumero_poliza" runat="server" Width="100%"
                                    OnSelectedIndexChanged="ddlnumero_poliza_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-right">
                                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                    <ContentTemplate>
                                        <asp:ImageButton ID="btnAceptar_v" runat="server"
                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/pdf.png" OnClick="btnAceptar_v_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <asp:UpdateProgress ID="UpdateProgress5" runat="server"
                                    AssociatedUpdatePanelID="UpdatePanel11">
                                    <ProgressTemplate>
                                        <asp:Image ID="Image1q2" runat="server"
                                            AlternateText="Espere un momento, por favor.." Height="30px"
                                            ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif"
                                            ToolTip="Espere un momento, por favor.." Width="30px" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View5" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel101" runat="server">
                        <ContentTemplate>
                            <table style="width: 100%;">
                                <tr>
                                    <td class="auto-style7">
                                        <asp:Label ID="lblmes_inicial1" runat="server" Style="text-align: right" Text="Fecha Inicial:"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style4">
                                                    <asp:DropDownList ID="ddlMes_inicial1" runat="server" OnSelectedIndexChanged="txtmes_inicial_SelectedIndexChanged">
                                                        <asp:ListItem Value="00">APERTURA</asp:ListItem>
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
                                                        <asp:ListItem Value="13">CIERRE</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="auto-style8">
                                                    <asp:Label ID="lblmes_final1" runat="server" Style="text-align: right" Text="Fecha Final:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlMes_final1" runat="server" OnSelectedIndexChanged="txtmes_inicial_SelectedIndexChanged">
                                                        <asp:ListItem Value="00">APERTURA</asp:ListItem>
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
                                                        <asp:ListItem Value="13">CIERRE</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td class="auto-style7">
                                        <asp:Label ID="lbltipo" runat="server" Text="Tipo:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddl_Tipo_D" runat="server" Width="100%">
                                            <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                            <asp:ListItem Value="1">Adeudos SAT</asp:ListItem>
                                            <asp:ListItem Value="2">Adeudos FOVISSSTE</asp:ListItem>
                                            <asp:ListItem Value="3">Adeudos ISSSTE</asp:ListItem>
                                            <asp:ListItem Value="4">Impuestos sobre Nómina</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_Tipo_D" ErrorMessage="*Requerido" InitialValue="0">*Requerido</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td class="auto-style7">
                                        <asp:Label ID="lblsubtipo" runat="server" Text="Adeudo:"></asp:Label>
                                    </td>
                                    <td class="auto-style5">
                                        <asp:DropDownList ID="ddl_subtipo" runat="server" Width="100%">
                                            <asp:ListItem Value="1">Corto Plazo</asp:ListItem>
                                            <asp:ListItem Value="2">Diferido</asp:ListItem>
                                            <asp:ListItem Value="3">Conciliado</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr valign="top">
                                    <td class="auto-style7">
                                        <asp:Label ID="lblNotas" runat="server" Text="Notas:"></asp:Label>
                                    </td>
                                    <td class="auto-style5">
                                        <asp:TextBox ID="txtNotas" runat="server" Height="150px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr valign="top">
                                    <td class="auto-style7">&nbsp;</td>
                                    <td class="auto-style9">
                                        <asp:UpdatePanel ID="UpdatePanel103" runat="server">
                                            <ContentTemplate>
                                                <asp:ImageButton ID="btnAceptar_D" runat="server" ImageUrl="https://sysweb.unach.mx/resources/imagenes/pdf.png" OnClick="btnAceptar_D_Click" />
                                                &nbsp;<asp:ImageButton ID="btn_excel_D" runat="server" ImageUrl="https://sysweb.unach.mx/resources/imagenes/excel.png" OnClick="imgBttnExcel_D" Style="text-align: center" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:UpdateProgress ID="UpdateProgress10" runat="server" AssociatedUpdatePanelID="UpdatePanel103">
                                            <ProgressTemplate>
                                                <asp:Image ID="Image1q7" runat="server" AlternateText="Espere un momento, por favor.." Height="50px" ImageUrl="https://sysweb.unach.mx/resources/imagenes/ajax_loader_gray_512.gif" ToolTip="Espere un momento, por favor.." Width="50px" />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:View>
            </asp:MultiView>


        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
