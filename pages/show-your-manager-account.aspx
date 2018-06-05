<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>
<%@ Import Namespace = "System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["level"] != "מנהל")
        {
            Response.Redirect("only-for-managers-error.aspx");
        }
        DataSet ds = new DataSet();
        ds.ReadXml(MapPath("XMLFile.xml"));

        foreach (DataRow r in ds.Tables[0].Rows)
        {
            if (Session["login"].ToString() == r["USERNAME"].ToString())
            {
                Session["username"] = r["USERNAME"];
                Session["password"] = r["PASSWORD"];
                Session["firstName"] = r["FIRSTNAME"];
                Session["lastName"] = r["LASTNAME"];
                Session["email"] = r["EMAIL"];
            }
        }

        if (Request.Form["submitBtn"] != null)
        {
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Manager Account View
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form action="show-your-manager-account.aspx" method="post">
<h3>Username:</h3>
<input type="text" value="<%=Session["username"] %>" name="username" readonly/>
<br />
<br />
<h3>Password:</h3>
<input type="text" value="<%=Session["password"] %>" name="password" readonly/>
<br />
<br />
<h3>First Name:</h3>
<input type="text" value="<%=Session["firstName"] %>" name="firstName" readonly/>
<br />
<br />
<h3>Last Name:</h3>
<input type="text" value="<%=Session["lastName"] %>" name="lastName" readonly/>
<br />
<br />
<h3>Email:</h3>
<input type="text" value="<%=Session["email"] %>" name="email" readonly/>
</form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

