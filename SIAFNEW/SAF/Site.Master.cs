﻿using System;
using System.Collections;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using CapaEntidad;
using CapaNegocio;

namespace SAF
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        #region <Variables>
        Sesion SesionUsu = new Sesion();

        Mnu mnu = new Mnu();
        Comun comun = new Comun();
        CN_Mnu CNMnu = new CN_Mnu();
        CN_Comun CNComun = new CN_Comun();
        List<Comun> Listsistema = new List<Comun>();
        Usuario ObjUsuario = new Usuario();
        CN_Usuario CNUsuario = new CN_Usuario();

        string Verificador = string.Empty;

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            //SesionUsu = (Sesion)Session["Usuario"]; 
            Inicializar();
           
            if (!IsPostBack)
            {
                SesionUsu.Modifica_Ejercicio = false;
                //CNComun.LlenaCombo("pkg_contratos.Obt_Combo_sistemas", ref ddlSistemas, "p_usuario", SesionUsu.Usu_Nombre, ref Listsistema);
                ddlUsu_Ejercicio.SelectedValue = SesionUsu.Usu_Ejercicio;

                

            }

            if (SesionUsu.Modifica_Ejercicio == true)
            {
                ddlUsu_Ejercicio.SelectedValue = SesionUsu.Usu_Ejercicio;
                SesionUsu.Modifica_Ejercicio = false;
            }



        }
        #region <Funciones y Sub>
        private void Inicializar()
        {
            try
            {
                SesionUsu = (Sesion)Session["Usuario"];                
                lblUsuario.Text = SesionUsu.Nombre_Completo;
                //ddlUsu_Ejercicio.SelectedValue = SesionUsu.Usu_Ejercicio;                
                mnu.NombreMenu = "MenuTop";
                mnu.UsuarioNombre = SesionUsu.Usu_Nombre;
                bttnCorreoUnach.Text = " "+SesionUsu.Correo_UNACH;
                mnu.Grupo = 15830;

                string siteMap = "ArchivosMenu/Web" + SesionUsu.Usu_Nombre + ".sitemap";
                string fullPath = Path.Combine(Server.MapPath("~"), siteMap);
                if (!File.Exists(fullPath))
                {
                    CNMnu.GenerateXMLFile(mnu, fullPath);
                }

                XmlSiteMapProvider testXmlProvider = new XmlSiteMapProvider();
                NameValueCollection providerAttributes = new NameValueCollection(1);
                providerAttributes.Add("siteMapFile", siteMap);
                testXmlProvider.Initialize("MyXmlSiteMapProvider", providerAttributes);
                testXmlProvider.BuildSiteMap();
                SiteMapDataSource smd = new SiteMapDataSource();
                smd.ShowStartingNode = false;
                smd.Provider = testXmlProvider;
                SiteMapPath1.Provider = testXmlProvider;
                MenuTop.DataSource = smd;
                MenuTop.DataBind();                
               

            }
            catch (Exception ex)
            {
                
                //lblMsj.Text = ex.Message;
            }
        }
        #endregion

        protected void MenuTop_MenuItemClick(object sender, MenuEventArgs e)
        {
            //ScriptManager.RegisterStartupScript(this, typeof(string), "f04", "CerrarPopUp()", true); 
        }  

        protected void BusyBoxButton1_Click1(object sender, EventArgs e)
        {
            //SesionUsu.Usu_Ejercicio = ddlUsu_Ejercicio.SelectedValue;
        }

        protected void BusyBoxButton1_Click(object sender, EventArgs e)
        {
            SesionUsu.Usu_Ejercicio = ddlUsu_Ejercicio.SelectedValue;
            SesionUsu.Modifica_Ejercicio = true;
            string currentPage = Request.UrlReferrer.ToString(); //this.Page.Request.AppRelativeCurrentExecutionFilePath;
            Response.Redirect(currentPage);

            //string AbsUrlAnterior = Request.UrlReferrer.AbsolutePath;
            //string AbsUrlActual = Request.Url.AbsolutePath;
            //string fullPath = string.Empty;

            //if (AbsUrlAnterior == AbsUrlActual)
            //{
            //    fullPath = Request.UrlReferrer.ToString();
            //    Response.Redirect(fullPath);
            //}

        }

        protected void bttnCerrarSesion_Click(object sender, EventArgs e)
        {

        }

        protected void linkBttnInicio_Click(object sender, EventArgs e)
        {
            //string ruta = Path.Combine(Server.MapPath("~/Inicio.aspx"));
            Response.Redirect("~/Inicio.aspx");

        }
    }
}
