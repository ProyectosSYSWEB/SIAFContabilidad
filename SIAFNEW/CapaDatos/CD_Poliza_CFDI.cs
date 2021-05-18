using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Text;

namespace CapaDatos
{
    public class CD_Poliza_CFDI
    {
        public void PolizaCFDIInsertar(Poliza_CFDI objPolizaCFDI, List<Poliza_CFDI> lstPolizasCFDI, ref string Verificador)
        {

            for (int i = 0; i < lstPolizasCFDI.Count; i++)
            {
                CD_Datos CDDatos = new CD_Datos();
                OracleCommand Cmd = null;
                try
                {
                    String[] Parametros = { "P_ID_POLIZA", "P_NOMBRE_ARCHIVO_XML", "P_NOMBRE_ARCHIVO_PDF", "P_BENEF_TIPO",
                                        "P_CFDI_FOLIO", "P_CFDI_FECHA", "P_CFDI_TOTAL", "P_CFDI_RFC","P_TIPO_GASTO","P_CFDI_UUID","P_CFDI_NOMBRE", "P_FECHA_CAPTURA", "P_USUARIO_CAPTURA" };
                    object[] Valores = {    objPolizaCFDI.IdPoliza, lstPolizasCFDI[i].NombreArchivoXML,  lstPolizasCFDI[i].NombreArchivoPDF, lstPolizasCFDI[i].Beneficiario_Tipo,
                    lstPolizasCFDI[i].CFDI_Folio, lstPolizasCFDI[i].CFDI_Fecha,   lstPolizasCFDI[i].CFDI_Total, lstPolizasCFDI[i].CFDI_RFC, lstPolizasCFDI[i].Tipo_Gasto,lstPolizasCFDI[i].CFDI_UUID,lstPolizasCFDI[i].CFDI_Nombre,
                        lstPolizasCFDI[i].Fecha_Captura,lstPolizasCFDI[i].Usuario_Captura};
                    String[] ParametrosOut = { "p_Bandera" };
                    Cmd = CDDatos.GenerarOracleCommand("INS_SAF_POLIZAS_CFDI", ref Verificador, Parametros, Valores, ParametrosOut);

                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    CDDatos.LimpiarOracleCommand(ref Cmd);
                }
            }
        }
        public void PolizaCFDIExtraInsertar(Poliza_CFDI objPolizaCFDI, List<Poliza_CFDI> lstPolizasCFDI, ref string Verificador)
        {

            for (int i = 0; i < lstPolizasCFDI.Count; i++)
            {
                CD_Datos CDDatos = new CD_Datos();
                OracleCommand Cmd = null;
                try
                {
                    String[] Parametros = { "P_ID_POLIZA", "P_NOMBRE_ARCHIVO_XML", "P_NOMBRE_ARCHIVO_PDF", "P_BENEF_TIPO",
                                        "P_CFDI_FOLIO", "P_CFDI_FECHA", "P_CFDI_TOTAL", "P_CFDI_RFC","P_TIPO_GASTO","P_CFDI_UUID","P_CFDI_NOMBRE", "P_FECHA_CAPTURA", "P_USUARIO_CAPTURA" };
                    object[] Valores = {    objPolizaCFDI.IdPoliza, lstPolizasCFDI[i].NombreArchivoXML,  lstPolizasCFDI[i].NombreArchivoPDF, lstPolizasCFDI[i].Beneficiario_Tipo,
                    lstPolizasCFDI[i].CFDI_Folio, lstPolizasCFDI[i].CFDI_Fecha,   lstPolizasCFDI[i].CFDI_Total, lstPolizasCFDI[i].CFDI_RFC, lstPolizasCFDI[i].Tipo_Gasto,lstPolizasCFDI[i].CFDI_UUID,lstPolizasCFDI[i].CFDI_Nombre,
                        lstPolizasCFDI[i].Fecha_Captura,lstPolizasCFDI[i].Usuario_Captura};
                    String[] ParametrosOut = { "p_Bandera" };
                    Cmd = CDDatos.GenerarOracleCommand("INS_SAF_POL_EXTRA_CFDI", ref Verificador, Parametros, Valores, ParametrosOut);

                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    CDDatos.LimpiarOracleCommand(ref Cmd);
                }
            }
        }

        public void PolizaCFDIEditar(Poliza_CFDI objPolizaCFDI, List<Poliza_CFDI> lstPolizasCFDI, ref string Verificador)
        {
            EliminarCFDIEditar(objPolizaCFDI.IdPoliza, ref Verificador);
            PolizaCFDIInsertar(objPolizaCFDI, lstPolizasCFDI, ref Verificador);

        }

        public void PolizaCFDIExtraEditar(Poliza_CFDI objPolizaCFDI, List<Poliza_CFDI> lstPolizasCFDI, ref string Verificador)
        {
            EliminarCFDIExtra(objPolizaCFDI.IdPoliza, ref Verificador);
            PolizaCFDIExtraInsertar(objPolizaCFDI, lstPolizasCFDI, ref Verificador);

        }

        public void EliminarCFDIExtra(int IdPoliza, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            try
            {
                String[] Parametros = { "P_ID_POLIZA" };
                object[] Valores = { IdPoliza };
                String[] ParametrosOut = { "p_Bandera" };
                Cmd = CDDatos.GenerarOracleCommand("DEL_SAF_CFDIS_EXTRAS", ref Verificador, Parametros, Valores, ParametrosOut);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CDDatos.LimpiarOracleCommand(ref Cmd);
            }
        }

        public void EliminarCFDIEditar(int IdPoliza, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            try
            {
                String[] Parametros = { "P_ID_POLIZA" };
                object[] Valores = { IdPoliza };
                String[] ParametrosOut = { "p_Bandera" };
                Cmd = CDDatos.GenerarOracleCommand("DEL_SAF_POLIZAS_CFDI", ref Verificador, Parametros, Valores, ParametrosOut);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CDDatos.LimpiarOracleCommand(ref Cmd);
            }
        }

        public void PolizaCFDIConsultaTotCheque(ref Poliza_CFDI objPolizaCFDI, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            try
            {
                String[] Parametros = { "P_ID_POLIZA" };
                object[] Valores = { objPolizaCFDI.IdPoliza };
                String[] ParametrosOut = { "P_IMPORTE", "p_Bandera" };
                Cmd = CDDatos.GenerarOracleCommand("SEL_SAF_IMPORTE_CHEQUE", ref Verificador, Parametros, Valores, ParametrosOut);
                if (Verificador == "0")
                {
                    objPolizaCFDI = new Poliza_CFDI();
                    objPolizaCFDI.CFDI_Total = Convert.ToDouble(Cmd.Parameters["P_IMPORTE"].Value);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CDDatos.LimpiarOracleCommand(ref Cmd);

            }
        }
        public void PolizaCFDIConsultaDatos(Poliza_CFDI objPolizaCFDI, ref List<Poliza_CFDI> lstPolizasCFDI, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand cmm = null;
            try
            {

                OracleDataReader dr = null;
                String[] Parametros = { "P_ID_POLIZA" };
                String[] Valores = { Convert.ToString(objPolizaCFDI.IdPoliza) };

                cmm = CDDatos.GenerarOracleCommandCursor("pkg_contabilidad.Obt_Grid_Polizas_CFDI", ref dr, Parametros, Valores);
                while (dr.Read())
                {

                    objPolizaCFDI = new Poliza_CFDI();
                    objPolizaCFDI.Beneficiario_Tipo = Convert.ToString(dr.GetValue(0));
                    objPolizaCFDI.CFDI_Folio = Convert.ToString(dr.GetValue(1));
                    objPolizaCFDI.CFDI_Fecha = Convert.ToString(dr.GetValue(2));
                    objPolizaCFDI.CFDI_Total = Convert.ToDouble(dr.GetValue(3));
                    objPolizaCFDI.CFDI_RFC = Convert.ToString(dr.GetValue(4));
                    objPolizaCFDI.Tipo_Gasto = Convert.ToString(dr.GetValue(5));
                    objPolizaCFDI.NombreArchivoXML = Convert.ToString(dr.GetValue(6));
                    objPolizaCFDI.NombreArchivoPDF = Convert.ToString(dr.GetValue(7));
                    objPolizaCFDI.Ruta_XML = "~/AdjuntosTemp/" + Convert.ToString(dr.GetValue(6));
                    objPolizaCFDI.Ruta_PDF = "~/AdjuntosTemp/" + Convert.ToString(dr.GetValue(7));
                    objPolizaCFDI.CFDI_UUID = Convert.ToString(dr.GetValue(8));
                    objPolizaCFDI.CFDI_Nombre = Convert.ToString(dr.GetValue(9));
                    objPolizaCFDI.Fecha_Captura = Convert.ToString(dr.GetValue(10));
                    objPolizaCFDI.Usuario_Captura = Convert.ToString(dr.GetValue(11));
                    objPolizaCFDI.Habilita = (Convert.ToString(dr.GetValue(12)) == "S") ? true : false;
                    lstPolizasCFDI.Add(objPolizaCFDI);
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CDDatos.LimpiarOracleCommand(ref cmm);
            }
        }
        public void PolizaCFDIConsultaDatosAdmin(Poliza_CFDI objPolizaCFDI, ref List<Poliza_CFDI> lstPolizasCFDI, string Buscar)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand cmm = null;
            try
            {

                OracleDataReader dr = null;
                String[] Parametros = { "P_TIPO_GASTO", "P_TIPO_BENEFICIARIO", "P_CENTRO_CONTABLE", "P_EJERCICIO", "P_MES", "P_BUSCAR" };
                String[] Valores = { objPolizaCFDI.Tipo_Gasto, objPolizaCFDI.Beneficiario_Tipo, objPolizaCFDI.Centro_Contable, objPolizaCFDI.Ejercicio, objPolizaCFDI.Mes_anio, Buscar };

                cmm = CDDatos.GenerarOracleCommandCursor("pkg_contabilidad.Obt_Grid_Polizas_CFDI_Admin", ref dr, Parametros, Valores);
                while (dr.Read())
                {

                    objPolizaCFDI = new Poliza_CFDI();
                    objPolizaCFDI.Beneficiario_Tipo = Convert.ToString(dr.GetValue(0));
                    objPolizaCFDI.CFDI_Folio = Convert.ToString(dr.GetValue(1));
                    objPolizaCFDI.CFDI_Fecha = Convert.ToString(dr.GetValue(2));
                    objPolizaCFDI.CFDI_Total = Convert.ToDouble(dr.GetValue(3));
                    objPolizaCFDI.CFDI_RFC = Convert.ToString(dr.GetValue(4));
                    objPolizaCFDI.Tipo_Gasto = Convert.ToString(dr.GetValue(5));
                    objPolizaCFDI.NombreArchivoXML = Convert.ToString(dr.GetValue(6));
                    objPolizaCFDI.NombreArchivoPDF = Convert.ToString(dr.GetValue(7));
                    objPolizaCFDI.Ruta_XML = "~/AdjuntosTemp/" + Convert.ToString(dr.GetValue(6));
                    objPolizaCFDI.Ruta_PDF = "~/AdjuntosTemp/" + Convert.ToString(dr.GetValue(7));
                    objPolizaCFDI.CFDI_UUID = Convert.ToString(dr.GetValue(8));
                    objPolizaCFDI.CFDI_Nombre = Convert.ToString(dr.GetValue(9));
                    objPolizaCFDI.Fecha_Captura = Convert.ToString(dr.GetValue(10));
                    objPolizaCFDI.Usuario_Captura = Convert.ToString(dr.GetValue(11));
                    objPolizaCFDI.Centro_Contable = Convert.ToString(dr.GetValue(12));
                    objPolizaCFDI.Numero_poliza = Convert.ToString(dr.GetValue(13));
                    objPolizaCFDI.Mes_anio = Convert.ToString(dr.GetValue(14));
                    objPolizaCFDI.CFDI_Total = Convert.ToDouble(dr.GetValue(15));
                    lstPolizasCFDI.Add(objPolizaCFDI);
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CDDatos.LimpiarOracleCommand(ref cmm);
            }
        }
        public void PolizasSinComprobar(Poliza objPoliza, ref List<Poliza> lstPolizas/*, string Buscar*/)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand cmm = null;
            try
            {

                OracleDataReader dr = null;
                String[] Parametros = { "p_centro_contable", "p_mes" };
                String[] Valores = { objPoliza.Centro_contable, objPoliza.Mes_anio };

                cmm = CDDatos.GenerarOracleCommandCursor("pkg_contabilidad.Obt_Grid_Polizas_sin_comprobar", ref dr, Parametros, Valores);
                while (dr.Read())
                {

                    objPoliza = new Poliza();
                    objPoliza.IdPoliza = Convert.ToInt32(dr.GetValue(0));
                    objPoliza.Centro_contable = Convert.ToString(dr.GetValue(1));
                    objPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(2));
                    objPoliza.Numero_poliza = Convert.ToString(dr.GetValue(3));
                    objPoliza.Fecha= Convert.ToString(dr.GetValue(4));
                    objPoliza.Concepto = Convert.ToString(dr.GetValue(5));
                    objPoliza.Tot_Cargo = Convert.ToDouble(dr.GetValue(6));
                    lstPolizas.Add(objPoliza);
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CDDatos.LimpiarOracleCommand(ref cmm);
            }
        }

    }
    public class CD_Poliza_Oficio
    {
        public void PolizaOficioInsertar(Poliza_Oficio objPolizaOficio, string Usuario, List<Poliza_Oficio> lstPolizaOficios, ref string Verificador)
        {

            for (int i = 0; i < lstPolizaOficios.Count; i++)
            {
                CD_Datos CDDatos = new CD_Datos();
                OracleCommand Cmd = null;
                try
                {
                    String[] Parametros = { "P_ID_POLIZA", "P_OFICIO_NUMERO", "P_OFICIO_FECHA", "P_NOMBRE_ARCHIVO", "P_USUARIO" };
                    object[] Valores = { objPolizaOficio.IdPoliza_Oficio, lstPolizaOficios[i].Numero_Oficio,  lstPolizaOficios[i].Fecha_Oficio, lstPolizaOficios[i].NombreArchivoOficio, Usuario
                    };
                    String[] ParametrosOut = { "p_Bandera" };
                    Cmd = CDDatos.GenerarOracleCommand("INS_SAF_POLIZAS_OFICIOS", ref Verificador, Parametros, Valores, ParametrosOut);

                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    CDDatos.LimpiarOracleCommand(ref Cmd);
                }
            }
        }

        public void PolizaOficioBorrar(Poliza_Oficio objPolizaOficio, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            try
            {
                String[] Parametros = { "P_ID_POLIZA" };
                object[] Valores = { objPolizaOficio.IdPoliza_Oficio };
                String[] ParametrosOut = { "p_Bandera" };
                Cmd = CDDatos.GenerarOracleCommand("DEL_SAF_POLIZAS_OFICIOS", ref Verificador, Parametros, Valores, ParametrosOut);

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CDDatos.LimpiarOracleCommand(ref Cmd);
            }
        }




        public void PolizaOficiosDatos(Poliza_Oficio objPolizaOficio, ref List<Poliza_Oficio> lstPolizaOficios, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand cmm = null;
            try
            {

                OracleDataReader dr = null;
                String[] Parametros = { "P_ID_POLIZA" };
                String[] Valores = { Convert.ToString(objPolizaOficio.IdPoliza_Oficio) };

                cmm = CDDatos.GenerarOracleCommandCursor("pkg_contabilidad.Obt_Grid_Poliza_Oficios", ref dr, Parametros, Valores);
                while (dr.Read())
                {

                    objPolizaOficio = new Poliza_Oficio();
                    objPolizaOficio.Numero_Oficio = Convert.ToString(dr.GetValue(2));
                    objPolizaOficio.Fecha_Oficio = Convert.ToString(dr.GetValue(3));
                    objPolizaOficio.NombreArchivoOficio = Convert.ToString(dr.GetValue(4));
                    objPolizaOficio.Ruta_Oficio = "~/OficiosTemp/" + Convert.ToString(dr.GetValue(4));
                    lstPolizaOficios.Add(objPolizaOficio);
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CDDatos.LimpiarOracleCommand(ref cmm);
            }
        }

    }
}
