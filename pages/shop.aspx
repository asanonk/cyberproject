<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["level"].ToString() == "אורח באתר")
        {
            Response.Redirect("only-for-users-error.aspx");
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<table border="1" width="100%">
<tr>

<td>
<center>
<img src="https://images.footballfanatics.com/FFImage/thumb.aspx?i=/productimages/_1768000/ff_1768829_xl.jpg&w=600" width="125px" height="125px" alt=""/>
<h2>99.99$</h2>
<a href="http://store.nba.com/Golden_State_Warriors_Jerseys/Mens_Golden_State_Warriors_Stephen_Curry_Fanatics_Branded_Royal_2018_NBA_Champions_Fast_Break_Replica_Player_Jersey_%E2%80%93_Icon_Edition" target="_blank"><img src="https://images-eu.ssl-images-amazon.com/images/I/41OCsvo6rtL.png" alt="" width="15%"/></a>
</center>
</td>

<td>
<center>
<img src="http://nba.frgimages.com/FFImage/thumb.aspx?i=/productImages/_2802000/ff_2802117_full.jpg&w=340" width="125px" height="125px" alt=""/>
<h2>109.99$</h2>
<a href="http://store.nba.com/Cleveland_Cavaliers_Gear/Mens_Cleveland_Cavaliers_LeBron_James_Nike_Maroon_Swingman_Jersey_-_Icon_Edition" target="_blank"><img src="https://images-eu.ssl-images-amazon.com/images/I/41OCsvo6rtL.png" alt="" width="15%"/></a>
</center>
</td>

</tr>

<tr>

<td>
<center>
<img src="http://nba.frgimages.com/FFImage/thumb.aspx?i=/productImages%2f_2711000%2fff_2711952_full.jpg&w=600" width="125px" height="125px" alt=""/>
<h2>77.99$</h2>
<a href="http://store.nba.com/Houston_Rockets_Pants_And_Shorts/Mens_Houston_Rockets_Nike_Red_Icon_Swingman_Basketball_Shorts" target="_blank"><img src="https://images-eu.ssl-images-amazon.com/images/I/41OCsvo6rtL.png" alt="" width="15%"/></a>
</center>
</td>

<td>
<center>
<img src="http://nba.frgimages.com/FFImage/thumb.aspx?i=/productImages%2f_2874000%2fff_2874134_full.jpg&w=600" width="125px" height="125px" alt=""/>
<h2>44.99$</h2>
<a href="http://store.nba.com/Boston_Celtics_Pants_And_Shorts/Mens_Boston_Celtics_Fanatics_Branded_Black_Kelly_Green_Replica_Shorts" target="_blank"><img src="https://images-eu.ssl-images-amazon.com/images/I/41OCsvo6rtL.png" alt="" width="15%"/></a>
</center>
</td>

</tr>



<tr>

<td>
<center>
<img src="http://nba.frgimages.com/FFImage/thumb.aspx?i=/productImages%2f_2895000%2fff_2895934_full.jpg&w=600" width="125px" height="125px" alt=""/>
<h2>149.99$</h2>
<a href="http://store.nba.com/Kevin_Durant_Basketball_Essentials_Nike/Mens_Nike_Gray_Zoom_KD10_Basketball_Shoes" target="_blank"><img src="https://images-eu.ssl-images-amazon.com/images/I/41OCsvo6rtL.png" alt="" width="15%"/></a>
</center>
</td>

<td>
<center>
<img src="http://nba.frgimages.com/FFImage/thumb.aspx?i=/productimages/_2895000/altimages/ff_2895920alt5_full.jpg&w=600" width="125px" height="125px" alt=""/>
<h2>184.99$</h2>
<a href="http://store.nba.com/Basketball_Essentials/Mens_Nike_White_Black_LeBron_15_Machine_61_Basketball_Shoes" target="_blank"><img src="https://images-eu.ssl-images-amazon.com/images/I/41OCsvo6rtL.png" alt="" width="15%"/></a>
</center>
</td>

</tr>

</table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

