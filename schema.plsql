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
