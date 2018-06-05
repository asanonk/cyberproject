<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Welcome Back
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
Hello <%=Session["login"] %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
<img src="../nbalogo.jpg" alt="nbalogo" width="540"/>
</asp:Content>

