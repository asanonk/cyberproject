<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>
<%@ Import Namespace = "System.Data.SqlClient" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string username = "";
        string name = "";
        string phone = "";
        string password="";
        string email = "";
        string adress = "";
        string gender = "";
        string birthday = "";
        string currentBestPlayer = "";
        string areYouPlayingBasketball = "";
        string bestPlayerEver = "";
        string favoriteShoes = "";
        string favoriteTeam = "";
        string theConStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        SqlConnection theConObj = new SqlConnection(theConStr);
        theConObj.Open();
        string theCmdStr = string.Format("Select * from Users where Username=N'{0}'", Session["login"]);
        SqlCommand theCmdObj = new SqlCommand(theCmdStr, theConObj);
        SqlDataReader reader = theCmdObj.ExecuteReader();
        if (reader.Read())
        {
            username = reader["Username"].ToString();
            name = reader["Name"].ToString();
            phone = reader["Phone"].ToString();
            password = reader["Password"].ToString();
            email = reader["Email"].ToString();
            adress = reader["Adress"].ToString();
            gender = reader["Gender"].ToString();
            birthday = reader["Birthday"].ToString();
            currentBestPlayer = reader["CurrentBestPlayer"].ToString();
            areYouPlayingBasketball = reader["AreYouPlayingBasketball"].ToString();
            bestPlayerEver = reader["BestPlayerEver"].ToString();
            favoriteShoes = reader["FavoriteShoesBrand"].ToString();
            favoriteTeam = reader["FavoriteTeam"].ToString();
        }
        theConObj.Close();
        Session["src"] = string.Format("http://www.barcode-generator.org/phpqrcode/getCode.php?cht=qr&amp;chl=https%3A%2F%2Fshow-user-info.000webhostapp.com%2Findex.html%3Fname%3D{0}%26username%3D{1}%26phone%3D{2}%26email%3D{3}%26adress%3D{4}%26gender%3D{5}%26birthday%3D{6}%26currentBestPlayer%3D{7}%26favoriteTeam%3D{8}%26bestPlayerEver%3D{9}%26favoriteShoesBrand%3D{10}%26areYouPlayingBasketball%3D{11}&amp;chs=180x180&amp;choe=UTF-8&amp;chld=L|0", name, username, phone ,email, adress, gender, birthday, currentBestPlayer, favoriteTeam, bestPlayerEver, favoriteShoes, areYouPlayingBasketball);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Scan The Barcode
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<img width="30%" src="<%=Session["src"] %>" id="qrcode-preview-image" alt="Preview of your QR Code">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

