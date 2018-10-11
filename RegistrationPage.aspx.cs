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
    public partial class RegistrationPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        SqlDataReader dataRead;
        SqlCommand command;

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (RadioButtonVolunteer.Checked == true)
            {
                //string interests = "";
                //foreach (ListItem item in CheckBoxListInterests.Items)
                //{
                //    if (item.Selected)
                //    {
                //        interests += item.Text + ",";
                //    }
                //}
                command = new SqlCommand("INSERT INTO usertable (name, mobileno, password, emailid, dob, usertype) values (@name, @mobileno, @password, @emailid, @dob, @usertype)", con);
                command.Parameters.AddWithValue("@name", txtBoxName.Text);
                command.Parameters.AddWithValue("@mobileno", Convert.ToInt64(txtBoxMobileNo.Text));
                command.Parameters.AddWithValue("@password", txtBoxPswd.Text);
                command.Parameters.AddWithValue("@emailid", txtBoxEmailId.Text);
                command.Parameters.AddWithValue("@dob", txtBoxDOB.Text);
                command.Parameters.AddWithValue("@usertype", "V");
                //command.Parameters.AddWithValue("@interests", interests);
                //command.Parameters.AddWithValue("@organization_name", txtorg.Text);

                if (command.ExecuteNonQuery() > 0)
                {
                    command = new SqlCommand("SELECT userid FROM usertable where mobileno = @mobileno AND password = @password", con);
                    command.Parameters.AddWithValue("@mobileno", txtBoxMobileNo.Text);
                    command.Parameters.AddWithValue("@password", txtBoxPswd.Text);
                    dataRead = command.ExecuteReader();
                    if (dataRead.Read())
                        Session["id"] = dataRead["userid"];
                    string script = "window.onload = function(){ alert('Your details have been saved successfully.');";
                    script += "window.location = 'VolunteerProfile.aspx';};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
                else
                {
                    string script = "window.onload = function(){ alert('Some error Occured. Try again later.');";
                    script += "window.location = 'RegistrationPage.aspx';};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }

            else if (RadioButtonEmployee.Checked == true)
            {
                command = new SqlCommand("INSERT INTO usertable (name, mobileno, password, emailid, dob, usertype) values (@name, @mobileno, @password, @emailid, @dob, @usertype)", con);
                command.Parameters.AddWithValue("@name", txtBoxName.Text);
                command.Parameters.AddWithValue("@mobileno", Convert.ToInt64(txtBoxMobileNo.Text));
                command.Parameters.AddWithValue("@password", txtBoxPswd.Text);
                command.Parameters.AddWithValue("@emailid", txtBoxEmailId.Text);
                command.Parameters.AddWithValue("@dob", txtBoxDOB.Text);
                command.Parameters.AddWithValue("@usertype", "E");
                //command.Parameters.AddWithValue("@designation", txtBoxDesignation.Text);

                if (command.ExecuteNonQuery() > 0)
                {
                    command = new SqlCommand("SELECT UserId FROM usertable where mobileno = @mobileno AND password = @password", con);
                    command.Parameters.AddWithValue("@mobileno", txtBoxMobileNo.Text);
                    command.Parameters.AddWithValue("@password", txtBoxPswd.Text);
                    dataRead = command.ExecuteReader();
                    if (dataRead.Read())
                        Session["id"] = dataRead["userid"];
                    string script = "window.onload = function(){ alert('Your details have been saved successfully.');";
                    script += "window.location = 'EmployeeProfile.aspx';};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
                else
                {
                    string script = "window.onload = function(){ alert('Some error Occured. Try again later.');";
                    script += "window.location = 'RegistrationPage.aspx';};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }
        }
    }
}