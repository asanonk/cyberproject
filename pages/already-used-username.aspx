<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>
<%@ Import Namespace = "System.Data.SqlClient" %>

<script runat="server">
    bool CheckUsername()
    {
        string username = Request.Form["username"];
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * From Users WHERE (Username = N'{0}')", username);
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
        if (dr.HasRows)
        {
            Session["usernameComment"] = "someone used this username";
            conObj.Close();
            return true;
        }//if
        conObj.Close();
        Session["usernameComment"] = "a good choice";
        return false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submitBtn"] != null)
        {
            if (CheckUsername() == false)
            {
                Session["username"] = Request.Form["username"];
                string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                string cmdStr = string.Format("SELECT Username From Users WHERE (Username = N'{0}')", Session["username"]);
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                string cmdInsertStr = string.Format("INSERT INTO Users (Username, Name, Password, Email, Phone, Gender, Birthday, Adress, CurrentBestPlayer, FavoriteTeam, BestPlayerEver, FavoriteShoesBrand, AreYouPlayingBasketball) VALUES (N'{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}', N'{6}', N'{7}', N'{8}', N'{9}', N'{10}', N'{11}', N'{12}')", Session["username"], Session["name"], Session["password"], Session["email"], Session["phoneNumber"], Session["gender"], Session["birthday"], Session["adress"], Session["currentBestPlayer"], Session["favoriteTeam"], Session["BestPlayerEver"], Session["favoriteShoesBrand"], Session["areYouPlayingBasketball"]);
                SqlCommand cmdInsersObj = new SqlCommand(cmdInsertStr, conObj);
                cmdInsersObj.ExecuteNonQuery();
                conObj.Close();
                Session["login"] = Session["username"];
                Session["level"] = "משתמש רגיל";
                Response.Redirect("update-succeeded.aspx");
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Great, But Your Username Is Already In Use...
Find Here A New One
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<script type="text/javascript">
    function CheckUsername() {
        var lettersCount = 0;
        var spacesCount = 0;
        var username = String(document.getElementById("username").value);
        if (username == "") {
            document.getElementById("usernameComment").innerHTML = "must be filled";
            return false;
        }
        for (var i = 0; i < username.length; i++) {
            lettersCount++;
            if (username[i] == " ") {
                spacesCount++;
            }
        }
        if (spacesCount == lettersCount) {
            document.getElementById("usernameComment").innerHTML = "must be filled";
            return false;
        }
        return true;
    }
</script>
<form action="already-used-username.aspx" method="post" onsubmit="return CheckUsername()">
<h5>Username</h5>
<input type="text" value="" id="username" name="username"/>
<p id="usernameComment"><%=Session["usernameComment"] %></p>
<br />
<input type="submit" class="buttonSendLoginRegisterUpdateForm" style="background-color:#cc33ff" value="Ok" name="submitBtn" />
</form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

