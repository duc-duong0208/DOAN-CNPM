<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="ThucDonTiec.aspx.cs" Inherits="QuanLyNhaHang.ThucDonTiec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

            body h3 {
                color: red;
                font-size: 22px;
                font-family: 'Times New Roman';
                margin-left: 50px;
            }

        .column {
            float: left;
            width: 25%;
            padding: 5px;
            height: 261px;
            padding-left: 10%;
        }

        .row:after {
            display: table;
        }

        .tong {
            margin-left: 190px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Tùy vào nhu cầu của mỗi buổi tiệc, Nhà hàng TTHQ Restaurant sẽ giúp bạn lựa chọn một thực đơn tiệc phù hợp trong danh sách các thực đơn tiệc phong phú và ngon miệng hiện có tại nhà hàng. </h3>
    <h3>Sau đây là một số thực đơn tiệc để Quý khách tham khảo:</h3>
    <br>
    <div class="tong">
        <div class="row">
            <div class="column" style="background-color: #ddd;">
                <div class="wpb_wrapper">
                    <p><strong>•</strong><strong>&nbsp;THỰC ĐƠN 1: 2.370.000 VNĐ</strong></p>
                    <p>
                        1. Súp Cua Bắp Mỹ, Gà Xé, Nấm Hương<br>
                        2. Cá Phile Sốt Chanh Dây<br>
                        3. Sườn Hầm Tiêu Xanh- Bánh Mì<br>
                        4.&nbsp; Lẩu Gà Nấu Nấm – Mì Sợi<br>
                        5. Trái Cây Dưa Hấu
                    </p>

                </div>
            </div>
            <div class="column" style="background-color: #ddd;">
                <div class="wpb_wrapper">
                    <p><strong>• THỰC ĐƠN 2: 2.695.000 <strong>VNĐ</strong></strong></p>
                    <p>
                        1. Khai Vị 3 Món :<br>
                        – Gỏi Củ Hủ Dừa Tôm Thịt<br>
                        – Chả Giò Hải Sản<br>
                        – Mực Sữa Chiên Nước Mắm<br>
                        2. Cá&nbsp; Phile Sốt Cam Úc<br>
                        3. Sườn Nấu Pate Pháp – Bánh Mì<br>
                        4. Lẩu Gà Tiềm Ớt Hiểm – Mì Sợi<br>
                        5. Trái Cây Thơm, Dưa Hấu
                    </p>

                </div>
            </div>
            <div class="column" style="background-color: #ddd;">
                <div class="wpb_wrapper">
                    <p><strong>• THỰC ĐƠN 3: 2.993.000 <strong>VNĐ</strong></strong></p>
                    <p>
                        1. Khai Vị 3 Món:<br>
                        – Gỏi Bò Tắc Non Cà Pháo<br>
                        – Chả Giò&nbsp;Quá Ngon<br>
                        – Mực Chiên Giòn<br>
                        2. Cá Phile Đút Lò<br>
                        3. Sườn Hầm Tỏi – Bánh Mì<br>
                        4. Lẩu Thái Hải Sản – Bún Tươi<br>
                        5. Trái Cây Thơm, Dưa hấu
                    </p>

                </div>
            </div>
            <div class="column" style="background-color: #ddd;">
                <div class="wpb_wrapper">
                    <p><strong>• THỰC ĐƠN 4: Theo thời giá</strong></p>
                    <p>
                        1. Khai Vị 3 Món:<br>
                        – Gỏi Ngó Sen Tôm Thịt<br>
                        – Cá Phile Tẩm Mè<br>
                        – Mực Chiên Giòn<br>
                        2. Sườn Cây Sốt Mật Ong<br>
                        3. Tôm Sú Hấp Nước Dừa<br>
                        4. Đùi Gà Nướng BBQ<br>
                        5. Lẩu Cá Lăng Măng Chua – Bún Tươi<br>
                        6. Trái Cây Thơm, Dưa hấu
                    </p>

                </div>
            </div>
            <div class="column" style="background-color: #ddd;">
                <div class="wpb_wrapper">
                    <p style="text-align: left;"><strong>• THỰC ĐƠN 5:&nbsp;Theo thời giá</strong></p>
                    <p>
                        1. Khai Vị 3 Món :<br>
                        – Gỏi Bò Bóp Thấu<br>
                        – Chả Giò Hải Sản<br>
                        – Mực Sữa Chiên Nước Mắm<br>
                        2. Cá Tầm Nướng Muối Ớt<br>
                        3. Tôm Sú Cháy Tỏi<br>
                        4. Gà Mái Dầu Hấp Mắm Nhĩ- Xôi Hạt Sen<br>
                        5. Lẩu Nấm Hải Sản – Mì Sợi<br>
                        6. Trái Cây Theo Mùa
                    </p>

                </div>
            </div>
            <div class="auto-style2" style="background-color: #ddd;">
                <div class="wpb_wrapper">
                    <p><strong>• THỰC ĐƠN 6:&nbsp;Theo thời giá</strong></p>
                    <p>
                        1. Khai Vị 3 Món :<br>
                        – Gỏi Xoài Tôm Khô Cá Sặc, Cá Dứa<br>
                        – Chả Giò&nbsp;Quá Ngon<br>
                        – Mực Chiên Giòn<br>
                        2. Gà Mái Dầu Nướng Muối Ớt<br>
                        3. Tôm Sú Hoàng Kim<br>
                        4. Cá Mú Hấp HongKong<br>
                        5. Lẩu Thái Hải Sản – Bún Tươi<br>
                        6. Trái Cây Theo Mùa
                    </p>

                </div>
            </div>
            <div class="column" style="background-color: #ddd;">
                <div class="wpb_wrapper">
                    <p><strong>• THỰC ĐƠN 7: <strong>Theo Thời Giá&nbsp;</strong></strong></p>
                    <p>
                        1. Gà Đông Tảo 2 Món :<br>
                        – Lòng Da Thịt Tái Chanh<br>
                        – Lẩu Hầm Sả<br>
                        2. Tôm Sú Nướng Muối Ớt<br>
                        3. Giò Heo Muối Chiên Giòn<br>
                        4. Cá Mú Hấp HongKong<br>
                        5. Rau Câu Trái Cây
                    </p>

                </div>
            </div>
            <div class="column" style="background-color: #ddd;">
                <div class="wpb_wrapper">
                    <p><strong>• THỰC ĐƠN 8: <strong>Theo Thời Giá</strong></strong></p>
                    <p>
                        1. Bát Bữu Thịt Nguội<br>
                        2. Heo Tộc Quay Lu Chặt Mẹt<br>
                        3. Cá Chình Bông Nướng Muối Ớt<br>
                        4. Tôm Càng Nướng Phô&nbsp; Mai<br>
                        5. Lẩu Vua<br>
                        6. Nho Mỹ
                    </p>
                </div>
            </div>
            <div class="column" style="background-color: #ddd;">
                <div class="wpb_wrapper">
                    <p><strong>• THỰC ĐƠN 9: 2.695.000 <strong>VNĐ</strong></strong></p>
                    <p>
                        1. Khai Vị 3 Món :<br>
                        – Gỏi Củ Hủ Dừa Tôm Thịt<br>
                        – Chả Giò Hải Sản<br>
                        – Mực Sữa Chiên Nước Mắm<br>
                        2. Cá&nbsp; Phile Sốt Cam Úc<br>
                        3. Sườn Nấu Pate Pháp – Bánh Mì<br>
                        4. Lẩu Gà Tiềm Ớt Hiểm – Mì Sợi<br>
                        5. Trái Cây Thơm, Dưa Hấu
                    </p>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
