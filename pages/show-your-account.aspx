<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>
<%@ Import Namespace = "System.Data.SqlClient" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["level"].ToString() != "משתמש רגיל")
        {
            if (Session["level"].ToString() == "מנהל")
            {
                Response.Redirect("show-your-manager-account.aspx");
            }
            Response.Redirect("only-for-users-error.aspx");
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Account View
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<iframe src="show-you-account-full-page.aspx" width="100%"></iframe>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

