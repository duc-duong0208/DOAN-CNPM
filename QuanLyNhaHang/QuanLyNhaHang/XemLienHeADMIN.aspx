<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLyAdmin.Master" AutoEventWireup="true" CodeBehind="XemLienHeADMIN.aspx.cs" Inherits="QuanLyNhaHang.XemLienHeADMIN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <marquee id="marq" scrollamount="7" direction="left" loop="forever"  
                        onmouseover="this.stop()" onmouseout="this.start()"> <asp:Label ID="Label1" runat="server" Text="Nội Dung Liên Hệ"></asp:Label></marquee>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1"  OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowUpdating="GridView1_RowUpdating1" Width="1600px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" >
                <Columns>
                     <asp:TemplateField HeaderText="Mã Liên Hệ"> 
                       <ItemTemplate>
                            <asp:Label ID="Label21" runat="server" Text='<%# Bind("MaLH") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Họ Tên Liên Hệ">
                          <EditItemTemplate>
                    <asp:TextBox ID="TextBox111" runat="server" Text='<%# Bind("HoTenLH") %>'></asp:TextBox>
                </EditItemTemplate>
              
                        <ItemTemplate>
                            <asp:Label ID="Label41" runat="server" Text='<%# Bind("HoTenLH") %>'></asp:Label>
                        </ItemTemplate>     
                          <FooterStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                      <asp:TemplateField HeaderText="Điện Thoại">
                           <EditItemTemplate>
                    <asp:TextBox ID="TextBox1122" runat="server" Text='<%# Bind("DienThoai") %>'></asp:TextBox>
                </EditItemTemplate>
             
                        <ItemTemplate>
                            <asp:Label ID="Label411" runat="server" Text='<%# Bind("DienThoai") %>'></asp:Label>
                        </ItemTemplate>     
                          <FooterStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                      <asp:TemplateField HeaderText="Email">
                           <EditItemTemplate>
                    <asp:TextBox ID="TextBox11123" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
           
                        <ItemTemplate>
                            <asp:Label ID="Label4111" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                        </ItemTemplate>     
                          <FooterStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                      <asp:TemplateField HeaderText="Nội Dung">
                           <EditItemTemplate>
                    <asp:TextBox ID="TextBox1211" runat="server" Text='<%# Bind("NoiDung") %>'></asp:TextBox>
                </EditItemTemplate>
         
                        <ItemTemplate>
                            <asp:Label ID="Label441" runat="server" Text='<%# Bind("NoiDung") %>'></asp:Label>
                        </ItemTemplate>     
                          <FooterStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                     <asp:TemplateField HeaderText="Thời Gian Liên Hệ">
                          <EditItemTemplate>
                    <asp:TextBox ID="TextBox111231" runat="server" Text='<%# Bind("TimeLH") %>'></asp:TextBox>
                </EditItemTemplate>
             
                        <ItemTemplate>
                            <asp:Label ID="Label4411" runat="server" Text='<%# Bind("TimeLH") %>'></asp:Label>
                        </ItemTemplate>     
                          <FooterStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>                              
                     <asp:TemplateField HeaderText="Next Email">
                         <ItemTemplate>
                             <a href="https://mail.google.com/">Next Email</a>
                         </ItemTemplate>
                         <FooterStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" />
                     </asp:TemplateField>
                     <asp:TemplateField ShowHeader="False" HeaderText="Chức Năng">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" ForeColor="#66FFFF" Font-Underline="False" BackColor="#333333" BorderColor="Black" BorderStyle="Outset"></asp:LinkButton>
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
</asp:Content>
