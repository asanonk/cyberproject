<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
In Order To Browse This Page You Need To Logout First
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

<a href="log-me-out.aspx"><button class="buttonLogin" style="vertical-align:middle"><span>Logout </span></button></a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

