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
        Session["table"] = "<table border = 1><tr><td>Username</td><td>Password</td><td>FIRSTNAME</td><td>LASTNAME</td><td>EMAIL</td></tr>";
        DataSet ds = new DataSet();
        ds.ReadXml(MapPath("XMLFile.xml"));

        foreach (DataRow r in ds.Tables[0].Rows)
        {
            Session["table"] += "<tr><td>" + r["USERNAME"] + "</td><td>" + r["PASSWORD"] + "</td><td>" + r["FIRSTNAME"] + "</td><td>" + r["LASTNAME"] + "</td><td>" + r["EMAIL"] + "</td><td></tr>";
        }
        Session["table"] += "</table>";
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Showing Managers
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<%=Session["table"] %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

