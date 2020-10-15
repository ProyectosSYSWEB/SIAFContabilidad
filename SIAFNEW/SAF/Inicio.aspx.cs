using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAF
{
    public partial class Inicio : System.Web.UI.Page
    {
        #region <Variables>
        string Verificador = string.Empty;
        CN_Usuario CNUsuario = new CN_Usuario();
        Usuario Usuario = new Usuario();
        Sesion SesionUsu = new Sesion();
        Comun Comun = new Comun();
        List<Comun> lstComun = new List<Comun>();
        Mnu mnu = new Mnu();
        CN_Mnu CNMnu = new CN_Mnu();
        CN_Comun CNMonitor = new CN_Comun();
        CN_Comun CNComun = new CN_Comun();
        CN_Informativa CNInformativa = new CN_Informativa();
        cuentas_contables Objinformativa = new cuentas_contables();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            SesionUsu = (Sesion)Session["Usuario"];
            if (!IsPostBack)
            {
                busca_informativa();
                //Inicializar();
            }
        }
        private void busca_informativa()
        {
            try
            {
                lblMensaje.Text = string.Empty;
                Objinformativa.usuario = SesionUsu.Usu_Nombre;
                Objinformativa.ejercicio = SesionUsu.Usu_Ejercicio;
                //CNInformativa.Consultar_Observaciones(ref Objinformativa, ref Verificador);
                CNInformativa.Consultar_Mensajes(SesionUsu.Usu_Nombre, 15361, ref lstComun);
                //if (Verificador == "0")
                //{
                    //if (Objinformativa.observaciones.Length > 1)
                    if (lstComun.Count > 1)
                    {
                        lblMsg_Observaciones.Text = string.Empty;
                        foreach (Comun lst in lstComun)
                        {
                            lblMsg_Observaciones.Text = lblMsg_Observaciones.Text+ "<br />" + lst.Descripcion;
                        }
                        ModalPopupExtender.Show();
                    }
                //}
                //else
                //{
                //    lblMensaje.Text = Verificador;
                //}
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }

        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            ModalPopupExtender.Hide();
        }
    }
}