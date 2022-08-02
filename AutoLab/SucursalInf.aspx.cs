using AutoLab.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;

namespace AutoLab
{

    [System.Web.Script.Services.ScriptService]

    public partial class SucursalInf : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //Configuraccion del DropDownList
            if (!Page.IsPostBack)
            {
                string mainconn = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                SqlConnection sqlconn = new SqlConnection(mainconn);
                string sqlquery = "select * from dbo.Sucursal";
                SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
                sqlconn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Dropdownlist1.DataSource = dt;
                Dropdownlist1.DataTextField = "NombreSucursal";
                Dropdownlist1.DataValueField = "IdSucursal";
                Dropdownlist1.DataBind();
                Dropdownlist1.Items.Insert(0, new ListItem("seleccionar sucursal", ""));
                sqlconn.Close();
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (txtNombreSucursal.Text == "")
            {
                lbResultado.Text = "introduzca un nombre";
                txtNombreSucursal.BorderColor = Color.Red;
            }
            else if (txtLogoSucursal.Text == "")
            {
                lbResultado.Text = "introduzca una Logo en Base64";
                txtLogoSucursal.BorderColor = Color.Red;
                txtNombreSucursal.BorderColor = Color.Black;
            }
            else if (txtDireccionSucursal.Text == "")
            {
                lbResultado.Text = "introduzca una Direccion";
                txtDireccionSucursal.BorderColor = Color.Red;
                txtNombreSucursal.BorderColor = Color.Black;
                txtLogoSucursal.BorderColor = Color.Black;
            }
            else if (txtTelefonoSucursal.Text == "")
            {
                lbResultado.Text = "introduzca un Telefono";
                txtTelefonoSucursal.BorderColor = Color.Red;
                txtNombreSucursal.BorderColor = Color.Black;
                txtLogoSucursal.BorderColor = Color.Black;
                txtDireccionSucursal.BorderColor = Color.Black;
            }
            else if (txtDescripcionSucursal.Text == "")
            {
                lbResultado.Text = "introduzca una Descripcion";
                txtDescripcionSucursal.BorderColor = Color.Red;
                txtNombreSucursal.BorderColor = Color.Black;
                txtLogoSucursal.BorderColor = Color.Black;
                txtDireccionSucursal.BorderColor = Color.Black;
                txtTelefonoSucursal.BorderColor = Color.Black;
            }
            else
            {

                Sucursal objSucursal = new Sucursal();
                objSucursal.NombreSucursal = txtNombreSucursal.Text;
                objSucursal.LogoSucursal = txtLogoSucursal.Text;
                objSucursal.DireccionSucursal = txtDireccionSucursal.Text;
                objSucursal.TelefonoSucursal = Convert.ToInt32(txtTelefonoSucursal.Text);
                objSucursal.DescripcionSucursal = txtDescripcionSucursal.Text;                   
                SucursalDal suDal = new SucursalDal();
                suDal.RegistrarSucursal(objSucursal);
                string mainconn = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                SqlConnection sqlconn = new SqlConnection(mainconn);
                string sqlquery = "select * from dbo.Sucursal";
                SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
                sqlconn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Dropdownlist1.DataSource = dt;
                Dropdownlist1.DataTextField = "NombreSucursal";
                Dropdownlist1.DataValueField = "IdSucursal";
                Dropdownlist1.DataBind();
                Dropdownlist1.Items.Insert(0, new ListItem("seleccionar sucursal", ""));
                sqlconn.Close();

                txtNombreSucursal.Text = "";
                txtLogoSucursal.Text = "";
                txtDireccionSucursal.Text = "";
                txtTelefonoSucursal.Text = "";
                txtDescripcionSucursal.Text = "";
                txtDescripcionSucursal.BorderColor = Color.Black;
                lbResultado.Text = "";
            }
        }

        protected void Dropdownlist1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            string sqlquery = "select * from dbo.Sucursal where NombreSucursal ='" + Dropdownlist1.SelectedItem.Text + "'";
            SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DetailsView1.DataSource = dt;
            DetailsView1.DataBind();
            sqlconn.Close();
        }
    }
}