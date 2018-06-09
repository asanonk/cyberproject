<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>
<%@ Import Namespace = "System.Data.SqlClient" %>

<script runat="server">
    string showUsername;
    string showName;
    string showPhone;
    string showPassword;
    string showEmail;
    string showAdress;
    string showGender;
    string showBirthday;
    string showCurrentBestPlayer;
    string showAreYouPlayingBasketball;
    string showBestPlayerEver;
    string showFavoriteShoes;
    string showFavoriteTeam;
    bool CheckUsername(string username)
    {
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT Username From Users WHERE (Username = N'{0}')", username);
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
        if (dr.HasRows)
        {
            conObj.Close();
            return true;
        }//if
        conObj.Close();
        return false;
        Session.Abandon();
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["usernameComment"] = "";
        if (Session["login"] == "אורח")
        {
            Response.Redirect("only-for-users-error.aspx");
        }
        if (Session["level"] == "מנהל")
        {
            Response.Redirect("show-your-manager-account.aspx");
        }
        string theConStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        SqlConnection theConObj = new SqlConnection(theConStr);
        theConObj.Open();
        string theCmdStr = string.Format("Select * from Users where Username=N'{0}'", Session["login"]);
        SqlCommand theCmdObj = new SqlCommand(theCmdStr, theConObj);
        SqlDataReader reader = theCmdObj.ExecuteReader();
        if (reader.Read())
        {
            showUsername = reader["Username"].ToString();
            showName = reader["Name"].ToString();
            showPhone = reader["Phone"].ToString();
            showPassword = reader["Password"].ToString();
            showEmail = reader["Email"].ToString();
            showAdress = reader["Adress"].ToString();
            showGender = reader["Gender"].ToString();
            showBirthday = reader["Birthday"].ToString();
            showCurrentBestPlayer = reader["CurrentBestPlayer"].ToString();
            showAreYouPlayingBasketball = reader["AreYouPlayingBasketball"].ToString();
            showBestPlayerEver = reader["BestPlayerEver"].ToString();
            showFavoriteShoes = reader["FavoriteShoesBrand"].ToString();
            showFavoriteTeam = reader["FavoriteTeam"].ToString();
        }
        theConObj.Close();
        if (Request.Form["submitBtn"] != null)
        {
            string name = Request.Form["name"];
            string username = Request.Form["username"];
            string password = Request.Form["password"];
            string email = Request.Form["email"];
            string phone = Request.Form["phoneNumber"];
            string gender = Request.Form["gender"];
            string BDDay = Request.Form["BDDay"];
            string BDMonth = Request.Form["BDMonth"];
            string BDYear = Request.Form["BDYear"];
            string adress = Request.Form["adress"];
            string currentBestPlayer = Request.Form["player"];
            string areYouPlayingBasketball = Request.Form["playing"];
            string bestPlayerEver = Request.Form["playerever"];
            string favoriteShoes = Request.Form["likedShoes"];
            string favoriteTeam = Request.Form["favoriteTeam"];
            string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            SqlConnection conObj = new SqlConnection(conStr);
            conObj.Open();
            if (name != "")
            {
                string cmdStr = string.Format("UPDATE Users SET Name = N'{0}' WHERE Username = N'{1}'", name, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (username != "")
            {
                if (username != Session["username"].ToString())
                {
                    if (CheckUsername(username) == false && username.Length >= 3)
                    {
                        string cmdStr = string.Format("UPDATE Users SET Username = N'{0}' WHERE Username = N'{1}'", username, Session["login"]);
                        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                        cmdObj.ExecuteNonQuery();
                        Session["usernameComment"] = "";
                        Session["login"] = username;
                    }
                    else
                    {
                        Session["username"] = Request.Form["username"];
                        Session["name"] = Request.Form["name"];
                        Session["password"] = Request.Form["password"];
                        Session["email"] = Request.Form["email"];
                        Session["phoneNumber"] = Request.Form["phoneNumber"];
                        Session["gender"] = Request.Form["gender"];
                        Session["BDDay"] = Request.Form["BDDay"];
                        Session["BDMonth"] = Request.Form["BDMonth"];
                        Session["BDYear"] = Request.Form["BDYear"];
                        Session["birthday"] = BDDay + "." + BDMonth + "." + BDYear;
                        Session["adress"] = Request.Form["adress"];
                        Session["currentBestPlayer"] = Request.Form["player"];
                        Session["favoriteTeam"] = Request.Form["favoriteTeam"];
                        Session["areYouPlayingBasketball"] = Request.Form["playing"];
                        Session["BestPlayerEver"] = Request.Form["playerever"];
                        Session["favoriteShoesBrand"] = Request.Form["likedShoes"];
                        Response.Redirect("already-used-username.aspx");
                    }
                }
            }
            if (password != "")
            {
                string cmdStr = string.Format("UPDATE Users SET Password = N'{0}' WHERE Username = N'{1}'", password, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (email != "")
            {
                string cmdStr = string.Format("UPDATE Users SET Email = N'{0}' WHERE Username = N'{1}'", email, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (phone != "")
            {
                string cmdStr = string.Format("UPDATE Users SET Phone = N'{0}' WHERE Username = N'{1}'", phone, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (gender != null)
            {
                string cmdStr = string.Format("UPDATE Users SET Gender = N'{0}' WHERE Username = N'{1}'", gender, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (BDDay != "Day")
            {
                string cmdStr = string.Format("UPDATE Users SET Birthday = N'{0}' WHERE Username = N'{1}'", (BDDay + "." + BDMonth + "." + BDYear), Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (adress != "")
            {
                string cmdStr = string.Format("UPDATE Users SET Adress = N'{0}' WHERE Username = N'{1}'", adress, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (currentBestPlayer != null)
            {
                string cmdStr = string.Format("UPDATE Users SET CurrentBestPlayer = N'{0}' WHERE Username = N'{1}'", currentBestPlayer, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (bestPlayerEver != null)
            {
                string cmdStr = string.Format("UPDATE Users SET BestPlayerEver = N'{0}' WHERE Username = N'{1}'", bestPlayerEver, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (favoriteShoes != null)
            {
                string cmdStr = string.Format("UPDATE Users SET FavoriteShoesBrand = N'{0}' WHERE Username = N'{1}'", favoriteShoes, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (areYouPlayingBasketball != null)
            {
                string cmdStr = string.Format("UPDATE Users SET AreYouPlayingBasketball = N'{0}' WHERE Username = N'{1}'", areYouPlayingBasketball, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            if (favoriteTeam != "Select")
            {
                string cmdStr = string.Format("UPDATE Users SET FavoriteTeam = N'{0}' WHERE Username = N'{1}'", favoriteTeam, Session["login"]);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                cmdObj.ExecuteNonQuery();
            }
            conObj.Close(); if (Session["usernamecomment"] == "")
            {
                Response.Redirect("update-your-account.aspx");
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Update Your Account<br /><br />
if you don't want to update something - leave it blank
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <script type="text/javascript">
        function Check() {
            var checkName = CheckName();
            var checkPhoneNumber = CheckPhoneNumber();
            var checkPassword = CheckPassword();
            var checkEmail = CheckEmail();
            var checkConfirmPassword = CheckConfirmPassword();
            var checkUsername = CheckUsername();
            var checkGender = CheckGender();
            var checkCurrentBestPlayer = CheckCurrentBestPlayer();
            var checkPlayingBasketball = CheckPlayingBasketball();
            var checkBestPlayerEver = CheckBestPlayerEver();
            var checkLikedShoes = CheckLikedShoes();
            var checkBD = CheckBD();
            var checkFavoriteTeam = CheckFavoriteTeam();
            var checkAdress = CheckAdress();
            return checkName && checkPhoneNumber && checkPassword && checkEmail && checkConfirmPassword && checkUsername && checkGender && checkCurrentBestPlayer && checkPlayingBasketball && checkBestPlayerEver && checkLikedShoes && checkBD && checkFavoriteTeam && checkAdress;
        }


        function CheckName() {
            var lettersCount = 0;
            var spacesCount = 0;
            var letters = "אבגדהוזחטיכלמנסעפצקרשתןםךףץ ";
            var name = String(document.getElementById("name").value);
            if (name == "") {
                return true;
            }
            for (var i = 0; i < name.length; i++) {
                var found = false;
                for (var k = 0; k < letters.length; k++) {
                    if (name[i] == letters[k]) {
                        found = true;
                        lettersCount++;
                        if (name[i] == " ") {
                            spacesCount++;
                        }
                    }
                }
                if (found == false) {
                    document.getElementById("nameComment").innerHTML = "must be written in hebrew";
                    return false;
                }
            }
            if (lettersCount == spacesCount) {
                document.getElementById("nameComment").innerHTML = "must be written in hebrew";
                return false;
            }
            if (spacesCount == 0) {
                document.getElementById("nameComment").innerHTML = "write you full name";
                return false;
            }
            document.getElementById("nameComment").innerHTML = "";
            return true;
        }


        function CheckPhoneNumber() {
            var phoneNumber = String(document.getElementById("phoneNumber").value);
            if (phoneNumber == "") {
                return true;
            }
            var newPhoneNumber = "";
            for (var i = 0; i < phoneNumber.length; i++) {
                if (phoneNumber[i] != '-') {
                    newPhoneNumber += phoneNumber[i];
                }
            }
            if (newPhoneNumber == "") {
                document.getElementById("phoneNumberComment").innerHTML = "must be filled";
                return false;
            }
            else if (newPhoneNumber[0] != '0') {
                document.getElementById("phoneNumberComment").innerHTML = "a phone number begins with 0";
                return false;
            }
            else if (newPhoneNumber.length != 10) {
                document.getElementById("phoneNumberComment").innerHTML = "a phone number is 10 digits long";
                return false;
            }
            else if (newPhoneNumber % 1 != 0) {
                document.getElementById("phoneNumberComment").innerHTML = "a phone number contains numbers only";
                return false;
            }
            else {
                document.getElementById("phoneNumberComment").innerHTML = "";
            }
            return true;
        }


        function CheckPassword() {
            var password = String(document.getElementById("password").value);
            var username = String(document.getElementById("username").value);
            if (password == "") {
                return true;
            }
            else if (password == username) {
                document.getElementById("passwordComment").innerHTML = "password and username can't be the same";
                return false;
            }
            var letter = false;
            var digit = false;
            var symbol = false;
            var digits = "0123456789";
            var symbols = "~`!#$%^&*+=-[]\\\';,/{}|\":<>?()";
            for (var i = 0; i < password.length; i++) {
                var thisCharLetter = true;
                for (var k = 0; k < symbols.length; k++) {
                    if (password[i] == symbols[k]) {
                        symbol = true;
                        thisCharLetter = false;
                    }
                }
                for (var k = 0; k < digits.length; k++) {
                    if (password[i] == digits[k]) {
                        digit = true;
                        thisCharLetter = false;
                    }
                }
                if (thisCharLetter == true) {
                    letter = true;
                }
            }
            if (digit == true && symbol == true && letter == true) {
                document.getElementById("passwordComment").innerHTML = "strong password";
                return true;
            }
            else if (digit == true && symbol == true || letter == true && symbol == true || digit == true && letter == true) {
                document.getElementById("passwordComment").innerHTML = "medium password - password must contain letter, symbol and digit";
                return false;
            }
            else {
                document.getElementById("passwordComment").innerHTML = "low password - password must contain letter, symbol and digit";
                return false;
            }
        }

        var emailValidChars = "@.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        function checkMatchChars(validChars, value) {
            var currentChar;
            var valid = false;
            // value.length - checking each letter
            for (var i = 0; i < value.length; i++) {
                currentChar = value.charAt(i);
                // checking each valid char to the current letter
                for (var j = 0; j < validChars.length; j++) {
                    if (currentChar == validChars.charAt(j)) {
                        valid = true;
                    }
                }
                if (!valid) {
                    return false
                }
            }
            return true;
        }

        function CheckEmail() {
            var email = document.getElementById("email").value;
            var atPosition = email.indexOf('@');
            var lastDot = email.lastIndexOf('.');
            var beforeAt = email.split('@', 1);
            var valid = checkMatchChars(emailValidChars, email);
            if (email == "") {
                return true;
            }
            if (email != "") {
                if (valid) {
                    if (atPosition == -1) {
                        document.getElementById("emailComment").innerHTML = "you don't have a @";
                        return false;
                    }
                    if (atPosition == 0) {
                        document.getElementById("emailComment").innerHTML = "you must have at least one char before the @";
                        return false;
                    }
                    if (email.lastIndexOf('@') != atPosition) {
                        document.getElementById("emailComment").innerHTML = "you have more than one @";
                        return false;
                    }
                    if (lastDot < atPosition) {
                        document.getElementById("emailComment").innerHTML = "email must conclude a dot after the @";
                        return false;
                    }
                    if (lastDot + 2 >= email.length) {
                        document.getElementById("emailComment").innerHTML = "email must conclude at least two chars after the dot";
                        return false;
                    }
                    if (lastDot < atPosition + 2) {
                        document.getElementById("emailComment").innerHTML = "email must conclude text between the @ the the dot";
                        return false;
                    }
                    document.getElementById("emailComment").innerHTML = "";
                    return true;
                }
                else {
                    document.getElementById("emailComment").innerHTML = "onlt number, english letters and dots are valid";
                    return false;
                }
            }
            else {
                document.getElementById("emailComment").innerHTML = "must be filled";
                return false;
            }
        }

        function CheckConfirmPassword() {
            var password = document.getElementById("password").value
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (password == confirmPassword) {
                document.getElementById("confirmPasswordComment").innerHTML = "";
                return true;
            }
            else {
                document.getElementById("confirmPasswordComment").innerHTML = "password and confirm password are not the same";
                return false;
            }
        }


        function CheckUsername() {
            var lettersCount = 0;
            var spacesCount = 0;
            var username = String(document.getElementById("username").value);
            if (username == "") {
                return true;
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


        function CheckGender() {
            return true;
        }


        function CheckCurrentBestPlayer() {
            return true;
        }


        function CheckPlayingBasketball() {
            return true;
        }

        function CheckFavoriteTeam() {
            return true;
        }

        function CheckBestPlayerEver() {
            return true;
        }


        function CheckLikedShoes() {
            var likedShoes = document.getElementsByName("likedShoes");
            var count = 0;
            for (var i = 0; i < likedShoes.length; i++) {
                if (likedShoes[i].checked == true) {
                    count++;
                }
            }
            if (count > 0 || count == 0) {
                document.getElementById("countedShoesBrands").innerHTML = "you chose " + count + " shoes brands";
                document.getElementById("likedShoesComment").innerHTML = "";
                return true;
            }
            else {
                document.getElementById("countedShoesBrands").innerHTML = "";
                document.getElementById("likedShoesComment").innerHTML = "must be filled";
                return false;
            }
        }


        function CheckBD() {
            return true;
        }


        function CheckAdress() {
            var lettersCount = 0;
            var spacesOrNumbersCount = 0;
            var letters = "אבגדהוזחטיכלמנסעפצקרשתןםךףץ0123456789 ";
            var adress = String(document.getElementById("adress").value);
            if (adress == "") {
                document.getElementById("adressComment").innerHTML = "must be filled";
                return false;
            }
            for (var i = 0; i < adress.length; i++) {
                var found = false;
                for (var k = 0; k < letters.length; k++) {
                    if (adress[i] == letters[k]) {
                        found = true;
                        lettersCount++;
                        if (adress[i] == " " || (parseInt(adress[i]) >= 0 && parseInt(adress[i]) <= 9)) {
                            spacesOrNumbersCount++;
                        }
                    }
                }
                if (found == false) {
                    document.getElementById("adressComment").innerHTML = "must be written in hebrew";
                    return false;
                }
                if (spacesOrNumbersCount == lettersCount) {
                    document.getElementById("adressComment").innerHTML = "must be written in hebrew";
                    return false;
                }

            }
            document.getElementById("adressComment").innerHTML = "";
            return true;
        }
</script>
<form action="update-your-account.aspx" method="post" onsubmit="return Check()">
<h5>Full Name</h5>
<input type="text" value="<%=showName %>" id="name" name="name"/>
<p id="nameComment"></p>
<br />
<br />
<h5>Username</h5>
<input type="text" value="<%=showUsername %>" id="username" name="username"/>
<p id="usernameComment"></p>
<p id="sessionCheckP"><%=Session["usernameComment"]%></p>
<br />
<br />
<h5>Password</h5>
<input type="password" value="<%=showPassword %>" id="password" name="password" />
<p id="passwordComment"></p>
<br />
<br />
<h5>Confirm Password</h5>
<input type="password" value="<%=showPassword %>" id="confirmPassword" name="confirmPassword" />
<p id="confirmPasswordComment"></p>
<br />
<br />
<h5>Email</h5>
<input type="text" value="<%=showEmail %>" id="email" name="email" />
<p id="emailComment"></p>
<br />
<h5>Phone Number</h5>
<input type="text" value="<%=showPhone %>" id="phoneNumber" name = "phoneNumber" />
<p id="phoneNumberComment"></p>
<br />
<br />
<h5>Gender</h5>
<span style="font-size: medium">Your Current is: <%=showGender%></span>
<br />
<input type="radio" name="gender" value="male"/>Male
<br />
<br />
<input type="radio" name="gender" value="female"/>Female
<p id="genderComment"></p>
<br />
<br />
<h5>Birth-Day</h5>
<span style="font-size: medium">Your Current is: <%=showBirthday%></span>
<br />
<select id="BDDay" name="BDDay">
<option>Day</option>
<option>01</option>
<option>02</option>
<option>03</option>
<option>04</option>
<option>05</option>
<option>06</option>
<option>07</option>
<option>08</option>
<option>09</option>
<option>10</option>
<option>11</option>
<option>12</option>
<option>13</option>
<option>14</option>
<option>15</option>
<option>16</option>
<option>17</option>
<option>18</option>
<option>19</option>
<option>20</option>
<option>21</option>
<option>22</option>
<option>23</option>
<option>24</option>
<option>25</option>
<option>26</option>
<option>27</option>
<option>28</option>
<option>29</option>
<option>30</option>
<option>31</option>
</select>
<select id="BDMonth" name="BDMonth">
<option>Month</option>
<option>01</option>
<option>02</option>
<option>03</option>
<option>04</option>
<option>05</option>
<option>06</option>
<option>07</option>
<option>08</option>
<option>09</option>
<option>10</option>
<option>11</option>
<option>12</option>
</select>
<select id="BDYear" name="BDYear">
<option>Year</option>
<option>2017</option>
<option>2016</option>
<option>2015</option>
<option>2014</option>
<option>2013</option>
<option>2012</option>
<option>2011</option>
<option>2010</option>
<option>2009</option>
<option>2008</option>
<option>2007</option>
<option>2006</option>
<option>2005</option>
<option>2004</option>
<option>2003</option>
<option>2002</option>
<option>2001</option>
<option>2000</option>
<option>1999</option>
<option>1998</option>
<option>1997</option>
<option>1996</option>
<option>1995</option>
<option>1994</option>
<option>1993</option>
<option>1992</option>
<option>1991</option>
<option>1990</option>
<option>1989</option>
<option>1988</option>
<option>1987</option>
<option>1986</option>
<option>1985</option>
<option>1984</option>
<option>1983</option>
<option>1982</option>
<option>1981</option>
<option>1980</option>
<option>1979</option>
<option>1978</option>
<option>1977</option>
<option>1976</option>
<option>1975</option>
<option>1974</option>
<option>1973</option>
<option>1972</option>
<option>1971</option>
<option>1970</option>
<option>1969</option>
<option>1968</option>
<option>1967</option>
<option>1966</option>
<option>1965</option>
<option>1964</option>
<option>1963</option>
<option>1962</option>
<option>1961</option>
<option>1960</option>
<option>1959</option>
<option>1958</option>
<option>1957</option>
<option>1956</option>
<option>1955</option>
<option>1954</option>
<option>1953</option>
<option>1952</option>
<option>1951</option>
<option>1950</option>
</select>
<p id="BDComment"></p>
<p id="ageComment"></p>
<br />
<br />
<h5>Adress</h5>
<input type="text" value="<%=showAdress %>" id="adress" name="adress"/>
<p id="adressComment"></p>
<br />
<br />
<h1>In My Opinion:</h1>
<br />
<br />
<h2>Who Is The Current Best Player?</h2>
<span style="font-size: medium">Your Current is: <%=showCurrentBestPlayer%></span>
<br />
<input type="radio" name="player" value="Kevin Durant" />Kevin Durant
<br />
<br />
<input type="radio" name="player" value="Stephen Curry" />Stephen Curry
<br />
<br />
<input type="radio" name="player" value="LeBron James" />LeBron James
<br />
<br />
<input type="radio" name="player" value="James Harden" />James Harden
<br />
<br />
<input type="radio" name="player" value="Russell Westbrook" />Russell Westbrook
<p id="currentBestPlayerComment"></p>
<br />
<br />
<h2>What Is Your Favorite Team?</h2>
<span style="font-size: medium">Your Current is: <%=showFavoriteTeam%></span>
<br />
<select id="favoriteTeam" name ="favoriteTeam">
<option>Select</option>
<option>Boston Celtics</option>
<option>Toronto Raptors</option>
<option>Cleveland Cavaliers</option>
<option>Detroit Pistons</option>
<option>Washington Wizards</option>
<option>Indiana Pacers</option>
<option>Milwaukee Bucks</option>
<option>Miami Heat</option>
<option>New York Knicks</option>
<option>Philadelphia 76ers</option>
<option>Brooklyn Nets</option>
<option>Charlotte Hornets</option>
<option>Chicago Bulls</option>
<option>Orlando Magic</option>
<option>Atlanta Hawks</option>
<option>Golden State Warriors</option>
<option>Houston Rockets</option>
<option>San Antonio Spurs</option>
<option>Minnesota Timberwolves</option>
<option>Oklahoma City Thunder</option>
<option>Denver Nuggets</option>
<option>Portland Trail Blazers</option>
<option>New Orleans Pelicans</option>
<option>Utah Jazz</option>
<option>LA Clippers</option>
<option>Phoenix Suns</option>
<option>Los Angeles Lakers</option>
<option>Sacramento Kings</option>
<option>Memphis Grizzlies</option>
<option>Dallas Mavericks</option>
</select>
<p id="favoriteTeamComment"></p>
<br />
<br />
<h2>Questions</h2>
<h2>Are You Playing Basketball?</h2>
<span style="font-size: medium">Your Current is: <%=showAreYouPlayingBasketball%></span>
<br />
<input type="radio" name="playing" value="yes" />Yes
<br />
<br />
<input type="radio" name="playing" value="no" />No
<p id="playingBasketballComment"></p>
<br />
<br />
<h2>Who Is Best Player Ever?</h2>
<span style="font-size: medium">Your Current is: <%=showBestPlayerEver%></span>
<br />
<input type="radio" name="playerever" value="jordan" />Michael Jordan
<br />
<br />
<input type="radio" name="playerever" value="bryant" />Kobe Bryant
<br />
<br />
<input type="radio" name="playerever" value="adul-jabbar" />Kareem Abdul Jabbar
<br />
<br />
<input type="radio" name="playerever" value="james" />LeBron James
<p id="bestPlayerEverComment"></p>
<br />
<br />
<h2>Shoes Brands That You Like</h2>
<span style="font-size: medium">Your Current is: <%=showFavoriteShoes%></span>
<br />
<input type="checkbox" name="likedShoes" value="Air Jordan" />Air Jordan<br /><br />
<input type="checkbox" name="likedShoes" value="KD" />KD<br /><br />
<input type="checkbox" name="likedShoes" value="SC" />SC<br /><br />
<input type="checkbox" name="likedShoes" value="Irving" />Irving<br /><br />
<input type="checkbox" name="likedShoes" value="Bryant" />Bryant<br />
<p id="countedShoesBrands"></p>
<p id="likedShoesComment"></p>
<br />
<br />
<input type="submit" class="buttonSendLoginRegisterUpdateForm" value="Next" id="submitBtn" name="submitBtn"/>
<br />
<br />
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

