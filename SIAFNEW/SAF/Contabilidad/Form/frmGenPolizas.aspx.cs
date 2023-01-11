using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAF.Contabilidad.Form
{
    public partial class frmGenPolizas : System.Web.UI.Page
    {
        #region <Variables>
        Int32[] Celdas = new Int32[] { 0, 15, 16, 17, 18, 19, 20 };
        string Verificador = string.Empty;
        string MsjError = string.Empty;
        Sesion SesionUsu = new Sesion();
        CN_Comun CNComun = new CN_Comun();
        CN_Poliza CNPoliza = new CN_Poliza();
        Poliza ObjPoliza = new Poliza();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            SesionUsu = (Sesion)Session["Usuario"];
            if (Request.QueryString["P_Tipo"] != null)
                SesionUsu.Usu_Rep = Request.QueryString["P_Tipo"];

            if (SesionUsu.Usu_Rep == "CJGRAL")
                lblTitulo.Text = "Pólizas de Caja General";
            else if(SesionUsu.Usu_Rep == "DEPTOFIN")
                lblTitulo.Text = "Pólizas de Finánzas";
            else
                lblTitulo.Text = "Acceso denegado";
        }

        protected void linkBttnGenPolizas_Click(object sender, EventArgs e)
        {
            int TotalPolizasGen = 0;
            Verificador = string.Empty;
            string ss=SesionUsu.Usu_Ejercicio.Substring(2, 2);
            string MesAnio =  ddlMes.SelectedValue+SesionUsu.Usu_Ejercicio.Substring(2, 2);
            try
            {
                CNPoliza.GenPolizasAuto(Convert.ToInt32(SesionUsu.Usu_Ejercicio), MesAnio, ddlTipo.SelectedValue, ref TotalPolizasGen, ref Verificador);

                if (Verificador == "0")
                {
                    lblMsjError.Text = "Se han generado " + TotalPolizasGen + " pólizas.";
                    CargarGrid();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(1, 'Se han generado "+TotalPolizasGen+" pólizas.');", true);
                }
                else
                {
                    CNComun.VerificaTextoMensajeError(ref Verificador);
                    //lblMsjError.Text = Verificador;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
                }

            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }
        private void CargarGrid()
        {
            Verificador = string.Empty;
            grvPolizas.DataSource = null;
            grvPolizas.DataBind();
            try
            {
                DataTable dt = new DataTable();
                grvPolizas.DataSource = dt;
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
        private List<Poliza> GetList()
        {
            Verificador = string.Empty;
            try
            {
                List<Poliza> List = new List<Poliza>();
                ObjPoliza.Ejercicio = Convert.ToInt32(SesionUsu.Usu_Ejercicio);
                 if (SesionUsu.Usu_Rep == "DEPTOFIN")
                    ObjPoliza.Centro_contable = "72104";
                else if (SesionUsu.Usu_Rep == "CJGRAL")
                    ObjPoliza.Centro_contable = "72103";

                return List;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}