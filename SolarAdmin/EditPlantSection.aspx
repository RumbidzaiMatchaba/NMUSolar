<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPlantSection.aspx.cs" Inherits="NMUSolar.SolarAdmin.EditPlantSection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <script  src="../SweetAlert2/dist/sweetalert2.min.js" type="module"></script>
     <script  src="../SweetAlert2/dist/sweetalert2.all.min.js" type="module"></script>
    <script src="../SweetAlert2/dist/sweetalert2.js"></script>
      <link href="../SweetAlert2/dist/sweetalert2.css"  rel="stylesheet"/>
     <link href="../Login/loginStyle.css" rel="stylesheet" />
   
    <title>Edit Plant Section</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btn" runat="server" Text="click_me" OnClick="btn_Click" />
        </div>
    </form>
    <script type="module">
        import Swal from "../SweetAlert2/dist/sweetalert2.js";

        function showpopup() {
            Swal.fire('good job',
                'you clicked it!',
                'success');
        }

        
    </script>
</body>
</html>
