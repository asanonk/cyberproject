<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>

<script runat="server">
    string notUser = "";
    string body = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["level"].ToString() == "משתמש רגיל")
        {
            notUser = "";
            body = "";
        }
        else if (Session["level"].ToString() == "אורח באתר")
        {
            notUser = "You Can Register Or Login As A Regular User";
            body = "<a href='login.aspx'><button class='buttonLogin' style='vertical-align:middle'><span>Login </span></button></a> <a href='register-name-email-phone.aspx'><button class='buttonLogin' style='vertical-align:middle; background-color:#00b300'><span>Register </span></button></a>";
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
this page is for managers only...
<%=notUser %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<%=body %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

