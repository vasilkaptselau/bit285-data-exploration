<%@ Page Language="c#" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<script runat="server">

    void Page_Load(object sender, EventArgs e)
    {
    
    // Database Connection via a Connection String
       string strConnect =  @"Provider=Microsoft.Jet.OLEDB.4.0;";
       strConnect += @"Data Source=|DataDirectory|/grocertogo.mdb;";
       strConnect += "Persist Security Info=False";
       OleDbConnection objConnection = new OleDbConnection(strConnect);
    
    // New SQL Statement to show category name and product information
       string strCommand = "SELECT Categories.CategoryName, Products.ProductName , Products.Manufacturer, Products.UnitPrice  FROM categories INNER JOIN products ON Categories.CategoryID=Products.CategoryID";
       OleDbDataAdapter objCommand = new OleDbDataAdapter(strCommand, objConnection);
    
       // Fill the empty DataSet Object with the contents of the command object
       // NOTE: a data set can hold many tables, call this table "Ian"
       DataSet Products = new DataSet();
       objCommand.Fill(Products, "myProducts");
    
       // Attach the data in the Dataset table to DataGrid
       gvGrocerToGo.DataSource=Products.Tables["myProducts"].DefaultView;
       gvGrocerToGo.DataBind();
    }

</script>
<html>
<head>
    <title>Data Grid Control example</title>
</head>
<body>
    <form  id="form1" runat="server">
        <asp:GridView id="gvGrocerToGo" runat="server"></asp:GridView>
    
    </form>
</body>
</html>