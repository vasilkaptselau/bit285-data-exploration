<%@ Page Language="c#" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Xml" %>
<script runat="server">

    /**
     *	An XML data-driven page using a DataSource Object
     */
        DataSet _artists;
    
       void Page_Load()
       {
         String xmlFilename = Server.MapPath("~/App_Data/artists.xml");
         _artists = new DataSet();
         _artists.ReadXml(xmlFilename);
         ian.DataSource = _artists;
         ian.DataBind();
       }

</script>
<html>
<head>
    <title>Data Grid Control - XML Example</title>
</head>
<body>
    <form  id="form1" runat="server">
        <asp:GridView id="ian" runat="server"></asp:GridView>
    </form>
</body>
</html>
