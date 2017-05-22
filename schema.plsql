/* connect as SYSDBA */

/* Script tao bang */
-- Chi Nhanh
create table ChiNhanh
(
       maCN varchar2(10) not null,
       tenCN varchar(20) not null,
       truongChiNhanh varchar2(10),
       constraint PK_ChiNhanh primary key (maCN)
);
-- Chi Tieu
create table ChiTieu
(
       maChiTieu varchar2(10) not null,
       tenChiTieu varchar2(20) not null,
       soTien number(10) not null,
       duAn varchar2(10),
       constraint PK_ChiTieu primary key (maChiTieu)
);
-- Nhan Vien
create table NhanVien
(
       maNV varchar2(10) not null,
       hoTen varchar(20) not null,
       diaChi varchar2(50) not null,
       dienThoai varchar2(11) not null,
       email varchar2(20) not null,
       maPhong varchar2(10),
       chiNhanh varchar2(10),
       luong number(10) not null,
       constraint PK_NhanVien primary key (maNV)
);
-- Phan Cong
create table PhanCong
(
       maNV varchar2(10) not null,
       duAn varchar2(10) not null,
       vaiTro varchar(20) not null,
       phuCap number(10) not null,
       constraint PK_PhanCong primary key (maNV, duAn)
);
-- Phong Ban
create table PhongBan
(
       maPhong varchar2(10) not null,
       tenPhong varchar2(20) not null,
       truongPhong varchar2(10),
       ngayNhanChuc date,
       soNhanVien int,
       chiNhanh varchar2(10),
       constraint PK_PhongBan primary key (maPhong)
);
-- Du An
create table DuAn
(
       maDA varchar2(10) not null,
       tenDA varchar2(20) not null,
       kinhPhi number(10) not null,
       phongChuTri varchar(10),
       truongDA varchar(10),
       constraint PK_DuAn primary key (maDA)
);
alter table ChiNhanh add constraint FK_ChiNhanh_NhanVien foreign key (truongChiNhanh) references NhanVien(maNV);
alter table ChiTieu add constraint FK_ChiTieu_DuAn foreign key (duAn) references DuAn(maDA);
alter table NhanVien add constraint FK_NhanVien_ChiNhanh foreign key (chiNhanh) references ChiNhanh(maCN);
alter table NhanVien add constraint FK_NhanVien_PhongBan foreign key (maPhong) references PhongBan(maPhong);
alter table PhanCong add constraint FK_PhanCong_NhanVien foreign key (maNV) references NhanVien(maNV);
alter table PhanCong add constraint FK_PhanCong_DuAn foreign key (duAn) references DuAn(maDA);
alter table PhongBan add constraint FK_PhongBan_ChiNhanh foreign key (chiNhanh) references ChiNhanh(maCN);
alter table DuAn add constraint FK_DuAn_PhongBan foreign key (phongChuTri) references PhongBan(maPhong);
alter table DuAn add constraint FK_DuAn_NhanVien foreign key (truongDA) references NhanVien(maNV);

/* Script them du lieu */

insert into ChiNhanh values ('CN-HCM', 'CN Ho Chi Minh', null);
insert into ChiNhanh values ('CN-HN', 'CN Ha Noi', null);
insert into ChiNhanh values ('CN-DN', 'CN Da Nang', null);

insert into PhongBan values ('PB-HCM-NS', 'Phong Nhan Su', null, null, null, 'CN-HCM');
insert into PhongBan values ('PB-HCM-KT', 'Phong Ke Toan', null, null, null, 'CN-HCM');
insert into PhongBan values ('PB-HCM-KH', 'Phong Ke Hoach', null, null, null, 'CN-HCM');
insert into PhongBan values ('PB-HN-NS', 'Phong Nhan Su', null, null, null, 'CN-HN');
insert into PhongBan values ('PB-HN-KT', 'Phong Ke Toan', null, null, null, 'CN-HN');
insert into PhongBan values ('PB-HN-KH', 'Phong Ke Hoach', null, null, null, 'CN-HN');
insert into PhongBan values ('PB-DN-NS', 'Phong Nhan Su', null, null, null, 'CN-DN');
insert into PhongBan values ('PB-DN-KT', 'Phong Ke Toan', null, null, null, 'CN-DN');
insert into PhongBan values ('PB-DN-KH', 'Phong Ke Hoach', null, null, null, 'CN-DN');

insert into NhanVien values ('NV001', 'Tran Van A', '256 Huynh Thuc Khang', '0901236732', 'nva@gmail.com', 'PB-HCM-NS', 'CN-HCM', 8000000);
insert into NhanVien values ('NV002', 'Nguyen Van B', '223 Luong Dinh Cua', '0902534731', 'nvb@gmail.com', 'PB-HCM-NS', 'CN-HCM', 8000000);
insert into NhanVien values ('NV003', 'Hoang Thi C', '44 Ly Thai To', '0942347613', 'nvc@gmail.com', 'PB-HCM-KT', 'CN-HCM', 7000000);
insert into NhanVien values ('NV004', 'Ly Thi D', '325 Nguyen Van Cu', '01672345344', 'nvd@gmail.com', 'PB-HCM-KT', 'CN-HCM', 7000000);
insert into NhanVien values ('NV005', 'Tra Van E', '33 Ly Thuong Kiet', '0945692415', 'nve@gmail.com', 'PB-HCM-KH', 'CN-HCM', 9000000);
insert into NhanVien values ('NV006', 'Hua Thi F', 'F34 Mac Dinh Chi', '01681231412', 'nvf@gmail.com', 'PB-HCM-KH', 'CN-HCM', 9000000);
insert into NhanVien values ('NV007', 'Tran Van G', '33 Hang Vong', '0914567539', 'nvg@gmail.com', 'PB-HN-NS', 'CN-HN', 8000000);
insert into NhanVien values ('NV008', 'Nguyen Van H', 'E21 Hang Com', '01647891456', 'nvh@gmail.com', 'PB-HN-NS', 'CN-HN', 8000000);
insert into NhanVien values ('NV009', 'Hoang Thi I', '44 Hang Ma', '01671112456', 'nvi@gmail.com', 'PB-HN-KT', 'CN-HN', 7000000);
insert into NhanVien values ('NV010', 'Ly Thi J', 'F67 Hang La', '0914256325', 'nvj@gmail.com', 'PB-HN-KT', 'CN-HN', 7000000);
insert into NhanVien values ('NV011', 'Tra Van K', 'S19 Pho Lang Thon', '0904444456', 'nvk@gmail.com', 'PB-HN-KH', 'CN-HN', 9000000);
insert into NhanVien values ('NV012', 'Hua Thi L', '672 Hang Xanh', '01688881414', 'nvl@gmail.com', 'PB-HN-KH', 'CN-HN', 9000000);
insert into NhanVien values ('NV013', 'Tran Van M', '272 Tu Quynh', '0901564789', 'nvm@gmail.com', 'PB-DN-NS', 'CN-DN', 8000000);
insert into NhanVien values ('NV014', 'Nguyen Van N', '14 Xa Thi Man', '01643589191', 'nvn@gmail.com', 'PB-DN-NS', 'CN-DN', 8000000);
insert into NhanVien values ('NV015', 'Hoang Thi O', '345 Cau The Huc', '01649789562', 'nvo@gmail.com', 'PB-DN-KT', 'CN-DN', 7000000);
insert into NhanVien values ('NV016', 'Ly Thi P', '167 Hue Mong Mo', '084088888', 'nvp@gmail.com', 'PB-DN-KT', 'CN-DN', 7000000);
insert into NhanVien values ('NV017', 'Tra Van Q', '1F1 Cinema Galaxy', '0902311212', 'nvq@gmail.com', 'PB-DN-KH', 'CN-DN', 9000000);
insert into NhanVien values ('NV018', 'Hua Thi R', '22 Ga Gion KFC', '01657898520', 'nvr@gmail.com', 'PB-DN-KH', 'CN-DN', 9000000);

update ChiNhanh set truongChiNhanh = 'NV001' where maCN = 'CN-HCM';
update ChiNhanh set truongChiNhanh = 'NV007' where maCN = 'CN-HN';
update ChiNhanh set truongChiNhanh = 'NV013' where maCN = 'CN-DN';

update PhongBan set truongPhong = 'NV002', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-HCM-NS';
update PhongBan set truongPhong = 'NV004', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-HCM-KT';
update PhongBan set truongPhong = 'NV006', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-HCM-KH';
update PhongBan set truongPhong = 'NV008', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-HN-NS';
update PhongBan set truongPhong = 'NV010', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-HN-KT';
update PhongBan set truongPhong = 'NV012', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-HN-KH';
update PhongBan set truongPhong = 'NV014', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-DN-NS';
update PhongBan set truongPhong = 'NV016', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-DN-KT';
update PhongBan set truongPhong = 'NV018', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-DN-KH';

insert into DuAn values ('DA001', 'Mo Rong Hieu', 10000000, 'PB-HCM-KH', 'NV005');
insert into DuAn values ('DA002', 'Nhan Dien Mat', 15000000, 'PB-HN-KH', 'NV011');
insert into DuAn values ('DA003', 'Tao Xu The', 20000000, 'PB-DN-KH', 'NV017');

insert into ChiTieu values ('CT0101', 'Loi Keo', 5000000, 'DA001');
insert into ChiTieu values ('CT0102', 'Tao Dung', 5000000, 'DA001');
insert into ChiTieu values ('CT0201', 'Ghi Nhan', 7500000, 'DA002');
insert into ChiTieu values ('CT0202', 'Xac Dinh', 7500000, 'DA002');
insert into ChiTieu values ('CT0301', 'Tham Do', 10000000, 'DA003');
insert into ChiTieu values ('CT0302', 'Sang Tao', 10000000, 'DA003');

insert into PhanCong values ('NV006', 'DA001', 'Giam Sat', 2000000);
insert into PhanCong values ('NV005', 'DA001', 'Thi Hanh', 1500000);
insert into PhanCong values ('NV012', 'DA002', 'Giam Sat', 2000000);
insert into PhanCong values ('NV011', 'DA002', 'Thi Hanh', 1500000);
insert into PhanCong values ('NV018', 'DA003', 'Giam Sat', 2000000);
insert into PhanCong values ('NV017', 'DA003', 'Thi Hanh', 1500000);
