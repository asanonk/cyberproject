<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Animation & Pesentation
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<script type="text/javascript">
    //gif
    var picNumber = 0;
    var show;
    function Start() {
        show = setInterval('Animation()', 60);
    }
    function Animation() {
        document.getElementById("currentImage").src = "../animation%20images/giphy-" + picNumber + ".png";
        if (picNumber == 73) {
            picNumber = 0;
        }
        else {
            picNumber++;
        }
    }
    function Stop() {
        clearInterval(show);
    }


    //album
    var speed = 1;
    var picNo = 1;
    function Next() {
        if (picNo >= 8) {
            picNo = 1;
        }
        else {
            picNo = picNo + speed;
        }
        document.getElementById("presentationImage").src = "../presentation%20images/pic" + picNo + ".jpg";
    }
    function Back() {
        if (picNo <= 1) {
            picNo = 8;
        }
        else {
            picNo = picNo - speed;
        }
        document.getElementById("presentationImage").src = "../presentation%20images/pic" + picNo + ".jpg";
    }
    function SpeedUp() {
        speed++;
    }
    function SpeedDown() {
        if (speed <= 0) {
            speed = 0;
        }
        speed--;
    }
    function SizeUp() {
        document.getElementById("presentationImage").width = document.getElementById("presentationImage").width + 50;
        document.getElementById("presentationImage").height = document.getElementById("presentationImage").height + 50;
    }
    function SizeDown() {
        document.getElementById("presentationImage").width = document.getElementById("presentationImage").width - 50;
        document.getElementById("presentationImage").height = document.getElementById("presentationImage").height - 50;
    }
</script>
<br />
<br />

<h1>Animation</h1>
<br />
<br />
<img src="../animation%20images/giphy-0.png" id="currentImage" width="500" height="500" alt="gif"/>
<br />
<br />
<input type="button" onclick="Start()" value="Start" />
<input type="button" onclick="Stop()" value="Stop" />
<br />
<br />

<h1>Presentation</h1>
<br />
<br />
<img src="../presentation%20images/pic1.jpg" id="presentationImage" width="500" height="500" alt="gif"/>
<br />
<br />
<input type="button" onclick="Next()" value="Next" />
<input type="button" onclick="Back()" value="Back" />
<input type="button" onclick="SpeedUp()" value="speed up" />
<input type="button" onclick="SpeedDown()" value="speed down" />
<input type="button" onclick="SizeUp()" value="size up" />
<input type="button" onclick="SizeDown()" value="size down" />

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">
</asp:Content>

