<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>
<%@ Import Namespace = "System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    string err = "";
    string ColorForTheChat()
    {
        Random r = new Random();
        int number = r.Next(1, 5);
        if (number == 1)
        {
            return "Blue";
        }
        else if (number == 2)
        {
            return "Purple";
        }
        else if (number == 3)
        {
            return "Orange";
        }
        else
        {
            return "Green";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "אורח")
        {
            Response.Redirect("logout-first.aspx");
        }
        if (Request.Form["submitBtn"] != null)
        {
            string username = Request.Form["username"];
            string password = Request.Form["password"];
            if (Request.Form["managerCheck"] == null)
            {
                string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                string cmdStr = string.Format("SELECT * From Users WHERE (Username = N'{0}' AND Password = N'{1}')", username, password);
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                SqlDataReader dr = cmdObj.ExecuteReader();
                if (dr.HasRows)
                {
                    Session["login"] = username;
                    Session["level"] = "משתמש רגיל";
                    Session["color"] = ColorForTheChat();
                    Response.Redirect("login-welcomeback.aspx");
                }
                else
                {
                    err = "<h3>Maybe you have a mistake?</h3><br><a href='register-name-email-phone.aspx'><button class='buttonLogin' style='vertical-align:middle'><span>Register </span></button></a>";
                }
            }
            else
            {
                DataSet ds = new DataSet();
                ds.ReadXml(MapPath("XMLFile.xml"));

                foreach (DataRow r in ds.Tables[0].Rows)
                {
                    if ((r["USERNAME"].ToString() == username) && (r["PASSWORD"].ToString() == password))
                    {
                        Session["login"] = r["USERNAME"].ToString();
                        Session["level"] = "מנהל";
                        Response.Redirect("login-welcomeback.aspx");
                    }
                }

                if (Session["login"] == "אורח")
                {
                    err = "<h3>Maybe you have a mistake?</h3>";
                }
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<%=err %>
<form action="login.aspx" method="post">
<h5>Username</h5>
<input type="text" id="username" name="username"/>
<h5>Password</h5>
<input type="password" id="password" name="password"/>
<br />
<br />
<input type="checkbox" name="managerCheck" id="managerCheck" />אני מנהל
<br />
<br />
<input type="submit" class="buttonSendLoginRegisterUpdateForm" value = "Login" name="submitBtn" id="submitBtn"/>
</form>
<br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
    <img src="../login.jpg" alt="login" width="540"/>
</asp:Content>

