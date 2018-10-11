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
using SMSLibrary;

namespace VSM
{
    public partial class AddEvent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        SqlDataReader dataRead;
        SqlCommand command;
        List<String> interestArr = new List<String>();
        List<String> mobileArr = new List<String>();
        int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                lblusername.Text = Session["name"].ToString();
                id = Convert.ToInt16(Session["id"]);
            }
            else
                Response.Redirect("index.html");
            Master.FindControl("btnLogout").Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string interests = "";
            foreach (ListItem item in CheckBoxListInterests.Items)
            {
                if (item.Selected)
                {
                    interests += item.Value + ",";
                    interestArr.Add(item.Text);
                }
            }
            //test.Text = interests;
            command = new SqlCommand("INSERT INTO eventinfo (EventName,EventDate,EventLocation,interests,EventDescription,EmployeeId) values (@EventName,@EventDate,@EventLocation,@interests,@EventDescription,@EmployeeId)", con);
            command.Parameters.AddWithValue("@EventName", txtevnm.Text);
            command.Parameters.AddWithValue("@EventDate", txtevdt.Text);
            command.Parameters.AddWithValue("@EventLocation", txtevloc.Text);
            command.Parameters.AddWithValue("@interests", interests);
            command.Parameters.AddWithValue("@EventDescription", txtevdesc.Text);
            command.Parameters.AddWithValue("@EmployeeId", id);
            con.Open();

            if (command.ExecuteNonQuery() > 0)
            {
                //broadcast
                foreach (string interest in interestArr)
                {
                    command = new SqlCommand("SELECT mobileno from UserTable where interests like @interests", con);
                    command.Parameters.AddWithValue("@interests", "%" + interest + "%");
                    dataRead = command.ExecuteReader();
                    while (dataRead.Read())
                    {
                        mobileArr.Add(Convert.ToString(dataRead["mobileNo"]));
                    }
                    dataRead.Close();
                }

                List<String> noDupes = mobileArr.Distinct().ToList();
                string msg = txtevnm + " will be held on " + txtevdt + " at " + txtevloc + ".By Svayam Sevak.";
                foreach (string mobile in noDupes)
                {
                    int isSent;
                    try
                    {
                        isSent = Sms.smsSend(mobile,msg);
                        if (isSent == 0)
                        {
                            msg = "OK";
                        }
                        if (isSent == 1)
                        {
                            msg = "OK NO RESPONSE";
                        }
                        if (isSent == 2)
                        {
                            msg = "FAILUREE";
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message.ToString());
                    }
                }
                string name = lblusername.Text.Trim();
                Session["name"] = name;
                string script = "window.onload = function(){ alert(" + msg + ");";
                script += "window.location = 'EmployeeProfile.aspx';};";
                ClientScript.RegisterStartupScript(this.GetType(), "Message", script, true);

            }
            else
            {
                string script = "window.onload = function(){ alert('Some error Occured. Try again later.');";
                script += "window.location = 'RegistrationPage.aspx';};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
            con.Close();
        }
    }
}