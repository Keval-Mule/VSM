using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace VSM
{
    public partial class LoginPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        SqlDataReader dataRead;
        SqlCommand command;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtBoxMobileNo.Text == "9999999999" && txtBoxPswd.Text == "admin")
                Response.Redirect("Upload_database.aspx");
            else
            {
                command = new SqlCommand("SELECT * FROM usertable where mobileno = @mobileno AND password = @password", con);
                command.Parameters.AddWithValue("@mobileno", txtBoxMobileNo.Text);
                command.Parameters.AddWithValue("@password", txtBoxPswd.Text);
                dataRead = command.ExecuteReader();
                if (dataRead.Read())
                {
                    Session["id"] = dataRead["userid"];
                    Session["name"] = dataRead["name"];
                    if (Convert.ToString(dataRead["usertype"]).Equals("V"))
                        Response.Redirect("VolunteerProfile.aspx");
                    else
                        Response.Redirect("EmployeeProfile.aspx");
                }
                else
                {
                    string script = "window.onload = function(){ alert('No such record found.');";
                    script += "window.location = 'LoginPage.aspx';};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }
        }
    }
}