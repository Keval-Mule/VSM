using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;

namespace VSM
{
    public partial class ViewNRateEvent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                lblEmpName.Text = Session["name"].ToString();
                id = Convert.ToString(Session["id"]);
            }
            else
                Response.Redirect("index.html");
            Master.FindControl("btnLogout").Visible = true;

            if (!IsPostBack)
            {
                gvFruits.DataSource = GetData("SELECT id, EventName, ISNULL((SELECT AVG(Rating) FROM EventRating WHERE id = EventInfo.id), 0) Rating FROM EventInfo");
                gvFruits.DataBind();
            }
        }
        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }

        protected void OnRatingChanged(object sender, RatingEventArgs e)
        {
            int rowIndex = ((sender as Rating).NamingContainer as GridViewRow).RowIndex;
            int fruitId = Convert.ToInt32(gvFruits.DataKeys[rowIndex].Value);
            string constr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO EventRating VALUES(@id, @Rating)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@id", fruitId);
                    cmd.Parameters.AddWithValue("@Rating", e.Value);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = lblEmpName.Text.Trim();
            Session["name"] = name;
            Response.Redirect("VolunteerProfile.aspx");
        }

    }
}