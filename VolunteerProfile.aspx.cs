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
    public partial class VolunteerProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        SqlDataReader dataRead;
        SqlCommand command;
        string id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                lblVolunteerName.Text = Session["name"].ToString();
                id = Convert.ToString(Session["id"]);
            }
            else
                Response.Redirect("index.html");
            Master.FindControl("btnLogout").Visible = true;
            //con.Open();
            //id = Convert.ToString(Session["id"]);
            //command = new SqlCommand("SELECT name FROM usertable where userid = @userid", con);
            //command.Parameters.AddWithValue("userid", Convert.ToInt32(id));
            //dataRead = command.ExecuteReader();
            //if (dataRead.Read())
            //    lblVolunteerName.Text = Convert.ToString(dataRead["name"]);
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            string name = lblVolunteerName.Text.Trim();
            Session["name"] = name;
            Session["id"] = id;
            Response.Redirect("EditVolunteerPage.aspx");
        }

        protected void btnUpdatePrvsEvent_Click(object sender, EventArgs e)
        {
            string name = lblVolunteerName.Text.Trim();
            Session["name"] = name;
            Response.Redirect("ViewNRateEvent.aspx");
        }
    }
}