﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data.OracleClient;
using System.Data;
using CapaEntidad;
using System.Web.UI.WebControls;
using System.IO;
#region Hecho por
//Nombre:      Lisseth Gtz. Gómez
//Correo:      lis_go82@hotmail.com
//Institución: Unach
#endregion

namespace CapaDatos
{
    public class CD_Poliza
    {
        public void PolizaConsultaGrid(ref Poliza ObjPoliza, String FechaInicial, String FechaFinal, String Buscar, String TipoUsu, ref List<Poliza> List)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand cmm = null;
            try
            {
                OracleDataReader dr = null;
                string Centro_Contable = ObjPoliza.Centro_contable;
                String[] Parametros = { "p_centro_contable", "p_fecha_inicial", "p_fecha_final", "p_tipo", "p_status", "p_buscar", "p_editor", "p_tipo_captura", "p_clasifica", "p_ejercicio" };
                String[] Valores = { ObjPoliza.Centro_contable, FechaInicial, FechaFinal, ObjPoliza.Tipo, ObjPoliza.Status, Buscar, TipoUsu, ObjPoliza.Tipo_captura, ObjPoliza.Clasificacion, Convert.ToString(ObjPoliza.Ejercicio) };

                cmm = CDDatos.GenerarOracleCommandCursor("pkg_contabilidad.Obt_Grid_Polizas", ref dr, Parametros, Valores);


                while (dr.Read())
                {
                    ObjPoliza = new Poliza();
                    ObjPoliza.IdPoliza = Convert.ToInt32(dr.GetValue(0));
                    ObjPoliza.Centro_contable = Convert.ToString(dr.GetValue(3));
                    ObjPoliza.Numero_poliza = Convert.ToString(dr.GetValue(2));
                    ObjPoliza.Tipo = Convert.ToString(dr.GetValue(4));
                    ObjPoliza.Fecha = Convert.ToString(dr.GetValue(7));
                    ObjPoliza.Mes_anio = Convert.ToString(dr.GetValue(8));
                    ObjPoliza.Status = Convert.ToString(dr.GetValue(9));
                    ObjPoliza.Concepto = Convert.ToString(dr.GetValue(6));
                    ObjPoliza.Tot_Cargo = Convert.ToDouble(dr.GetValue(19));
                    ObjPoliza.Tot_Abono = Convert.ToDouble(dr.GetValue(20));
                    ObjPoliza.Cedula_numero = Convert.ToString(dr.GetValue(21));
                    string Pasa = Convert.ToString(dr.GetValue(21)); //Verifica si el mes esta cerrado

                    ObjPoliza.Opcion_Eliminar = Convert.ToString(dr.GetValue(21)) == "S" ? false : true;
                    ObjPoliza.Opcion_Eliminar2 = Convert.ToString(dr.GetValue(21)) == "S" ? true : false;
                    ObjPoliza.Opcion_Modificar = Convert.ToString(dr.GetValue(21)) == "S" ? false : true;
                    ObjPoliza.Opcion_Modificar2 = Convert.ToString(dr.GetValue(21)) == "S" ? true : false;
                    ObjPoliza.Opcion_Copiar = Convert.ToString(dr.GetValue(10)) == "MC" ? (Centro_Contable == "00000" || Convert.ToString(dr.GetValue(21)) == "S") ? false : true : false;
                    ObjPoliza.Opcion_Copiar2 = Convert.ToString(dr.GetValue(10)) == "MC" ? (Centro_Contable == "00000" || Convert.ToString(dr.GetValue(21)) == "S") ? true : false : true;

                    if (Convert.ToString(dr.GetValue(22)) == "E" && (Convert.ToString(dr.GetValue(28)) == "CFDI" || Convert.ToString(dr.GetValue(28)) == "OFICIO"))
                    {
                        ObjPoliza.Opcion_CFDI = true;
                        ObjPoliza.Opcion_CFDI2 = false;
                        ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(24)) == "0" ? "+ " + Convert.ToString(dr.GetValue(28)) : "(" + Convert.ToString(dr.GetValue(24)) + ")" + Convert.ToString(dr.GetValue(28));
                    }
                    else if (Convert.ToString(dr.GetValue(22)) == "I" && Convert.ToString(dr.GetValue(28)) == "OFICIO")
                    {
                        ObjPoliza.Opcion_CFDI = true;
                        ObjPoliza.Opcion_CFDI2 = false;
                        ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(24)) == "0" ? "+ " + Convert.ToString(dr.GetValue(28)) : "(" + Convert.ToString(dr.GetValue(24)) + ")" + Convert.ToString(dr.GetValue(28));
                    }
                    else if (Convert.ToString(dr.GetValue(22)) == "D" && (Convert.ToString(dr.GetValue(28)) == "CFDI" || Convert.ToString(dr.GetValue(28)) == "OFICIO"))
                    {
                        ObjPoliza.Opcion_CFDI = true;
                        ObjPoliza.Opcion_CFDI2 = false;
                        ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(24)) == "0" ? "+ " + Convert.ToString(dr.GetValue(28)) : "(" + Convert.ToString(dr.GetValue(24)) + ")" + Convert.ToString(dr.GetValue(28));
                    }
                    else
                    {
                        ObjPoliza.Opcion_CFDI = false;
                        ObjPoliza.Opcion_CFDI2 = true;
                        ObjPoliza.Desc_Tipo_Documento = "S/N";
                    }

                    ObjPoliza.Tiene_CFDI = Convert.ToInt32(dr.GetValue(24)) > 0 ? true : false;
                    ObjPoliza.Total_CFDI = Convert.ToInt32(dr.GetValue(24));
                    ObjPoliza.Mes_Cerrado = Convert.ToString(dr.GetValue(25));
                    ObjPoliza.Cheque_numero = Convert.ToString(dr.GetValue(26));
                    ObjPoliza.Cheque_importe = Convert.ToDouble(dr.GetValue(27));
                    ObjPoliza.Tipo_Documento = Convert.ToString(dr.GetValue(28));
                    List.Add(ObjPoliza);
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
        public void GenPolizasAuto(int Ejercicio, string Mes, string Tipo, ref int TotalPolizasGen, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            try
            {
                String[] Parametros = { "P_EJERCICIO", "P_MES_ANIO" };
                object[] Valores = { Ejercicio, Mes };
                String[] ParametrosOut = { "P_TOTAL", "P_BANDERA" };
                if(Tipo=="01")
                    Cmd = CDDatos.GenerarOracleCommand("GNR_POLIZAS_INGRESOS_CAJAGRAL", ref Verificador, Parametros, Valores, ParametrosOut);
                else
                    Cmd = CDDatos.GenerarOracleCommand("GNR_POLIZAS_REND_CAJAGRAL", ref Verificador, Parametros, Valores, ParametrosOut);
                if (Verificador == "0")
                {
                    TotalPolizasGen = Convert.ToInt32(Cmd.Parameters["P_TOTAL"].Value);
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

        public void PolizaConsultaGrid_Min(ref Poliza ObjPoliza, String FechaInicial, String FechaFinal, String Buscar, String TipoUsu, ref List<Poliza> List)
            {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand cmm = null;
            try
            {
                OracleDataReader dr = null;
                string Centro_Contable = ObjPoliza.Centro_contable;
                String[] Parametros = { "p_centro_contable", "p_fecha_inicial", "p_fecha_final", "p_tipo", "p_status", "p_buscar", "p_editor", "p_tipo_captura", "p_clasifica", "p_ejercicio" };
                String[] Valores = { ObjPoliza.Centro_contable, FechaInicial, FechaFinal, ObjPoliza.Tipo, ObjPoliza.Status, Buscar, TipoUsu, ObjPoliza.Tipo_captura, ObjPoliza.Clasificacion, Convert.ToString(ObjPoliza.Ejercicio) };

                cmm = CDDatos.GenerarOracleCommandCursor("pkg_contabilidad.Obt_Grid_Polizas_Min2", ref dr, Parametros, Valores);

                //if (dr. <= 2000)
                //{
                while (dr.Read())
                {
                   

                    ObjPoliza = new Poliza();
                    ObjPoliza.IdPoliza = Convert.ToInt32(dr.GetValue(0));
                    ObjPoliza.Numero_poliza = Convert.ToString(dr.GetValue(1));
                    ObjPoliza.Centro_contable = Convert.ToString(dr.GetValue(2));
                    ObjPoliza.Tipo = Convert.ToString(dr.GetValue(3));
                    ObjPoliza.Concepto = Convert.ToString(dr.GetValue(4));
                    ObjPoliza.Fecha = Convert.ToString(dr.GetValue(5));
                    ObjPoliza.Mes_anio = Convert.ToString(dr.GetValue(6));
                    ObjPoliza.Status = Convert.ToString(dr.GetValue(7));
                    ObjPoliza.Opcion_Copiar = Convert.ToString(dr.GetValue(8)) == "MC" ? (Centro_Contable == "00000" || Convert.ToString(dr.GetValue(12)) == "S") ? false : true : false;
                    ObjPoliza.Opcion_Copiar2 = Convert.ToString(dr.GetValue(8)) == "MC" ? (Centro_Contable == "00000" || Convert.ToString(dr.GetValue(12)) == "S") ? true : false : true;

                    ObjPoliza.Tot_Cargo = Convert.ToDouble(dr.GetValue(9));
                    ObjPoliza.Tot_Abono = Convert.ToDouble(dr.GetValue(10));
                    ObjPoliza.Cedula_numero = Convert.ToString(dr.GetValue(11));
                    //string Pasa = Convert.ToString(dr.GetValue(12)); //Verifica si el mes esta cerrado

                    ObjPoliza.Opcion_Eliminar = Convert.ToString(dr.GetValue(12)) == "S" ? false : true;
                    ObjPoliza.Opcion_Eliminar2 = Convert.ToString(dr.GetValue(12)) == "S" ? true : false;
                    ObjPoliza.Opcion_Modificar = Convert.ToString(dr.GetValue(12)) == "S" ? false : true;
                    ObjPoliza.Opcion_Modificar2 = Convert.ToString(dr.GetValue(12)) == "S" ? true : false;
                    string tipo = Convert.ToString(dr.GetValue(13));
                    string tipo_docto = Convert.ToString(dr.GetValue(18));

                    if (Convert.ToString(dr.GetValue(13)) == "E" && (Convert.ToString(dr.GetValue(18)) == "CFDI" || Convert.ToString(dr.GetValue(18)) == "OFICIO" || Convert.ToString(dr.GetValue(18)) == "AMBOS"))
                    {
                        ObjPoliza.Opcion_CFDI = true;
                        ObjPoliza.Opcion_CFDI2 = false;
                        //ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(14)) == "0" ? "+ " + Convert.ToString(dr.GetValue(18)) : "(" + Convert.ToString(dr.GetValue(14)) + ")" + Convert.ToString(dr.GetValue(18));
                        if (Convert.ToString(dr.GetValue(14)) == "0")
                        {
                            if (Convert.ToString(dr.GetValue(18)) == "OFICIO")
                                ObjPoliza.Desc_Tipo_Documento = "+ Oficio";
                            else if (Convert.ToString(dr.GetValue(18)) == "CFDI")
                                ObjPoliza.Desc_Tipo_Documento = "+ Cfdi";
                            else if (Convert.ToString(dr.GetValue(18)) == "AMBOS")
                                ObjPoliza.Desc_Tipo_Documento = "+ Cfdi/Oficio";
                        }
                        else
                        {
                            if (Convert.ToString(dr.GetValue(18)) == "OFICIO")
                                ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(14)) + " Oficio(s)";
                            else if (Convert.ToString(dr.GetValue(18)) == "CFDI")
                                ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(14)) + " Cfdi(s)";
                            else if (Convert.ToString(dr.GetValue(18)) == "AMBOS")
                                ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(14)) + " Cfdi/Oficio";
                        }
                    }
                    else if (Convert.ToString(dr.GetValue(13)) == "I" && Convert.ToString(dr.GetValue(18)) == "OFICIO")
                    {
                        ObjPoliza.Opcion_CFDI = true;
                        ObjPoliza.Opcion_CFDI2 = false;
                        //ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(14)) == "0" ? "+ " + Convert.ToString(dr.GetValue(18)) : "(" + Convert.ToString(dr.GetValue(14)) + ")" + Convert.ToString(dr.GetValue(18));
                        if (Convert.ToString(dr.GetValue(14)) == "0")
                        {
                            if (Convert.ToString(dr.GetValue(18)) == "OFICIO")
                                ObjPoliza.Desc_Tipo_Documento = "+ Oficio";
                            else if (Convert.ToString(dr.GetValue(18)) == "CFDI")
                                ObjPoliza.Desc_Tipo_Documento = "+ Cfdi";
                        }
                        else
                        {
                            if (Convert.ToString(dr.GetValue(18)) == "OFICIO")
                                ObjPoliza.Desc_Tipo_Documento =  Convert.ToString(dr.GetValue(14)) + " Oficio(s)";
                            else if (Convert.ToString(dr.GetValue(18)) == "CFDI")
                                ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(14)) + " Cfdi(s)";
                        }
                    }
                    else if (Convert.ToString(dr.GetValue(13)) == "D" && (Convert.ToString(dr.GetValue(18)) == "CFDI" || Convert.ToString(dr.GetValue(18)) == "OFICIO") || Convert.ToString(dr.GetValue(18)) == "AMBOS")
                    {
                        ObjPoliza.Opcion_CFDI = true;
                        ObjPoliza.Opcion_CFDI2 = false;
                        //ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(14)) == "0" ? "+ " + Convert.ToString(dr.GetValue(18)) : "(" + Convert.ToString(dr.GetValue(14)) + ")" + Convert.ToString(dr.GetValue(18));
                        if (Convert.ToString(dr.GetValue(14)) == "0")
                        {
                            if (Convert.ToString(dr.GetValue(18)) == "OFICIO")
                                ObjPoliza.Desc_Tipo_Documento = "+ Oficio";
                            else if (Convert.ToString(dr.GetValue(18)) == "CFDI")
                                ObjPoliza.Desc_Tipo_Documento = "+ Cfdi";
                            else if (Convert.ToString(dr.GetValue(18)) == "AMBOS")
                                ObjPoliza.Desc_Tipo_Documento = "+ Cfdi/Oficio";

                        }
                        else
                        {
                            if (Convert.ToString(dr.GetValue(18)) == "OFICIO")
                                ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(14)) + " Oficio(s)";
                            else if (Convert.ToString(dr.GetValue(18)) == "CFDI")
                                ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(14)) + " Cfdi(s)";
                            else if (Convert.ToString(dr.GetValue(18)) == "AMBOS")
                                ObjPoliza.Desc_Tipo_Documento = Convert.ToString(dr.GetValue(14)) + " Cfdi/Oficio";
                        }
                    }
                    else
                    {
                        ObjPoliza.Opcion_CFDI = false;
                        ObjPoliza.Opcion_CFDI2 = true;
                        ObjPoliza.Desc_Tipo_Documento = "S/N";
                    }

                    ObjPoliza.Tiene_CFDI = Convert.ToInt32(dr.GetValue(14)) > 0 ? true : false;
                    ObjPoliza.Total_CFDI = Convert.ToInt32(dr.GetValue(14));
                    ObjPoliza.Mes_Cerrado = Convert.ToString(dr.GetValue((15)));
                    ObjPoliza.Cheque_numero = Convert.ToString(dr.GetValue(16));
                    ObjPoliza.Cheque_importe = Convert.ToDouble(dr.GetValue(17));
                    ObjPoliza.Tipo_Documento = Convert.ToString(dr.GetValue(18));
                    ObjPoliza.IdCedula = Convert.ToInt32(dr.GetValue(19));
                    if (Convert.ToInt32(dr.GetValue(20)) == 0)
                    {
                        ObjPoliza.Opcion_Volante = false;
                        ObjPoliza.Opcion_Volante2 = true;
                    }
                    else
                    {
                        ObjPoliza.Opcion_Volante = true;
                        ObjPoliza.Opcion_Volante2 = false;
                    }
                        

                    ObjPoliza.RutaVolante = "https://sysweb.unach.mx/SAF/Patrimonio/Reportes/VisualizadorCrystal_patrimonio.aspx?Tipo=RP-VOLANTE&Id=" + Convert.ToInt32(dr.GetValue(20));
                    ObjPoliza.Validar_Total_CFDI = (Convert.ToString(dr.GetValue(21)) == "S") ? true : false;
                    List.Add(ObjPoliza);
                }
                //}
                //else
                //{
                //    throw new Exception("Regis");
                //}
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

        public void ValidarTotal(ref Poliza objPoliza, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            try
            {
                String[] Parametros = { "P_ID_POLIZA" };
                object[] Valores = { objPoliza.IdPoliza };
                String[] ParametrosOut = { "P_VALIDAR", "P_BANDERA" };
                Cmd = CDDatos.GenerarOracleCommand("VALIDAR_TOTAL", ref Verificador, Parametros, Valores, ParametrosOut);
                if (Verificador == "0")
                {
                    objPoliza = new Poliza();
                    objPoliza.ValidaTotal = Convert.ToString(Cmd.Parameters["P_VALIDAR"].Value);
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
        public void ConsultarPolizaSel(ref Poliza ObjPoliza, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            try
            {


                string[] ParametrosIn = { "P_ID_POLIZA" };
                object[] Valores = { ObjPoliza.IdPoliza
            };
                string[] ParametrosOut ={
                                          "P_CENTRO_CONTABLE",
                                          "P_FECHA",
                                          "P_TIPO",
                                          "P_STATUS",
                                          "P_TIPO_CAPTURA",
                                          "P_NUMERO_POLIZA",
                                          "P_CONCEPTO",
                                          "P_CHEQUE_CUENTA",
                                          "P_CHEQUE_NUMERO",
                                          "P_CHEQUE_IMPORTE",
                                          "P_CEDULA_NUMERO",
                                          "P_BENEFICIARIO",
                                          "P_CFDI",
                                          "P_TIPO_DOCUMENTO",
                                          "P_CLASIFICACION",
                                          "P_VALIDA_TOT_CFDI",
                                          "P_BANDERA"
                };

                Cmd = CDDatos.GenerarOracleCommand("SEL_SAF_POLIZAS", ref Verificador, ParametrosIn, Valores, ParametrosOut);
                if (Verificador == "0")
                {
                    ObjPoliza = new Poliza();
                    ObjPoliza.Centro_contable = Convert.ToString(Cmd.Parameters["P_CENTRO_CONTABLE"].Value);
                    ObjPoliza.Fecha = Convert.ToString(Cmd.Parameters["P_FECHA"].Value);
                    ObjPoliza.Tipo = Convert.ToString(Cmd.Parameters["P_TIPO"].Value);
                    ObjPoliza.Status = Convert.ToString(Cmd.Parameters["P_STATUS"].Value);
                    ObjPoliza.Tipo_captura = Convert.ToString(Cmd.Parameters["P_TIPO_CAPTURA"].Value);
                    ObjPoliza.Numero_poliza = Convert.ToString(Cmd.Parameters["P_NUMERO_POLIZA"].Value);
                    ObjPoliza.Concepto = Convert.ToString(Cmd.Parameters["P_CONCEPTO"].Value);
                    ObjPoliza.Cheque_cuenta = Convert.ToString(Cmd.Parameters["P_CHEQUE_CUENTA"].Value);
                    ObjPoliza.Cheque_numero = Convert.ToString(Cmd.Parameters["P_CHEQUE_NUMERO"].Value);
                    ObjPoliza.Cheque_importe = Convert.ToDouble(Cmd.Parameters["P_CHEQUE_IMPORTE"].Value);
                    ObjPoliza.Cedula_numero = Convert.ToString(Cmd.Parameters["P_CEDULA_NUMERO"].Value);
                    ObjPoliza.Beneficiario = Convert.ToString(Cmd.Parameters["P_BENEFICIARIO"].Value);
                    ObjPoliza.CFDI = Convert.ToString(Cmd.Parameters["P_CFDI"].Value);
                    ObjPoliza.Tipo_Documento = Convert.ToString(Cmd.Parameters["P_TIPO_DOCUMENTO"].Value);
                    ObjPoliza.Clasificacion = Convert.ToString(Cmd.Parameters["P_CLASIFICACION"].Value);
                    ObjPoliza.Validar_Total_CFDI = true;
                    //if (Convert.ToString(Cmd.Parameters["P_VALIDA_TOT_CFDI"].Value) == "S")
                    //    ObjPoliza.Validar_Total_CFDI = true;
                    //else
                    //    ObjPoliza.Validar_Total_CFDI = false;
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
        public void PolizaInsertar(ref Poliza ObjPoliza, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            string ValidaCFDI = (ObjPoliza.Validar_Total_CFDI == true) ? "S" : "N";
            try
            {
                String[] Parametros = { "P_EJERCICIO", "P_NUMERO_POLIZA", "P_CENTRO_CONTABLE", "P_TIPO", "P_CONCEPTO", "P_FECHA", "P_STATUS",
                                        "P_TIPO_CAPTURA","P_ALTA_USUARIO","P_CHEQUE_CUENTA","P_CHEQUE_NUMERO","P_CHEQUE_IMPORTE","P_CEDULA_NUMERO",
                                        "P_BENEFICIARIO", "P_CFDI", "P_OFICIO_AUTORIZACION","P_TIPO_DOCUMENTO", "P_CLASIFICACION", "P_ID_CEDULA",
                                        "P_VALIDA_TOT_CFDI"};
                object[] Valores = {    ObjPoliza.Ejercicio, ObjPoliza.Numero_poliza, ObjPoliza.Centro_contable, ObjPoliza.Tipo, ObjPoliza.Concepto,
                                        ObjPoliza.Fecha, ObjPoliza.Status, ObjPoliza.Tipo_captura, ObjPoliza.Alta_usuario, ObjPoliza.Cheque_cuenta,
                                        ObjPoliza.Cheque_numero,ObjPoliza.Cheque_importe,ObjPoliza.Cedula_numero,ObjPoliza.Beneficiario,ObjPoliza.CFDI,
                                        ObjPoliza.Oficio_Autorizacion,ObjPoliza.Tipo_Documento,ObjPoliza.Clasificacion,ObjPoliza.IdCedula, "N"};
                String[] ParametrosOut = { "p_Bandera", "p_id_poliza" };

                //Cmd = CDDatos.GenerarOracleCommand("ins_saf_polizas2", ref Verificador, Parametros, Valores, ParametrosOut);
                Cmd = CDDatos.GenerarOracleCommand("ins_saf_polizas", ref Verificador, Parametros, Valores, ParametrosOut);
                if (Verificador == "0")
                {
                    ObjPoliza.IdPoliza = Convert.ToInt32(Cmd.Parameters["P_ID_POLIZA"].Value);
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
        public void PolizaEditar(ref Poliza ObjPoliza, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            string ValidaCFDI = (ObjPoliza.Validar_Total_CFDI == true) ? "S" : "N";

            try
            {
                String[] Parametros = { "P_ID_POLIZA","P_NUMERO_POLIZA", "P_CENTRO_CONTABLE", "P_TIPO", "P_CONCEPTO", "P_FECHA",
                                        "P_STATUS", "P_TIPO_CAPTURA","P_MODIFICACION_USUARIO", "P_CHEQUE_CUENTA","P_CHEQUE_NUMERO",
                                        "P_CHEQUE_IMPORTE","P_CEDULA_NUMERO","P_BENEFICIARIO","P_CFDI","P_OFICIO_AUTORIZACION",
                                        "P_TIPO_DOCUMENTO", "P_CLASIFICACION", "P_ID_CEDULA", "P_VALIDA_TOT_CFDI"};
                object[] Valores = {    ObjPoliza.IdPoliza,ObjPoliza.Numero_poliza, ObjPoliza.Centro_contable, ObjPoliza.Tipo,
                                        ObjPoliza.Concepto, ObjPoliza.Fecha, ObjPoliza.Status, ObjPoliza.Tipo_captura, ObjPoliza.Modificacion_usuario,
                                        ObjPoliza.Cheque_cuenta,ObjPoliza.Cheque_numero,ObjPoliza.Cheque_importe,ObjPoliza.Cedula_numero,ObjPoliza.Beneficiario,
                    ObjPoliza.CFDI,ObjPoliza.Oficio_Autorizacion, ObjPoliza.Tipo_Documento, ObjPoliza.Clasificacion, ObjPoliza.IdCedula, ValidaCFDI};
                String[] ParametrosOut = { "p_Bandera" };
                //Cmd = CDDatos.GenerarOracleCommand("UPD_SAF_POLIZAS2", ref Verificador, Parametros, Valores, ParametrosOut);
                Cmd = CDDatos.GenerarOracleCommand("UPD_SAF_POLIZAS", ref Verificador, Parametros, Valores, ParametrosOut);
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
        public void PolizaEliminar(Poliza ObjPoliza, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            try
            {
                String[] Parametros = { "P_ID_POLIZA" };
                object[] Valores = { ObjPoliza.IdPoliza };
                String[] ParametrosOut = { "p_Bandera" };
                Cmd = CDDatos.GenerarOracleCommand("DEL_SAF_POLIZAS", ref Verificador, Parametros, Valores, ParametrosOut);
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
        public void PolizaEliminarRegistro(Poliza ObjPoliza, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            try
            {
                String[] Parametros = { "P_ID_POLIZA" };
                object[] Valores = { ObjPoliza.IdPoliza };
                String[] ParametrosOut = { "p_Bandera" };
                Cmd = CDDatos.GenerarOracleCommand("DEL_SAF_POLIZAS_REGISTRO", ref Verificador, Parametros, Valores, ParametrosOut);
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

        public void PolizaCopiar(ref Poliza ObjPoliza, ref string Verificador)
        {
            CD_Datos CDDatos = new CD_Datos();
            OracleCommand Cmd = null;
            try
            {
                String[] Parametros = { "P_ID_POLIZA", "P_NUMERO_POLIZA", "P_FECHA", "P_CLASIFICACION" };
                object[] Valores = { ObjPoliza.IdPoliza, ObjPoliza.Numero_poliza, ObjPoliza.Fecha, ObjPoliza.Clasificacion };
                String[] ParametrosOut = { "p_Bandera", "P_NEW_ID_POLIZA" };
                Cmd = CDDatos.GenerarOracleCommand("COPIAR_POLIZA", ref Verificador, Parametros, Valores, ParametrosOut);
                if (Verificador == "0")
                    ObjPoliza.IdPoliza = Convert.ToInt32(Cmd.Parameters["P_NEW_ID_POLIZA"].Value);
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
}

