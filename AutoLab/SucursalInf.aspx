<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SucursalInf.aspx.cs" Inherits="AutoLab.SucursalInf" %>

<link href="style.css" rel="stylesheet" />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="Azul">
                <img class="logo" src="LogoAutoLab.png" alt="Alternate Text" />

                <div class="preto"></div>
            </div>

        </header>
        <section>
            <div class="form">
                <label class="registro">Registro de sucursal</label>

                <div class="line1">
                    <label>Nombre Sucursal:</label>
                    <label>Descripcion:</label>
                </div>
                <div class="text1">
                    <asp:TextBox CssClass="textbox1" ID="txtNombreSucursal" runat="server" />
                    <asp:TextBox CssClass="textbox1" ID="txtDescripcionSucursal" runat="server" />
                </div>
                <div class="line2">
                    <label>Logo:</label>
                    <label>Direccion:</label>
                    <label>Telefono:</label>
                </div>
                <div class="text2">
                    <asp:TextBox CssClass="textbox2" ID="txtLogoSucursal" runat="server" />
                    <asp:TextBox CssClass="textbox2" ID="txtDireccionSucursal" runat="server" />
                    <asp:TextBox CssClass="textbox2" ID="txtTelefonoSucursal" runat="server" />
                </div>
                <div class="button1">
                    <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click"
                        Text="Registrar"></asp:Button>
                </div>
                <asp:Label ID="lbResultado" runat="server"></asp:Label>
                <div class="text3">
                    <label>Selecione Sucursal</label>
                    <br />
                    <br />
                    <asp:DropDownList ID="Dropdownlist1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Dropdownlist1_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT DISTINCT [NombreSucursal], [LogoSucursal], [DescripcionSucursal], [TelefonoSucursal], [DireccionSucursal], [IdSucursal] FROM [Sucursal]"></asp:SqlDataSource>
                </div>
                <asp:DetailsView ID="DetailsView1" runat="server" Height="16px" Width="247px"  CellPadding="4" ForeColor="#333333" GridLines="Horizontal" RowStyle-HorizontalAlign="Left">
                    <AlternatingRowStyle  BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle CssClass="tabela" BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
            </div>
        </section>
    </form>
</body>
</html>
