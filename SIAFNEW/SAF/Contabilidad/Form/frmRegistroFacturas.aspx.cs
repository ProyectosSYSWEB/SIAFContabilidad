using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAF.Contabilidad.Form
{
    public partial class frmRegistroFacturas : System.Web.UI.Page
    {
        #region <Variables>
        Usuario Usuario = new Usuario();
        Sesion SesionUsu = new Sesion();
        CN_Comun CNComun = new CN_Comun();
        string Verificador = string.Empty;
        Poliza_CFDI ObjPolizaCFDI = new Poliza_CFDI();
        Poliza ObjPoliza = new Poliza();
        CN_Poliza_CFDI CNPolizaCFDI = new CN_Poliza_CFDI();

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            SesionUsu = (Sesion)Session["Usuario"];
            if (!IsPostBack)
            {
                Cargarcombos();
                CargarGridPolizas();
                MultiView1.ActiveViewIndex = 0;
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "FiltroProveedor", "Autocomplete();", true);

        }

        private List<Poliza> GetList()
        {

            try
            {
                List<Poliza> List = new List<Poliza>();
                //ObjPolizaCFDI.Tipo_Gasto = ddlTipo_Gasto.SelectedValue;
                //ObjPolizaCFDI.Beneficiario_Tipo = ddlTipo_Beneficiario.SelectedValue;
                //ObjPolizaCFDI.Centro_Contable = DDLCentro_Contable.SelectedValue;
                //ObjPolizaCFDI.Ejercicio = SesionUsu.Usu_Ejercicio;
                //ObjPolizaCFDI.Mes_anio = ddlMes.SelectedValue;
                ObjPoliza.Centro_contable = DDLCentro_Contable.SelectedValue;
                ObjPoliza.Mes_anio = ddlMes.SelectedValue;
                CNPolizaCFDI.PolizasSinComprobar(ObjPoliza, ref List/*, txtBuscar.Text*/);
                return List;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private void CargarGridPolizas()
        {
            grvPolizaCFDI.DataSource = null;
            grvPolizaCFDI.DataBind();
            //Int32[] Celdas = new Int32[] { 0, 2 };
            try
            {
                DataTable dt = new DataTable();
                grvPolizas.DataSource = GetList();
                grvPolizas.DataBind();

            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        private void Cargarcombos()
        {
            try
            {
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Proveedores", ref ddlProveedor);


                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Tipo_Beneficiario", ref ddlTipoBeneficiario2);
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Tipo_Gasto", ref ddlTipoGasto2);


                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Centros_Contables", ref DDLCentro_Contable, "p_usuario", "p_ejercicio", SesionUsu.Usu_Nombre, SesionUsu.Usu_Ejercicio);
                DDLCentro_Contable.SelectedIndex = 1;
            }
            catch (Exception ex)
            {
                //lblError.Text = ex.Message;
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);

            }
        }



        protected void grvPolizaCFDI_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            List<Poliza_CFDI> lstPolizasCFDI = new List<Poliza_CFDI>();
            lstPolizasCFDI = (List<Poliza_CFDI>)Session["PolizasCFDI"];
            try
            {

                grvPolizaCFDI.PageIndex = 0;
                grvPolizaCFDI.PageIndex = e.NewPageIndex;
                CargarGridPolizaCFDI(lstPolizasCFDI);
            }

            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        protected void btnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void ddlProveedor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProveedor.SelectedValue == "X")
                txtProveedor.Visible = true;
            else
                txtProveedor.Visible = false;

            txtRFC.Text = ddlProveedor.SelectedValue;
        }

        protected void bttnAgregaFactura_Click(object sender, EventArgs e)
        {
            string Ruta;
            string NombreArchivo;
            List<Poliza_CFDI> lstPolizasCFDI = new List<Poliza_CFDI>();
            string VerificadorCFDI = string.Empty;
            DateTime FechaActual = DateTime.Today;

            try
            {

                ObjPolizaCFDI.Beneficiario_Tipo = ddlTipoBeneficiario2.SelectedValue;
                ObjPolizaCFDI.Tipo_Gasto = ddlTipoGasto2.SelectedValue;
                ObjPolizaCFDI.Fecha_Captura = FechaActual.ToString("dd/MM/yyyy");
                ObjPolizaCFDI.Usuario_Captura = SesionUsu.Usu_Nombre;
                ObjPolizaCFDI.CFDI_UUID = txtFolio.Text;
                ObjPolizaCFDI.CFDI_Fecha = txtFecha.Text;
                ObjPolizaCFDI.CFDI_Total = Convert.ToDouble(txtImporte.Text);
                ObjPolizaCFDI.CFDI_Nombre = txtProveedor.Text.ToUpper();
                ObjPolizaCFDI.CFDI_RFC = txtRFC.Text;


                if (FileFactura.HasFile)
                {
                    NombreArchivo = FileFactura.FileName.ToUpper();
                    if (NombreArchivo.Contains(".XML"))
                    {
                        Ruta = Path.Combine(Server.MapPath("~/AdjuntosExtras"), grvPolizas.SelectedRow.Cells[0].Text + "-" + DDLCentro_Contable.SelectedValue + "-" + grvPolizas.SelectedRow.Cells[3].Text + "-" + NombreArchivo);
                        FileFactura.SaveAs(Ruta);
                        ObjPolizaCFDI.NombreArchivoXML = grvPolizas.SelectedRow.Cells[0].Text + "-" + DDLCentro_Contable.SelectedValue + "-" + grvPolizas.SelectedRow.Cells[3].Text + "-" + NombreArchivo;
                        ObjPolizaCFDI.Ruta_XML = "~/AdjuntosExtras/" + ObjPolizaCFDI.NombreArchivoXML;
                    }
                }


                else if (FileFacturaPDF.HasFile)
                {
                    NombreArchivo = FileFacturaPDF.FileName.ToUpper();
                    if (NombreArchivo.Contains(".PDF"))
                    {
                        Ruta = Path.Combine(Server.MapPath("~/AdjuntosExtras"), grvPolizas.SelectedRow.Cells[0].Text + "-" + DDLCentro_Contable.SelectedValue + "-" + grvPolizas.SelectedRow.Cells[3].Text + "-" + NombreArchivo);
                        FileFacturaPDF.SaveAs(Ruta);
                        ObjPolizaCFDI.NombreArchivoPDF = grvPolizas.SelectedRow.Cells[0].Text + "-" + DDLCentro_Contable.SelectedValue + "-" + grvPolizas.SelectedRow.Cells[3].Text + "-" + NombreArchivo;
                        ObjPolizaCFDI.Ruta_PDF = "~/AdjuntosExtras/" + ObjPolizaCFDI.NombreArchivoPDF;
                    }
                }

                if (Session["PolizasCFDI"] != null)
                    lstPolizasCFDI = (List<Poliza_CFDI>)Session["PolizasCFDI"];

                lstPolizasCFDI.Add(ObjPolizaCFDI);
                Session["PolizasCFDI"] = lstPolizasCFDI;
                CargarGridPolizaCFDI(lstPolizasCFDI);
                LimpiarCampos();

            }

            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        private void CargarGridPolizaCFDI(List<Poliza_CFDI> ListPolizaCFDI)
        {
            grvPolizaCFDI.DataSource = null;
            grvPolizaCFDI.DataBind();
            Int32[] Celdas = new Int32[] { 10, 11 };
            Int32[] Celdas2 = new Int32[] { 10, 11, 12 };
            try
            {
                double TotalPagos;
                DataTable dt = new DataTable();
                grvPolizaCFDI.DataSource = ListPolizaCFDI;
                grvPolizaCFDI.DataBind();
                if (ListPolizaCFDI.Count() > 0)
                {
                    TotalPagos = ListPolizaCFDI.Sum(item => Convert.ToDouble(item.CFDI_Total));

                    Label lblTot = (Label)grvPolizaCFDI.FooterRow.FindControl("lblGranTotal");
                    Label lblTotInt = (Label)grvPolizaCFDI.FooterRow.FindControl("lblGranTotalInt");

                    lblTot.Text = TotalPagos.ToString("C");
                    lblTotInt.Text = Convert.ToString(TotalPagos);
                }
                CNComun.HideColumns(grvPolizaCFDI, Celdas);

            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        protected void linkBttnAgregar_Click(object sender, EventArgs e)
        {
            LinkButton cbi = (LinkButton)(sender);
            GridViewRow row = (GridViewRow)cbi.NamingContainer;
            grvPolizas.SelectedIndex = row.RowIndex;
            MultiView1.ActiveViewIndex = 1;
            LimpiarCampos();
            List<Poliza_CFDI> lstPolizasCFDI = new List<Poliza_CFDI>();
            ObjPolizaCFDI.IdPoliza = Convert.ToInt32(grvPolizas.SelectedRow.Cells[0].Text);
            CNPolizaCFDI.PolizaCFDIConsultaDatos(ObjPolizaCFDI, ref lstPolizasCFDI, ref Verificador);
            if (lstPolizasCFDI.Count > 0)
            {
                Session["PolizasCFDI"] = lstPolizasCFDI;
                CargarGridPolizaCFDI(lstPolizasCFDI);
            }
        }

        protected void LimpiarCampos()
        {
            ddlTipoBeneficiario2.SelectedIndex = 0;
            ddlTipoGasto2.SelectedIndex = 0;
            txtFecha.Text = string.Empty;
            ddlProveedor.SelectedIndex = 0;
            ddlProveedor_SelectedIndexChanged(null, null);
            grvPolizaCFDI.DataSource = null;
            grvPolizaCFDI.DataBind();
        }


        protected void linkBttnBuscar_Click(object sender, EventArgs e)
        {
            CargarGridPolizas();
        }

        protected void btnCancelarCFDI_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnGuardarCFDI_Click(object sender, EventArgs e)
        {
            /*DATOS CFDI XML*/
            Verificador = string.Empty;
            List<Poliza_CFDI> lstPolizasCFDI = new List<Poliza_CFDI>();
            Poliza objPolizas = new Poliza();
            double total = 0;
            try
            {
                if (grvPolizaCFDI.Rows.Count >= 1)
                {
                    Label lblTot = (Label)grvPolizaCFDI.FooterRow.FindControl("lblGranTotalInt");
                    double lblTotInt = Convert.ToDouble(lblTot.Text);
                    lblTotInt = Math.Ceiling(lblTotInt);
                    objPolizas.IdPoliza = Convert.ToInt32(grvPolizas.SelectedRow.Cells[0].Text);



                    if (Session["PolizasCFDI"] != null)
                        lstPolizasCFDI = (List<Poliza_CFDI>)Session["PolizasCFDI"];


                    ObjPolizaCFDI.IdPoliza = Convert.ToInt32(grvPolizas.SelectedRow.Cells[0].Text);
                    CNPolizaCFDI.PolizaCFDIExtraEditar(ObjPolizaCFDI, lstPolizasCFDI, ref Verificador);

                    if (Verificador == "0")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(1, 'Los datos han sido agregados correctamente.');", true);

                        SesionUsu.Editar = -1;
                        MultiView1.ActiveViewIndex = 0;
                        CargarGridPolizas();



                    }
                    else
                    {
                        //SesionUsu.Editar = -1;
                        //MultiView1.ActiveViewIndex = 0;
                        //CargarGrid(0);
                        CNComun.VerificaTextoMensajeError(ref Verificador);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);

                    }
                }
                else
                {
                    CNPolizaCFDI.EliminarCFDIEditar(Convert.ToInt32(grvPolizas.SelectedRow.Cells[0].Text), ref Verificador);
                    if (Verificador == "0")
                    {
                        SesionUsu.Editar = -1;
                        MultiView1.ActiveViewIndex = 0;
                        CargarGridPolizas();
                    }
                }
                /*FIN DATOS CFDI XML*/
            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        protected void grvPolizaCFDI_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            List<Poliza_CFDI> lstPolizasCFDI = new List<Poliza_CFDI>();
            lstPolizasCFDI = (List<Poliza_CFDI>)Session["PolizasCFDI"];
            try
            {
                int fila = e.RowIndex;
                int pagina = grvPolizaCFDI.PageSize * grvPolizaCFDI.PageIndex;
                fila = pagina + fila;
                lstPolizasCFDI.RemoveAt(fila);
                Session["PolizasCFDI"] = lstPolizasCFDI;
                CargarGridPolizaCFDI(lstPolizasCFDI);
            }

            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }
    }
}