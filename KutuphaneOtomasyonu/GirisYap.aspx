<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GirisYap.aspx.cs" Inherits="KutuphaneOtomasyonu.GirisYap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            height: 26px;
            width: 115px;
        }
        .auto-style4 {
            width: 115px;
        }
        .auto-style5 {
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <span class="auto-style2"><strong>YÖNETİCİ PANELİ</strong></span><table style="width:100%;">
        <tr>
            <td class="auto-style3">Kullanıcı Adı:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtKullaniciadi" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Şifre:</td>
            <td>
                <asp:TextBox ID="txtSifre" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
            <tr>
                <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="GİRİŞ YAP" Width="145px" CssClass="auto-style5" />
                </td>
            </tr>
    </table>
        <p>
            <asp:Label ID="girisBilgi" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
