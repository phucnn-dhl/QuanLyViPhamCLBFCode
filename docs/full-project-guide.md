# Huong dan Toan dien Project - He thong Quan ly Vi pham CLB F-Code

> Tai lieu nay danh cho nguoi moi, doc tu dau den cuoi se hieu het project
> va co the thuyet trinh. Moi chuong co ghi "Cau hoi thuong gap" de chuan bi.

---

## Chuong 1: Project nay lam gi?

### 1.1 Bai toan

CLB F-Code la mot cau lac bo sinh vien. CLB co thanh vien tham gia hoat dong,
nhung khi thanh vien vi pham noi quy (khong mac ao, vang hop, khong tham gia
hoat dong, bao luc) thi bi phat tien hoac bi Out CLB.

**Truoc day:** Ghi bang Excel hoac giay → kho quan ly, kho thong ke.

**Project nay:** Mot chuong trinh C chay tren terminal, giup Ban Chu Nhiem
(BCN) quan ly toan bo: them thanh vien, ghi vi pham, thu tien, thong ke, xuat
bao cao.

### 1.2 Ai su dung

| Vai tro | Lam duoc gi |
|---------|-------------|
| **BCN** (admin) | Moi thu: them/xoa thanh vien, ghi vi pham, thu tien, thong ke, xuat bao cao |
| **Truong nhom** | Giong thanh vien thuong |
| **Thanh vien** | Xem profile, xem vi pham cua minh, xem tien no, doi mat khau |

### 1.3 Man hinh chuong trinh

```
+---------------------------+
| DANG NHAP                 |  <-- Nhap MSSV + mat khau
+---------------------------+
         |
         v
  +-------------+        +------------------+
  | Menu BCN    |        | Menu Thanh vien  |
  | (15 chuc nang)|      | (5 chuc nang)    |
  +-------------+        +------------------+
         |                        |
         v                        v
  Them/xoa TV                Xem profile
  Ghi vi pham               Xem lich su VP
  Thu tien                  Xem tien no
  Thong ke/bao cao          Doi mat khau
  Tim kiem/ngay             Dang xuat
```

---

## Chuong 2: Cau truc Project

### 2.1 Thu muc

```
QuanLyViPhamCLBFCode/
├── include/           ← File .h (khai bao ham, struct)
│   ├── types.h        ← Dinh nghia toan bo struct va hang so
│   ├── auth.h         ← Khai bao ham dang nhap/xuat
│   ├── fileio.h       ← Khai bao ham doc/ghi file
│   ├── member.h       ← Khai bao ham quan ly thanh vien
│   ├── violation.h    ← Khai bao ham quan ly vi pham
│   ├── report.h       ← Khai bao ham bao cao
│   └── utils.h        ← Khai bao ham tien ich
├── src/               ← File .c (code chinh)
│   ├── main.c         ← Dieu khien chinh, menu
│   ├── auth.c         ← Dang nhap, doi mat khau
│   ├── fileio.c       ← Doc/ghi file .dat
│   ├── member.c       ← Them/sua/xoa thanh vien
│   ├── violation.c    ← Ghi vi pham, thu tien
│   ├── report.c       ← Thong ke, bao cao
│   └── utils.c        ← Ham tien ich dung chung
├── data/              ← Du lieu luu tru (binary .dat)
├── bin/               ← File chay (.exe)
├── build/             ← File .o (trung gian)
├── docs/              ← Tai lieu
└── Makefile           ← Lenh build
```

### 2.2 Tai sao tach .h va .c?

- **File .h** (header): Chua "lo go" cua ham — ten ham, tham so, kieu tra ve.
  Giup cac file khac biet ham do ton tai va goi duoc.
- **File .c** (source): Chua code thuc te cua ham.

**Tuong tu thuc te:** .h giong "danh bạ" (biet ten, so dien thoai), .c giong
"nguoi thuc te" (khi goi dien thi nguoi do tra loi).

**Vi du:**
```c
// include/utils.h - Chi khai bao
void formatTime(time_t t, char *buffer, size_t bufSize);

// src/utils.c - Code thuc te
void formatTime(time_t t, char *buffer, size_t bufSize) {
    struct tm *timeinfo = localtime(&t);
    strftime(buffer, bufSize, "%d/%m/%Y %H:%M", timeinfo);
}
```

### 2.3 Co bao nhieu module?

| Module | File | Trach nhiem |
|--------|------|-------------|
| **Types** | types.h | Dinh nghia du lieu (struct, hang so) |
| **Utils** | utils.h + utils.c | Tien ich dung chung (nhap, validate, ngay) |
| **FileIO** | fileio.h + fileio.c | Doc/ghi file binary an toan |
| **Auth** | auth.h + auth.c | Dang nhap/xuat, mat khau |
| **Member** | member.h + member.c | CRUD thanh vien |
| **Violation** | violation.h + violation.c | Vi pham, thu tien, loc |
| **Report** | report.h + report.c | Thong ke, xuat bao cao |
| **Main** | main.c | Menu, dieu khien chinh |

**Cau hoi thuong gap:** "Tai sao khong bo tat ca vao 1 file?"
→ Tach module giup code de doc, de sua, de test. Moi nguoi chi viec phan
cua minh. Day la nguyen tac "Separation of Concerns".

---

## Chuong 3: Du Lieu

### 3.3 Cau truc du lieu chinh

```c
// Thanh vien
typedef struct {
    char studentId[10];    // MSSV: "SV0001"
    char fullName[50];     // Ten: "Nguyen Van A"
    char email[50];        // Email
    char phone[15];        // SDT
    int team;              // Ban: 0=Hoc thuat, 1=Ke hoach, 2=Nhan su, 3=Truyen thong
    int role;              // Chuc vu: 0=TV, 1=Truong nhom, 2=BCN
    int isActive;          // Trang thai: 1=Hoat dong, 0=Out CLB
    int consecutiveAbsences; // So buoi vang lien tiep
    int violationCount;    // Tong so vi pham
    double totalFine;      // Tong tien no
} Member;

// Vi pham
typedef struct {
    char studentId[10];    // MSSV cua nguoi vi pham
    time_t violationTime;  // Thoi gian vi pham (timestamp)
    int reason;            // Ly do: 0=Khong mac ao, 1=Vang, 2=Khong tham gia, 3=Bao luc
    double fine;           // Tien phat
    int isPaid;            // Da thu? 1=Co, 0=Chua
    int penalty;           // Hinh phat: 0=Phat tien, 1=Out CLB
    char note[100];        // Ghi chu
} Violation;

// Tai khoan dang nhap
typedef struct {
    char studentId[10];    // MSSV (dung lam username)
    char password[20];     // Mat khau
    int role;              // 0=Thanh vien, 1=BCN
    int isLocked;          // 1=Da bi khoa
    int failCount;         // So lan nhap sai
} Account;
```

### 3.4 Cach luu tru

Du lieu duoc luu trong **3 file binary** (.dat):

```
accounts.dat    ← [int count] [Account 1] [Account 2] ...
members.dat     ← [int count] [Member 1]  [Member 2]  ...
violations.dat  ← [int count] [Violation 1] [Violation 2] ...
```

Moi file bat dau bang 1 so nguyen `int` cho biet co bao nhieu ban ghi, theo
sau la mang cac struct ghi lien tiep.

**Tai sao dung binary ma khong dung text (CSV/JSON)?**
- Doc/ghi nhanh hon (khong can parse)
- File nho hon (khong luu ten cot, dau phay, dau ngoac kep)
- Don gian — dung `fread`/`fwrite` truc tiep, khong can thu vien ben ngoai

**Nhuoc diem:** Khong mo duoc bang Notepad. Nhung de giai quyet, co chuc nang
"xuat bao cao" ra file .txt de doc.

### 3.5 Toan bo du lieu nam trong RAM

```c
// main.c
static AppDatabase gDb;  // Mot bien duy nhat chua TAT CA du lieu

typedef struct {
    Member members[1000];       // Toi da 1000 thanh vien
    Violation violations[10000];// Toi da 10000 vi pham
    Account accounts[1000];     // Toi da 1000 tai khoan
    int memberCount;            // So thanh vien hien tai
    int violationCount;         // So vi pham hien tai
    int accountCount;           // So tai khoan hien tai
} AppDatabase;
```

**Tai sao khong dung database (MySQL, SQLite)?**
- Day la project hoc tap C, tap trung vao tu duy lap trinh C thuần
- Du lieu nho (toi da 1000 thanh vien) → RAM du cho
- Khong can cai dat them phan mem nao

---

## Chuong 4: Luong Du Lieu Chinh

### 4.1 Dang nhap

```
Nhap MSSV + Mat khau
        |
        v
  Tim tai khoan trong accounts[]
        |
   Khong tim thay → "Tai khoan khong ton tai"
   Tim thay → Kiem tra mat khau
        |
   Sai → Tang failCount
        |     failCount >= 3 → Khoa tai khoan, luu vao file
        |     failCount < 3  → "Con lai X lan thu"
        |
   Dung → Reset failCount = 0
          Luu vao file
          Luu thong tin vao session (bien static)
          Chuyen den menu theo role
```

### 4.2 Ghi nhan vi pham

```
Nhap MSSV
    |
    v
Tim thanh vien → Khong ton tai? → Loi
    |
    v
Da Out CLB? → Loi (khong ghi nhan duoc nua)
    |
    v
Chon ly do vi pham
    |
    +--- Khong mac ao / Khong tham gia HD:
    |       Phat tien (20k TV, 50k Truong nhom)
    |       Reset consecutiveAbsences = 0
    |
    +--- Vang hop:
    |       Phat tien
    |       Tang consecutiveAbsences
    |       Neu >= 3: Canh bao
    |       Neu >= 4: Hoi xac nhan Out CLB
    |
    +--- Bao luc:
            Phat 0 VND
            Hoi xac nhan Out CLB ngay
            Reset consecutiveAbsences = 0
    |
    v
Nhap ghi chu
    |
    v
Luu violations.dat + members.dat (co rollback neu loi)
```

### 4.3 Xoa thanh vien (Cascade Delete)

```
Nhap MSSV → Tim thanh vien
    |
    v
Kiem tra: Dang xoa chinh minh? → Loi
    |
    v
Xac nhan xoa
    |
    v
Xoa account (thu hoi quyen truy cap)
    |   Dich phan tu phia sau len lap day khoang trong
    v
Xoa toan bo violations cua thanh vien do
    |   Cung cach: dich phan tu len
    v
Xoa member
    |
    v
Luu 3 file: accounts → violations → members
```

**Cau hoi thuong gap:** "Tai sao luu theo thu tu do?"
→ Luu account truoc de dam bao ngay ca khi loi o buoc giua, tai khoan da bi
thu hoi (khong con quyen truy cap).

---

## Chuong 5: Cac Module Chi Tiet

### 5.1 types.h — "Nha kho du lieu"

Chua tat ca dinh nghia du lieu cua toan bo project. **Chi co 1 file nay** dinh
nghia struct, tat ca file khac chi `#include` vao.

**Tai sao:** De tranh "vong tron" (file A include B, B include A). Tat ca struct
nam trong 1 file duy nhat.

**Hang so quan trong:**
```c
#define MAX_MEMBERS    1000    // Gioi han thanh vien
#define MAX_VIOLATIONS 10000   // Gioi han vi pham

#define TEAM_ACADEMIC  0       // Ban Hoc thuat
#define TEAM_PLANNING  1       // Ban Ke hoach
#define TEAM_HR        2       // Ban Nhan su
#define TEAM_MEDIA     3       // Ban Truyen thong

#define REASON_NO_JACKET  0    // Khong mac ao CLB
#define REASON_ABSENT     1    // Vang hop
#define REASON_NO_ACTIVITY 2   // Khong tham gia hoat dong
#define REASON_VIOLENCE   3    // Bao luc
```

### 5.2 utils.c — "Hop dung cu"

Cung cap ham tien ich cho tat ca module khac:

| Ham | Lam gi |
|-----|--------|
| `readString()` | Doc chuoi an toan, khong tran bo nho |
| `readInt()` | Doc so nguyen, tu dong xoa stdin |
| `isEmailValid()` | Kiem tra email hop le |
| `isIdValid()` | Kiem tra MSSV hop le |
| `isPhoneValid()` | Kiem tra so dien thoai |
| `parseDate()` | Chuyen "dd/mm/yyyy" → time_t |
| `formatTime()` | Chuyen time_t → "dd/mm/yyyy HH:MM" |
| `teamName()` | So ban → ten tieng Viet ("Hoc thuat") |
| `reasonName()` | So ly do → ten tieng Viet ("Vang mat") |

**Tai sao can module nay:** Tranh viet lai cung mot nhieu lan. Vi du:
`teamName()` duoc dung o report.c, violation.c, member.c — viet 1 lan,
dung o nhieu cho.

### 5.3 fileio.c — "Thu kho"

| Ham | Lam gi |
|-----|--------|
| `fileioLoadAll()` | Doc ca 3 file .dat vao RAM |
| `fileioSaveMembers()` | Ghi members[] ra file |
| `fileioSaveViolations()` | Ghi violations[] ra file |
| `fileioSaveAccounts()` | Ghi accounts[] ra file |

**Ky thuat an toan (da giai thich o technical-highlights.md):**
- Atomic save: ghi vao .tmp → rename thanh .dat
- Crash recovery: kiem tra .tmp luc khoi dong
- Bounds checking: kiem tra count khong vuot gioi han

### 5.4 auth.c — "Bao ve"

| Ham | Lam gi |
|-----|--------|
| `authLogin()` | Dang nhap, khoa TK sau 3 lan sai |
| `authLogout()` | Dang xuat, xoa session |
| `authGetSession()` | Lay thong tin nguoi dang nhap hien tai |
| `authChangePassword()` | Doi mat khau (can nhap MK cu) |
| `authResetPassword()` | BCN reset MK thanh vien ve MSSV |

**Ky thuat:** Session duoc luu trong bien `static` chi file auth.c
moi truy cap duoc → "encapsulation" giong private trong OOP.

### 5.5 member.c — "Quan ly nhan su"

| Ham | Lam gi |
|-----|--------|
| `memberFindById()` | Tim thanh vien theo MSSV |
| `memberValidateInput()` | Kiem tra email, phone, ten |
| `memberAdd()` | Them thanh vien + tu tao tai khoan |
| `memberEdit()` | Sua thong tin + tinh lai phat neu doi role |
| `memberDelete()` | Xoa thanh vien + cascade xoa VP + TK |
| `memberViewProfile()` | Xem profile ca nhan |
| `memberListAll()` | Xem danh sach (phan trang 20 dong) |

### 5.6 violation.c — "Giam sat ky luat"

| Ham | Lam gi |
|-----|--------|
| `violationRecord()` | Ghi nhan vi pham moi |
| `violationMarkPaid()` | BCN danh dau da thu tien |
| `violationViewOwn()` | Thanh vien xem VP cua minh |
| `violationViewFines()` | Thanh vien xem tien no |
| `violationViewAllFiltered()` | BCN xem VP co loc |
| `violationCheckAllOutClb()` | Kiem tra nguong Out CLB |
| `violationSearchByDate()` | Tim VP theo khoang ngay |

### 5.7 report.c — "Ke toan"

| Ham | Lam gi |
|-----|--------|
| `reportTeamStats()` | Thong ke thu/no theo ban |
| `reportSortMembersByViolations()` | Xep hang TV theo so VP |
| `reportExportTxt()` | Xuat bao cao ra file .txt |

---

## Chuong 6: Cac Cau Hoi Thuyet Trinh Thuong Gap

### Q1: "Tai sao chon C ma khong chon Python/Java?"

- Bai tap yeu cau dung C de lap trinh co ban
- C cho phep hieu ro cach quan ly bo nho, file I/O
- Khong can cai dat moi truong phuc tap (chi can gcc)

### Q2: "Lam sao dam bao du lieu khong bi mat khi chuong trinh crash?"

Chung toi su dung **3-file atomic save strategy**:
1. Ghi vao file .tmp (tam)
2. Doi ten .dat cu thanh .bak (backup)
3. Doi ten .tmp thanh .dat (chinh)
4. Xoa .bak

Neu crash o buoc nao, luon co the phuc hoi tu file con ton tai. Chi mat du lieu
khi ca 3 file bi huong dong thoi — xac suat rat thap.

### Q3: "Lam sao dam bao nhat quan du lieu khi ghi nhieu file cung luc?"

Su dung **transaction rollback pattern**: Luu trang thai cu (snapshot) vao
bien tam, thu luu, neu loi thi restore lai tu snapshot.

### Q4: "Thuat toan sap xep dung gi? Tai sao khong dung qsort?"

Dung **Selection Sort tu viet** tren mang con tro. Ly do:
- `qsort()` cua C khong truyen duoc `db` (context) vao ham so sanh
- Voi 1000 thanh vien, O(n^2) van cham chi trong duoi 1 giay
- De trinh bay va giai thich cho giao vien

### Q5: "Muc phat thay doi khi doi chuc vu thi sao?"

Khi BCN sua chuc vu thanh vien, he thong **tu dong tinh lai** muc phat cho
tat ca vi pham chua dong. Vi pham da dong la lich su, khong bi anh huong.

### Q6: "Lam sao ngan thanh vien tu xoa chinh minh?"

Ham `memberDelete()` kiem tra `authGetSession()` de biet ai dang dang nhap.
Neu MSSV can xoa trung voi session hien tai → tu choi.

### Q7: "Tai saoViolation khong luon team?"

Vi team cua thanh vien co the thay doi (chuyen ban). Neu luu team trong
violation, khi thanh vien chuyen ban thi bao cao cu se sai. Thiet ke hien tai
luon "tra cuu nguoc" tu violation → member → team de lay team moi nhat.

### Q8: "Co bao nhieu compiler warning va tai sao?"

30+ flags nhu `-Wall`, `-Wshadow`, `-Wconversion`... Muc dich:
- Phat hien bug som ngay tu giai doan compile
- Dam bao code chat luong, khong co warning nao khi build
- Giong nhu "spell checker" cho code

### Q9: "He thong bao mat the nao?"

- **Account lockout:** 3 lan sai mat khau → khoa tai khoan
- **Role-based access:** BCN moi lam duoc thao tac nhay cam
- **Session private:** Chi auth.c truy cap session, module khac phai goi ham
- **Password reset:** Chi BCN duoc reset, mat khau moi = MSSV

### Q10: "Neu thanh vien vang nhieu lan thi sao?"

- Vang 2 lan lien tiep → "Theo doi"
- Vang 3 lan → "CANH BAO" (them 1 buoi nua la Out)
- Vang 4+ lan → Hoi xac nhan Out CLB
- Bao luc → Out CLB ngay (khong phat tien)

Chu y: "Lien tiep" — neu vang hom nay nhung ngay mai di (mac ao, tham gia)
thi bo dem ve 0. Chi vang hop moi tang dem.

---

## Chuong 7: Cach Chay Demo

### 7.1 Build va nap data

```bash
mingw32-make           # Build
bin\seed_data.exe      # Nap demo data
```

### 7.2 Thu tu demo goi y

1. **Dang nhap BCN:** ADMIN / ADMIN
2. **Xem danh sach thanh vien** (option 13) → cho thay 14 thanh vien
3. **Thong ke theo ban** (option 7) → cho thay da thu / con no
4. **Kiem tra Out CLB** (option 8) → cho thay SV0011 gan Out
5. **Tim kiem theo ngay** (option 11) → nhap 01/03/2026 - 30/04/2026
6. **Xuat bao cao** (option 10) → mo file .txt cho thay
7. **Thu tien** (option 5) → thu cho SV0002
8. **Dang xuat, login SV0002** → xem lich su vi pham, tien no
9. **Reset data:** `bin\seed_data.exe clear`

### 7.3 Tai lieu tham khao

- `docs/demo-and-test-guide.md` — Huong dan demo chi tiet tung buoc
- `docs/technical-highlights.md` — 18 ky thuat lap trinh voi giai thich
