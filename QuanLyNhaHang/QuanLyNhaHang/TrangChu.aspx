<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="QuanLyNhaHang.TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="trangchu4.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .mySlides {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menusp">
        <a href="GiaTangDan.aspx">Giá Tăng Dần</a>
        <a href="BanChay.aspx">Bán Chạy</a>
        <a href="GiamDan.aspx">Giá Giảm Dần</a>
    </div>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" CssClass="auto-style1">
        <ItemTemplate>
            <div class="container">
                <asp:LinkButton ID="LinkButton3" CommandArgument='<%# Eval("MaMonAn") %>' OnClick="LinkButton3_Click" runat="server" text-algin="center">
                     <img  ID="Image1" src="<%# "Images/" +Eval("HinhAnh") %>" Height="330" Width="630" />
                     <div class="overlay"> <%# Eval("TenMonAn") %>
                      <div class="gia">
                      <%#Eval("DonGia","{0:0,0 }") %>
                     </div>
                    </div>
            </div>
            </asp:LinkButton>
        </ItemTemplate>
    </asp:DataList>
    <div class="mainr">
    </br>
            
    <h2>PHỤC VỤ TIỆC NHÀ HÀNG</h2>
    </br>
            <div class="hero-image">
                <div class="hero-text">
                    <h1 style="font-size: 50px">Phục Vụ Tiệc Chuyên Nghiệp</h1>
                    <h4>0944889999</h4>
                    <a href="ThucDonTiec.aspx">Xem</a>
                </div>
            </div>

    </br>
    <h2>KHÔNG GIAN NHÀ HÀNG</h2>
    </br>
            <div id="trai">
                <img class="mySlides w3-animate-right" src="Images/KGNH/tiectrongnha.jpg" style="width: 1900px; height: 600px;">
                <img class="mySlides w3-animate-left" src="Images/KGNH/ngoaitroi.jpg" style="width: 1900px; height: 600px;">
                <img class="mySlides w3-animate-right" src="Images/KGNH/vip2.jpg" style="width: 1900px; height: 600px;">
                <img class="mySlides w3-animate-left" src="Images/KGNH/noi-to-chuc-tiec-tat-nien-tot-nhat-sai-gon-tn.jpg" style="width: 1900px; height: 600px;">
                <img class="mySlides w3-animate-left" src="Images/KGNH/sinhnhat.jpg" style="width: 1900px; height: 600px;">
                <img class="mySlides w3-animate-left" src="Images/KGNH/bep.jpg" style="width: 1900px; height: 600px;">
            </div>
        </div>
    <script>
        var myIndex = 0;
        carousel();
        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) { myIndex = 1 }
            x[myIndex - 1].style.display = "block";
            setTimeout(carousel, 2500);
        }
    </script>
</asp:Content>
