<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>
<%@ Import Namespace = "System.Data.SqlClient" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["level"].ToString() != "מנהל")
        {
            Response.Redirect("only-for-managers-error.aspx");
        }
        //AreYouPlayingBasketball
        int countYes = 0;
        int countNo = 0;
        //CurrentBestPlayer
        int durant = 0;
        int curry = 0;
        int james = 0;
        int harden = 0;
        int westbrook = 0;
        //Gender
        int male = 0;
        int female = 0;
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT AreYouPlayingBasketball, CurrentBestPlayer, Gender FROM Users ORDER BY Name ASC");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader reader = cmdObj.ExecuteReader();
        while (reader.Read())
        {
            if (reader["AreYouPlayingBasketball"].ToString() == "yes")
            {
                countYes++;
            }
            else
            {
                countNo++;
            }
            ////////////////////
            if (reader["CurrentBestPlayer"].ToString() == "Kevin Durant")
            {
                durant++;
            }
            else if (reader["CurrentBestPlayer"].ToString() == "Stephen Curry")
            {
                curry++;
            }
            else if (reader["CurrentBestPlayer"].ToString() == "LeBron James")
            {
                james++;
            }
            else if (reader["CurrentBestPlayer"].ToString() == "James Harden")
            {
                harden++;
            }
            else
            {
                westbrook++;
            }
            ///////////////////
            if (reader["Gender"].ToString() == "male")
            {
                male++;
            }
            else
            {
                female++;
            }
            
        }
        conObj.Close();
        Session["yes"] = countYes;
        Session["no"] = countNo;
        
        Session["durant"] = durant;
        Session["curry"] = curry;
        Session["james"] = james;
        Session["westbrook"] = westbrook;
        Session["harden"] = harden;

        Session["male"] = male;
        Session["female"] = female;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    Graphic Orders
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<script type="text/javascript">
//are you playing basketball
    google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Playing', parseInt(document.getElementById("yes").value)],
          ['Dont Playing', parseInt(document.getElementById("no").value)]
        ]);
        
            var options = {
          title: 'Are You Playing Basketball?',
          is3D: true,
        };
        
        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }

      
//current best player
    google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart2);
      function drawChart2() {
        var data2 = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Stephen Curry', parseInt(document.getElementById("curry").value)],
          ['Kevin Durant', parseInt(document.getElementById("durant").value)],
          ['James Harden', parseInt(document.getElementById("harden").value)],
          ['Russel Westbrook', parseInt(document.getElementById("westbrook").value)],
          ['LeBron James', parseInt(document.getElementById("james").value)]
        ]);
        
            var options2 = {
          title: 'Current Best Player',
          pieHole: 0.4,
        };
        
        var chart2 = new google.visualization.PieChart(document.getElementById('piechart_3d2'));
        chart2.draw(data2, options2);
      }




      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart4);

      function drawChart4() {
        var data4 = google.visualization.arrayToDataTable([
          ['Name', 'Choices'],
          ['S.Curry', parseInt(document.getElementById("curry").value)],
          ['K.Durant', parseInt(document.getElementById("durant").value)],
          ['J.Harden', parseInt(document.getElementById("harden").value)],
          ['R.Westbrook', parseInt(document.getElementById("westbrook").value)],
          ['L.James', parseInt(document.getElementById("james").value)]
        ]);

        var options4 = {
          chart: {
            title: 'Current Best Player',
            subtitle: 'Name, Choices',
          }
        };

        var chart4 = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart4.draw(data4, google.charts.Bar.convertOptions(options4));
      }

//gender
    google.charts.load('current', {'packages':['gauge']});
      google.charts.setOnLoadCallback(drawChart3);

      function drawChart3() {

        var data3 = google.visualization.arrayToDataTable([
          ['Gender', 'Value'],
          ['Male', parseInt(document.getElementById("male").value)],
          ['Female', parseInt(document.getElementById("female").value)]
        ]);

        var options3 = {
          width: 400, height: 120,
          redFrom: 90, redTo: 100,
          yellowFrom:75, yellowTo: 90,
          minorTicks: 5
        };

        var chart3 = new google.visualization.Gauge(document.getElementById('chart_div'));

        chart3.draw(data3, options3);
      }
</script>

<input type="text" value="<%=Session["yes"] %>" id="yes" hidden />
<input type="text" value="<%=Session["no"] %>" id="no" hidden />


<input type="text" value="<%=Session["durant"] %>" id="durant" hidden />
<input type="text" value="<%=Session["james"] %>" id="james" hidden />
<input type="text" value="<%=Session["curry"] %>" id="curry" hidden />
<input type="text" value="<%=Session["westbrook"] %>" id="westbrook" hidden />
<input type="text" value="<%=Session["harden"] %>" id="harden" hidden />

<input type="text" value="<%=Session["male"] %>" id="male" hidden />
<input type="text" value="<%=Session["female"] %>" id="female" hidden />
<div id="piechart_3d" style="width: 100%"></div>
<div id="columnchart_material" style="width: 100%"></div>
<div id="piechart_3d2" style="width: 100%"></div>
<center><div id="chart_div" style="width: 100%"></div></center>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

