<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>
<%@ Import Namespace = "System.Data.SqlClient" %>

<script runat="server">
    string iframe = "<iframe id='iframe' src='edit-or-delete-users.aspx' width='100%' height='500px'></iframe>";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["level"].ToString() != "מנהל")
        {
            Response.Redirect("only-for-managers-error.aspx");
        }
        iframe = "<iframe id='iframe' src='edit-or-delete-users.aspx' width='100%' height='500px'></iframe>";

        if (Request.Form["searchBtn"] != null)
        {
            iframe = "<iframe id='iframe' src='show-user-account-full-page-searched-by-username.aspx?username=" + Request.Form["username"] + "' width='100%' height='500px'></iframe>";
        }

        if (Request.Form["showAllBtn"] != null)
        {
            iframe = "<iframe id='iframe' src='edit-or-delete-users.aspx' width='100%' height='500px'></iframe>";
        }   
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Edit/Delete Users
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<h3>Specific Search</h3>
<form action="update-all-users.aspx" method="post">
<input type="text" name="username" placeholder="enter a username" />
<br />
<input class="buttonLogin" style="background-color: #cccc00;" type="submit" name="searchBtn" value="Search" />
<br /><br />
<h3>OR</h3>
<input class="buttonLogin" style="background-color: #ff6666;" type="submit" name="showAllBtn" value="Show All" />
</table>
</form>
<br />
<%=iframe%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

