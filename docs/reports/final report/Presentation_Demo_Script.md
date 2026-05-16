# KICH BAN THUYET TRINH DEMO - CHI TIET TOAN BO

## MUC LUC

1. [Tong quan hinh thuc thuyet trinh](#1-tong-quan)
2. [Phan cong 5 nguoi](#2-phan-cong)
3. [Chuan bi truoc khi len](#3-chuan-bi)
4. [Kich ban demo tung buoc](#4-kich-ban-demo)
5. [Tung nguoi can nam cai gi](#5-tung-nguoi-can-nam)
6. [Cau hoi BGK hay hỏi va cach tra loi](#6-cau-hoi-bgk)
7. [Nhung loi can tranh khi thuyet trinh](#7-loi-can-tranh)

---

# 1. TONG QUAN HINH THUC THUYET TRINH {#1-tong-quan}

## Hinh thuc

- **KHONG CAN SLIDE** - Demo truc tiep tren terminal
- BGK se hoi them thong qua **Task Sheet** trong report
- **Khong nhat thiet ai lam phan nao noi phan do** - BGK chu dong hoi
- Muc tieu: cho BGK thay chuong trinh **chay dung va chuan logic**

## Thoi gian uoc tinh

| Giai doan | Thoi gian | Noi dung |
|-----------|-----------|----------|
| Gioi thieu | 1 phut | Ten de tai, nhom, he thong lam gi |
| Demo Admin flow | 6-7 phut | Login admin, thao tac toan bo menu BCN |
| Demo Member flow | 3 phut | Login member, xem self-service |
| Demo Persistence | 1 phut | Thoat, mo lai, kiem tra data |
| Q&A | Con lai | BGK hoi bat ky ai |

## Thu tu demo tong quat (kể câu chuyện logic)

```
BUILD & SEED -> LOGIN ADMIN -> QUAN LY THANH VIEN -> GHI VI PHAM ->
THU TIEN -> THONG KE/BAO CAO -> LOGOUT -> LOGIN MEMBER -> SELF-SERVICE ->
THOAT -> MO LAI -> KIEM TRA PERSISTENCE
```

---

# 2. PHAN CONG 5 NGUOI {#2-phan-cong}

## 2.1 Ai lam gi trong luc demo

### Nguoi cầm may demo (de xuat: Nguyen Ngoc Phuc)

- **Tai sao chon Phuc**: thao tac go phim nhanh, hieu ro luong menu, khong bi run khi go
- Nhiem vu: go phim, thao tac tren terminal theo huong dan cua nguoi noi
- **KHONG tu y chay lung tung** - chi go khi nguoi noi bao hoac theo kich ban da chot

### Nguoi dan chinh (de xuat: Dam Le Tuan Anh - Leader)

- Mo dau, gioi thieu de tai
- Dan luong demo: "Bay gio chung toi se demo phan..."
- Chot lai, cam on
- Dieu phoi khi BGK hoi: chon nguoi tra loi hoac tu tra loi

### 3 nguoi bo sung (Phu, Bao, Thang)

- San sang tra loi khi BGK hoi vao phan minh chuyen trach
- Bo sung them thong tin neu nguoi tra loi chua du
- Quan sat BGK de nhan biet ho dang thac mac dieu gi

## 2.2 Phan chuyen trach hieu bieu cho Q&A

Khi BGK hoi, ai nen la nguoi tra loi chinh:

| Chu de BGK hoi | Nguoi tra loi chinh | Nguoi bo sung |
|----------------|--------------------|--------------| 
| **Kien truc / Module hoa** | Nguyen Ngoc Phuc | Dam Le Tuan Anh |
| **Authentication / Login / Lock / Password** | Nguyen Ngoc Phuc | Huynh Gia Bao |
| **Member CRUD / Validation / Cascade Delete** | Nguyen Van Phu | Nguyen Ngoc Phuc |
| **Vi pham / Fine / Out CLB / Threshold** | Huynh Gia Bao | Nguyen Van Phu |
| **Thong ke / Sort / Export / Tim kiem ngay** | Vo Hieu Thang | Dam Le Tuan Anh |
| **File I/O / Persistence / Atomic Save** | Nguyen Ngoc Phuc | Vo Hieu Thang |
| **Data structures / types.h / Constants** | Nguyen Ngoc Phuc | Nguyen Van Phu |
| **Business rules tong quan** | Dam Le Tuan Anh | Bat ky ai |
| **Quy trinh lam viec nhom / Phan cong** | Dam Le Tuan Anh | Ca nhom |

---

# 3. CHUAN BI TRUOC KHI LEN {#3-chuan-bi}

## 3.1 Checklist may moc

- [ ] Terminal da mo san, font **to** (Consolas 18+ hoac size tuong duong)
- [ ] Font color dam dan (trang tren nen den, hoac nguoc lai)
- [ ] Window terminal phu de BGK doc duoc tu xa
- [ ] Da chay thu toan bo kich ban **it nhat 2 lan** khong bi loi
- [ ] Co Notepad san de mo file export .txt
- [ ] Thu muc `bin\data\` co du lieu seed sach

## 3.2 Checklist du lieu

- [ ] Da chay `bin\seed_data.exe` moi (data sach, khong co thay doi tu lan chay truoc)
- [ ] Kiem tra: `ADMIN / ADMIN` login duoc
- [ ] Kiem tra: `SV0002 / 123456` login duoc
- [ ] Kiem tra: SV0011 co 4 vang lien tiep
- [ ] Kiem tra: SV0008 co 3 vang lien tiep
- [ ] Kiem tra: 14 thanh vien, 16 vi pham, 15 tai khoan

## 3.3 Checklist hau canh

- [ ] File report .docx da xong va san sang nop
- [ ] Repository GitHub da push code moi nhat len main
- [ ] README.md chuan, co huong dan build/run
- [ ] Moi nguoi da doc qua Task Sheet trong report va hieu phan minh
- [ ] Moi nguoi da chay thu it nhat 1 lan toan bo demo tren may minh

## 3.4 Lenh chuan bi san

```bash
# Build (chay truoc khi BGK den)
mingw32-make

# Build seed tool
gcc -std=c17 -m64 -Wall -Iinclude tools/seed_data.c -o bin/seed_data.exe

# Nap data moi
bin\seed_data.exe

# Chay app
bin\violation-management-system.exe
```

---

# 4. KICH BAN DEMO TUNG BUOC {#4-kich-ban-demo}

## === PHAN A: GIOI THIEU (1 phut) ===

### Ai noi: Dam Le Tuan Anh

### Noi dung:

> "Xin chao thay/cô và cac ban.
>
> Chung em la nhom **mid**, gom 5 thanh vien:
> - Dam Le Tuan Anh - nhom truong
> - Nguyen Ngoc Phuc
> - Nguyen Van Phu
> - Huynh Gia Bao
> - Vo Hieu Thang
>
> De tai cua chung em la **F-Code Club Member Violation Management System** -
> he thong quan ly vi pham thanh vien CLB F-Code.
>
> Day la ung dung CLI viet bang C chay tren terminal,
> giup Ban Chu Nhiem quan ly: thanh vien, vi pham, tien phat, canh bao Out CLB,
> va xuat bao cao.
>
> Bay gio chung em xin demo truc tiep chuong trinh."

---

## === PHAN B: BUILD & SEED (1 phut) ===

### Muc dich: Chung minh code that, khong gia

### Nguoi thao tac: Nguyen Ngoc Phuc

### Nguoi noi: Dam Le Tuan Anh

### Cach noi:

> "Truoc tien, chung em build project va nap du lieu demo de BGK thay day la code chay that."

### Thao tac tren man hinh:

```
Gõ: mingw32-make
```

Cho thay build thanh cong. Khong can giai thich Makefile.

```
Gõ: bin\seed_data.exe
```

Cho thay thong bao nap du lieu: 14 thanh vien, 16 vi pham, 15 tai khoan.

```
Gõ: bin\violation-management-system.exe
```

### Ket qua tren man hinh:

```
  F-CODE VIOLATION MANAGEMENT SYSTEM
[OK] Tai du lieu thanh cong
  - Thanh vien: 14/1000
  - Vi pham: 16
  - Tai khoan: 15
```

### Cach noi:

> "Chuong trinh load thanh cong 14 thanh vien, 16 vi pham va 15 tai khoan tu file .dat"

---

## === PHAN C: LOGIN ADMIN (1 phut) ===

### Muc dich: Chung minh authentication va phan quyen

### Buoc C1: Login admin thanh cong

```
MSSV: ADMIN
Mat khau: ADMIN
```

### Ket qua:

```
[OK] Dang nhap thanh cong

MENU BAN CHU NHIEM
1. Them thanh vien moi
2. Sua thong tin thanh vien
3. Xoa thanh vien
4. Ghi nhan vi pham
5. Danh dau da thu tien
6. Xem danh sach vi pham
7. Thong ke tien phat theo ban
8. Kiem tra nguong Out CLB
9. Sap xep theo so lan vi pham
10. Xuat bao cao
11. Tim kiem theo ngay
12. Xem profile ca nhan
13. Xem danh sach thanh vien
14. Doi mat khau
15. Reset mat khau thanh vien
0. Dang xuat
```

### Cach noi:

> "Sau khi login voi tai khoan ADMIN - la tai khoan BCN mac dinh duoc tu tao khi chay lan dau -
> he thong hien menu Ban Chu Nhiem voi 15 chuc nang quan ly."

### Diem nam: BGK co the hoi "Tai khoan ADMIN lay tu dau?"

**Tra loi:** "Tai khoan ADMIN duoc tu tao tu dong boi `fileio.c` khi chuong trinh khoi chay lan dau ma khong co bat ky tai khoan nao trong file `accounts.dat`. Mat khau mac dinh la `ADMIN`."

---

## === PHAN D: QUAN LY THANH VIEN (2 phut) ===

### Buoc D1: Xem danh sach thanh vien (Option 13)

```
Nhap lua chon: 13
```

### Ket qua: Bang 14 thanh vien voi MSSV, ho ten, ban, chuc vu, trang thai

### Cach noi:

> "Day la danh sach 14 thanh vien hien co trong he thong,
> chia thanh 4 ban: Hoc thuat, Ke hoach, Nhan su, Truyen thong.
> Moi thanh vien co chuc vu: Thanh vien, Truong nhom/Pho nhom, hoac Ban chu nhiem."

---

### Buoc D2: Them thanh vien moi (Option 1)

```
Nhap lua chon: 1

Nhap MSSV: SV0099
Nhap ho va ten: Nguyen Van Test
Nhap email: test@fcode.vn
Nhap so dien thoai: 0987654321
Chon ban (0-Hoc thuat, 1-Ke hoach, 2-Nhan su, 3-Truyen thong): 2
Chon chuc vu (0-Thanh vien, 1-Truong nhom/Pho nhom, 2-Ban chu nhiem): 0
```

### Ket qua:

```
[OK] Them thanh vien thanh cong
  MSSV: SV0099
  Ten: Nguyen Van Test
  Ban: Nhan su
  Chuc vu: Thanh vien
  Tai khoan da duoc tao voi mat khau mac dinh: SV0099
```

### Cach noi:

> "Khi them thanh vien moi, he thong tu dong tao tai khoan dang nhap
> voi mat khau mac dinh la MSSV cua thanh vien do.
> Dieu nay giup thanh vien co the dang nhap ngay lap tuc."

### Diem nam: BGK co the hoi "Mat khau mac dinh la gi?"

**Tra loi:** "Mat khau mac dinh bang dung MSSV cua thanh vien. Vi du SV0099 thi mat khau la `SV0099`. Thanh vien co the doi mat khau sau khi dang nhap."

---

### Buoc D3: Sua thong tin thanh vien (Option 2)

```
Nhap lua chon: 2

Nhap MSSV can sua: SV0099

(Thong tin hien tai hien ra)

NHAP THONG TIN MOI (Nhan Enter de giu nguyen):
Ho va ten moi: Nguyen Van Da Sua
Email moi: (Enter - giu nguyen)
So dien thoai moi: (Enter - giu nguyen)
Ban moi (...) [-1 de giu nguyen]: -1
Chuc vu moi (...) [-1 de giu nguyen]: -1
Trang thai (...) [-1 de giu nguyen]: -1
```

### Ket qua:

```
[OK] Sua thong tin thanh vien thanh cong
```

### Cach noi:

> "Chuc nang sua cho phep cap nhat tung truong rieng,
> nhan Enter de giu nguyen truong khong muon sua."

---

## === PHAN E: GHI NHAN VI PHAM (2 phut) ===

### Day la phan QUAN TRONG NHAT - the hien business logic

### Buoc E1: Ghi vi pham thuong - Member phat 20k

```
Nhap lua chon: 4

GHI NHAN VI PHAM
Nhap MSSV thanh vien: SV0099

  Thanh vien: Nguyen Van Da Sua
  Ban: Nhan su
  Chuc vu: Thanh vien

Chon ly do vi pham:
  0. Khong mac ao CLB
  1. Vang hop
  2. Khong tham gia hoat dong
  3. Bao luc
Nhap lua chon: 0

Ghi chu (Enter de bo qua): Test vi pham demo
```

### Ket qua:

```
[OK] Ghi nhan vi pham thanh cong
  Thanh vien: Nguyen Van Da Sua (SV0099)
  Ly do: Khong mac ao CLB
  Thoi gian: 16/05/2026 ...
  Tien phat: 20000 VND
```

### Cach noi:

> "SV0099 la thanh vien thuong, nen bi phat **20,000 VND** vi khong mac ao CLB.
> He thong tu dong tinh tien phat dua tren chuc vu cua thanh vien."

---

### Buoc E2: Ghi vi pham cho Leader - phat 50k

```
Nhap lua chon: 4

Nhap MSSV thanh vien: SV0004

  Thanh vien: Pham Minh Duc
  Ban: Ke hoach
  Chuc vu: Truong nhom/Pho nhom

Nhap lua chon: 0

Ghi chu: (Enter)
```

### Ket qua:

```
[OK] Ghi nhan vi pham thanh cong
  ...
  Tien phat: 50000 VND
```

### Cach noi:

> "SV0004 la Truong nhom, nen bi phat **50,000 VND** - gap doi so voi thanh vien thuong.
> Day la business rule: lanh dao vi pham phai chiu trach nhiem nang hon."

### Diem nam DAY LA DIEM RAT HAY:

**Neu BGK hoi "Tai sao 2 nguoi cung vi pham ma tien khac nhau?"**

**Tra loi:** "Vi he thong phan biet tien phat theo `Member.role`. Thanh vien thuong phat 20,000 VND, con Truong nhom va BCN phat 50,000 VND. Day la quy dinh cua CLB de tang trach nhiem cho lanh dao."

---

### Buoc E3: Ghi vi pham vang mat - dem vang lien tiep

```
Nhap lua chon: 4

Nhap MSSV thanh vien: SV0005

  Thanh vien: Vo Thi Mai
  Ban: Ke hoach
  Chuc vu: Thanh vien

Nhap lua chon: 1   (Vang hop)

Ghi chu: (Enter)
```

### Ket qua:

```
[THONG BAO] So buoi vang lien tiep cua Vo Thi Mai: 2

[OK] Ghi nhan vi pham thanh cong
  ...
  Tien phat: 20000 VND
```

### Cach noi:

> "Khi ghi nhan vi pham 'Vang hop', he thong tu dong tang bien dem
> `consecutiveAbsences`. Thanh vien nay hien dang vang 2 buoi lien tiep.
> He thong se canh bao o 3 buoi va xac nhan Out CLB tu buoi thu 4."

---

## === PHAN F: OUT CLB THRESHOLD (1 phut) ===

### Buoc F1: Kiem tra nguong Out CLB (Option 8)

```
Nhap lua chon: 8
```

### Ket qua:

```
KIEM TRA NGUONG OUT CLB
+------------+----------------------+-----------+------------+
| MSSV       | Ho va ten            | Vang LT   | Trang thai |
+------------+----------------------+-----------+------------+
| SV0008     | Ngo Thi Hanh         | 3         | CANH BAO   |
| SV0011     | Dang Thi Ngoc        | 4         | QUA NGUONG |
+------------+----------------------+-----------+------------+

Chu thich:
  Theo doi  : Vang 2 buoi lien tiep
  CANH BAO  : Vang 3 buoi lien tiep (them 1 buoi -> Out)
  QUA NGUONG: Vang qua 3 buoi, cho BCN xu ly
  Out CLB   : Da bi Out CLB
```

### Cach noi:

> "He thong hien thi SV0011 voi 4 buoi vang lien tiep - trang thai QUA NGUONG,
> va SV0008 voi 3 buoi - trang thai CANH BAO.
>
> Logic nhu sau:
> - 2 vang lien tiep: bat dau theo doi
> - 3 vang lien tiep: canh bao
> - Tu buoi thu 4 tro di: hoi xac nhan BCN de Out CLB"

### Diem nam:

**BGK hoi "Nguong Out CLB la may buoi?"**

**Tra loi:** "Warning o 3 buoi vang lien tiep. Tu buoi thu 4 tro di, he thong se hoi BCN xac nhan de Out CLB. Day la luong xu ly trong `violation.c` - ham `violationCheckOutThreshold()`."

---

## === PHAN G: LOC VI PHAM & THU TIEN (2 phut) ===

### Buoc G1: Xem vi pham voi filter "Chua thu" (Option 6)

```
Nhap lua chon: 6

XEM DANH SACH VI PHAM
1. Xem tat ca
2. Loc theo ban
3. Loc theo ly do
4. Loc theo trang thai thu tien
0. Quay lai
Nhap lua chon: 4

Chon trang thai (0-Da thu, 1-Chua thu): 1
```

### Ket qua: Bang chi nhung vi pham chua thu tien

### Cach noi:

> "He thong ho tro 4 cach loc: xem tat ca, loc theo ban, loc theo ly do,
> va loc theo trang thai thu tien. Day la danh sach cac vi pham chua dong tien."

---

### Buoc G2: Thu tien phat (Option 5)

```
Nhap lua chon: 5

Nhap MSSV thanh vien: SV0002

Danh sach vi pham chua dong phat cua Tran Thi Bich:
  1. 20/04/2026 - Vang mat (20000 VND)

Chon STT de danh dau Da Thu (1-1, 0 de Huy): 1
```

### Ket qua:

```
[OK] Da thu tien thanh cong! Tong no con lai: 0 VND
```

### Cach noi:

> "BCN chon vi pham chua dong va danh dau da thu.
> He thong tu dong tinh lai tong no con lai cua thanh vien.
> SV0002 da dong het, con no 0 VND."

### Diem nam:

**BGK hoi "Thu tien thi cap nhat nhung file nao?"**

**Tra loi:** "Cap nhat ca 2 file: `violations.dat` (doi `isPaid` tu 0 thanh 1) va `members.dat` (tinh lai `totalFine`). Luu theo thu tu violations truoc, members sau. Neu luu members that bai, he thong se rollback violations ve trang thai cu."

---

## === PHAN H: THONG KE & BAO CAO (2 phut) ===

### Buoc H1: Thong ke theo ban (Option 7)

```
Nhap lua chon: 7
```

### Ket qua: Bang 4 ban voi Da thu, Con no, Tong

### Cach noi:

> "Bang thong ke tong hop tien phat theo 4 ban cua CLB,
> bao gom so tien da thu, so tien con no, va tong cong.
> Giup BCN biet ban nao con nhieu tien phat chua thu."

---

### Buoc H2: Sap xep theo so vi pham (Option 9)

```
Nhap lua chon: 9

1. Tang dan
2. Giam dan
0. Quay lai
Nhap lua chon: 2
```

### Ket qua: Bang thanh vien sap xep giam dan theo so vi pham. SV0011 (4 vp) dung dau.

### Cach noi:

> "Thanh vien SV0011 dung dau voi 4 lan vi pham.
> Luu y: sap xep su dung pointer array - khong thay doi thu tu goc cua mang `members[]`,
> chi thay doi thu tu hien thi."

### Diem nam:

**BGK hoi "Tai sao sort bang pointer array?"**

**Tra loi:** "De bao toan thu tu goc cua mang `members[]` trong `AppDatabase`. Neu sap xep truc tiep, thu tu thanh vien se bi thay doi, anh huong den cac thao tac khac dang su dung index. Nen tao mot mang con tro tro den cac member, roi sap xep mang con tro do."

---

### Buoc H3: Xuat bao cao (Option 10)

```
Nhap lua chon: 10
```

### Ket qua:

```
[OK] Da xuat bao cao ra file: <duong_dan>\violation_report_20260516_XXXXXX.txt
```

### Cach noi:

> "Bao cao duoc xuat ra file .txt dat cung thu muc voi file executable,
> voi ten file chua timestamp de khong bi ghi de bao cao cu."

**Mo file .txt bang Notepad de BGK xem noi dung.**

---

### Buoc H4: Tim kiem theo ngay (Option 11)

```
Nhap lua chon: 11

Nhap ngay bat dau (dd/mm/yyyy): 01/03/2026
Nhap ngay ket thuc (dd/mm/yyyy): 30/04/2026
```

### Ket qua: Danh sach vi pham trong khoang ngay

### Cach noi:

> "He thong loc vi pham theo khoang ngay.
> Ngay bat dau duoc chuan hoa thanh 00:00:00, ngay ket thuc thanh 23:59:59,
> dam bao bao gom toan bo ngay cuoi cung chu khong chi diem nua dem."

---

## === PHAN I: XOA THANH VIEN CASCADE (1 phut) ===

### Buoc I1: Xoa thanh vien SV0099 (Option 3)

```
Nhap lua chon: 3

Nhap MSSV can xoa: SV0099

(Hien thong tin thanh vien)

Xac nhan xoa thanh vien nay va toan bo du lieu lien quan? (1: Co, 0: Khong): 1
```

### Ket qua:

```
[OK] Xoa thanh vien thanh cong.
```

### Cach noi:

> "Xoa thanh vien la cascade delete: he thong xoa tai khoan dang nhap,
> xoa tat ca vi pham thuoc thanh vien do, roi moi xoa ho so thanh vien.
> Thu tu: account -> violations -> member. Moi buoc deu luu xuong file ngay lap tuc."

### Diem nam:

**BGK hoi "Tai sao thu tu xoa la account -> violations -> member?"**

**Tra loi:** "Xoa account truoc de thanh vien mat quyen truy cap ngay lap tuc. Xoa violations truoc de khong con ban ghi vi pham le. Cuoi cung moi xoa member. Neu xoa member truoc thi violations se tro den studentId khong ton tai."

---

## === PHAN J: MEMBER SELF-SERVICE (2 phut) ===

### Muc dich: Cho thay phan quyen - member chi thay thong tin cua minh

### Buoc J1: Logout va login member

```
Nhap lua chon: 0
```

### Ket qua: `[OK] Da dang xuat`

```
MSSV: SV0002
Mat khau: 123456
```

### Ket qua:

```
[OK] Dang nhap thanh cong

MENU THANH VIEN
1. Xem profile ca nhan
2. Xem lich su vi pham
3. Xem tong tien phat con no
4. Xem danh sach thanh vien
5. Doi mat khau
0. Dang xuat
```

### Cach noi:

> "Sau khi dang nhap voi tai khoan thanh vien SV0002,
> he thong chi hien menu thanh vien voi 5 chuc nang - khong co cac chuc nang quan ly cua BCN.
> Day la phan quyen dua tren `Account.role`."

---

### Buoc J2: Xem profile (Option 1)

```
Nhap lua chon: 1
```

### Ket qua: Thong tin ca nhan cua SV0002

### Cach noi:

> "Thanh vien chi xem duoc thong tin cua chinh minh, khong xem duoc cua nguoi khac."

---

### Buoc J3: Xem lich su vi pham (Option 2)

```
Nhap lua chon: 2
```

### Ket qua: 3 vi pham cua SV0002

### Cach noi:

> "SV0002 co 3 vi pham. Vi pham cuoi cung trang thai CHUA THU."

---

### Buoc J4: Xem tien phat con no (Option 3)

```
Nhap lua chon: 3
```

### Ket qua:

```
TONG SO TIEN CAN DONG: 0 VND
```

(hoac 20000 VND tuy thuoc buoc thu tien G2 da thuc hien chua)

### Cach noi:

> "Vi phat da duoc BCN thu o buoc truoc nen SV0002 khong con no khoan nao."

---

## === PHAN K: PERSISTENCE CHECK (1 phut) ===

### Muc dich: Chung minh data khong mat khi tat chuong trinh

### Buoc K1: Thoat app

```
Nhap lua chon: 0
```

(Login screen hien ra, nhan Ctrl+C hoac nhap MSSV rong de thoat)

### Cach noi:

> "Bay gio chung em thoat chuong trinh va mo lai de kiem tra du lieu co duoc luu khong."

### Buoc K2: Chay lai app

```
Gõ: bin\violation-management-system.exe
```

### Ket qua:

```
[OK] Tai du lieu thanh cong
  - Thanh vien: 14/1000    (13 thanh vien goc + da xoa SV0099)
  - Vi pham: ...            (so luong phu hop)
  - Tai khoan: ...
```

### Buoc K3: Login va kiem tra

```
MSSV: SV0002
Mat khau: 123456
```

```
Nhap lua chon: 3   (Xem tien no)
```

### Ket qua: Tong no = 0 VND (neu da thu o buoc G2)

### Cach noi:

> "Du lieu duoc giu nguyen sau khi khoi dong lai.
> He thong luu du lieu xuong file .dat sau moi thao tac thay doi,
> dung co che atomic save voi file .tmp va .bak de tranh mat du lieu neu ung dung bi ngat giua chung."

### Buoc K4: Thoat hoan toan

```
Nhap lua chon: 0
(Ctrl+C de thoat)
```

---

## === PHAN L: KET THUC (30 giay) ===

### Ai noi: Dam Le Tuan Anh

### Noi dung:

> "Tren day la toan bo demo he thong Quan ly Vi pham thanh vien CLB F-Code.
>
> He thong da hoan thanh cac chuc nang chinh:
> - Dang nhap phan quyen theo role
> - Quan ly thanh vien CRUD
> - Ghi nhan vi pham voi tinh phat tu dong theo chuc vu
> - Theo doi vang lien tiep va canh bao Out CLB
> - Thu tien phat va thong ke
> - Xuat bao cao va tim kiem
> - Luu tru du lieu ben vung bang file .dat
>
> Chung em xin cam on thay/co va BGK. Nhom san sang tra loi cau hoi."

---

# 5. TUNG NGUOI CAN NAM CAI GI {#5-tung-nguoi-can-nam}

## 5.1 Dam Le Tuan Anh (Leader)

### Phu trach hieu bieu: TONG QUAN & DIEU PHOI

### Phai nam thuoc long:

**Ve project tong quan:**
- De tai: F-Code Club Member Violation Management System
- Ngon ngu: C, chay tren terminal/CLI
- Khong dung database, khong dung thu vien ngoai, chi dung C standard library
- Mentor: Nguyen Khoa, Team: mid
- Thoi gian: 17/04/2026 - 16/05/2026

**Ve kien truc:**
- 7 module: main.c, auth.c, member.c, violation.c, report.c, fileio.c, utils.c
- types.h la trung tam dinh nghia struct
- Tat ca data nam trong 1 bien `AppDatabase gDb` (static trong main.c)
- Moi module nhan con tro `AppDatabase*` de thao tac

**Ve quy trinh lam viec nhom:**
- Phan chia theo story trong docs/stories/
- Dung Git, branch, commit theo convention
- Build bang Makefile

**Ve Task Sheet (Section 6 trong report):**
- Doc thuoc noi dung Task Sheet cua minh va 4 thanh vien khac
- Biet noi vi du cu the tung nguoi da lam gi

### Cau hoi phai tra loi duoc:

| Cau hoi | Tra loi ngan |
|---------|-------------|
| Project lam gi? | Quan ly vi pham thanh vien CLB F-Code: ghi nhan vi pham, tinh phat, theo doi vang, thong ke |
| Tai sao dung C? | Day la project Train-C, tap trung vao struct, file I/O, module hoa |
| Tai sao khong dung database? | Yeu cau mon gioi han C standard library, du lieu nho, file .dat la du |
| Nhom lam viec nhu the nao? | Chia story, code tren Git, review, integration testing |
| Ai lam phan nao? | (Doc tu Task Sheet - phai nam thuoc) |

---

## 5.2 Nguyen Ngoc Phuc

### Phu trach hieu bieu: KIEN TRUC + AUTHENTICATION + FILE I/O

### Phai nam thuoc long:

**Ve kien truc module:**

| Module | Vai tro |
|--------|---------|
| `main.c` | Diem vao, load data, login loop, route menu theo role |
| `auth.c` | Login, logout, session, doi/reset mat khau |
| `member.c` | CRUD thanh vien, validation, cascade delete |
| `violation.c` | Ghi vi pham, tinh phat, threshold, mark paid, self-service |
| `report.c` | Thong ke, sort, export .txt |
| `fileio.c` | Load/save .dat, atomic save, first-run bootstrap |
| `utils.c` | Input helpers, validation, date/time, display names |

**Ve authentication (auth.c):**
- Session duoc luu trong bien `static Account currentSession` (module-private)
- `authLogin()` loop den khi thanh cong hoac lock
- Sai mat khau 3 lan lien tiep -> `isLocked = 1`, luu vao file ngay
- `authGetSession()` tra ve con tro den session hien tai hoac NULL
- `authChangePassword()` yeu cau nhap mat khau cu, moi, xac nhan
- `authResetPassword()` chi BCN, reset ve MSSV, mo lock

**Ve file I/O (fileio.c):**
- 3 file: `accounts.dat`, `members.dat`, `violations.dat`
- Nam trong thu muc `data/` cung cho voi file .exe
- Atomic save: ghi `.tmp` -> doi ten `.dat` thanh `.bak` -> doi `.tmp` thanh `.dat` -> xoa `.bak`
- Khi load: kiem tra `.tmp` con ton tai khong (crash recovery)
- First run: tu tao `ADMIN/ADMIN` neu khong co account nao
- Save sau MOI thao tac thay doi du lieu

**Ve data structures (types.h):**

| Struct | Field quan trong |
|--------|-----------------|
| `Account` | `studentId`, `password`, `role` (0=Member, 1=BCN), `isLocked`, `failCount` |
| `Member` | `studentId`, `fullName`, `team`, `role` (0=TV, 1=Leader, 2=BCN), `totalFine`, `consecutiveAbsences`, `isActive` |
| `Violation` | `studentId`, `reason`, `fine`, `isPaid`, `penalty`, `violationTime`, `note` |
| `AppDatabase` | `members[1000]`, `violations[10000]`, `accounts[1000]` + 3 count |

**Ve 2 loai role (DIEM RAT QUAN TRONG):**
- `Account.role`: `ACCOUNT_ROLE_MEMBER` (0) hoac `ACCOUNT_ROLE_BCN` (1) -> quyet dinh MENU nao hien
- `Member.role`: `MEMBER_ROLE_MEMBER` (0), `MEMBER_ROLE_LEADER` (1), `MEMBER_ROLE_BCN` (2) -> quyet dinh TIEN PHAT
- Vi du: Truong nhom co Account.role = 0 (vao menu thanh vien) nhung Member.role = 1 (phat 50k)

### Cau hoi phai tra loi duoc:

| Cau hoi | Tra loi ngan |
|---------|-------------|
| Session luu o dau? | Bien static trong auth.c, chi truy cap qua authGetSession() |
| Tai sao tach Account.role va Member.role? | 1 cai cho menu, 1 cai cho tinh phat. Leader vao menu thanh vien nhung phat 50k |
| Lock account nhu the nao? | Tang failCount moi lan sai, khi = 3 thi set isLocked=1 va luu vao file ngay |
| Data luu o dau? | 3 file .dat trong thu muc data/ cung cho .exe |
| Atomic save la gi? | Ghi .tmp -> doi .dat thanh .bak -> doi .tmp thanh .dat -> xoa .bak. Neu crash giua chung thi co the phuc hoi |
| First run thi sao? | Khong co file .dat -> tao moi + tao ADMIN/ADMIN tu dong |
| Tai sao dung mang tinh? | Yeu cau mon, du lieu nho (max 1000 members), khong can cap phat dong |

---

## 5.3 Nguyen Van Phu

### Phu trach hieu bieu: MEMBER MANAGEMENT + VALIDATION

### Phai nam thuoc long:

**Ve them thanh vien (member.c - memberAdd):**
- Nhap: MSSV, ho ten, email, SDT, ban (0-3), chuc vu (0-2)
- Validate: MSSV khong trung, ten khong trong, email dung dinh dang, SDT 7-15 so
- Tu dong tao Account voi mat khau = MSSV
- Luu ca members.dat va accounts.dat
- Neu luu accounts that bai -> rollback memberCount va accountCount

**Ve sua thanh vien (member.c - memberEdit):**
- Nhap MSSV, hien thong tin hien tai
- Sua tung truong: ten, email, SDT, ban, chuc vu, trang thai
- Nhan Enter de giu nguyen moi truong
- **Neu doi chuc vu (role):** tinh lai toan bo tien phat chua dong theo muc moi
  - Vi du: tu Thanh vien -> Leader, tat ca vi pham chua thu tu 20k -> 50k
  - Goi ham `recalcFines()` - quet tat ca violations chuaPaid, thay fine, cong lai totalFine
  - Dong thoi cap nhat Account.role de menu thay doi neu can

**Ve xoa thanh vien (member.c - memberDelete):**
- Cascade delete: xoa Account -> xoa Violations -> xoa Member
- Khong cho BCN xoa chinh minh
- Hien thong tin thanh vien truoc khi hoi xac nhan
- Luu theo thu tu: accounts.dat -> violations.dat -> members.dat

**Ve xem thanh vien (member.c):**
- `memberViewProfile()`: lay session studentId, tim member, hien tat ca thong tin
- `memberListAll()`: hien bang, phan trang moi 20 dong, dem active/outCLB

**Ve validation (utils.c):**
- `isEmailValid()`: co 1 dau @, khong bat dau/ket thuc bang @ hoac ., chi chua ky tu hop le
- `isPhoneValid()`: 7-15 so, co the bat dau bang +
- `isIdValid()`: it nhat 4 ky tu, bat dau bang chu cai, chi chua chu+so

### Cau hoi phai tra loi duoc:

| Cau hoi | Tra loi ngan |
|---------|-------------|
| Them thanh vien tao nhung gi? | Tao 1 ban ghi Member + 1 ban ghi Account. Mat khau mac dinh = MSSV |
| Sua thanh vien co gi dac biet? | Neu doi chuc vu, he thong tinh lai toan bo tien phat chua dong theo muc moi |
| Cascade delete la gi? | Xoa thanh vien se xoa luon tai khoan va tat ca vi pham lien quan |
| Tai sao khong cho BCN xoa chinh minh? | De tranh mat quyen truy cap, phai de BCN khac thuc hien |
| Validation lam nhung gi? | Kiem tra email, SDT, MSSV hop le. MSSV phai duy nhat, it nhat 4 ky tu |

---

## 5.4 Huynh Gia Bao

### Phu trach hieu bieu: VIOLATION LOGIC + FINE + OUT CLB

### Phai nam thuoc long:

**Ve 4 loai vi pham:**

| Constant | Gia tri | Ten | Tien phat |
|----------|---------|-----|-----------|
| REASON_NO_JACKET | 0 | Khong mac ao CLB | 20k hoac 50k |
| REASON_ABSENT | 1 | Vang hop | 20k hoac 50k |
| REASON_NO_ACTIVITY | 2 | Khong tham gia HD | 20k hoac 50k |
| REASON_VIOLENCE | 3 | Bao luc | 0 VND + Out CLB |

**Ve tinh phat (violation.c - calculateFine):**
- `MEMBER_ROLE_MEMBER` -> 20,000 VND
- `MEMBER_ROLE_LEADER` hoac `MEMBER_ROLE_BCN` -> 50,000 VND
- `REASON_VIOLENCE` -> 0 VND, penalty = PENALTY_OUT_CLB

**Ve vang lien tiep (violation.c - handleAbsent):**
- Moi lan ghi vi pham "Vang hop": `consecutiveAbsences++`
- Cac vi pham khac (khong mac ao, khong tham gia HD): reset `consecutiveAbsences = 0`
  - Ly do: thanh vien da den (chi la khong mac ao hoac khong tham gia), khong phai vang
- Tai 3 vang: hien CANH BAO
- Tu 4 vang: hoi xac nhan BCN de Out CLB (`confirmOutClb()`)

**Ve Out CLB:**
- Co 2 luong: (1) vang lien tiep tu 4 buoi, (2) bao luc
- Khi Out: `member->isActive = STATUS_OUT_CLB` (0)
- Thanh vien da Out CLB khong the ghi them vi pham (kiem tra trong violationRecord)

**Ve mark paid (violation.c - violationMarkPaid):**
- Chi BCN moi co quyen (kiem tra session->role)
- Hien danh sach vi pham chua dong cua thanh vien
- BCN chon 1 vi pham de danh dau da thu
- Cap nhat `isPaid = 1`, tinh lai `totalFine` cua member
- Luu violations.dat roi members.dat
- Co rollback neu luu that bai

**Ve self-service (violation.c):**
- `violationViewOwn()`: member xem vi pham cua minh (loc theo session->studentId)
- `violationViewFines()`: member xem khoan phat chua dong cua minh

**Ve filter vi pham (violation.c - violationViewAllFiltered):**
- 4 che do: tat ca, theo ban, theo ly do, theo trang thai thu tien

**Ve tim kiem ngay (violation.c - violationSearchByDate):**
- Nhap dd/mm/yyyy
- Ngay bat dau -> 00:00:00, ngay ket thuc -> 23:59:59
- So sanh `violationTime` voi khoang [start, end]
- Validate: ngay bat dau <= ngay ket thuc

### Cau hoi phai tra loi duoc:

| Cau hoi | Tra loi ngan |
|---------|-------------|
| Fine tinh nhu the nao? | Thanh vien: 20k, Leader/BCN: 50k, Bao luc: 0 + Out CLB |
| Vang may buoi thi Out? | Canh bao o 3, xac nhan Out tu buoi 4 tro di |
| Vi pham khong mac ao co tang vang LT khong? | Khong. Chi vi pham "Vang hop" moi tang. Cac vi pham khac reset ve 0 vi thanh vien da den |
| Mark paid thay doi gi? | isPaid thanh 1, totalFine duoc tinh lai = tong cac vi pham con isPaid=0 |
| Thanh vien da Out CLB co ghi them vi pham duoc khong? | Khong. violationRecord kiem tra isActive truoc khi cho ghi |
| Tim kiem ngay chuan hoa nhu the nao? | Ngay bat dau = 00:00:00, ngay ket thuc = 23:59:59, de bao gom toan bo ngay cuoi |

---

## 5.5 Vo Hieu Thang

### Phu trach hieu bieu: REPORTING + EXPORT + TOOLS + DOCS

### Phai nam thuoc long:

**Ve thong ke theo ban (report.c - reportTeamStats):**
- Duyet tat ca violations, xac dinh team cua member tuong ung
- Cong don `collected` (isPaid=1) va `outstanding` (isPaid=0) cho tung team
- Hien bang 4 ban: Da thu, Con no, Tong

**Ve sap xep (report.c - reportSortMembersByViolations):**
- Tao mang `const Member *sorted[MAX_MEMBERS]` - mang con tro
- Sap xep mang con tro bang selection sort (khong sap mang goc)
- So sanh theo so luong vi phat (duyet violations de dem)
- Ho tro tang dan va giam dan
- **Ly do dung pointer array:** khong thay doi thu tu goc cua members[], khong can copy toan bo struct

**Ve export bao cao (report.c - reportExportTxt):**
- Tao file `.txt` dat cung cho voi file .exe
- Ten file: `violation_report_YYYYMMDD_HHMMSS.txt`
- Noi dung: header + thoi gian xuat + tong hop theo ban + danh sach thanh vien con no
- Mo file, ghi, dong file

**Ve seed data (tools/seed_data.c):**
- Tool rieng biet, co main() rieng, khong nam trong Makefile
- Build: `gcc -std=c17 -m64 -Wall -Iinclude tools/seed_data.c -o bin/seed_data.exe`
- Chay: `bin\seed_data.exe` (nap data) hoac `bin\seed_data.exe clear` (xoa data)
- Tao 14 thanh vien, 15 tai khoan (14 + ADMIN), 16 vi pham
- Du lieu demo: SV0011 co 4 vang LT, SV0008 co 3 vang LT
- Mat khau demo: `123456` (khac voi mat khau mac dinh khi them moi la MSSV)

**Ve Makefile:**
- `mingw32-make` -> build app
- `mingw32-make clean` -> xoa bin/
- `mingw32-make format` -> clang-format
- `mingw32-make tidy` -> clang-tidy

**Ve docs:**
- `docs/demo-and-test-guide.md` -> huong dan demo chi tiet
- `docs/technical-highlights.md` -> diem ky thuat noi bat
- `docs/planning/architecture.md` -> kien truc
- `docs/planning/epics.md` -> phan chia story

### Cau hoi phai tra loi duoc:

| Cau hoi | Tra loi ngan |
|---------|-------------|
| Thong ke duoc bao nhieu ban? | 4 ban: Hoc thuat, Ke hoach, Nhan su, Truyen thong |
| Thong ke lay du lieu tu dau? | Duyet mang violations, tim member tuong ung de biet team, cong don theo isPaid |
| Tai sao sort khong thay mang goc? | Dung mang con tro sorted[], chi hoan doi con tro, khong hoan doi struct Member |
| Export ra dinh dang gi? | File .txt, ten co timestamp, noi dung co tong hop ban va danh sach no |
| Seed data de lam gi? | Tao du lieu demo nhat quan de thuyet trinh, cho phep reset va nap lai |
| Tai sao mat khau seed la 123456? | De demo tien hon. Khi them thanh vien that thi mat khau la MSSV |

---

# 6. CAU HOI BGK HAY HOI VA CACH TRA LOI {#6-cau-hoi-bgk}

## 6.1 Nhom cau hoi ve CONG NGHE

### Q: Tai sao dung C ma khong dung ngon ngu khac?

**A (bat ky ai):** "Day la project trong chuong trinh Train-C cua CLB F-Code.
Muc tieu la luyen tap cac kien thuc co ban cua C: struct, file I/O, module hoa, con tro,
lam viec voi mang tinh va du lieu nhị phan.
C giup the hien ro logic he thong o muc thap hon."

### Q: Tai sao khong dung database?

**A (bat ky ai):** "Yeu cau mon gioi han chi dung C standard library.
Du lieu cua bai toan khong lon - toi da 1000 thanh vien va 10000 vi pham -
nen file .dat voi fread/fwrite la du de dap ung yeu cau luu tru."

### Q: Dung mang tinh co han che gi khong?

**A (Phuc):** "Co han che ve kich thuoc toi da - 1000 thanh vien, 10000 vi pham.
Nhung trong pham vi CLB voi khoang 100 thanh vien thi day la giai phap don gian va du dung.
Neu can mo rong, co the chuyen sang cap phat dong hoac linked list."

## 6.2 Nhom cau hoi ve KIEN TRUC

### Q: Tai sao tach nhieu module vay?

**A (Phuc):** "De tranh nhoi toan bo logic vao main.c. Moi module chi lo 1 trach nhiem:
auth lo login, member lo CRUD, violation lo vi pham, report lo thong ke, fileio lo luu tru.
Giup code de bao tri, de test, va de phan cong lam viec."

### Q: Tai sao tach Account.role va Member.role?

**A (Phuc hoac Bao):** "Day la 2 viec khac nhau:
- `Account.role` chi co 2 gia tri (Member hoac BCN) -> quyet dinh MENU nao hien ra sau login
- `Member.role` co 3 gia tri (Thanh vien, Truong nhom, BCN) -> quyet dinh MUC PHAT (20k hoac 50k)
- Vi du: Truong nhom co Account.role = Member (vao menu thanh vien) nhung Member.role = Leader (phat 50k)
- Neu gop lai se khong phan biet duoc 2 truong hop nay."

### Q: AppDatabase la gi? Tai sao dung 1 bien toan cuc?

**A (Phuc):** "AppDatabase la struct chua 3 mang: members, violations, accounts va 3 bien count.
Toan bo du lieu he thong nam trong 1 bien `static AppDatabase gDb` trong main.c.
Cac module nhan con tro `&gDb` de thao tac.
Cach nay don gian, de hieu, va phu hop voi CLI app 1 user."

## 6.3 Nhom cau hoi ve BUSINESS LOGIC

### Q: Tien phat tinh nhu the nao?

**A (Bao):** "Co 2 muc:
- Thanh vien thuong: 20,000 VND moi vi pham
- Truong nhom / Pho nhom / BCN: 50,000 VND moi vi pham
- Truong hop bao luc: 0 VND nhung xu ly Out CLB
Ham `calculateFine()` trong violation.c lay Member.role lam tham so."

### Q: Out CLB duoc xu ly nhu the nao?

**A (Bao):** "Co 2 luong:
1. **Vang lien tiep**: moi lan vang tang `consecutiveAbsences`. O 3 vang -> canh bao. Tu 4 vang -> hoi BCN xac nhan Out CLB.
2. **Bao luc**: ngay lap tuc hoi xac nhan Out CLB, khong phat tien.
Khi Out: `member->isActive = 0`. Thanh vien da Out khong the ghi them vi pham."

### Q: Vi pham khong mac ao co tang vang lien tiep khong?

**A (Bao):** "Khong. Chi vi pham 'Vang hop' moi tang `consecutiveAbsences`.
Vi pham 'Khong mac ao' va 'Khong tham gia HD' se reset ve 0,
vi thanh vien da den hop (chi la khong mac ao hoac khong tham gia), khong phai vang."

### Q: Thu tien phat thay doi nhung gi?

**A (Bao):** "3 thu:
1. `violation.isPaid` tu 0 thanh 1
2. `member.totalFine` duoc tinh lai = tong cac vi pham con isPaid=0
3. Luu ca violations.dat va members.dat
Co rollback: neu luu members that bai, khoi phuc violation ve trang thai cu."

## 6.4 Nhom cau hoi ve DATA & PERSISTENCE

### Q: Dung lieu co mat khi tat chuong trinh khong?

**A (Phuc hoac Thang):** "Khong. He thong luu du lieu xuong file .dat sau MOI thao tac thay doi:
them member, sua member, xoa member, ghi vi pham, thu tien, doi mat khau...
Ngoai ra co co che atomic save: ghi file .tmp truoc, doi ten .dat thanh .bak,
roi moi doi .tmp thanh .dat. Neu crash giua chung, lan load tiep theo se phuc hoi tu .tmp hoac .bak."

### Q: Cascade delete la gi? Thu tu xoa nhu the nao?

**A (Phu):** "Khi xoa thanh vien, he thong xoa 3 loai du lieu:
1. Xoa Account truoc (thanh vien mat quyen truy cap ngay)
2. Xoa tat ca Violations cua thanh vien do
3. Cuoi cung moi xoa Member
Lu files theo cung thu tu: accounts.dat -> violations.dat -> members.dat."

### Q: Sort bang pointer array la gi?

**A (Thang hoac Phuc):** "Thay vi sap xep truc tiep mang `members[]` (se lam thay doi thu tu goc),
ta tao 1 mang con tro `const Member *sorted[]` tro den cac member,
roi sap xep mang con tro nay. Mang goc `members[]` khong bi anh huong.
Dung selection sort, phu hop voi so luong nho (toi da 1000)."

### Q: First run thi he thong lam gi?

**A (Phuc):** "Khi khong co bat ky file .dat nao, ham `fileioLoadAll()` se:
1. Tao cac file .dat trong
2. Tu dong tao tai khoan ADMIN/ADMIN voi role BCN
3. Luu xuong file ngay lap tuc
Tu do BCN co the dang nhap ngay va bat dau su dung."

## 6.5 Nhom cau hoi ve QUY TRINH NHOM

### Q: Nhom lam viec nhu the nao?

**A (Tuấn Anh):** "Chia theo story trong epics, moi story la 1 task ro rang.
Dung Git, commit theo convention, code tren branch rieng roi merge vao main.
Co story files de ghi lai yeu cau va ket qua.
Review code, integration testing truoc khi chot."

### Q: Ai lam phan nao? (Hoi truc tiep tu Task Sheet)

**Cach tra loi cua tung nguoi:**

**Tuấn Anh (Leader):** "Em dieu phoi tong the, thiet ke cau truc project,
dong thoi dong vai tro trong auth, member, violation va reporting.
Em tich hop cac source file, review tong the, va chuan bi demo."

**Phuc:** "Em tap trung vao authentication, data persistence, va kien truc.
Em tham gia implement login, session, file I/O, va ho tro integration testing."

**Phu:**** "Em tap trung vao member management: CRUD, validation, cascade delete,
va dam bao tinh nhat quan cua du lieu khi sua/xoa thanh vien."

**Bao:** "Em tap trung vao violation processing: tinh phat, threshold vang lien tiep,
mark paid, va cac luong loc va tim kiem vi pham."

**Thang:** "Em tap trung vao reporting: thong ke theo ban, sap xep, export bao cao,
va ho tro docs va demo preparation."

## 6.6 Nhom cau hoi kho (DE BIET)

### Q: Neu member doi chuc vu thi fine cu the nao?

**A (Phu hoac Bao):** "Khi sua thanh vien va thay doi chuc vu, ham `recalcFines()` trong member.c
se quet tat ca vi pham chua thanh toan cua thanh vien do,
cap nhat lai so tien phat theo muc moi (20k hoac 50k),
va tinh lai `totalFine`. Vi pham da thanh toan khong bi anh huong."

### Q: Neu ung dung crash giua luc luu file thi sao?

**A (Phuc):** "Co che atomic save: ghi vao file .tmp truoc.
Neu crash trong khi ghi .tmp, file .dat cu van nguyen ven.
Neu crash sau khi doi .dat thanh .bak nhung truoc khi doi .tmp thanh .dat,
lan load tiep theo se thay .tmp con ton tai va .dat khong ton tai -> phuc hoi tu .tmp.
Neu ca 2 deu ton tai -> .dat la hop le, xoa .tmp."

### Q: Biet han che nao cua he thong khong?

**A (bat ky ai):** "Viec lo thong tin vi pham hien tai chi tim theo MSSV, chua ho tro tim theo ten.
Export bao cao chi ho tro .txt, chua co PDF hoac Excel.
Ngoai ra thong tin Admin trong seed data su dung mat khau khac voi flow tao member that."
(Khong can tu nhan nhieu hon can thiet, noi thuc te va khong che khong qua xa)

---

# 7. NHUNG LOI CAN TRANH KHI THUYET TRINH {#7-loi-can-tranh}

## 7.1 Loi ve thao tac

| Loi | Cach tranh |
|-----|-----------|
| Go sai menu option | Da go dung option truoc khi noi. Tap truoc |
| Nhap sai mat khau demo | Nho: ADMIN/ADMIN, SV0002/123456. Dán giấy lên màn hình nếu cần |
| App bi crash giua demo | Chay thu toan bo truoc 2 lan. Dung seed data sach |
| Terminal chu nho BGK khong doc duoc | Set font Consolas 18+ truoc |
| Mo file .txt cham | Co Notepad mo san truoc |

## 7.2 Loi ve cach noi

| Loi | Cach tranh |
|-----|-----------|
| Noi "he thong hoan hao" | Noi "he thong dap ung tot yeu cau mon" |
| Noi "khong co bug" | Noi "da test cac luong chinh va hoat dong on dinh" |
| Noi "bao mat cao" | Noi "co co che lock account va phan quyen theo role" |
| Noi "toi uu" | Noi "phu hop voi quy mo du lieu cua CLB" |
| Lan man, dai dong | Tra loi trong 2-3 cau. BGK hoi them thi noi them |
| Im lang khi BGK hoi | Nghi 2 giay roi tra loi. Khong biet thi noi "em xin bo sung them..." |

## 7.3 Loi ve tinh cach

| Loi | Cach tranh |
|-----|-----------|
| 1 nguoi noi het, 4 nguoi im | Nguoi duoc hoi chinh tra loi, nguoi khac bo sung ngan |
| Tra loi mau lam, sai | Nghi ro roi tra loi. Sai con hon la sai ve noi dung |
| Chen ngang BGK | Cho BGK hoi xong, doi 1-2 giay roi bat dau tra loi |
| Bao loi nguoi khac | Khong BAO GIO phuc bic loi sai cua dong doi truoc BGK. Bo sung them thong tin thay vi chinh phuc |

## 7.4 Loi ve du lieu

| Loi | Cach tranh |
|-----|-----------|
| Dung data da bi thay doi tu lan chay truoc | Chay `seed_data.exe` ngay truoc khi demo |
| Quen mat khau demo | ADMIN/ADMIN va SV0002/123456. Ghi ra giay |
| Thu tien nhung quen buoc do de trong demo | Chay theo dung kich ban, khong skip buoc |
| Khong kiem tra persistence vi thoi gian | Luon lam buoc thoat-mo lai-kiem tra |

---

# PHU LUC: BANG TONG HOP NHANH

## Menu BCN (15 chuc nang)

| Option | Ten | Module | Demo buoc |
|--------|-----|--------|-----------|
| 1 | Them thanh vien | member.c | D2 |
| 2 | Sua thanh vien | member.c | D3 |
| 3 | Xoa thanh vien | member.c | I1 |
| 4 | Ghi nhan vi pham | violation.c | E1, E2, E3 |
| 5 | Danh dau da thu tien | violation.c | G2 |
| 6 | Xem danh sach vi pham | violation.c | G1 |
| 7 | Thong ke theo ban | report.c | H1 |
| 8 | Kiem tra nguong Out CLB | violation.c | F1 |
| 9 | Sap xep theo vi pham | report.c | H2 |
| 10 | Xuat bao cao | report.c | H3 |
| 11 | Tim kiem theo ngay | violation.c | H4 |
| 12 | Xem profile | member.c | (khong demo) |
| 13 | Xem danh sach thanh vien | member.c | D1 |
| 14 | Doi mat khau | auth.c | (khong demo chinh) |
| 15 | Reset mat khau | auth.c | (khong demo chinh) |

## Menu Thanh vien (5 chuc nang)

| Option | Ten | Module | Demo buoc |
|--------|-----|--------|-----------|
| 1 | Xem profile ca nhan | member.c | J2 |
| 2 | Xem lich su vi pham | violation.c | J3 |
| 3 | Xem tien phat con no | violation.c | J4 |
| 4 | Xem danh sach thanh vien | member.c | (khong demo) |
| 5 | Doi mat khau | auth.c | (khong demo) |

## Tai khoan demo

| MSSV | Mat khau | Role | Muc dich |
|------|----------|------|----------|
| ADMIN | ADMIN | BCN | Toan bo luong admin |
| SV0002 | 123456 | Member | Demo member self-service |
| SV0011 | 123456 | Member | 4 vang LT, nhieu vi pham nhat |
| SV0008 | 123456 | Member | 3 vang LT, canh bao |
| SV0004 | 123456 | Leader | Demo phat 50k cho leader |
| SV0099 | SV0099 | Member | Them moi trong demo |

## Fine rule

| Chuc vu | Tien phat/vi pham |
|---------|-------------------|
| Thanh vien | 20,000 VND |
| Truong nhom / Pho nhom | 50,000 VND |
| BCN | 50,000 VND |
| Bao luc (bat ky role) | 0 VND + Out CLB |

## Threshold rule

| So vang lien tiep | Trang thai | Hanh dong |
|-------------------|-----------|-----------|
| 2 | Theo doi | Hien trong bang kiem tra |
| 3 | CANH BAO | Thong bao cho BCN |
| 4+ | QUA NGUONG | Hoi xac nhan BCN de Out CLB |
| Da Out | Out CLB | Khong ghi them vi pham duoc |

---

# KET LUAN

Day la kich ban chi tiet toan bo. De chuan bi tot:

1. **Moi nguoi doc phan minh** (Section 5) va hieu het cac cau hoi/tra loi
2. **Chay thu kich ban demo** (Section 4) tren may it nhat 2 lan
3. **Tap hoi dong** 1 lan de luyen Q&A (Section 6)
4. **Checklist** (Section 3) lam tat ca cac muc truoc khi len
5. **Tranh cac loi** (Section 7) - doc ky va nho
