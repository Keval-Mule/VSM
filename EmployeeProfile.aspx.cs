using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VSM
{
    public partial class EmployeeProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                lblEmpName.Text = Session["name"].ToString();
            }
            else
                Response.Redirect("index.html");
            Master.FindControl("btnLogout").Visible = true;
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            string name = lblEmpName.Text.Trim();
            Session["name"] = name;
            this.Session["id"] = Session["id"];
            Response.Redirect("EditEmployeeProfile.aspx");
        }

        protected void btnAddNewEvent_Click(object sender, EventArgs e)
        {
            string name = lblEmpName.Text.Trim();
            Session["name"] = name;
            this.Session["id"] = Session["id"];
            Response.Redirect("AddEvent.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string name = lblEmpName.Text.Trim();
            Session["name"] = name;
            this.Session["id"] = Session["id"];
            Response.Redirect("UpdateEvent.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = lblEmpName.Text.Trim();
            Session["name"] = name;
            Response.Redirect("VolunteerRecord.aspx");
        }
    }
}