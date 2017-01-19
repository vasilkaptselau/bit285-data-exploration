<%@ Page Language="c#" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Xml" %>
<script runat="server">

    /**
     *	An XML data-driven page using a DataSource Object
     */
    DataSet Artists; // a 

    void Page_Load()
    {
        String xmlFilename = Server.MapPath("~/App_Data/artists.xml");
        Artists = new DataSet();
        Artists.ReadXml(xmlFilename);

        gvArtists.DataSource = Artists;
        gvArtists.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string xmlFilename = Server.MapPath("~/App_Data/artists.xml");
           Artists = new DataSet();
           Artists.ReadXml(xmlFilename);
          // DataRow newRow = Artists.Tables[0].NewRow();
           DataTable myTable=Artists.Tables[0];
           DataRow newRow=myTable.NewRow();

           newRow["name"] = FirstName.Text;    // This Data comes from new textboxes
           newRow["nationality"] = ArtNationality.Text;
           newRow["movement"] = Mov.Text;
           newRow["birthdate"] = ArtBir.Text;
           Artists.Tables[0].Rows.Add(newRow); // New Data came and add new row in table

           Artists.AcceptChanges();
           gvArtists.DataSource = Artists;
           gvArtists.DataBind();
           Artists.WriteXml(xmlFilename); // Add new row in XML file

    }
</script>
<html>
<head>
    <title>Data Grid Control - XML Example</title>
</head>
<body>
    <form  id="form1" runat="server">
        <asp:GridView id="gvArtists" runat="server"></asp:GridView>
        </br>
        </br>
        <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>&nbsp;Artist Name<br />
        <asp:TextBox ID="ArtNationality" runat="server"></asp:TextBox>&nbsp;Nationality<br />
        <asp:TextBox ID="Mov" runat="server"></asp:TextBox>&nbsp;Movement<br />
        <asp:TextBox ID="ArtBir" runat="server"></asp:TextBox>&nbsp;Artist Birthdate<br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
