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
    public partial class frmHabilitaCta : System.Web.UI.Page
    {
        #region <Variables>
        Int32[] Celdas = new Int32[] { 0, 15, 16, 17, 18, 19, 20 };
        string Verificador = string.Empty;
        CN_Comun CNComun = new CN_Comun();
        Centros_Contables objCentroContable = new Centros_Contables();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGrid();
        }
        private void CargarGrid()
        {
            Verificador = string.Empty;

            grdCCDisponibles.DataSource = null;
            grdCCDisponibles.DataBind();
            try
            {
                DataTable dt = new DataTable();
                grdCCDisponibles.DataSource = dt;
                grdCCDisponibles.DataSource = GetList();
                grdCCDisponibles.DataBind();
            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }
        private List<Centros_Contables> GetList()
        {
            Verificador = string.Empty;
            try
            {
                List<Centros_Contables> List = new List<Centros_Contables>();


                return List;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}