<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="QuanLyNhaHang.LienHe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="lienhe.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khung">

        <div class="khungtrai">
            Mọi chi tiết xin liên hệ:
            </br>
             </br>
            <asp:Label ID="lb_nhahang" runat="server" Text="Nhà Hàng TTHQ Restaurants" Font-Size="20" Font-Bold="True"></asp:Label>
            </br>
             </br>
               </br>
          Địa chỉ: k131 - Lý Thái Tổ - Thanh Khê - Đà Nẵng
           </br>
             </br>
               </br>
            Điện thoại: 0944889999
             </br>
             </br>
               </br>
          Tư vấn & nhận tiệc: 0944889999
            </br>
             </br>
               </br>
            Emai:<a href="https://gmail.com/"> tthq_restaurants239@gmail.com</a>
            </br>
               </br>
             </br>
            Facebook:<a href="https://www.tthqrestaurants.com"> tthq_restaurants239@gmail.com</a>
        </div>
        <div class="khungphai">
            <div class="khungtren">
                <a>LIÊN HỆ</a>
            </div>
            <div class="khungduoi">
                <div class="khungduoitrong">

                    <asp:TextBox ID="txt_hoten" placeholder=" Nhập Họ Và Tên" runat="server" Width="100%" Height="40px" ForeColor="White" Font-Size="14"></asp:TextBox>
                    </br>
             </br>       
                     <asp:TextBox ID="txt_dienthoai" placeholder="Điện Thoại:" runat="server" Width="100%" Height="40px" ForeColor="White" Font-Size="14"></asp:TextBox>
                    </br>
             </br>
                     <asp:TextBox ID="txtemail" placeholder=" Nhập Email:" runat="server" Width="100%" Height="40px" ForeColor="White" Font-Size="14"></asp:TextBox>
                    </br>
             </br>
                     <asp:TextBox ID="txtnoidung" placeholder=" Nhập Nội Dung:" runat="server" Width="100%" Height="100px" ForeColor="White" Font-Size="14"></asp:TextBox>
                    </br>
             </br>
                     <div class="gui">

                         <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">GỬI</asp:LinkButton>
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
    <div class="bando">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3833.9855102123793!2d108.20642121478537!3d16.066241688882727!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219fbf01196f3%3A0x9a3a91800ef99441!2sTTHQ%20Restaurant!5e0!3m2!1svi!2s!4v1603895856191!5m2!1svi!2s" width="100%" height="550" frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>
</asp:Content>
