<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLyAdmin.Master" AutoEventWireup="true" CodeBehind="QLDHADMIN.aspx.cs" Inherits="QuanLyNhaHang.QLDHADMIN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <marquee id="marq" scrollamount="7" direction="left" loop="forever"  
                        onmouseover="this.stop()" onmouseout="this.start()"> <asp:Label ID="Label1" runat="server" Text="Quản Lý Đơn hàng"></asp:Label></marquee>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1"  OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowUpdating="GridView1_RowUpdating1" Width="1600px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" >
                <Columns>
                     <asp:TemplateField HeaderText="ID">
                       
                        <ItemTemplate>
                            <asp:Label ID="Label21" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Tên Khách Hàng">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("HoTenKH") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_tenkhachhang" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label41" runat="server" Text='<%# Bind("HoTenKH") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Phone_Number">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox51" runat="server" Text='<%# Bind("SDT") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_sdt" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label51" runat="server" Text='<%# Bind("SDT") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Hình Thức Đặt Bàn">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1001" runat="server" Text='<%# Bind("HinhThucDatBan") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="txt_htdb" runat="server">
                                <asp:ListItem>Bàn Bình Thường</asp:ListItem>
                                <asp:ListItem>Bàn Vip</asp:ListItem>
                                <asp:ListItem>Tiệc Gia Đình</asp:ListItem>
                                <asp:ListItem>Tiệc Sinh Nhật</asp:ListItem>
                                <asp:ListItem>Tiệc Công Ty</asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1001" runat="server" Text='<%# Bind("HinhThucDatBan") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số Lượng Người">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("SoLuongNguoi") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_sl" runat="server" TextMode="Number"></asp:TextBox>
                        </FooterTemplate>
                         <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("SoLuongNguoi") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                       <asp:TemplateField HeaderText="Ngày">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox32" runat="server" Text='<%# Bind("Ngay") %>' TextMode="Date"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_ngay" runat="server" TextMode="Date"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label32" runat="server" Text='<%# Bind("Ngay") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Time">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox69" runat="server" Text='<%# Bind("Time") %>' TextMode="Time"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_time" runat="server" TextMode="Time"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label69" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Tổng Tiền">
                       
                        <FooterTemplate>
                            <asp:TextBox ID="txt_tongtien" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label79" runat="server" Text='<%# Bind("TongTien") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tình Trạng Thanh Toán">
                         <EditItemTemplate>
                            <asp:TextBox ID="TextBox779" runat="server" Text='<%# Bind("TinhTrangTT") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_tttt" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label779" runat="server" Text='<%# Bind("TinhTrangTT") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" HeaderText="Chức Năng">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"></asp:LinkButton>
                        </EditItemTemplate>
                       
                        <FooterTemplate>
                            <asp:Button ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click1" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"/>
                        </FooterTemplate>
                       
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>                
                     <asp:TemplateField HeaderText="xem">
                         <ItemTemplate>
                             <asp:Button ID="Button1" runat="server" Text="Xem Chi Tiết" CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click" style="height: 29px" />
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
</asp:Content>

