﻿<%@ Page Language="C#" %>
<%@ Import Namespace = "System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["table"] = "<table border = 1><tr><td>Name</td><td>Username</td><td>Phone</td><td>Password</td><td>Email</td><td>Adress</td><td>Gender</td><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td></tr>";
        //Session["table2"] = "<table border = 1><tr><td>Birthday</td><td>CurrentBestPlayer</td><td>FavoriteTeam</td><td>BestPlayerEver</td><td>FavoriteShoesBrand</td><td>AreYouPlayingBasketball</td>";
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT * FROM Users WHERE Username = N'{0}'", Session["login"]);
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        if (reader.Read())
        {
            Session["table"] += "<tr><td>" + reader["Name"] + "</td><td>" + reader["Username"] + "</td><td>" + reader["Phone"] + "</td><td>" + reader["Password"] + "</td><td>" + reader["Email"] + "</td><td>" + reader["Adress"] + "</td><td>" + reader["Gender"] + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
            //Session["table2"] += "<tr><td></td><td>" + "</td><td>" + reader["Birthday"] + "</td><td>" + reader["CurrentBestPlayer"] + "</td><td>" + reader["FavoriteTeam"] + "</td><td>" + reader["BestPlayerEver"] + "</td><td>" + reader["FavoriteShoesBrand"] + "</td><td>" + reader["AreYouPlayingBasketball"] + "</td>";
        }
        conObj.Close();
        Session["table"] += "</tr></table>";
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<%=Session["table"] %>
</body>
</html>
