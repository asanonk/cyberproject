<%@ Page Title="" Language="C#" MasterPageFile="~/pages/mainmenu.master" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == "אורח")
        {
            Response.Redirect("only-for-users-error.aspx");
        }
        if (Session["level"] == "מנהל")
        {
            Session["clearBtn"] = "<form action='chat.aspx' method='post'> <input type='submit' class='cleanBtn' value='נקה' name='clearBtn' /> </form>";
        }
        else
        {
            Session["clearBtn"] = "";
        }
        if (Request.Form["sub"] != null)
        {
            if (Request.Form["spk"] != "")
            {
                Application["chat"] = "<div class=\"message\" > <div class=\"content\" style='background-color: " + Session["color"] + "'>" + Session["login"].ToString() + " <br/> " + Request.Form["spk"] + "</div></div><div class=\"corner\" > </div>" + Application["chat"];
            }
        }
        if (Request.Form["clearBtn"] != null)
        {
            Application["chat"] = "";
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Chat
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<script type="text/javascript">
    function HappyEmoji() {
        document.getElementById("spk").value = document.getElementById("spk").value + document.getElementById("happyEmoji").value;
    }
    function SadEmoji() {
        document.getElementById("spk").value = document.getElementById("spk").value + document.getElementById("sadEmoji").value;
    }
    function LaughingEmoji() {
        document.getElementById("spk").value = document.getElementById("spk").value + document.getElementById("laughingEmoji").value;
    }
    function BlowingAKissEmoji() {
        document.getElementById("spk").value = document.getElementById("spk").value + document.getElementById("blowingAKissEmoji").value;
    }
    function CryingEmoji() {
        document.getElementById("spk").value = document.getElementById("spk").value + document.getElementById("cryingEmoji").value;
    }
    function AngryEmoji() {
        document.getElementById("spk").value = document.getElementById("spk").value + document.getElementById("angryEmoji").value;
    }
    function PooEmoji() {
        document.getElementById("spk").value = document.getElementById("spk").value + document.getElementById("pooEmoji").value;
    }
</script>
<iframe width="100%" height="200px" src="chat-iframe.aspx"  style="background-color:Silver"></iframe>
<center>
<form action="chat.aspx" method="post">
<table width="100%">
<tr>
<td><input type="button" style="background-color:White; border:0;" value="😀" name="happyEmoji" id="happyEmoji" onclick="HappyEmoji()"/></td>
<td><input type="button" style="background-color:White; border:0;" value="😥" name="sadEmoji" id="sadEmoji" onclick="SadEmoji()"/></td>
<td><input type="button" style="background-color:White; border:0;" value="😂" name="laughingEmoji" id="laughingEmoji" onclick="LaughingEmoji()"/></td>
<td><input type="button" style="background-color:White; border:0;" value="😘" name="blowingAKissEmoji" id="blowingAKissEmoji" onclick="BlowingAKissEmoji()"/></td>
<td><input type="button" style="background-color:White; border:0;" value="😭" name="cryingEmoji" id="cryingEmoji" onclick="CryingEmoji()"/></td>
<td><input type="button" style="background-color:White; border:0;" value="😡" name="angryEmoji" id="angryEmoji" onclick="AngryEmoji()"/></td>
<td><input type="button" style="background-color:White; border:0;" value="💩" name="pooEmoji" id="pooEmoji" onclick="PooEmoji()"/></td>
</tr>
</table>
<input type="text" size="70" name="spk" id="spk"/>
<br />
<input type="submit" class="sendBtn" name="sub" value="שלח" />
</form>
<br />
<%=Session["clearBtn"] %>
</center>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">

</asp:Content>

