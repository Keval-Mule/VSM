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
    public partial class EditEmployeeProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        SqlDataReader dataRead;
        SqlCommand command;
        string id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                con.Open();
                id = Convert.ToString(Session["id"]);
                command = new SqlCommand("SELECT * FROM usertable where userid = @userid", con);
                command.Parameters.AddWithValue("@userid", Convert.ToInt32(id));
                dataRead = command.ExecuteReader();
                if (dataRead.Read())
                {
                    txtBoxMobileNo.Text = Convert.ToString(dataRead["mobileno"]);
                    txtuepeml.Text = Convert.ToString(dataRead["emailid"]);
                    //txtBoxDOB = Convert.ToString(Convert.ToDateTime(dataRead["date"]));
                    //txtBoxMobileNo.Text = Convert.ToString(dataRead["mobileno"]);
                }
                con.Close();
            }
            else
                Response.Redirect("index.html");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeProfile.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string eml = txtuepeml.Text;
            string interests = "";
            foreach (ListItem item in CheckBoxListInterests.Items)
            {
                if (item.Selected)
                {
                    interests += item.Value + ",";
                }
            }
            con.Open();
            command = new SqlCommand("UPDATE UserTable SET EmailId = @EmailId,password = @password,interests = @interests, designation= @designation, organization_name= @organization_name where mobileno=@mobileno", con);
            command.Parameters.AddWithValue("@mobileno", Convert.ToInt64(txtBoxMobileNo.Text));
            command.Parameters.AddWithValue("@EmailId", txtuepeml.Text);
            command.Parameters.AddWithValue("@password", txtuppswd.Text);
            command.Parameters.AddWithValue("@interests", interests);
            command.Parameters.AddWithValue("@designation", txtdesig.Text);
            command.Parameters.AddWithValue("@organization_name", txtngo.Text);
            dataRead = command.ExecuteReader();
            if (dataRead.Read())
                Session["id"] = dataRead["userid"];
            string script = "window.onload = function(){ alert('Your details have been saved successfully.');";
            script += "window.location = 'EmployeeProfile.aspx';};";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            con.Close();
        }
    }
}