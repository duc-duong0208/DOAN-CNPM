<%@ Page Title="" Language="C#" MasterPageFile="~/tanggiambanchay.Master" AutoEventWireup="true" CodeBehind="timkiem.aspx.cs" Inherits="QuanLyNhaHang.timkiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" CssClass="auto-style1" >
        <ItemTemplate>
            <div class="container" > 
                 <asp:LinkButton ID="LinkButton3"  CommandArgument='<%# Eval("MaMonAn") %>' OnClick="LinkButton3_Click" runat="server" text-algin="center">
                     <img  ID="Image1" src="<%# "Images/" +Eval("HinhAnh") %>" Height="300" Width="630" />
                     <div class="overlay"> <%# Eval("TenMonAn") %>
                      <div class="gia">
                      <%#Eval("DonGia","{0:0,0 }") %>
                     </div>
                    </div>
                 </div>           
           </asp:LinkButton>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
