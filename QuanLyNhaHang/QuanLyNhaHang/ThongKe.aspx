<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLyAdmin.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="QuanLyNhaHang.ThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .timkiemthangnam {
            width: 1600px;
            height: 30px;
            font-size: 20px;
        }

        .cantrai {
            margin-left: 200px;
            float: left;
            font-size: 20px;
        }

        .canphai {
            margin-right: 200px;
            float: right;
            font-size: 20px;
        }
    </style>
    <link href="dsd.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <marquee id="marq" scrollamount="7" direction="left" loop="forever"
        onmouseover="this.stop()" onmouseout="this.start()"> <asp:Label ID="Label1" runat="server" Text="Thống Kê"></asp:Label></marquee>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="timkiemthangnam">
        <div class="cantrai">
            Chọn Tháng:&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="1">tháng một</asp:ListItem>
                <asp:ListItem Value="2">tháng hai</asp:ListItem>
                <asp:ListItem Value="3">tháng ba</asp:ListItem>
                <asp:ListItem Value="4">tháng tư</asp:ListItem>
                <asp:ListItem Value="5">tháng năm</asp:ListItem>
                <asp:ListItem Value="6">tháng sáu</asp:ListItem>
                <asp:ListItem Value="7">tháng bảy</asp:ListItem>
                <asp:ListItem Value="8">tháng tám</asp:ListItem>
                <asp:ListItem Value="9">tháng chín</asp:ListItem>
                <asp:ListItem Value="10">tháng mười</asp:ListItem>
                <asp:ListItem Value="11">tháng mười một</asp:ListItem>
                <asp:ListItem Value="12">tháng mười hai</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp; Chọn Năm:
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>2019</asp:ListItem>
                <asp:ListItem>2020</asp:ListItem>
                <asp:ListItem>2021</asp:ListItem>
                <asp:ListItem>2022</asp:ListItem>
                <asp:ListItem>2023</asp:ListItem>
                <asp:ListItem>2024</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Tìm Kiếm" />
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="canphai">
            Doanh Thu:
            <asp:Label ID="Label8" runat="server"></asp:Label>
            <a id="iddn" onclick="document.getElementById('id01').style.display='block'" style="width: auto;">Xem Danh Sách Đen </a>&nbsp;&nbsp;&nbsp;                

        </div>
    </div>
    </br>
    </br>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowUpdating="GridView1_RowUpdating1" Width="1600px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên Khách Hàng">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("HoTenKH") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("HoTenKH") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone_Number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("SDT") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("SDT") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số Lượng Người">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SoLuongNguoi") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SoLuongNguoi") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Ngày">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Ngay") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Ngay") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Time">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Time") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tổng Tiền">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxơ7" runat="server" Text='<%# Bind("TongTien") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("TongTien") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    </br>
    </br>
                 <div id="id01" class="modal1">

                     <div class="imgcontainer">
                         <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                     </div>

                     <div class="container2">
                         <h5>DANH SÁCH ĐEN</h5>
                         </br>
    </br>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowFooter="True" OnRowDeleting="GridView2_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowUpdating="GridView1_RowUpdating1" Width="1600px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:TemplateField HeaderText="ID">

                    <ItemTemplate>
                        <asp:Label ID="Label2122" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên Khách Hàng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4141" runat="server" Text='<%# Bind("HoTenKH") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label4141" runat="server" Text='<%# Bind("HoTenKH") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone_Number">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5151" runat="server" Text='<%# Bind("SDT") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label5151" runat="server" Text='<%# Bind("SDT") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hình Thức Đặt Bàn">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox100111" runat="server" Text='<%# Bind("HinhThucDatBan") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label100111" runat="server" Text='<%# Bind("HinhThucDatBan") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Số Lượng Người">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1111" runat="server" Text='<%# Bind("SoLuongNguoi") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label1111" runat="server" Text='<%# Bind("SoLuongNguoi") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ngày">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3211" runat="server" Text='<%# Bind("Ngay") %>' TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label3211" runat="server" Text='<%# Bind("Ngay") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6969" runat="server" Text='<%# Bind("Time") %>' TextMode="Time"></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label6969" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tổng Tiền">


                    <ItemTemplate>
                        <asp:Label ID="Label7669" runat="server" Text='<%# Bind("TongTien") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tình Trạng Thanh Toán">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox77669" runat="server" Text='<%# Bind("TinhTrangTT") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label77999" runat="server" Text='<%# Bind("TinhTrangTT") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" HeaderText="Chức Năng">
                    <ItemTemplate>
                        &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>




                     </div>

                 </div>

    <script>
        // Get the modal
        var modal = document.getElementById('id01');

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>

</asp:Content>
