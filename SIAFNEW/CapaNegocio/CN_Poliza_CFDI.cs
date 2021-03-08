using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CapaNegocio
{
    public class CN_Poliza_CFDI
    {
        public void PolizaCFDIInsertar(Poliza_CFDI objPolizaCFDI, List<Poliza_CFDI> lstPolizasCFDI, ref string Verificador)
        {
            try
            {
                CD_Poliza_CFDI CDPolizaCFDI = new CD_Poliza_CFDI();
                CDPolizaCFDI.PolizaCFDIInsertar(objPolizaCFDI, lstPolizasCFDI, ref Verificador);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public void PolizaCFDIEditar(Poliza_CFDI objPolizaCFDI, List<Poliza_CFDI> lstPolizasCFDI, ref string Verificador)
        {
            try
            {
                CD_Poliza_CFDI CDPolizaCFDI = new CD_Poliza_CFDI();
                CDPolizaCFDI.PolizaCFDIEditar(objPolizaCFDI, lstPolizasCFDI, ref Verificador);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public void PolizaCFDIConsultaDatos(Poliza_CFDI objPolizaCFDI, ref List<Poliza_CFDI> lstPolizasCFDI, ref string Verificador)
        {
            try
            {
                CD_Poliza_CFDI CDPolizaCFDI = new CD_Poliza_CFDI();
                CDPolizaCFDI.PolizaCFDIConsultaDatos(objPolizaCFDI, ref lstPolizasCFDI, ref Verificador);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

        public void PolizaOficiosDatos(Poliza_Oficio objPolizaOficio, ref List<Poliza_Oficio> lstPolizaOficios, ref string Verificador)
        {
            try
            {
                CD_Poliza_Oficio CDPolizaOficio = new CD_Poliza_Oficio();
                CDPolizaOficio.PolizaOficiosDatos(objPolizaOficio, ref lstPolizaOficios, ref Verificador);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        public void PolizaCFDIConsultaDatosAdmin(Poliza_CFDI objPolizaCFDI, ref List<Poliza_CFDI> lstPolizasCFDI, string Buscar)
        {
            try
            {
                CD_Poliza_CFDI CDPolizaCFDI = new CD_Poliza_CFDI();
                CDPolizaCFDI.PolizaCFDIConsultaDatosAdmin(objPolizaCFDI, ref lstPolizasCFDI, Buscar);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }


    }
    public class CN_Poliza_Oficio
    {
        public void PolizaOficioInsertar(Poliza_Oficio objPolizaOficio, string Usuario, List<Poliza_Oficio> lstPolizaOficios, ref string Verificador)
        {
            try
            {
                CD_Poliza_Oficio CDPolizaOficio = new CD_Poliza_Oficio();
                CDPolizaOficio.PolizaOficioBorrar(objPolizaOficio, ref Verificador);
                if (Verificador == "0")
                {
                    Verificador = string.Empty;
                    CDPolizaOficio.PolizaOficioInsertar(objPolizaOficio, Usuario, lstPolizaOficios, ref Verificador);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public void PolizaOficiosConsulta(Poliza_Oficio objPolizaOficio, ref List<Poliza_Oficio> lstPolizaOficios, ref string Verificador)
        {
            try
            {
                CD_Poliza_Oficio CDPolizaOficio = new CD_Poliza_Oficio();
                CDPolizaOficio.PolizaOficiosDatos(objPolizaOficio, ref lstPolizaOficios, ref Verificador);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
    }
    }
