<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>
<%@ Import Namespace = "System.Data.SqlClient" %>
<script runat="server">
    void NamesAZ()
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Phone</td><td>Password</td><td>Email</td><td>Adress</td><td>Gender</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users ORDER BY Name ASC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["Phone"] + "</td><td>" + reader["Password"] + "</td><td>" + reader["Email"] + "</td><td>" + reader["Adress"] + "</td><td>" + reader["Gender"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }

    void NamesZA()
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Phone</td><td>Password</td><td>Email</td><td>Adress</td><td>Gender</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users ORDER BY Name DESC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["Phone"] + "</td><td>" + reader["Password"] + "</td><td>" + reader["Email"] + "</td><td>" + reader["Adress"] + "</td><td>" + reader["Gender"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }

    void PersonalQuestions()
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Current<br>Best Player</td><td>Favorite<br>Team</td><td>Best<br>Player Ever</td><td>Favorite<br>Shoes Brand</td><td>AreYou<br>Playing Basketball</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users ORDER BY Name DESC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }
    
    void FavoriteTeam()
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Favorite<br>Team</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users ORDER BY Name DESC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["FavoriteTeam"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }

    void EmailAZ()
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Email</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users ORDER BY Email ASC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["Email"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }

    void EmailZA()
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Email</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users ORDER BY Email DESC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["Email"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }
    void FavoriteShoesBrand()
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Favorite<br>Shoes Brand</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users ORDER BY Name DESC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }

    void CurrentBestPlayerANDBestPlayerEver()
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Current<br>Best<br>Player</td><td>Best<br>Player<br>Ever</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users ORDER BY Name DESC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["BestPlayerEver"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }

    void AreYouPlayingBasketballANDGender()
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Are You<br>Playing<br>Basketball</td><td>Gender</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users ORDER BY Name DESC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td><td>" + reader["Gender"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }

    void Gender()
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Gender</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users ORDER BY Name DESC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["Gender"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["level"].ToString() != "מנהל")
        {
            Response.Redirect("only-for-managers-error.aspx");
        }
        Session["orderBy"] = "";
        Session["table"] = "";
        if (Request.Form["submitBtn"] != null)
        {
            if (Request.Form["selectOption"] == "names a-z + basic info")
            {
                NamesAZ();
            }
            else if (Request.Form["selectOption"] == "names z-a + basic info")
            {
                NamesZA();
            }
            else if (Request.Form["selectOption"] == "personal questions")
            {
                PersonalQuestions();
            }
            else if (Request.Form["selectOption"] == "favorite team")
            {
                FavoriteTeam();
            }
            else if (Request.Form["selectOption"] == "email a-z")
            {
                EmailAZ();
            }
            else if (Request.Form["selectOption"] == "email z-a")
            {
                EmailZA();
            }
            else if (Request.Form["selectOption"] == "favorite shoes brand")
            {
                FavoriteShoesBrand();
            }
            else if (Request.Form["selectOption"] == "CurrentBestPlayer + BestPlayerEver")
            {
                CurrentBestPlayerANDBestPlayerEver();
            }
            else if (Request.Form["selectOption"] == "AreYouPlayingBasketball? + Gender")
            {
                AreYouPlayingBasketballANDGender();
            }
            else if (Request.Form["selectOption"] == "gender")
            {
                Gender();
            }
            else if (Request.Form["selectOption"] == "show all")
            {
                Session["table"] = "";
            }
            Session["orderBy"] = Request.Form["selectOption"];
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Order Users
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<script type="text/javascript">
    function Check() {
        if (document.getElementById("selectOption").value == "show all") {
            document.getElementById("iframe").style.visibility = "visible";
            document.getElementById("orderTable").innerHTML = "";
            return false;
        }
        return true;
    }
</script>
<form action="order-users.aspx" method="post" onsubmit="return Check()">
<select id="selectOption" name="selectOption">
<option value="select">select</option>
<option value="names a-z + basic info">names a-z + basic info</option>
<option value="names z-a + basic info">names z-a + basic info</option>
<option value="personal questions">personal questions</option>
<option value="email a-z">email a-z</option>
<option value="email z-a">email z-a</option>
<option value="gender">gender</option>
<option value="favorite team">favorite team</option>
<option value="favorite shoes brand">favorite shoes brand</option>
<option value="CurrentBestPlayer + BestPlayerEver">CurrentBestPlayer + BestPlayerEver</option>
<option value="AreYouPlayingBasketball? + Gender">AreYouPlayingBasketball? + Gender</option>
<option value="show all">show all</option>
</select>
<input type="submit" name="submitBtn" id="submitBtn" />
</form>
<h2>Ordering By: <%=Session["orderBy"] %></h2>
<div id="orderTable"><%=Session["table"]%></div>
<iframe id="iframe" src="show-all-users.aspx" width="100%" style="visibility: hidden"></iframe>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

