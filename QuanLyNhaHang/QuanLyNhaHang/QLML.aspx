<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLyAdmin.Master" AutoEventWireup="true" CodeBehind="QLML.aspx.cs" Inherits="QuanLyNhaHang.QLML" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <marquee id="marq" scrollamount="7" direction="left" loop="forever"  
                        onmouseover="this.stop()" onmouseout="this.start()"> <asp:Label ID="Label2" runat="server" Text="Quản Lý Mã Loại"></asp:Label></marquee>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1"  OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowUpdating="GridView1_RowUpdating1" Width="1600px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" >
                <Columns>
                     <asp:TemplateField HeaderText="Mã Loại"> 
                         <FooterTemplate>
                            <asp:TextBox ID="txt_loaimonan" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label21" runat="server" Text='<%# Bind("MaLoaiMon") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Tên Loại Món">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("TenLoaiMon") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txttenloai" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label41" runat="server" Text='<%# Bind("TenLoaiMon") %>'></asp:Label>
                        </ItemTemplate>     
                          <FooterStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" />
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
                        <FooterStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>                
                     <asp:TemplateField HeaderText="xem">
                         <ItemTemplate>
                             <asp:Button ID="Button1" runat="server" Text="Quản Lý Sản Phẩm" CommandArgument='<%# Eval("MaLoaiMon") %>' OnClick="Button1_Click" style="height: 29px" />
                         </ItemTemplate>
                         <FooterStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" />
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
