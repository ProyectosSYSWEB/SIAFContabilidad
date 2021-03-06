﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CapaEntidad
{
    public class Poliza_CFDI
    {
        private int _IdPoliza_CFDI;
        public int IdPoliza_CFDI
        {
            get { return _IdPoliza_CFDI; }
            set { _IdPoliza_CFDI = value; }
        }

        private int _Id_CFDI;
        public int Id_CFDI
        {
            get { return _Id_CFDI; }
            set { _Id_CFDI = value; }
        }

        private string _Ejercicio;
        public string Ejercicio
        {
            get { return _Ejercicio; }
            set { _Ejercicio = value; }
        }

        private bool _Habilita;
        public bool Habilita
        {
            get { return _Habilita; }
            set { _Habilita = value; }
        }

        private string _Mes_anio;
        public string Mes_anio
        {
            get { return _Mes_anio.Trim(); }
            set { _Mes_anio = value.Trim(); }
        }

        private int _IdPoliza;
        public int IdPoliza
        {
            get { return _IdPoliza; }
            set { _IdPoliza = value; }
        }
        private string _Numero_poliza;
        public string Numero_poliza
        {
            get { return _Numero_poliza.Trim(); }
            set { _Numero_poliza = value.Trim(); }
        }

        private string _NombreArchivoXML = string.Empty;
        public string NombreArchivoXML
        {
            get { return _NombreArchivoXML.Trim(); }
            set { _NombreArchivoXML = value.Trim(); }
        }

        private string _NombreArchivoPDF = string.Empty;
        public string NombreArchivoPDF
        {
            get { return _NombreArchivoPDF.Trim(); }
            set { _NombreArchivoPDF = value.Trim(); }
        }

        private string _Ruta_PDF = string.Empty;
        public string Ruta_PDF
        {
            get { return _Ruta_PDF.Trim(); }
            set { _Ruta_PDF = value.Trim(); }
        }

        private string _Ruta_XML = string.Empty;
        public string Ruta_XML
        {
            get { return _Ruta_XML.Trim(); }
            set { _Ruta_XML = value.Trim(); }
        }

        private string _Beneficiario_Tipo;
        public string Beneficiario_Tipo
        {
            get { return _Beneficiario_Tipo.Trim(); }
            set { _Beneficiario_Tipo = value.Trim(); }
        }

        private string _CFDI_Folio;
        public string CFDI_Folio
        {
            get { return _CFDI_Folio.Trim(); }
            set { _CFDI_Folio = value.Trim(); }
        }

        private string _CFDI_Fecha;
        public string CFDI_Fecha
        {
            get { return _CFDI_Fecha.Trim(); }
            set { _CFDI_Fecha = value.Trim(); }
        }

        private double _CFDI_Total;
        public double CFDI_Total
        {
            get { return _CFDI_Total; }
            set { _CFDI_Total = value; }
        }


        public double _Importe_Partida;
        public double Importe_Partida
        {
            get { return _Importe_Partida; }
            set { _Importe_Partida = value; }
        }

        private string _Partida;
        public string Partida
        {
            get { return _Partida.Trim(); }
            set { _Partida = value.Trim(); }
        }

        private string _CFDI_RFC;
        public string CFDI_RFC
        {
            get { return _CFDI_RFC.Trim(); }
            set { _CFDI_RFC = value.Trim(); }
        }

        private string _CFDI_UUID;
        public string CFDI_UUID
        {
            get { return _CFDI_UUID.Trim(); }
            set { _CFDI_UUID = value.Trim(); }
        }

        private string _CFDI_Nombre;
        public string CFDI_Nombre
        {
            get { return _CFDI_Nombre.Trim(); }
            set { _CFDI_Nombre = value.Trim(); }
        }

        private string _Tipo_Gasto;
        public string Tipo_Gasto
        {
            get { return _Tipo_Gasto.Trim(); }
            set { _Tipo_Gasto = value.Trim(); }
        }

        private string _Tipo_Docto=string.Empty;
        public string Tipo_Docto
        {
            get { return _Tipo_Docto.Trim(); }
            set { _Tipo_Docto = value.Trim(); }
        }

        private string _Fecha_Captura;
        public string Fecha_Captura
        {
            get { return _Fecha_Captura.Trim(); }
            set { _Fecha_Captura = value.Trim(); }
        }

        private string _Usuario_Captura;
        public string Usuario_Captura
        {
            get { return _Usuario_Captura.Trim(); }
            set { _Usuario_Captura = value.Trim(); }
        }

        private string _Centro_Contable;
        public string Centro_Contable
        {
            get { return _Centro_Contable.Trim(); }
            set { _Centro_Contable = value.Trim(); }
        }
    }
    public class Poliza_Oficio:Empleado
    {
        private int _IdPoliza_Oficio;
        public int IdPoliza_Oficio
        {
            get { return _IdPoliza_Oficio; }
            set { _IdPoliza_Oficio = value; }
        }

        private string _Numero_Oficio;
        public string Numero_Oficio
        {
            get { return _Numero_Oficio; }
            set { _Numero_Oficio = value; }
        }

        private string _Fecha_Oficio;
        public string Fecha_Oficio
        {
            get { return _Fecha_Oficio; }
            set { _Fecha_Oficio = value; }
        }

        private double _Importe_Oficio;
        public double Importe_Oficio
        {
            get { return _Importe_Oficio; }
            set { _Importe_Oficio = value; }
        }

        private string _Proveedor;
        public string Proveedor
        {
            get { return _Proveedor; }
            set { _Proveedor = value; }
        }    


        private string _RFC;
        public string RFC
        {
            get { return _RFC; }
            set { _RFC = value; }
        }

        private string _NombreArchivoOficio = string.Empty;
        public string NombreArchivoOficio
        {
            get { return _NombreArchivoOficio.Trim(); }
            set { _NombreArchivoOficio = value.Trim(); }
        }

        private string _Ruta_Oficio = string.Empty;
        public string Ruta_Oficio
        {
            get { return _Ruta_Oficio.Trim(); }
            set { _Ruta_Oficio = value.Trim(); }
        }

        private string _Tipo_Docto_Oficio = string.Empty;
        public string Tipo_Docto_Oficio
        {
            get { return _Tipo_Docto_Oficio.Trim(); }
            set { _Tipo_Docto_Oficio = value.Trim(); }
        }

    }
}
