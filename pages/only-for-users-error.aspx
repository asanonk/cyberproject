<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
this page is for users only...
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<a href="login.aspx"><button class="buttonLogin" style="vertical-align:middle"><span>Login </span></button></a>
<a href="register-name-email-phone.aspx"><button class="buttonLogin" style="vertical-align:middle; background-color:#00b300"><span>Register </span></button></a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

