<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPaneli.aspx.cs" Inherits="KutuphaneOtomasyonu.AdminPaneli" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            width: 100%;
            height: 631px;
        }
        .auto-style4 {
            height: 218px;
        }
        .auto-style5 {
            width: 72%;
            height: 142px;
        }
        .auto-style6 {
            height: 30px;
        }
        .auto-style7 {
            height: 30px;
            width: 122px;
        }
        .auto-style8 {
            width: 122px;
        }
        .auto-style10 {
            width: 597px;
            height: 29px;
        }
        .auto-style11 {
            height: 218px;
            width: 597px;
        }
        .auto-style12 {
            width: 83%;
            margin-right: 7px;
            height: 91px;
        }
        .auto-style13 {
            height: 391px;
            width: 597px;
        }
        .auto-style14 {
            height: 391px;
        }
        .auto-style15 {
            width: 122px;
            height: 35px;
        }
        .auto-style16 {
            height: 35px;
        }
        .auto-style17 {
            height: 30px;
            width: 171px;
        }
        .auto-style18 {
            height: 29px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
        <span class="auto-style2"><strong style="background-color: #3366FF">YÖNETİCİ PANELİ</strong></span><table class="auto-style3">
            <tr>
                <td class="auto-style10" style="background-color: #FF6699">
                    <strong>Kitaplar</strong></td>
                <td class="auto-style18" style="background-color: #FF6699">
                    <strong>Üyeler</strong></td>
            </tr>
            <tr>
                <td class="auto-style11" style="background-color: #99FFCC">
                    <table class="auto-style5" style="background-color: #CCFF99">
                        <tr>
                            <td class="auto-style7">Kitap Adı:</td>
                            <td class="auto-style6">
                                <asp:TextBox ID="kitapAdiText" runat="server" Width="239px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">Basım Yılı:</td>
                            <td>
                                <asp:TextBox ID="basimYiliText" runat="server" Width="237px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style15">Yayınevi:</td>
                            <td class="auto-style16">
                                <asp:TextBox ID="yayinEviText" runat="server" Width="236px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                <asp:Button ID="kitapEkleBTN" runat="server" Font-Bold="True" Text="Kitap Ekle" Width="164px" OnClick="kitapEkleBTN_Click" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtKitapId" runat="server" Width="34px">id</asp:TextBox>
                                <asp:Button ID="Button1" runat="server" Font-Bold="True" Text="Güncelle" Width="109px" OnClick="Button1_Click" />
                                <asp:Button ID="Button3" runat="server" Font-Bold="True" OnClick="Button3_Click" Text="Sil" Width="90px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style4" style="background-color: #CCFFFF">
                    <table class="auto-style12" style="background-color: #FFFF00">
                        <tr>
                            <td class="auto-style17">Üye Adı:</td>
                            <td class="auto-style6">
                                <asp:TextBox ID="uyeAdiText" runat="server" Width="255px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style17">
                                <asp:Button ID="uyeEkleBTN" runat="server" Font-Bold="True" Text="Üye Ekle" Width="165px" OnClick="uyeEkleBTN_Click" />
                            </td>
                            <td class="auto-style6">
                                <asp:TextBox ID="txtUyeId" runat="server" Width="39px">id</asp:TextBox>
                                <asp:Button ID="Button2" runat="server" Font-Bold="True" Text="Güncelle" Width="121px" OnClick="Button2_Click" />
                                <asp:Button ID="Button4" runat="server" Text="Sil" Width="93px" Font-Bold="True" OnClick="Button4_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style17">
                                <asp:Label ID="Label1" runat="server" Text="Kitap ID:"></asp:Label>
                            </td>
                            <td class="auto-style6">
                                <asp:TextBox ID="TextBox1" runat="server" Width="39px"></asp:TextBox>
                                <asp:Button ID="Button5" runat="server" Font-Bold="True" OnClick="Button5_Click" Text="Kitabı Ver" Width="121px" />
                                <asp:Button ID="Button6" runat="server" Font-Bold="True" OnClick="Button6_Click" Text="Kitabı Al" Width="92px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style13" style="background-color: #99FFCC">
                    <asp:Label ID="kitapBilgiLabel" runat="server"></asp:Label>
                    <asp:GridView ID="kitapGridView" runat="server" Width="438px">
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                </td>
                <td class="auto-style14" style="background-color: #CCFFFF">
                    <asp:Label ID="uyeBilgiLabel" runat="server"></asp:Label>
                    <asp:GridView ID="uyeGridView" runat="server" Width="495px">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
