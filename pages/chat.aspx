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
            Session["clearBtn"] = "<form action='chat.aspx' method='post'> <input type='submit' class='cleanBtn' value='נקה' name='submitBtn' /> </form>";
        }
        else
        {
            Session["clearBtn"] = "";
        }
        if (Request.Form["sub"] != null)
        {
            if (Request.Form["spk"] != "")
            {
                Application["chat"] = "<div class=\"message\" > <div class=\"content\">" + Session["login"].ToString() + " <br/> " + Request.Form["spk"] + "</div></div><div class=\"corner\" > </div>" + Application["chat"];
            }
        }
        if (Request.Form["submitBtn"] != null)
        {
            Application["chat"] = "";
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Chat
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<iframe width="100%" height="200px" src="chat-iframe.aspx"  style="background-color:Silver"></iframe>
<center>
<form action="chat.aspx" method="post">
<input type="text" size="70" name="spk" />
<input type="submit"class="sendBtn" name="sub" value="שלח" />
</form>
<br />
<%=Session["clearBtn"] %>
</center>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="image" Runat="Server">

</asp:Content>

