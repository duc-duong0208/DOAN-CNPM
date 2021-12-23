<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="ChiTietSP.aspx.cs" Inherits="QuanLyNhaHang.ChiTietSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="ChiTietSP2.css" rel="stylesheet" />
          <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0" nonce="FieZyJQj"></script>
    <asp:DataList ID="DataList1" runat="server">
      <ItemTemplate>

            <div class="motsp">           
             <div id="left">
             <img  ID="myImg" src="<%# "Images/" +Eval("HinhAnh") %>" Height="300" Width="630" />  
              <div id="ds">
                <div class="gia">
                <%#Eval("DonGia","{0:0,0,0}") %>
                </div> 
                <div id="thanhngang">
                <asp:Label ID="Label4" ForeColor="White" runat="server" Text='<%# Eval("tym") %>' Font-Size="11"></asp:Label>
                </div>
                <div id="thanhngang2">     
                    <asp:LinkButton ID="LinkButton2"  CommandArgument='<%# Eval("MaMonAn") %>' runat="server" OnClick="LinkButton2_Click"> <img Width="20px" Height="18px"  src="Images/icons8-aed-40.png" /></asp:LinkButton>
                </div>
              </div>   
              </div>
              <div id="right">
              <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="25px" ForeColor="Red" Text='<%# Eval("TenMonAn") %>'></asp:Label>             
                  </br>            
                </br>
                  &nbsp;
                  <asp:Label ID="Label2" runat="server" Font-Size="20px" Text='<%# Eval("MoTa") %>'></asp:Label>
                  <br>
                 </br>
                  <br>
                </br>
                  <div id="nhapsl">
                      &nbsp;
                      <asp:TextBox ID="TextBox1" runat="server" BackColor="White" BorderColor="#FF3300" BorderStyle="Inset" Height="35px" placeholder="Số Lượng" TextMode="Number" Width="120px"></asp:TextBox>
                      <br>
                     </br>
                      <br>
                </br>
                  </div>
                  <div id="f">
                      <div id="rung">
                          <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("MaMonAn") %>' Font-Size="30px" OnClick="LinkButton1_Click">
                <img src="Images/datmon.png" Width="30px" />
                Thêm Món</asp:LinkButton>
                      </div>
                  </div>
                  <div id="share">
                      <br>
                      <br>
                      <br></br>
                      <div class="fb-share-button" data-href="https://www.facebook.com/TTHQ-Restaurant-103210365069380" data-layout="button_count" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.facebook.com%2FTTHQ-Restaurant-103210365069380&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>
                      
                  </br>
        
               
</div>
                </div>
                </div>
        </ItemTemplate>
    </asp:DataList>
    <div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div>
    <script>
var modal = document.getElementById("myModal");

var img = document.getElementById("myImg");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}

var span = document.getElementsByClassName("close")[0];
span.onclick = function() { 
  modal.style.display = "none";
}
    </script>
    
     <div class="main">
     </br>
     </br>
    <h2 >PHỤC VỤ TIỆC NHÀ HÀNG</h2>
            <div class="hero-image">
  <div class="hero-text">
    <h1 style="font-size:50px">Phục Vụ Tiệc Chuyên Nghiệp</h1>
    <h4>0944889999</h4>
    <a href="ThucDonTiec.aspx">Xem</a>
  </div>
</div>
         </br>
     </br>
            <h2>KHÔNG GIAN NHÀ HÀNG</h2>
            <div id="trai">
    <img class="mySlides w3-animate-right" src="Images/KGNH/tiectrongnha.jpg" style="width:1900px; height:600px;">
  <img class="mySlides w3-animate-left" src="Images/KGNH/ngoaitroi.jpg" style="width:1900px; height:600px;">
  <img class="mySlides w3-animate-right" src="Images/KGNH/vip2.jpg"style="width:1900px; height:600px;">
  <img class="mySlides w3-animate-left" src="Images/KGNH/noi-to-chuc-tiec-tat-nien-tot-nhat-sai-gon-tn.jpg" style="width:1900px; height:600px;">
  <img class="mySlides w3-animate-left" src="Images/KGNH/sinhnhat.jpg" style="width:1900px; height:600px;">
  <img class="mySlides w3-animate-left" src="Images/KGNH/bep.jpg" style="width:1900px; height:600px;">
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
         </div>
</asp:Content>
