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
            <div class="menu">
                <img class="logo" src="LogoAutoLab.png" alt="Alternate Text" />
            </div>

        </header>
        <section>
            <div class="form">
                <label class="registro">Registro de sucursal</label>
                <div class="formContent">
                    <div class="line">
                        <label>Nombre Sucursal:</label>
                        <asp:TextBox CssClass="textbox" ID="txtNombreSucursal" runat="server" />
                    </div>
                    <div class="line">
                        <label>Descripcion:</label>
                        <asp:TextBox CssClass="textbox" ID="txtDescripcionSucursal" runat="server" />
                    </div>
                </div>
                <div class="formContent">
                    <div class="line">
                        <label>Logo:</label>
                        <asp:TextBox CssClass="textbox" ID="txtLogoSucursal" runat="server" />
                    </div>
                    <div class="line">
                        <label>Direccion:</label>
                        <asp:TextBox CssClass="textbox" ID="txtDireccionSucursal" runat="server" />
                    </div>
                    <div class="line">
                        <label>Telefono:</label>
                        <asp:TextBox CssClass="textbox" ID="txtTelefonoSucursal" runat="server" />
                    </div>
                </div>
                <div class="button1">
                    <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click"
                        Text="Registrar"></asp:Button>
                    <asp:Label ID="lbResultado" runat="server"></asp:Label>
                </div>

                <div class="selectBox">
                    <label>Selecione Sucursal</label>
                    <asp:DropDownList ID="Dropdownlist1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Dropdownlist1_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT DISTINCT [NombreSucursal], [LogoSucursal], [DescripcionSucursal], [TelefonoSucursal], [DireccionSucursal], [IdSucursal] FROM [Sucursal]"></asp:SqlDataSource>
                </div>
                <div class="container">
                    <table>
                        <thead>
                            <tr class="tablehead">
                                <th class="encabezamiento">ID</th>
                                <th class="encabezamiento">Nombre</th>
                                <th class="encabezamiento">Logo</th>
                                <th class="encabezamiento">Direccion</th>
                                <th class="encabezamiento">Telefono</th>
                                <th class="encabezamiento">Descripcion</th>
                            </tr>
                        </thead>
                        <asp:Repeater ID="Repeater" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("IdSucursal") %></td>
                                    <td><%# Eval("NombreSucursal") %></td>
                                    <td><%# Eval("LogoSucursal") %></td>
                                    <td><%# Eval("DireccionSucursal") %></td>
                                    <td><%# Eval("TelefonoSucursal") %></td>
                                    <td><%# Eval("DescripcionSucursal") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
