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

        public void PolizaCFDIExtraInsertar(Poliza_CFDI objPolizaCFDI, List<Poliza_CFDI> lstPolizasCFDI, ref string Verificador)
        {
            try
            {
                CD_Poliza_CFDI CDPolizaCFDI = new CD_Poliza_CFDI();
                CDPolizaCFDI.PolizaCFDIExtraInsertar(objPolizaCFDI, lstPolizasCFDI, ref Verificador);
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

        public void PolizaCFDIExtraEditar(Poliza_CFDI objPolizaCFDI, List<Poliza_CFDI> lstPolizasCFDI, ref string Verificador)
        {
            try
            {
                CD_Poliza_CFDI CDPolizaCFDI = new CD_Poliza_CFDI();
                CDPolizaCFDI.PolizaCFDIExtraEditar(objPolizaCFDI, lstPolizasCFDI, ref Verificador);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void EliminarCFDIEditar(int IdPoliza, ref string Verificador)
        {
            try
            {
                CD_Poliza_CFDI CDPolizaCFDI = new CD_Poliza_CFDI();
                CDPolizaCFDI.EliminarCFDIEditar(IdPoliza, ref Verificador);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void PolizaCFDIConsultaTotCheque(ref Poliza_CFDI objPolizaCFDI, ref string Verificador)
        {
            try
            {
                CD_Poliza_CFDI CDPolizaCFDI = new CD_Poliza_CFDI();
                CDPolizaCFDI.PolizaCFDIConsultaTotCheque(ref objPolizaCFDI, ref Verificador);
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

        public void PolizasSinComprobar(Poliza objPoliza, ref List<Poliza> lstPolizas/*, string Buscar*/)
        {
            try
            {
                CD_Poliza_CFDI CDPolizaCFDI = new CD_Poliza_CFDI();
                CDPolizaCFDI.PolizasSinComprobar(objPoliza, ref lstPolizas/*, Buscar*/);
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
                    //Verificador = string.Empty;
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
