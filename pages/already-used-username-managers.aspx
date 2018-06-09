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
            if (Request.Form["username"] == Session["theUsernameOfTheEditUser"].ToString())
            {
                Response.Redirect("update-succeeded.aspx");
            }
            if (CheckUsername() == false)
            {
                Session["username"] = Request.Form["username"];
                string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                string cmdStr = string.Format("SELECT Username From Users WHERE (Username = N'{0}')", Session["username"]);
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                string cmdInsertStr = string.Format("UPDATE Users SET Username = N'{0}', Name = N'{1}', Password = N'{2}', Email = N'{3}', Phone = N'{4}', Gender = N'{5}', Birthday = N'{6}', Adress = N'{7}', CurrentBestPlayer = N'{8}', FavoriteTeam = N'{9}', BestPlayerEver = N'{10}', FavoriteShoesBrand = N'{11}', AreYouPlayingBasketball = N'{12}' WHERE Username=N'{13}'", Session["username"], Session["name"], Session["password"], Session["email"], Session["phoneNumber"], Session["gender"], Session["birthday"], Session["adress"], Session["currentBestPlayer"], Session["favoriteTeam"], Session["BestPlayerEver"], Session["favoriteShoesBrand"], Session["areYouPlayingBasketball"], Session["username"]);
                SqlCommand cmdInsersObj = new SqlCommand(cmdInsertStr, conObj);
                cmdInsersObj.ExecuteNonQuery();
                conObj.Close();
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
        if (username == document.getElementById("password").value) {
            document.getElementById("usernameComment").innerHTML = "must be different than the password";
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
        if (username.length < 3) {
            document.getElementById("usernameComment").innerHTML = "write your full username";
            return false;
        }
        return true;
    }
</script>
<form action="already-used-username-managers.aspx" method="post" onsubmit="return CheckUsername()">
<h5>Username</h5>
<input type="text" value="" id="username" name="username"/>
<p id="usernameComment"><%=Session["usernameComment"] %></p>
<input type="password" value="<%=Session["password"] %>" id="password" hidden/>
<br />
<input type="submit" class="buttonSendLoginRegisterUpdateForm" style="color:#cc33ff" value="Ok" name="submitBtn" />
</form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

