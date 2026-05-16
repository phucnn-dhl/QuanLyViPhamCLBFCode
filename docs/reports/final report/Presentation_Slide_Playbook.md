# Presentation Slide Playbook

## Mục đích của file này

File này là bản hướng dẫn **thực chiến** để làm slide thuyết trình cho project:

**F-Code Club Member Violation Management System**

Khác với file guideline tổng quát, file này đi theo kiểu:

- Slide nào nên có gì
- Nên để chữ gì trên slide
- Nên chèn hình gì
- Nên vẽ sơ đồ gì
- Khi nói nên nhấn ý gì
- Chỗ nào nên tránh nói quá tay
- Chỗ nào nên chuẩn bị để demo và Q&A

Mục tiêu là để nhóm có thể:

- mở file này
- làm slide theo đúng thứ tự
- copy ý chính sang PowerPoint / Canva / Google Slides
- có luôn khung nói khi thuyết trình

---

## 1. Mục tiêu thực sự của bộ slide

Khi hội đồng xem slide và nghe nhóm nói, họ thường đánh giá theo các câu hỏi ngầm sau:

1. **Bài toán này có thật và có hợp lý không?**
2. **Nhóm có hiểu yêu cầu đề bài không?**
3. **Nhóm có làm đủ các luồng chính không?**
4. **Code có được tổ chức bài bản không?**
5. **Nhóm có hiểu hệ thống mình xây hay chỉ ghép code?**
6. **Sản phẩm có demo được thật không?**

Vì vậy, bộ slide tốt phải giúp trả lời được 6 câu hỏi trên.

Nếu phải rút gọn, slide vẫn phải giữ được 4 trụ cột:

- **Problem**
- **Features**
- **Architecture / Logic**
- **Demo**

---

## 2. Tư duy làm slide cho project này

Project này là **CLI application bằng C**, nên điểm mạnh để đưa lên slide không nằm ở giao diện đẹp mà nằm ở:

- logic nghiệp vụ rõ
- tách module hợp lý
- file I/O và persistence
- xử lý role / permission / fine / payment / threshold
- demo được trên terminal

Do đó, khi làm slide:

- đừng cố “trang điểm UI” quá nhiều
- đừng biến slide thành poster
- đừng nhét quá nhiều ảnh terminal nhỏ li ti

Thay vào đó, nên ưu tiên:

- sơ đồ luồng
- bảng chức năng
- tóm tắt data model
- 1-2 ảnh terminal tiêu biểu
- bullet ngắn, rõ, có ý chính

---

## 3. Độ dài bộ slide khuyến nghị

Nên làm khoảng:

- **12 slide chính**
- cộng thêm **1 slide Q&A**

Tổng là khoảng **13 slide**

Nếu thời gian rất thoải mái:

- có thể làm `14-15 slide`

Nếu thời gian ngắn:

- giữ `10-11 slide`

Nhưng không nên dưới `9 slide`, vì sẽ quá gấp và thiếu logic.

---

## 4. Cấu trúc bộ slide đề xuất

### Tổng thể bộ slide

1. Title
2. Problem Statement
3. Objectives and Scope
4. User Roles and Main Features
5. System Workflow
6. System Architecture
7. Data Structures
8. Core Business Logic
9. Technical Highlights
10. Testing and Validation
11. Demo Plan
12. Limitations and Future Improvements
13. Conclusion / Q&A

---

## 5. Playbook chi tiết từng slide

## Slide 1 - Title Slide

### Mục tiêu

Giới thiệu project, tên nhóm, thành viên và ngữ cảnh.

### Nội dung nên có

- Tên đề tài:
  - `F-Code Club Member Violation Management System`
- Team name:
  - `mid`
- Mentor:
  - `Nguyễn Khoa`
- Nhóm thành viên:
  - Đàm Lê Tuấn Anh
  - Nguyễn Ngọc Phúc
  - Nguyễn Văn Phú
  - Huỳnh Gia Bảo
  - Võ Hiếu Thắng
- Dòng phụ:
  - `Train-C Final Project`
  - hoặc `Academic Board - F-Code Club`

### Nên trình bày thế nào

**Layout gợi ý:**

- Trên cùng: tên đề tài lớn
- Ở giữa: 1 subtitle ngắn
- Dưới cùng: nhóm, mentor, thành viên

### Nên chèn hình gì

Nên có 1 trong các lựa chọn sau:

- logo F-Code nếu có file đẹp
- icon terminal / code đơn giản
- nền hình trừu tượng công nghệ nhẹ

Không nên:

- dùng quá nhiều icon lòe loẹt
- để ảnh nền rối chữ khó đọc

### Trọng tâm khi nói

- Chào hội đồng
- Giới thiệu tên project
- Giới thiệu đây là hệ thống gì
- Nói ngắn gọn được viết bằng C, chạy trên terminal

### Thời lượng nói

Khoảng `20-30 giây`

---

## Slide 2 - Problem Statement

### Mục tiêu

Làm rõ pain point của CLB nếu không có hệ thống.

### Nội dung nên có

Nên chia thành 2 cột:

| Thực trạng | Hệ quả |
| --- | --- |
| Quản lý vi phạm rời rạc | Khó tra cứu |
| Theo dõi thủ công | Dễ sai sót |
| Cuối kỳ tổng hợp bằng tay | Tốn thời gian |
| Không rõ ai nợ phạt / gần Out CLB | Khó xử lý minh bạch |

### Câu chữ gợi ý để đặt trên slide

**Title:**
`Problem Statement`

**Bullets:**

- F-Code Club has many members across 4 teams
- Violations need to be tracked consistently
- Manual tracking is fragmented and error-prone
- Hard to know outstanding fines and Out CLB threshold

### Nên chèn hình gì

Một sơ đồ “before vs after” rất hợp:

```text
Before:
Zalo / ghi nhớ / file rời rạc

After:
Single CLI system
```

Hoặc dùng icon:

- chat bubble
- notebook
- warning
- database/file

### Trọng tâm khi nói

- Đây là bài toán quản lý thực tế
- Khó khăn không phải chỉ “ghi vi phạm”, mà là:
  - theo dõi lâu dài
  - thu tiền phạt
  - quyết định Out CLB minh bạch

### Thời lượng nói

Khoảng `40-50 giây`

---

## Slide 3 - Objectives and Scope

### Mục tiêu

Cho hội đồng biết project này được xây để giải quyết cái gì và trong phạm vi nào.

### Nội dung nên có

**Objectives**

- Manage member records
- Record violations
- Calculate fines automatically
- Track payment status
- Support reporting and search
- Persist data to file

**Scope / Constraints**

- Written in `C`
- Runs on `CLI / terminal`
- Uses `.dat` files
- No database
- No external libraries

### Cách trình bày tốt

Chia slide làm 2 khối:

- `Project Objectives`
- `Technical Constraints`

### Nên chèn hình gì

Không cần ảnh lớn.  
Có thể dùng 6 icon nhỏ tương ứng:

- member
- warning
- money
- report
- file
- terminal

### Trọng tâm khi nói

- Nhóm tập trung đúng yêu cầu môn
- Hệ thống không hướng tới GUI hay cloud
- Điểm chính là logic và persistence

### Thời lượng nói

Khoảng `40 giây`

---

## Slide 4 - User Roles and Main Features

### Mục tiêu

Cho thấy ai dùng hệ thống và mỗi role có thể làm gì.

### Nội dung nên có

Nên trình bày theo bảng:

| Role | Main Actions |
| --- | --- |
| Member | View profile, own violations, own fines, member list, change password |
| BCN/Admin | Full management, violation recording, payment marking, statistics, export, search |

Sau đó thêm một nhóm bullet:

**Main feature groups**

- Authentication
- Member management
- Violation management
- Reporting and export

### Nên chèn hình gì

Rất nên có sơ đồ role-based access:

```text
Login
 ├─ Member Menu
 └─ BCN Menu
```

Đây là sơ đồ rất đơn giản nhưng cực hiệu quả.

### Trọng tâm khi nói

- Phân quyền là điểm quan trọng
- Member chỉ xem được thông tin của mình
- BCN có toàn quyền quản lý

### Nên nhấn thêm

Trong code có 2 loại role:

- `Account.role` để vào menu
- `Member.role` để tính tiền phạt

Nếu có thời gian, đây là chi tiết rất đáng nói.

### Thời lượng nói

Khoảng `45-60 giây`

---

## Slide 5 - System Workflow

### Mục tiêu

Cho hội đồng hình dung hệ thống hoạt động từ đầu đến cuối ra sao.

### Nội dung nên có

Nên vẽ 1 workflow lớn:

```text
Start Program
   ↓
Load data from files
   ↓
Login
   ↓
Route by role
   ├─ Member menu
   └─ BCN menu
   ↓
Perform action
   ↓
Save updated data
```

### Tại sao slide này quan trọng

Vì nó giúp nối:

- requirement
- architecture
- demo

Nếu không có slide này, phần thuyết trình dễ bị rời rạc.

### Nên chèn hình gì

Chỉ cần sơ đồ flowchart đơn giản là đủ.  
Không cần hình màn hình ở slide này.

### Trọng tâm khi nói

- Chương trình load dữ liệu ngay từ đầu
- Sau login sẽ route theo role
- Mọi thao tác quan trọng đều tác động lên in-memory state và sau đó save xuống file

### Thời lượng nói

Khoảng `40 giây`

---

## Slide 6 - System Architecture

### Mục tiêu

Cho thấy nhóm có tổ chức code rõ ràng.

### Nội dung nên có

Nên show sơ đồ module:

```text
main
 ├─ auth
 ├─ member
 ├─ violation
 ├─ report
 ├─ fileio
 └─ utils
```

Sau đó thêm mô tả ngắn:

- `main`: menu and application loop
- `auth`: login, session, password
- `member`: CRUD operations
- `violation`: fine and discipline logic
- `report`: statistics and export
- `fileio`: load/save `.dat`
- `utils`: validation and helpers

### Nên chèn hình gì

Nên vẽ sơ đồ module block rõ ràng.

Không nên:

- chụp nguyên cây thư mục từ VS Code

Vì nhìn không đẹp và không cô đọng.

### Trọng tâm khi nói

- Nhóm tránh nhồi logic vào `main.c`
- Chia module giúp code dễ bảo trì, dễ kiểm thử, dễ giải thích
- Cấu trúc này cũng bám sát yêu cầu tổ chức code trong đề

### Thời lượng nói

Khoảng `50-60 giây`

---

## Slide 7 - Data Structures

### Mục tiêu

Giải thích các entity chính và cách dữ liệu được lưu.

### Nội dung nên có

Nên dùng bảng:

| Struct | Purpose | Key Fields |
| --- | --- | --- |
| `Account` | Authentication | `studentId`, `password`, `role`, `isLocked`, `failCount` |
| `Member` | Member profile | `studentId`, `fullName`, `team`, `role`, `totalFine`, `consecutiveAbsences` |
| `Violation` | Discipline record | `studentId`, `reason`, `violationTime`, `fine`, `isPaid`, `penalty` |
| `AppDatabase` | In-memory system state | arrays + counts |

### Nên chèn hình gì

Có thể dùng sơ đồ quan hệ đơn giản:

```text
Member 1 --- n Violation
Member 1 --- 1 Account
```

Rất nên có sơ đồ này vì nó giúp hội đồng hiểu nhanh dữ liệu.

### Trọng tâm khi nói

- `Member` là hồ sơ chính
- `Violation` nối với member qua `studentId`
- `Account` tách riêng để xử lý xác thực
- `AppDatabase` gom toàn bộ state vào một chỗ

### Thời lượng nói

Khoảng `50-60 giây`

---

## Slide 8 - Core Business Logic

### Mục tiêu

Nêu các rule “đắt” nhất của hệ thống.

### Nội dung nên có

Chia thành 3 cụm:

#### 1. Fine Calculation

- Member: `20,000 VND`
- Leader / BCN: `50,000 VND`
- Violence: `0 VND` and Out CLB handling

#### 2. Consecutive Absence Rule

- Track `consecutiveAbsences`
- Warning threshold
- Out CLB confirmation flow

#### 3. Payment Update

- Record violation → create debt
- Mark paid → update `isPaid`
- Recalculate `totalFine`

### Nên chèn hình gì

Có thể dùng 3 khối card ngang.

Nếu muốn chi tiết hơn, vẽ mini flow:

```text
Record violation
   ↓
calculate fine
   ↓
update member status
   ↓
save data
```

### Trọng tâm khi nói

- Đây là phần thể hiện project có business logic thật
- Không chỉ lưu dữ liệu, mà có rule xử lý theo role và theo hành vi vi phạm

### Thời lượng nói

Khoảng `60 giây`

---

## Slide 9 - Technical Highlights

### Mục tiêu

Cho thấy nhóm có kỹ thuật lập trình tử tế chứ không chỉ “làm xong chức năng”.

### Nội dung nên có

Nên chọn 5 ý mạnh nhất:

1. Binary file persistence with `.dat`
2. Save after every mutation
3. Atomic save using `.tmp` and `.bak`
4. Rollback when multi-file update fails
5. Pointer-array sorting without modifying original member array

Nếu còn chỗ, thêm:

6. Auto-create default `ADMIN/ADMIN`
7. Date search using normalized start/end of day

### Nên chèn hình gì

Rất nên có 1 sơ đồ nhỏ cho atomic save:

```text
data.dat
   ↓
write data.tmp
   ↓
backup to data.bak
   ↓
replace data.dat
```

Sơ đồ này rất đáng giá vì:

- dễ nhìn
- thể hiện chiều sâu kỹ thuật
- dễ nói

### Trọng tâm khi nói

- nhóm có quan tâm tới tính ổn định dữ liệu
- dù là project CLI bằng C, vẫn cố gắng xử lý save an toàn

### Thời lượng nói

Khoảng `60-75 giây`

---

## Slide 10 - Testing and Validation

### Mục tiêu

Cho thấy nhóm có kiểm thử có chủ đích.

### Nội dung nên có

Nên chia thành 5 nhóm:

- Authentication tests
- Member CRUD tests
- Violation flow tests
- Reporting tests
- Persistence tests

Hoặc bảng ngắn:

| Area | What was checked |
| --- | --- |
| Login | success, fail, lock |
| Member | add, edit, delete, profile, list |
| Violation | record, payment, threshold |
| Report | statistics, export, search |
| Data | restart persistence |

### Nên chèn hình gì

Không bắt buộc.  
Có thể chỉ dùng checklist icon.

### Trọng tâm khi nói

- nhóm đã test không chỉ happy path
- có test lock account
- có test payment flow
- có test save/load sau restart
- có seed data để demo lặp lại ổn định

### Thời lượng nói

Khoảng `45-60 giây`

---

## Slide 11 - Demo Plan

### Mục tiêu

Chuẩn bị rõ hội đồng sắp xem gì trong terminal.

### Nội dung nên có

Nên để đúng các bước demo:

1. Start application
2. Login as `ADMIN / ADMIN`
3. View member list
4. Record a violation
5. View violations / mark paid
6. Show team statistics
7. Export report
8. Login as member
9. View own violations and fines

### Nên chèn hình gì

Có thể để:

- 1 ảnh terminal login
- 1 ảnh terminal menu admin

Hoặc giữ slide sạch, chỉ để plan.

### Trọng tâm khi nói

- Nhóm sẽ demo từ admin flow sang member flow
- Mục đích là cho thấy hệ thống không chỉ lưu dữ liệu mà còn xử lý nghiệp vụ và reporting

### Lưu ý cực quan trọng

Demo phải khớp dữ liệu seed hiện tại:

- `ADMIN / ADMIN`
- `SV0002 / 123456`

### Thời lượng nói

Khoảng `20-30 giây` trước khi chuyển sang demo thật

---

## Slide 12 - Limitations and Future Improvements

### Mục tiêu

Nói thật nhưng giữ hình ảnh tích cực.

### Nội dung nên có

**Current limitations**

- CLI-based interaction only
- Local binary file storage
- Export supports text report format
- Some flows can still be improved for usability

**Future improvements**

- richer search and filtering
- more report formats
- improved admin overview
- stronger validation for edge cases

### Nên chèn hình gì

Không cần hình lớn.  
Có thể chia đôi slide:

- left: current limitations
- right: future improvements

### Trọng tâm khi nói

- nhóm hoàn thành đúng trọng tâm môn học
- nếu phát triển tiếp thì sẽ ưu tiên usability và report depth

### Thời lượng nói

Khoảng `35-45 giây`

---

## Slide 13 - Conclusion / Q&A

### Mục tiêu

Chốt lại giá trị của project và mời đặt câu hỏi.

### Nội dung nên có

**Conclusion**

- Solves a real club management problem
- Covers major required workflows
- Uses modular C architecture
- Supports real terminal demo with persistent data

Sau đó:

`Thank you - Q&A`

### Nên chèn hình gì

- logo nhóm / logo F-Code / icon question

### Trọng tâm khi nói

- Nhóm đã xây được hệ thống hoàn chỉnh theo phạm vi môn
- Mời hội đồng đặt câu hỏi

### Thời lượng nói

Khoảng `20-30 giây`

---

## 6. Nên dùng hình gì trong toàn bộ deck

## 6.1. Những loại hình nên dùng

### 1. Sơ đồ workflow

Rất nên có:

- login flow
- role routing flow
- atomic save flow
- demo flow

### 2. Sơ đồ module

Phải có ít nhất 1 slide architecture với sơ đồ module.

### 3. Sơ đồ quan hệ dữ liệu

Nên có:

- Member - Account - Violation

### 4. Ảnh chụp terminal

Chỉ nên dùng **2 đến 4 ảnh**

Ví dụ:

- login screen
- admin menu
- violation list
- exported report

### 5. Bảng nhỏ / summary table

Rất hợp với project này:

- role table
- feature summary
- test summary

---

## 6.2. Những loại hình không nên dùng

- ảnh meme
- icon quá màu mè
- chụp nguyên cả IDE
- screenshot terminal quá dài, chữ nhỏ khó đọc
- hình nền rối làm chìm chữ

---

## 7. Trọng tâm thật sự của bộ slide

Nếu nhóm bị thiếu thời gian, hãy ưu tiên làm mạnh 5 slide sau:

### Quan trọng nhất

1. Problem Statement
2. Main Features
3. Architecture
4. Core Business Logic
5. Demo Plan

### Quan trọng thứ hai

6. Data Structures
7. Technical Highlights
8. Testing

### Quan trọng thứ ba

9. Limitations
10. Q&A

---

## 8. Nên show gì khi demo

Phần demo không nên chạy lung tung.  
Chỉ nên show những thứ có giá trị nhất.

## 8.1. Nên show ở admin flow

- login
- member list
- record violation
- violation list / filter
- mark paid
- statistics
- export report

## 8.2. Nên show ở member flow

- own profile
- own violation history
- own outstanding fines

## 8.3. Thứ nên tránh trong demo

- nhập quá nhiều tay
- đi lòng vòng menu không mục đích
- test edge case dài dòng trong lúc demo chính
- đổi password giữa demo nếu không thật sự cần

---

## 9. Cách nói để slide thuyết phục hơn

## 9.1. Nên dùng kiểu nói này

- “Nhóm chia hệ thống thành các module…”
- “Trong code hiện tại, luồng xử lý chính là…”
- “Điểm nhóm muốn nhấn mạnh là…”
- “Business rule ở đây là…”
- “Để đảm bảo dữ liệu không bị mất, nhóm…”
- “Ở phạm vi môn học, nhóm ưu tiên…”

## 9.2. Nên tránh kiểu nói này

- “Project này gần như hoàn hảo”
- “Không có bug”
- “Bảo mật rất cao”
- “Tối ưu tuyệt đối”
- “Không thể mất dữ liệu”

---

## 10. Câu hỏi Q&A dễ bị hỏi và cách chuẩn bị

## 10.1. Về công nghệ

### Hỏi:
Tại sao dùng C?

### Chuẩn bị:

- vì project thuộc Train-C
- vì muốn luyện struct, file I/O, module hóa
- vì phù hợp với phạm vi đề bài CLI

## 10.2. Về lưu trữ

### Hỏi:
Tại sao không dùng database?

### Chuẩn bị:

- yêu cầu môn hạn chế công nghệ
- dữ liệu không quá lớn
- file `.dat` đủ để đáp ứng persistence

## 10.3. Về business logic

### Hỏi:
Fine được tính thế nào?

### Chuẩn bị:

- Member: 20k
- Leader / BCN: 50k
- Violence: 0 và xử lý Out CLB

## 10.4. Về kiến trúc

### Hỏi:
Tại sao tách nhiều module?

### Chuẩn bị:

- dễ bảo trì
- dễ giải thích
- tránh nhồi logic vào `main.c`
- đúng tiêu chí tổ chức code

## 10.5. Về dữ liệu

### Hỏi:
Làm sao đảm bảo dữ liệu không mất?

### Chuẩn bị:

- save sau mỗi mutation
- atomic save
- load lại khi khởi động

## 10.6. Về sorting

### Hỏi:
Tại sao sort bằng pointer array?

### Chuẩn bị:

- không muốn thay đổi thứ tự gốc của `members[]`
- chỉ cần thay đổi thứ tự hiển thị
- giảm việc copy cả struct

## 10.7. Về role

### Hỏi:
Tại sao có `Account.role` và `Member.role`?

### Chuẩn bị:

- một cái cho menu access
- một cái cho fine logic
- tách ra giúp business logic rõ hơn

---

## 11. Cách chia người nói theo slide

## Phương án gợi ý

### Đàm Lê Tuấn Anh

- Slide 1
- Slide 13
- chuyển giữa trình bày và demo

### Nguyễn Ngọc Phúc

- Slide 6
- Slide 7
- Slide 9

### Nguyễn Văn Phú

- Slide 10
- phần dẫn demo
- Slide 11

### Huỳnh Gia Bảo

- Slide 2
- Slide 3
- Slide 12

### Võ Hiếu Thắng

- Slide 4
- Slide 5
- Slide 8

---

## 12. Checklist cuối trước khi chốt slide

## 12.1. Checklist nội dung

- Tên project đúng
- Tên nhóm đúng
- Tên mentor đúng
- Thành viên đúng
- Feature không ghi sai
- Demo flow khớp seed data
- Kiến trúc khớp code
- Business rules khớp implementation

## 12.2. Checklist thiết kế

- Font thống nhất
- Màu thống nhất
- Tiêu đề slide đồng đều
- Không có slide quá nhiều chữ
- Screenshot đủ rõ
- Sơ đồ dễ nhìn

## 12.3. Checklist thuyết trình

- Ai nói slide nào đã chốt
- Demo ai cầm máy đã chốt
- Account demo đã chuẩn bị
- Dữ liệu seed sẵn
- Đã chạy thử 1-2 lần

---

## 13. Mẫu nội dung ngắn có thể copy trực tiếp sang slide

## Slide 1

**F-Code Club Member Violation Management System**  
Team: `mid`  
Mentor: `Nguyễn Khoa`

## Slide 2

**Problem Statement**

- Manual violation tracking is fragmented
- Hard to know who owes fines
- Hard to detect Out CLB threshold
- End-of-term summary is inefficient

## Slide 3

**Objectives and Scope**

- Manage members and violations
- Calculate fines automatically
- Track payment status
- Generate reports
- Store data persistently in `.dat` files

## Slide 4

**User Roles and Features**

- Member: profile, own violations, own fines
- BCN: full management, reporting, export
- Feature groups:
  - Authentication
  - Member management
  - Violation management
  - Reporting

## Slide 5

**System Workflow**

- Load data
- Login
- Route by role
- Perform action
- Save updated data

## Slide 6

**Architecture**

- `main`
- `auth`
- `member`
- `violation`
- `report`
- `fileio`
- `utils`

## Slide 7

**Data Structures**

- `Account`
- `Member`
- `Violation`
- `AppDatabase`

## Slide 8

**Core Business Logic**

- Fine calculation by role
- Consecutive absence tracking
- Payment update and total fine recalculation

## Slide 9

**Technical Highlights**

- Binary file persistence
- Atomic save strategy
- Rollback handling
- Pointer-array sorting
- Date-range filtering

## Slide 10

**Testing and Validation**

- Authentication
- Member CRUD
- Violation flow
- Reporting
- Persistence after restart

## Slide 11

**Demo Plan**

- Admin login
- View members
- Record violation
- Mark paid
- Export report
- Member login

## Slide 12

**Limitations and Future Work**

- CLI only
- Local file storage
- More advanced reporting can be added
- Better UX can be developed later

## Slide 13

**Conclusion**

- Solves a real club management problem
- Covers major required workflows
- Demonstrates modular C implementation

---

## 14. Kết luận cuối

Nếu nhóm làm slide theo playbook này, bộ thuyết trình sẽ có các ưu điểm:

- logic rõ
- bám sát project thật
- ít rủi ro nói sai code
- dễ chia người nói
- dễ nối với phần demo
- đủ chất kỹ thuật để hội đồng đánh giá tốt

Khi làm thật, luôn nhớ:

- slide để hỗ trợ nói
- không phải để chép lại report
- trọng tâm của project này là logic, cấu trúc code, và demo terminal chạy thật
