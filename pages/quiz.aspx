<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == "אורח")
        {
            Response.Redirect("only-for-users-error.aspx");
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Quiz - Test Your Knowledge
<img src="../quiz.png" alt="quiz" width="540"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<script type="text/javascript">

    var startTime = Date.now();
    function Check() {
        var count = 0;
        if (Question1() == true) {
            count++;
        }
        if (Question2() == true) {
            count++;
        }
        if (Question3() == true) {
            count++;
        }
        if (Question4() == true) {
            count++;
        }
        if (Question5() == true) {
            count++;
        }
        if (Question6() == true) {
            count++;
        }
        if (Question7() == true) {
            count++;
        }
        if (Question8() == true) {
            count++;
        }
        if (Question9() == true) {
            count++;
        }
        if (Question10() == true) {
            count++;
        }
        document.getElementById("results").innerHTML = "you got " + count + " of 10\n You did it in " + ((Date.now() - startTime) / 1000) + " seconds";
    }


    function Question1() {
        var team = document.getElementById("question1");
        if (team.selectedIndex == 1) {
            return true;
        }
        return false;
    }


    function Question2() {
        var team = document.getElementsByName("champsnumber");
        for (var i = 0; i < team.length; i++) {
            if (team[i].checked == true && i == 2) {
                return true;
            }
        }
        return false;
    }


    function Question3() {
        var team = document.getElementsByName("richestplayer");
        for (var i = 0; i < team.length; i++) {
            if (team[i].checked == true && i == 1) {
                return true;
            }
        }
    }


    function Question4() {
        var team = document.getElementsByName("bestplayerever");
        for (var i = 0; i < team.length; i++) {
            if (team[i].checked == true && i == 1) {
                return true;
            }
        }
    }


    function Question5() {
        var team = document.getElementsByName("most3pt");
        for (var i = 0; i < team.length; i++) {
            if (team[i].checked == true && i == 3) {
                return true;
            }
        }
    } 


    function Question6() {
        var team = document.getElementsByName("3pt");
        for (var i = 0; i < team.length; i++) {
            if (team[i].checked == true && i == 0) {
                return true;
            }
        }
    }


    function Question7() {
        var team = document.getElementsByName("mostinquarter");
        for (var i = 0; i < team.length; i++) {
            if (team[i].checked == true && i == 3) {
                return true;
            }
        }
    }


    function Question8() {
        var team = document.getElementsByName("quarter");
        for (var i = 0; i < team.length; i++) {
            if (team[i].checked == true && i == 1) {
                return true;
            }
        }
    } 


    function Question9() {
        var team = document.getElementsByName("100points");
        for (var i = 0; i < team.length; i++) {
            if (team[i].checked == true && i == 3) {
                return true;
            }
        }
    }


    function Question10() {
        var team = document.getElementsByName("finals");
        for (var i = 0; i < team.length; i++) {
            if (team[i].checked == true && i == 3) {
                return true;
            }
        }
    }
</script>
<form action="" method="post">
<h2>Which Team Has The Most NBA Championships?</h2>
<select id="question1">
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
<br />
<br />

<h2>How Many Championships This Teams Has?</h2>
<input type="radio" name="champsnumber" value="10" />10
<br />
<br />
<input type="radio" name="champsnumber" value="20" />20
<br />
<br />
<input type="radio" name="champsnumber" value="17" />17
<br />
<br />
<input type="radio" name="champsnumber" value="12" />12
<br />
<br />

<h2>Who's The Richest Basketball Player?</h2>
<input type="radio" name="richestplayer" value="james" />LeBron James
<br />
<br />
<input type="radio" name="richestplayer" value="jordan" />Michael Jordan
<br />
<br />
<input type="radio" name="richestplayer" value="bryant" />Kobe Bryant
<br />
<br />
<input type="radio" name="richestplayer" value="shaq" />Shaquille O'Neal
<br />
<br />

<h2>How Considers To The Best Player Ever?</h2>
<input type="radio" name="bestplayerever" value="james" />LeBron James
<br />
<br />
<input type="radio" name="bestplayerever" value="jordan" />Michael Jordan
<br />
<br />
<input type="radio" name="bestplayerever" value="bryant" />Wilt Chamberlain
<br />
<br />
<input type="radio" name="bestplayerever" value="shaq" />Larry Bird
<br />
<br />

<h2>What Is The Record For 3 Points In One Season?</h2>
<input type="radio" name="most3pt" value="501" />501
<br />
<br />
<input type="radio" name="most3pt" value="236" />236
<br />
<br />
<input type="radio" name="most3pt" value="450" />450
<br />
<br />
<input type="radio" name="most3pt" value="402" />402
<br />
<br />

<h2>How Owns This Record (Most 3 Point In One Season)?</h2>
<input type="radio" name="3pt" value="curry" />Stephen Curry
<br />
<br />
<input type="radio" name="3pt" value="thompson" />Klay Thompson
<br />
<br />
<input type="radio" name="3pt" value="durant" />Kevin Durant
<br />
<br />
<input type="radio" name="3pt" value="iverson" />Allen Iverson
<br />
<br />

<h2>What Is The Record Points In One Quarter?</h2>
<input type="radio" name="mostinquarter" value="30" />30
<br />
<br />
<input type="radio" name="mostinquarter" value="42" />42
<br />
<br />
<input type="radio" name="mostinquarter" value="27" />27
<br />
<br />
<input type="radio" name="mostinquarter" value="36" />37
<br />
<br />

<h2>How Owns This Record (Most Points In One Quarter)?</h2>
<input type="radio" name="quarter" value="curry" />LeBron Janes
<br />
<br />
<input type="radio" name="quarter" value="thompson" />Klay Thompson
<br />
<br />
<input type="radio" name="quarter" value="durant" />Michael Jordan
<br />
<br />
<input type="radio" name="quarter" value="iverson" />Wilt Chamberlain
<br />
<br />

<h2>What Is The Record Of Most Points In One Game By One Person?</h2>
<input type="radio" name="100points" value="80" />80
<br />
<br />
<input type="radio" name="100points" value="64" />64
<br />
<br />
<input type="radio" name="100points" value="110" />110
<br />
<br />
<input type="radio" name="100points" value="100" />100
<br />
<br />

<h2>Which Teams Met 3 Times In A Row In The NBA Finals (NBA Record)?</h2>
<input type="radio" name="finals" value="celtics & warriors" />Boston Celtics & Golden State Warriors
<br />
<br />
<input type="radio" name="finals" value="heat&lakers" />Miami Heat & Los Angeles Lakers
<br />
<br />
<input type="radio" name="finals" value="lakers&boston" />Los Angeles Lakers & Boston Celtics
<br />
<br />
<input type="radio" name="finals" value="warriors&cavs" />Golden State Warriors & Claveland Cavaliers
<br />
<br />
<input type="button" value="Finish" onclick="Check()"/>
<h1 id="results"></h1>
</form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
    
</asp:Content>

