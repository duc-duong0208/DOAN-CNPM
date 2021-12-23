<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="DatMon.aspx.cs" Inherits="QuanLyNhaHang.DatMon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="datmon4.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .mySlides {
            display: none;
        }

        .auto-style7 {
            width: 325px;
            height: 64px;
            font-family: 'Times New Roman';
            font-size: 20px;
            font-style: italic;
            padding-left: 30px;
        }

        .auto-style8 {
            height: 64px;
        }

        .auto-style11 {
            width: 325px;
            height: 71px;
            padding-left: 30px;
        }

        .auto-style12 {
            height: 71px;
            padding-left: 125px;
        }

        .auto-style13 {
            width: 325px;
            height: 72px;
            padding-left: 30px;
        }



        .auto-style14 {
            height: 72px;
            padding-left: 125px;
        }

        .auto-style15 {
            width: 325px;
            height: 116px;
            padding-left: 30px;
        }

        .auto-style16 {
            height: 116px;
        }

        .auto-style17 {
            width: 325px;
            font-family: 'Times New Roman';
            font-size: 20px;
            font-style: italic;
            height: 47px;
            padding-left: 30px;
        }

        .auto-style18 {
            width: 325px;
            height: 62px;
            padding-left: 30px;
        }

        .auto-style19 {
            height: 62px;
            padding-left: 125px;
        }

        .auto-style20 {
            height: 33px;
            font-size: 22px;
            font-family: 'Times New Roman';
        }

        .auto-style21 {
            width: 325px;
            height: 75px;
        }

        .auto-style22 {
            height: 75px;
        }

            .auto-style22 a {
                text-decoration: none;
                border-radius: 50% 50%;
                background-color: orangered;
                color: white;
                padding: 15px 15px;
                font-size: 23px;
                text-shadow: 1px 1px 2px, 0 0 25px, 0 0 5px;
            }

        .auto-style23 {
            height: 47px;
        }

        #themmon a {
            float: right;
            margin-right: 854px;
            text-decoration: none;
            border-radius: 50% 50%;
            background-color: coral;
            color: white;
            padding: 15px 15px;
            font-size: 20px;
            text-shadow: 1px 1px 2px, 0 0 25px, 0 0 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="left">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" BackColor="White" BorderColor="#999999" BorderWidth="1px" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowUpdating="GridView1_RowUpdating1" BorderStyle="Solid" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField HeaderText="Mã Món Ăn">
                    <ItemTemplate>
                        <asp:Label ID="mahangpk" runat="server" Text='<%# Bind("MaMonAn") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên Món Ăn">
                    <ItemTemplate>
                        <asp:Label ID="tenhangpk" runat="server" Text='<%# Bind("TenMonAn") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Đơn Giá">
                    <ItemTemplate>
                        <asp:Label ID="dongiapk" runat="server" Text='<%# Bind("DonGia") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Số Lượng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox44" runat="server" Text='<%# Bind("SoLuong") %>' ForeColor="White" Height="23px" Width="50px" BackColor="Black" TextMode="Number"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SoLuong") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Width="200px" Height="120px" ImageUrl='<%# "~/Images/" + Eval("HinhAnh")%>' />
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="thanhtien" HeaderText="Thành Tiền" />
                <asp:TemplateField ShowHeader="False" HeaderText="Chức Năng">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit"> <img src="Images/edit.png" width="50px" height="50px"/></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete"> <img src="Images/delete.png" width="50px" height="50px" /></asp:LinkButton>
                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        </br>
    <asp:Label ID="Label1" ForeColor="Red" Font-Bold="true" Font-Size="18px" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        </br>
        <div id="themmon">
                 </br>
            <asp:LinkButton ID="LinkButton5" Style="vertical-align: middle" runat="server" OnClick="LinkButton5_Click">Thêm Món</asp:LinkButton>
        </div>
    </div>
    <div class="right">
        <table style="width: 800px">
            <tr>
                <th colspan="2" class="auto-style20">Nhập Thông Tin Khách Hàng Đặt Món</th>
            </tr>
            <tr>
                <td class="auto-style7">1. Nhập thông tin khách hàng</td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style18">Anh/Chị:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButtonList ID="RadioButtonListanhchi" runat="server" RepeatDirection="Horizontal" Width="200px" Height="21px" RepeatLayout="Flow">
                        <asp:ListItem>Anh</asp:ListItem>
                        <asp:ListItem>Chị</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td class="auto-style19">Họ Tên: 
         <asp:TextBox ID="TextBox_hoten" runat="server" BackColor="White" BorderWidth="1px" Height="32px" Width="251px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">Ngày Đặt Món:</asp:TextBox><asp:TextBox ID="TextBox_ngay" runat="server" TextMode="Date"></asp:TextBox>
                </td>
                <td class="auto-style12">Phone:
                    <asp:TextBox ID="TextBox_phone" runat="server" Width="252px" TextMode="Phone"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style13">Thời gian:&nbsp; </asp:TextBox><asp:TextBox ID="TextBox_time" runat="server" Width="180px" TextMode="Time"></asp:TextBox>
                </td>
                <td class="auto-style14">Số lượng người:
                    <asp:TextBox ID="TextBox_sl" runat="server" Width="190px" TextMode="Number"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style17">2.Chọn hình thức đặt bàn</td>
                <td class="auto-style23"></td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:RadioButtonList ID="RadioButtonList_hinhthucchonban" runat="server" RepeatLayout="Flow">
                        <asp:ListItem>Bàn Bình Thường</asp:ListItem>
                        <asp:ListItem>Bàn Vip</asp:ListItem>
                        <asp:ListItem>Tiệc Gia Đình</asp:ListItem>
                        <asp:ListItem>Tiệc Công Ty</asp:ListItem>
                        <asp:ListItem>Tiệc Sinh Nhật</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td class="auto-style16">
                    <marquee id="marq" scrollamount="7" direction="right" loop="forever"
                        onmouseover="this.stop()" onmouseout="this.start()">
                     <a href="TrangChu.aspx"><img src="Images/chuyen-to-chuc-tiec.jpg" title="baohanh" width="300" height="120" id="baohanh" /> </a>
                     <a href="TrangChu.aspx"><img src="Images/chuyen-to-chuc-tiec.jpg" title="muatragop" width="300" height="120" id="muatragop" /> </a>
         <a href="TrangChu.aspx"><img src="Images/chuyen-to-chuc-tiec.jpg" title="sanpham"   width="300" height="120" id="lap1" /></a>
                <a href="TrangChu.aspx"><img src="Images/chuyen-to-chuc-tiec.jpg"  title="sanphamphukien"    width="300" height="120" id="lap2" /></a>
                      <a href="TrangChu.aspx"><img src="Images/chuyen-to-chuc-tiec.jpg"  title="sanpham"    width="300" height="120" id="lap5" /></a>
             <a href="TrangChu.aspx"><img src="Images/chuyen-to-chuc-tiec.jpg"  title="sanpham"    width="300" height="120" id="lap6" /> </a></marquee>
            </tr>

            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style22">&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Đặt Hàng</asp:LinkButton></td>
            </tr>
        </table>
    </div>
    <div class="main">
        </br>
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
