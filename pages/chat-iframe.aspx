<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .message
        {
            
            background-color:#3080b8;
            margin:5px 15px 5px 5px;
            border-radius:35px;
            border:5px solid #3080b8;
            padding:5px 5px 5px 5px;
            width:350px;
            height:auto;
            color:White;
            font-family:Arial;
            text-align:right;
            vertical-align:top;
            float:right;
            
        }
        .corner
        {
            
            background-image:url('messag.png');
            width:50px;
            height:50px; 
            float:right;
            position:relative;
            left:390px;
            top:-1px;
            z-index:-3;
       
        }
        .content
        {
            
            padding:-5px 0px 0px 0px;
            margin:1px 10px 0px 0px;
            
      
        }
        </style>
</head>
<body>
    <%=Application["chat"] %>
</body>
</html>
