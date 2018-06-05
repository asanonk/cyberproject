<%@ Page Title="" Language="C#" MasterPageFile="~/pages/teams.master" %>

<script runat="server">
    protected void Login_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["login"] = "אורח";
        Session["level"] = "אורח באתר";
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
San Antonio Spurs
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="position" Runat="Server">
3rd
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="wins" Runat="Server">
19
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="loses" Runat="Server">
10
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bp" Runat="Server">
    <img src="../teams/sanantonio/kawhi.png" alt="kawhi" width="270"/>
	Kawhi Leonard
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ppg" Runat="Server">
101.3
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="champs" Runat="Server">
5
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="logo" Runat="Server">
    <img src="../teams/sanantonio/sanantonioLogo.png" alt="sanantonio" width="270"/>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="arena" Runat="Server">
    <img src="../teams/sanantonio/sanantonioArena.jpg" alt="arena" width="270"/>
    	AT&T Center
</asp:Content>