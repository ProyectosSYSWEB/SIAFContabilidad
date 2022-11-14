using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAF.Contabilidad.Form
{
    public partial class frmRegBeneficiarios_Pasivo : System.Web.UI.Page
    {
        #region <Variables>
        string Verificador = string.Empty;
        string VerificadorDet = string.Empty;
        Sesion SesionUsu = new Sesion();
        CN_Comun CNComun = new CN_Comun();
        private static List<Comun> ListTipo = new List<Comun>();

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            SesionUsu = (Sesion)Session["Usuario"];
            if (!IsPostBack)
                Inicializar();

            ScriptManager.RegisterStartupScript(this, GetType(), "Empleados", "Autocomplete();", true);

        }
        private void Inicializar()
        {
            MultiView1.ActiveViewIndex = 0;           
            Cargarcombos();
            //CargarGrid();
        }
        private void Cargarcombos()
        {
            Verificador = string.Empty;
            try
            {
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Centros_Contables", ref DDLCentro_Contable, "p_usuario", "p_ejercicio", SesionUsu.Usu_Nombre, SesionUsu.Usu_Ejercicio);
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Centros_Contables", ref DDLCentro_Contable2, "p_usuario", "p_ejercicio", SesionUsu.Usu_Nombre, SesionUsu.Usu_Ejercicio);
                CNComun.LlenaCombo("PKG_PRESUPUESTO.Obt_Combo_Proyecto", ref DDLProyecto, "p_ejercicio", SesionUsu.Usu_Ejercicio);
                CNComun.LlenaCombo("PKG_PRESUPUESTO.Obt_Combo_Proyecto", ref DDLProyecto2, "p_ejercicio", SesionUsu.Usu_Ejercicio);
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Empleados", ref DDLBeneficiario);
                //CNComun.LlenaCombo("PKG_PRESUPUESTO.Obt_Grid_Cat_TipoProy", ref DDLProyecto, "p_todos", "S");
                //CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Centros_Contables", ref DDLCentro_Contable, "p_usuario", "p_ejercicio", "p_sistema", SesionUsu.Usu_Nombre, SesionUsu.Usu_Ejercicio, "CONCILIACION", ref ListCentroContable);
                //Session["CentrosContab"] = ListCentroContable;
                //CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Tipo_Conciliacion", ref ddlTipo, "p_ejercicio", SesionUsu.Usu_Ejercicio, ref ListTipo);
                //CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Tipo_Conciliacion", ref ddlTipo2, "p_ejercicio", SesionUsu.Usu_Ejercicio, ref ListTipo);
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
            MultiView1.ActiveViewIndex = 1;
            DDLCentro_Contable2.SelectedValue = DDLCentro_Contable.SelectedValue;
            DDLCentro_Contable2_SelectedIndexChanged(null, null);

        }

        protected void DDLCentro_Contable2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Verificador = string.Empty;
            try
            {
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Cedulas", ref DDLCedula, "p_ejercicio", "p_centro_contable", "p_mes_anio", "p_clave_evento", SesionUsu.Usu_Ejercicio, DDLCentro_Contable2.SelectedValue, "", "97");
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Polizas_Tipo", ref DDLPoliza, "p_ejercicio", "p_centro_contable", "p_mes_anio", SesionUsu.Usu_Ejercicio, DDLCentro_Contable2.SelectedValue, "");
                DDLFormato2.SelectedIndex = 0;
                DDLFormato2_SelectedIndexChanged(null, null);
                CNComun.LlenaCombo("PKG_PRESUPUESTO.Obt_Combo_Fuente_F", ref DDLFuente2, "p_ejercicio", "p_dependencia", "p_evento", SesionUsu.Usu_Ejercicio, DDLCentro_Contable2.SelectedValue, "00");


            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        protected void linkBttnSalir_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void DDLFormato2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Verificador = string.Empty;
            try
            {
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Ctas_Contables", ref DDLCuenta, "p_ejercicio", "p_centro_contable", "p_cta_mayor", "p_nivel", SesionUsu.Usu_Ejercicio, DDLCentro_Contable2.SelectedValue, DDLFormato2.SelectedValue, "4");
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