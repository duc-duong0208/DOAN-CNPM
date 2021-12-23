<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="DatHang.aspx.cs" Inherits="QuanLyNhaHang.DatHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="dathang.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style4 {
            width: 2024px;
            font-size: 20px;
        }
        .auto-style8 {
            width: 2024px;
            font-size: 20px;
            color:red;
        }
        .auto-style20{
            color:red;
            font-size:22px;
        }
      
        .auto-style23 {
            width: 1342px;
        }
        .auto-style25 {
            width: 1342px;
            height: 87px;
            font-size:20px;
        }
        .auto-style26 {
            font-weight: bold;
        }
        .auto-style28 {
            width: 1133px;
        }
        .auto-style29 {
            width: 2024px;
            height: 87px;
            font-size: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="chay" class="auto-style28">
        <div id="chaychu">
<marquee id="marq" scrollamount="7" direction="left" loop="forever"  
                        onmouseover="this.stop()" onmouseout="this.start()">
                   <h2>Chúc Quý Khách Ăn Ngon Miệng</h2></marquee>        </div>
    </div>
    <div class="outer">
    <div class="left">
      <table style="width:1000px">
  <tr>
    <th colspan="2" class="auto-style20">Thông Tin Đặt Hàng</th>
  </tr>
        <tr>
    <td class="auto-style29"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.Thông tin khách hàng<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label><strong>: </strong> <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
      
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phone: <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label> 
 
&nbsp; 
           
            </td>
     <td class="auto-style25">
        <strong>2. Hình thức đặt bàn<br />
        &nbsp;&nbsp; </strong> <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp; 
         
&nbsp;&nbsp; 
         <br />
&nbsp;&nbsp; Số lượng người: <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label> (Người)</td>
  </tr>
           <tr>
    <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ngày Đặt Món: <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label> 
   
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thời gian:&nbsp; <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label> 
               </td>
     <td class="auto-style23">&nbsp;</td>
  </tr>
  <tr>
          <th colspan="2" class="auto-style21">  
 
        &nbsp;&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" BackColor="White" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="100%" >
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                     
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
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("SoLuong") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField HeaderText="Hình Ảnh"> <ItemTemplate> <asp:Image ID="Image1" runat="server" Width="200px" Height="120px" ImageUrl='<%# "~/Images/" + Eval("HinhAnh")%>'/> </ItemTemplate> </asp:TemplateField>
                     <asp:BoundField DataField="thanhtienpk" HeaderText="Thành Tiền" />
                 
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
            </th>
  
     
 
   <tr>
    <td class="auto-style8">&nbsp;<b>Tổng Thành Tiền:&nbsp; </b> 
    <asp:Label ID="Label1" ForeColor="#FF3300" Font-Bold="true" Font-Size="20px"  runat="server" CssClass="auto-style26"></asp:Label>
        <b>&nbsp;VND</b></td>
     <td class="auto-style23">&nbsp;</td>
  </tr> 
       
      
              
</table>
    </br>
        </div>
    <div class="right">
                <div class="khungphai">
             <div class="khungtren">
             <a>LIÊN HỆ</a>
             </div>
             <div class="khungduoi">
                 <div class="khungduoitrong">
                     
                            <asp:TextBox ID="txt_hoten"  placeholder=" Nhập Họ Và Tên" runat="server" Width="100%" Height="40px" ForeColor="White" Font-Size="14"></asp:TextBox>
                      </br>
             </br>       
                     <asp:TextBox ID="txt_dienthoai"  placeholder="Điện Thoại:" runat="server" Width="100%" Height="40px" ForeColor="White" Font-Size="14"></asp:TextBox>
                   </br>
             </br>
                     <asp:TextBox ID="txtemail"  placeholder=" Nhập Email:" runat="server" Width="100%" Height="40px" ForeColor="White" Font-Size="14"></asp:TextBox>
                     </br>
             </br>
                     <asp:TextBox ID="txtnoidung"  placeholder=" Nhập Nội Dung:" runat="server" Width="100%" Height="100px" ForeColor="White" Font-Size="14"></asp:TextBox>
                      </br>
             </br>
                     <div class="gui">
                        <asp:LinkButton ID="idgui" runat="server" OnClick="idgui_Click">GỬI</asp:LinkButton>
                     </div>
                      </br>
             </br>
                      
                      <a>Hotline: 0944889999</a></br>
             </br>
                     </br>
             </br>
                 </div>
                             
             </div>
         </div>

        </div>
        </div>
</asp:Content>
