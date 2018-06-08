<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>

<script runat="server">
    string checkManager = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["level"].ToString() == "מנהל")
        {
            checkManager = "Manager";
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Welcome Back
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
Hello <%=checkManager %> <%=Session["login"] %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
<img src="../nbalogo.jpg" alt="nbalogo" width="540"/>
</asp:Content>

