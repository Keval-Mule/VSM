using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;

namespace VSM
{
    public partial class Upload_database : System.Web.UI.Page
    {
        static string filenm = "";

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadFile(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/Files/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }
            filenm = Path.GetFileName(FileUpload1.FileName);
            //Save the File to the Directory (Folder).
            FileUpload1.SaveAs(folderPath + filenm);

            //Display the success message.
            lblMessage.Text = Path.GetFileName(FileUpload1.FileName) + " has been uploaded.";
        }

        protected void insertdata_Click(object sender, EventArgs e)
        {
            OleDbConnection oconn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/Files/" + filenm) + ";Extended Properties=Excel 8.0");
            try
            {
                OleDbCommand ocmd = new OleDbCommand("select * from [Sheet1$]", oconn);
                oconn.Open();
                OleDbDataReader odr = ocmd.ExecuteReader();
                string Name = "";
                string MobileNo = "";
                string EmailId = "";
                string DOB = "";
                string UserType = "";
                string Password = "";

                while (odr.Read())
                {
                    Name = valid(odr, 0);
                    MobileNo = valid(odr, 1);
                    EmailId = valid(odr, 2);
                    DOB = valid(odr, 3);
                    UserType = valid(odr, 4);
                    Password = valid(odr, 5);
                    insertdataintosql(Name, MobileNo, EmailId, DOB, UserType, Password);
                }
                oconn.Close();
            }
            catch (DataException ee)
            {
                lblmsg.Text = ee.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                lblmsg.Text = "Data Inserted Sucessfully and \n Message has been sent to newly added user that they have been registered on App:www.svayamsevak.ga with the userid & password.";
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }
        }
        protected string valid(OleDbDataReader myreader, int stval)//if any columns are found null then they are replaced by zero
        {
            object val = myreader[stval];
            if (val != DBNull.Value)
                return val.ToString();
            else
                return Convert.ToString(0);
        }
        protected void viewdata_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=F:\Keval\Mestek\19-01-2017 update 2\VSM\VSM\App_Data\VSMDB.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
            try
            {
                SqlDataAdapter sda = new SqlDataAdapter("select * from UserTable", con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (DataException de)
            {
                lblmsg.Text = de.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                lblmsg.Text = "Data Shown Sucessfully";
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }
        }
        public void insertdataintosql(string Name, string MobileNo, string EmailId, string DOB, string UserType, string Password)
        {
            //SqlConnection con = new SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename="F:\Keval\Mestek\19-01-2017 update 2\VSM\VSM\App_Data\VSMDB.mdf";Integrated Security=True;Connect Timeout=30;User Instance=True");
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into UserTable(Name,MobileNo,EmailId,DOB,UserType,Password) values(@Name,@MobileNo,@EmailId,@DOB,@UserType,@Password)";
            cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Name;
            cmd.Parameters.Add("@MobileNo", SqlDbType.BigInt).Value = Convert.ToInt64(MobileNo);
            cmd.Parameters.Add("@EmailId", SqlDbType.NVarChar).Value = EmailId;
            cmd.Parameters.Add("@DOB", SqlDbType.NVarChar).Value = DOB;
            cmd.Parameters.Add("@UserType", SqlDbType.NVarChar).Value = UserType;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Name;
            cmd.CommandType = CommandType.Text;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void deletedata_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename="F:\Keval\Mestek\19-01-2017 update 2\VSM\VSM\App_Data\VSMDB.mdf";Integrated Security=True;Connect Timeout=30;User Instance=True");
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "delete from UserTable";
                cmd.CommandType = CommandType.Text;
                con.Open();
                cmd.ExecuteScalar();
                con.Close();
            }
            catch (DataException de1)
            {
                lblmsg.Text = de1.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                lblmsg.Text = "Data Deleted Sucessfully";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}