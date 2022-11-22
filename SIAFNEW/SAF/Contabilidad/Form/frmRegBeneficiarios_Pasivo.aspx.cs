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
    public partial class frmRegBeneficiarios_Pasivo : System.Web.UI.Page
    {
        #region <Variables>
        string Verificador = string.Empty;
        string VerificadorDet = string.Empty;
        Sesion SesionUsu = new Sesion();
        Pasivo objPasivo = new Pasivo();
        CN_Comun CNComun = new CN_Comun();
        CN_Empleado CNEmpleado = new CN_Empleado();
        CN_Poliza CNPasivo = new CN_Poliza();
        private static List<Comun> ListTipo = new List<Comun>();
        List<Comun> ListPolizas = new List<Comun>();
        List<Comun> ListCedulas = new List<Comun>();
        List<Comun> ListCuentas = new List<Comun>();
        Comun objBeneficiario = new Comun();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            SesionUsu = (Sesion)Session["Usuario"];
            if (!IsPostBack)
                Inicializar();

            ScriptManager.RegisterStartupScript(this, GetType(), "Empleados", "Autocomplete();", true);
            //ScriptManager.RegisterStartupScript(this, GetType(), "GridEmpleados", "CatEmpleados();", true);

        }
        private void Inicializar()
        {
            MultiView1.ActiveViewIndex = 0;
            Cargarcombos();
            //CargarGrid();
        }

        private void CargarGridEmpleados()
        {
            Verificador = string.Empty;
            grdEmpleados.DataSource = null;
            grdEmpleados.DataBind();
            try
            {
                DataTable dt = new DataTable();
                grdEmpleados.DataSource = dt;
                grdEmpleados.DataSource = GetListEmpleados();
                grdEmpleados.DataBind();
            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }
        private List<Empleado> GetListEmpleados()
        {
            Empleado objEmpleado = new Empleado();
            try
            {
                List<Empleado> ListEmpleados = new List<Empleado>();
                objEmpleado.Nombre = txtNombre.Text.ToUpper();
                CNEmpleado.ConsultarCatEmpleados(objEmpleado, ref ListEmpleados);
                return ListEmpleados;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private void Cargarcombos()
        {
            Verificador = string.Empty;
            try
            {
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Centros_Contables", ref DDLCentro_Contable, "p_usuario", "p_ejercicio", SesionUsu.Usu_Nombre, SesionUsu.Usu_Ejercicio);
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Centros_Contables", ref DDLCentro_Contable2, "p_usuario", "p_ejercicio", SesionUsu.Usu_Nombre, SesionUsu.Usu_Ejercicio);
                CNComun.LlenaCombo("PKG_PRESUPUESTO.Obt_Combo_Proyecto", ref DDLProyecto, "p_ejercicio", SesionUsu.Usu_Ejercicio);
                //CNComun.LlenaCombo("PKG_PRESUPUESTO.Obt_Combo_Proyecto", ref DDLProyecto2, "p_ejercicio", SesionUsu.Usu_Ejercicio);
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Empleados", ref DDLBeneficiario);
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Proveedores", ref DDLProveedor);
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
            grdPasivos.DataSource = null;
            grdPasivos.DataBind();
            Session["Pasivos"] = null;
            Session["Cedulas"] = null;
            Session["Polizas"] = null;
            DDLCentro_Contable2.SelectedValue = DDLCentro_Contable.SelectedValue;
            DDLCentro_Contable2_SelectedIndexChanged(null, null);
        }

        protected void DDLCentro_Contable2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Verificador = string.Empty;
            try
            {
                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Cedulas", ref DDLCedula, "p_ejercicio", "p_centro_contable", "p_mes_anio", "p_clave_evento", SesionUsu.Usu_Ejercicio, DDLCentro_Contable2.SelectedValue, "1222", "97", ref ListCedulas);
                Session["Cedulas"] = ListCedulas;
                DDLCedula_SelectedIndexChanged(null, null);
                //DDLFormato2.SelectedIndex = 0;
                //DDLFormato2_SelectedIndexChanged(null, null);
                //CNComun.LlenaCombo("PKG_PRESUPUESTO.Obt_Combo_Fuente_F", ref DDLFuente2, "p_ejercicio", "p_dependencia", "p_evento", SesionUsu.Usu_Ejercicio, DDLCentro_Contable2.SelectedValue, "00");
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
            rowBenef.Visible = false;
            rowProveedor.Visible = false;
            Session["Cuentas"] = null;



            try
            {
                if (DDLFormato2.SelectedValue == "2112")
                    rowProveedor.Visible = true;
                else
                    rowBenef.Visible = true;

                CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Cuentas_Poliza", ref DDLCuenta, "p_id_poliza", "p_mayor", "p_centro_contable", "p_ejercicio", DDLPoliza.SelectedValue, DDLFormato2.SelectedValue, DDLCentro_Contable2.SelectedValue, SesionUsu.Usu_Ejercicio, ref ListCuentas);
                if (ListCuentas.Count > 0)
                    Session["Cuentas"] = ListCuentas;
                else
                    Session["Cuentas"] = null;

                DDLCuenta_SelectedIndexChanged(null, null);

                //if (Session["Cedulas"] == null)
                //{
                //    CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Polizas_Cedula", ref DDLPoliza, "p_id_cedula", "p_mayor", "0", DDLFormato2.SelectedValue, ref ListPolizas);
                //    if (ListPolizas.Count > 0)
                //    {
                //        Session["Polizas"] = ListPolizas;
                //        DDLPoliza_SelectedIndexChanged(null, null);
                //    }
                //}
                //else
                //{
                //    ListCedulas = (List<Comun>)Session["Cedulas"];
                //    if (ListCedulas.Count > 0)
                //    {
                //        CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Polizas_Cedula", ref DDLPoliza, "p_id_cedula", "p_mayor", ListCedulas[DDLCedula.SelectedIndex].EtiquetaDos, DDLFormato2.SelectedValue, ref ListPolizas);
                //        if (ListPolizas.Count > 0)
                //        {
                //            Session["Polizas"] = ListPolizas;
                //            DDLPoliza_SelectedIndexChanged(null, null);
                //        }
                //        else
                //        {
                //            Session["Polizas"] = null;
                //            CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Cuentas_Poliza", ref DDLCuenta, "p_id_poliza", "p_mayor", "p_centro_contable", "p_ejercicio", "0", DDLFormato2.SelectedValue, DDLCentro_Contable2.SelectedValue, SesionUsu.Usu_Ejercicio, ref ListCuentas);
                //            Session["Cuentas"] = null;
                //            DDLCuenta_SelectedIndexChanged(null, null);
                //        }
                //    }
                //    else
                //    {
                //        Session["Polizas"] = null;
                //        CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Cuentas_Poliza", ref DDLCuenta, "p_id_poliza", "p_mayor", "p_centro_contable", "p_ejercicio", "0", DDLFormato2.SelectedValue, DDLCentro_Contable2.SelectedValue, SesionUsu.Usu_Ejercicio, ref ListCuentas);
                //        Session["Cuentas"] = null;
                //        DDLCuenta_SelectedIndexChanged(null, null);
                //    }

                //}
            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        protected void linBttnAgregar_Click(object sender, EventArgs e)
        {
            Verificador = string.Empty;
            List<Pasivo> lstPasivos = new List<Pasivo>();

            try
            {
                objPasivo.centro_contable = DDLCentro_Contable2.SelectedValue;
                objPasivo.id_cedula = Convert.ToInt32(DDLCedula.SelectedValue);
                objPasivo.id_poliza = Convert.ToInt32(DDLPoliza.SelectedValue);
                objPasivo.formato = DDLFormato2.SelectedValue;
                objPasivo.cuenta = DDLCuenta.SelectedValue;
                objPasivo.fuente_financiamiento = DDLFuente2.SelectedValue;
                objPasivo.proyecto = DDLProyecto2.SelectedValue;

                objBeneficiario = (Comun)Session["Beneficiario"];
                if (objBeneficiario != null)
                    objPasivo.beneficiario = objBeneficiario.Descripcion;


                objPasivo.importe = Convert.ToDouble(txtImporte.Text);
                //if (DDLFormato2.SelectedValue == "2112")
                //    objPasivo.beneficiario = DDLProveedor.SelectedValue;
                //else
                //    objPasivo.beneficiario = DDLBeneficiario.SelectedValue;

                if (Session["Pasivos"] != null)
                    lstPasivos = (List<Pasivo>)Session["Pasivos"];

                lstPasivos.Add(objPasivo);
                Session["Pasivos"] = lstPasivos;
                CargarGridPasivos(lstPasivos);
            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        protected void grdPasivos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            List<Pasivo> lstPasivos = new List<Pasivo>();
            lstPasivos = (List<Pasivo>)Session["Pasivos"];
            try
            {
                int fila = e.RowIndex;
                lstPasivos.RemoveAt(fila);

                Session["Pasivos"] = lstPasivos;
                CargarGridPasivos(lstPasivos);
            }

            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }
        private void CargarGridPasivos(List<Pasivo> lstPasivos)
        {
            grdPasivos.DataSource = null;
            grdPasivos.DataBind();
            try
            {
                double TotalPagos;
                DataTable dt = new DataTable();
                grdPasivos.DataSource = lstPasivos;
                grdPasivos.DataBind();
                if (lstPasivos.Count() > 0)
                    TotalPagos = lstPasivos.Sum(item => Convert.ToDouble(item.importe));
                else
                    TotalPagos = 0;



            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        protected void DDLPoliza_SelectedIndexChanged(object sender, EventArgs e)
        {
            Verificador = string.Empty;
            try
            {
                if (DDLPoliza.SelectedValue == "0")
                    rowNumPol.Visible = true;
                else
                    rowNumPol.Visible = false;

                DDLFormato2_SelectedIndexChanged(null, null);
                //if (DDLPoliza.Items.Count > 0)
                //{
                //    CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Cuentas_Poliza", ref DDLCuenta, "p_id_poliza", "p_mayor", "p_centro_contable", "p_ejercicio", DDLPoliza.SelectedValue, DDLFormato2.SelectedValue, DDLCentro_Contable2.SelectedValue, SesionUsu.Usu_Ejercicio, ref ListCuentas);
                //    Session["Cuentas"] = ListCuentas;
                //    DDLCuenta_SelectedIndexChanged(null, null);
                //}
                //else
                //{
                //    CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Cuentas_Poliza", ref DDLCuenta, "p_id_poliza", "p_mayor", "p_centro_contable", "p_ejercicio", DDLPoliza.SelectedValue, DDLFormato2.SelectedValue, DDLCentro_Contable2.SelectedValue, SesionUsu.Usu_Ejercicio, ref ListCuentas);
                //    txtImporte.Text = string.Empty;
                //    Session["Cuentas"] = null;
                //    DDLCuenta_SelectedIndexChanged(null, null);
                //}

            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        protected void DDLCedula_SelectedIndexChanged(object sender, EventArgs e)
        {
            Verificador = string.Empty;
            try
            {
                ListCedulas = (List<Comun>)Session["Cedulas"];



                if (ListCedulas.Count > 0)
                {
                    CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Polizas_Cedula", ref DDLPoliza, "p_id_cedula", "p_mayor", ListCedulas[DDLCedula.SelectedIndex].EtiquetaDos, "0", ref ListPolizas);
                    CNComun.LlenaCombo("PKG_CONTABILIDAD.Obt_Combo_Fuente_Cedula", ref DDLFuente2, "p_id_cedula", "p_dependencia", "p_ejercicio", ListCedulas[DDLCedula.SelectedIndex].EtiquetaDos, DDLCentro_Contable2.SelectedValue, SesionUsu.Usu_Ejercicio);
                    CNComun.LlenaCombo("PKG_CONTABILIDAD.Obt_Combo_Proyecto_Cedula", ref DDLProyecto2, "p_id_cedula", "p_dependencia", "p_ejercicio", ListCedulas[DDLCedula.SelectedIndex].EtiquetaDos, DDLCentro_Contable2.SelectedValue, SesionUsu.Usu_Ejercicio);
                }
                else
                {
                    CNComun.LlenaCombo("pkg_contabilidad.Obt_Combo_Polizas_Cedula", ref DDLPoliza, "p_id_cedula", "p_mayor", "-1", "0", ref ListPolizas);
                    CNComun.LlenaCombo("PKG_CONTABILIDAD.Obt_Combo_Fuente_Cedula", ref DDLFuente2, "p_id_cedula", "p_dependencia", "p_ejercicio", "0", DDLCentro_Contable2.SelectedValue, SesionUsu.Usu_Ejercicio);
                    CNComun.LlenaCombo("PKG_CONTABILIDAD.Obt_Combo_Proyecto_Cedula", ref DDLFuente2, "p_id_cedula", "p_dependencia", "p_ejercicio", "0", DDLCentro_Contable2.SelectedValue, SesionUsu.Usu_Ejercicio);
                }

                DDLPoliza_SelectedIndexChanged(null, null);
                //DDLFormato2_SelectedIndexChanged(null, null);

            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        protected void DDLCuenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            Verificador = string.Empty;
            try
            {

                if (Session["Cuentas"] == null)
                    txtImporte.Text = "0";
                else
                {
                    ListCuentas = (List<Comun>)Session["Cuentas"];
                    if (ListCuentas.Count > 0)
                        txtImporte.Text = ListCuentas[DDLCuenta.SelectedIndex].EtiquetaDos;
                }



            }
            catch (Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }

        protected void linkBttnBuscaNombreEmp_Click(object sender, EventArgs e)
        {
            CargarGridEmpleados();
        }


        protected void linkBttnBuscaEmp_Click(object sender, EventArgs e)
        {
            Verificador = string.Empty;
            try
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopupEmpleados", "$('#modalEmpleados').modal('show')", true);
            }
            catch(Exception ex)
            {
                Verificador = ex.Message;
                CNComun.VerificaTextoMensajeError(ref Verificador);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "mostrar_modal(0, '" + Verificador + "');", true);
            }
        }
    }
}