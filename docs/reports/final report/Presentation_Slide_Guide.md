# Presentation Slide Guide

## Mục tiêu của file này

File này là hướng dẫn chi tiết để nhóm chuẩn bị **slide thuyết trình Final Project** cho đề tài:

**F-Code Club Member Violation Management System**

Mục tiêu của bộ slide không phải là nhồi hết mọi thứ trong report lên màn hình, mà là:

- Giúp hội đồng hiểu bài toán nhóm giải quyết là gì.
- Cho thấy nhóm đã làm ra hệ thống nào, có gì nổi bật.
- Thể hiện được tư duy thiết kế, triển khai và kiểm thử.
- Hỗ trợ phần demo thật mượt hơn.
- Giúp từng thành viên biết mình nên nói phần nào.

File này ưu tiên phong cách thuyết trình:

- Rõ.
- Gọn.
- Có logic.
- Không lan man.
- Không biến slide thành “bản sao của report”.

---

## 1. Mục tiêu tổng thể của bài thuyết trình

Khi nhóm trình bày, hội đồng thường muốn nhìn ra 5 thứ:

1. **Nhóm có hiểu bài toán không**
   - Vì sao cần hệ thống này
   - Ai dùng
   - Khó khăn của cách quản lý cũ

2. **Nhóm có làm đúng yêu cầu không**
   - Các chức năng bắt buộc có đầy đủ không
   - Có thêm phần nâng cao không

3. **Nhóm có tổ chức code ổn không**
   - Có chia module không
   - Có dùng struct, file I/O, separation of concerns không

4. **Nhóm có hiểu code của mình không**
   - Giải thích được luồng xử lý
   - Giải thích được business rules
   - Giải thích được tại sao thiết kế như vậy

5. **Sản phẩm có chạy thật không**
   - Demo được
   - Không crash
   - Có dữ liệu minh họa rõ ràng

Vì vậy, bộ slide nên được xây quanh 5 mục tiêu trên.

---

## 2. Nguyên tắc làm slide

### 2.1. Slide không phải là report thu nhỏ

Không nên copy nguyên đoạn văn dài từ report lên slide.  
Slide chỉ nên giữ:

- ý chính
- từ khóa
- sơ đồ
- bảng nhỏ
- ảnh màn hình / flow

Phần giải thích chi tiết để người thuyết trình nói.

### 2.2. Mỗi slide chỉ nên có 1 ý chính

Nếu một slide vừa nói bài toán, vừa nói kiến trúc, vừa nói chức năng thì người nghe rất khó theo.

Tốt nhất là:

- 1 slide = 1 nhóm ý
- 3 đến 5 bullet tốt hơn 10 bullet dài

### 2.3. Ưu tiên tính dễ nói

Khi thiết kế slide, luôn tự hỏi:

- Slide này có giúp mình nói dễ hơn không?
- Nhìn vào slide có biết phải nói gì trong 30-60 giây không?

Nếu không, slide đó đang quá rối hoặc quá thừa.

### 2.4. Tập trung vào phần nhóm thực sự làm được

Vì project này là CLI bằng C, điểm mạnh không phải UI đẹp, mà là:

- logic rõ
- file I/O
- module hóa
- business rule
- demo chạy thật

Vậy slide nên nhấn vào các điểm đó.

### 2.5. Không tự làm khó mình

Đừng đưa vào slide các tuyên bố quá lớn như:

- “hệ thống tối ưu”
- “bảo mật cao”
- “gần như hoàn hảo”
- “không có lỗi”

Những từ như vậy dễ bị hội đồng hỏi vặn.

Nên dùng cách nói thực tế hơn:

- “đáp ứng tốt yêu cầu môn”
- “đảm bảo dữ liệu được lưu sau mỗi thao tác”
- “hệ thống hỗ trợ các luồng quản lý chính”
- “đã kiểm thử các kịch bản chính”

---

## 3. Thời lượng gợi ý

Nếu nhóm có khoảng **8-12 phút thuyết trình + demo**, có thể chia như sau:

- `1 phút` mở đầu và giới thiệu đề tài
- `1 phút` bài toán và mục tiêu
- `2 phút` chức năng chính
- `2 phút` kiến trúc và thiết kế dữ liệu
- `1 phút` điểm kỹ thuật nổi bật
- `2-4 phút` demo
- `1 phút` kết luận và hướng phát triển

Nếu thời gian ngắn hơn, cắt bớt phần chữ, giữ lại:

- bài toán
- chức năng
- kiến trúc
- demo

---

## 4. Cấu trúc slide đề xuất

Nên làm khoảng **10 đến 13 slide**, không tính slide Q&A.

### Slide 1. Title Slide

**Mục tiêu:** giới thiệu ngắn gọn project và nhóm.

**Nội dung nên có:**

- Tên đề tài
- Tên nhóm: `mid`
- Mentor: `Nguyễn Khoa`
- Môn / chương trình: F-Code Train-C
- Tên 5 thành viên

**Cách nói gợi ý:**

“Nhóm em xin trình bày đề tài F-Code Club Member Violation Management System, là hệ thống quản lý vi phạm thành viên CLB F-Code được xây dựng bằng ngôn ngữ C chạy trên terminal.”

---

### Slide 2. Problem Statement

**Mục tiêu:** làm rõ vì sao cần project này.

**Nội dung nên có:**

- CLB có nhiều thành viên, chia theo 4 ban
- Có nội quy rõ ràng: mặc áo, đi họp, tham gia hoạt động, không bạo lực
- Cách quản lý thủ công gây khó theo dõi
- Cuối kỳ khó biết:
  - ai vi phạm bao nhiêu lần
  - ai còn nợ tiền phạt
  - ai gần tới ngưỡng Out CLB

**Có thể trình bày theo 2 cột:**

| Cách cũ | Vấn đề |
| --- | --- |
| Ghi nhớ / chat / ghi tay | Dễ sót, khó tra cứu |
| Theo dõi rời rạc | Khó thống kê |
| Cuối kỳ tổng hợp thủ công | Dễ sai, tốn thời gian |

**Cách nói gợi ý:**

“Bài toán nhóm giải quyết là số hóa việc quản lý vi phạm trong CLB, thay cho cách theo dõi rời rạc qua tin nhắn hoặc ghi nhớ thủ công.”

---

### Slide 3. Project Objectives

**Mục tiêu:** nêu rõ hệ thống cần làm gì.

**Nội dung nên có:**

- Quản lý thành viên
- Ghi nhận vi phạm
- Tính tiền phạt tự động theo vai trò
- Theo dõi trạng thái đã thu / chưa thu
- Cảnh báo Out CLB theo rule
- Tìm kiếm, thống kê, xuất báo cáo
- Lưu dữ liệu bằng file `.dat`

**Nên có thêm 1 dòng ràng buộc công nghệ:**

- Pure C
- CLI / terminal
- Không dùng database
- Không dùng thư viện ngoài

---

### Slide 4. Final Scope / Features Overview

**Mục tiêu:** cho hội đồng thấy nhóm làm được những gì.

**Cách tốt nhất:** chia thành 3 nhóm chức năng.

**Nhóm 1 - Authentication**

- Login
- Logout
- Change password
- Reset password
- Lock account after 3 failed attempts

**Nhóm 2 - Member & Violation Management**

- Add / edit / delete member
- View profile
- View member list
- Record violation
- Mark fine as paid
- View own violations / fines

**Nhóm 3 - Report & Support**

- Team statistics
- Sort by violation count
- Export `.txt`
- Search by date range
- Demo seed data

**Lưu ý trình bày:**

Không nên nhồi cả bảng dài từ report lên slide.  
Nên gói thành nhóm chức năng như trên.

---

### Slide 5. User Roles

**Mục tiêu:** giải thích ai dùng hệ thống và dùng khác nhau thế nào.

**Nội dung nên có:**

| Role | Capabilities |
| --- | --- |
| Member | View own profile, violations, fines, member list, change password |
| BCN/Admin | Full access: manage members, record violations, mark paid, statistics, export report |

**Điểm quan trọng nên nói:**

- `Account.role` quyết định menu truy cập
- `Member.role` quyết định mức phạt
- Đây là 2 khái niệm khác nhau trong hệ thống

Đây là một điểm kỹ thuật khá hay và dễ gây ấn tượng nếu nói rõ.

---

### Slide 6. System Architecture

**Mục tiêu:** cho thấy project được chia module rõ ràng.

**Nội dung nên có dạng sơ đồ khối:**

```text
main
 ├─ auth
 ├─ member
 ├─ violation
 ├─ report
 ├─ fileio
 └─ utils
```

**Mô tả ngắn từng module:**

- `main`: menu, điều phối luồng
- `auth`: login, session, password
- `member`: CRUD thành viên
- `violation`: ghi nhận vi phạm, mark paid, threshold logic
- `report`: thống kê, sort, export
- `fileio`: load/save dữ liệu
- `utils`: input, validation, time/date helpers

**Cách nói gợi ý:**

“Nhóm tách hệ thống thành các module riêng để tránh nhồi toàn bộ logic vào `main.c`, đồng thời giúp dễ bảo trì và dễ kiểm thử hơn.”

---

### Slide 7. Data Model

**Mục tiêu:** trình bày các struct chính.

**Nội dung nên có:**

- `Account`
- `Member`
- `Violation`
- `AppDatabase`

**Cách trình bày tốt:**

Không cần show full struct code.  
Chỉ cần bảng tóm tắt:

| Struct | Vai trò |
| --- | --- |
| `Account` | Thông tin đăng nhập, role, lock state |
| `Member` | Hồ sơ thành viên, team, role, totalFine, status |
| `Violation` | Lý do vi phạm, thời gian, fine, payment status |
| `AppDatabase` | Chứa toàn bộ arrays trong RAM |

**Điểm nên nhấn:**

- Dùng mảng tĩnh
- `MAX_MEMBERS = 1000`
- `MAX_VIOLATIONS = 10000`
- Toàn bộ dữ liệu chạy trong RAM và lưu xuống file khi thay đổi

---

### Slide 8. Core Business Logic

**Mục tiêu:** nêu các rule quan trọng nhất.

**Nội dung nên có:**

#### Fine Calculation

- Member: `20,000 VND`
- Leader / BCN: `50,000 VND`
- Violence: `0 VND` + xử lý Out CLB

#### Out CLB Rule

- Theo dõi `consecutiveAbsences`
- Warning khi vắng liên tiếp
- Đủ ngưỡng thì BCN xác nhận Out CLB

#### Payment Flow

- Vi phạm mới tạo ra khoản phạt
- BCN mark paid
- `totalFine` cập nhật lại ngay

**Nếu muốn đẹp hơn, có thể trình bày bằng 3 card ngang.**

---

### Slide 9. Technical Highlights

**Mục tiêu:** thể hiện điểm mạnh về mặt lập trình, không chỉ là “có chức năng”.

**Nội dung nên chọn 4 đến 6 ý nổi bật nhất:**

- Binary file persistence with `.dat`
- Save after every mutation
- Atomic save with `.tmp` / `.bak`
- Transaction-like rollback on multi-file update
- Pointer-array sorting without modifying original member order
- Session management with `static` state in `auth.c`
- Auto-create default admin on first run
- Search by date range with normalized day boundaries

**Lưu ý:**

Không cần đưa hết 18 technical highlights lên slide.  
Chỉ nên chọn những ý dễ nói và dễ gây ấn tượng.

**Cách nói gợi ý:**

“Điểm nhóm muốn nhấn mạnh không chỉ là có chức năng, mà là cách nhóm xử lý dữ liệu và đảm bảo tính ổn định cho hệ thống CLI bằng C.”

---

### Slide 10. Demo Scenario

**Mục tiêu:** chuẩn bị người nghe cho phần demo.

**Nội dung nên có:**

- Login as `ADMIN`
- View member list
- Record a violation
- Check threshold / statistics
- Export report
- Login as a member
- View own fines

**Hoặc trình bày theo bảng ngắn:**

| Step | What to show |
| --- | --- |
| 1 | Admin login |
| 2 | Member list |
| 3 | Record violation |
| 4 | Mark paid / statistics |
| 5 | Export report |
| 6 | Member self-service |

**Mục đích của slide này:**

Giúp demo không bị “tự nhiên nhảy vào màn hình terminal”.

---

### Slide 11. Testing / Validation

**Mục tiêu:** cho thấy nhóm có kiểm tra hệ thống chứ không chỉ code xong là thôi.

**Nội dung nên có:**

- Test login success / fail / account lock
- Test add/edit/delete member
- Test record violation and fine update
- Test mark paid and `totalFine` recalculation
- Test statistics / export / date search
- Test persistence after restart

**Có thể trình bày theo checklist:**

- Authentication flows
- CRUD flows
- Violation flows
- Reporting flows
- Persistence flows

**Nên nói thêm:**

Nhóm có `seed_data` để tạo dữ liệu demo nhất quán.

---

### Slide 12. Limitations and Future Improvements

**Mục tiêu:** nói thật nhưng không tự dìm project.

**Nội dung nên có:**

- Current system is CLI only
- Data storage is local file based
- Report export currently supports `.txt`
- Some flows can still be expanded for better UX

**Future improvements có thể nêu:**

- Search/filter richer hơn
- Better report formats
- More detailed admin dashboard
- Better validation and edge-case handling

**Cách nói gợi ý:**

“Trong phạm vi môn học và ràng buộc pure C, nhóm ưu tiên hoàn thành đúng các luồng nghiệp vụ chính. Nếu phát triển tiếp, nhóm muốn cải thiện trải nghiệm sử dụng và chiều sâu báo cáo.”

---

### Slide 13. Conclusion

**Mục tiêu:** chốt lại giá trị của project.

**Nội dung nên có:**

- Solves a real club-management problem
- Covers key required features
- Uses modular C design and file persistence
- Supports real demo workflows

**Câu chốt gợi ý:**

“Nhóm đã xây dựng được một hệ thống quản lý vi phạm thành viên CLB F-Code bằng C, đáp ứng các luồng chính về quản lý thành viên, ghi nhận vi phạm, thu tiền phạt, thống kê và lưu trữ dữ liệu ổn định trên terminal.”

---

### Slide 14. Q&A

Rất đơn giản:

- “Thank you”
- “Q&A”

hoặc:

- “Xin cảm ơn thầy/cô và các bạn”
- “Nhóm sẵn sàng trả lời câu hỏi”

---

## 5. Nội dung nên nói ở từng slide

Phần này là “speaker guide” để nhóm không bị bí khi nói.

### Slide 1 - Nói gì

- Chào hội đồng
- Giới thiệu tên đề tài
- Giới thiệu ngắn đây là hệ thống gì
- Giới thiệu nhóm và mentor

### Slide 2 - Nói gì

- Mô tả cách quản lý thủ công gặp khó khăn
- Nêu pain points cụ thể
- Chuyển sang nhu cầu phải có hệ thống số hóa

### Slide 3 - Nói gì

- Hệ thống cần giải quyết những việc nào
- Nhấn đây là terminal-based system bằng C

### Slide 4 - Nói gì

- Chia chức năng theo nhóm
- Nói ngắn gọn từng nhóm
- Không kể toàn bộ từng menu item quá dài

### Slide 5 - Nói gì

- Member làm được gì
- BCN làm được gì
- Nhấn mạnh phân quyền

### Slide 6 - Nói gì

- Giới thiệu cấu trúc module
- Giải thích vì sao tách module
- Nhấn main không chứa toàn bộ business logic

### Slide 7 - Nói gì

- Giới thiệu các struct chính
- Nói mỗi struct dùng làm gì
- Nhấn AppDatabase là state trung tâm

### Slide 8 - Nói gì

- Trình bày 2-3 business rule quan trọng nhất
- Nhấn fine calculation và Out CLB logic

### Slide 9 - Nói gì

- Trình bày 3-5 điểm kỹ thuật mạnh nhất
- Không cần giải thích quá sâu code ở slide
- Chừa phần sâu cho Q&A

### Slide 10 - Nói gì

- Giới thiệu demo sắp chạy
- Nói rõ nhóm sẽ demo theo thứ tự nào

### Slide 11 - Nói gì

- Hệ thống đã được test như thế nào
- Nhấn các case quan trọng đã cover

### Slide 12 - Nói gì

- Nói thật phần giới hạn
- Kèm hướng phát triển để thể hiện tư duy tiếp tục cải tiến

### Slide 13 - Nói gì

- Chốt giá trị project
- Cảm ơn

---

## 6. Chia người thuyết trình theo slide

Vì nhóm có 5 người, có thể chia như sau:

### Đàm Lê Tuấn Anh

Phụ trách:

- Slide 1
- Slide 13
- điều phối chuyển sang demo / Q&A

Phù hợp vì đây là phần mở và chốt.

### Nguyễn Ngọc Phúc

Phụ trách:

- Slide 4
- Slide 6
- Slide 7
- hoặc trả lời sâu phần architecture / technical logic

### Nguyễn Văn Phú

Phụ trách:

- Slide 9
- Slide 10
- Slide 11
- phần chuyển sang demo

### Huỳnh Gia Bảo

Phụ trách:

- Slide 2
- Slide 3
- Slide 12

### Võ Hiếu Thắng

Phụ trách:

- Slide 5
- Slide 8
- hỗ trợ demo member-side flow

Nếu không muốn chia quá nhiều người nói, có thể dùng mô hình:

- `2 người nói chính`
- `3 người hỗ trợ demo và Q&A`

Nhưng nếu hội đồng muốn đánh giá đều từng thành viên thì nên để mỗi người nói ít nhất 1 đoạn.

---

## 7. Gợi ý thứ tự demo

Phần demo nên bám sát dữ liệu seed hiện có.

### Kịch bản demo gợi ý

1. Chạy app
2. Login `ADMIN / ADMIN`
3. Xem danh sách thành viên
4. Ghi nhận vi phạm cho một member
5. Xem danh sách vi phạm / lọc
6. Mark paid
7. Xem thống kê theo ban
8. Export report
9. Logout
10. Login member như `SV0002 / 123456`
11. Xem own violations / own fines

### Tại sao thứ tự này tốt

- Đi từ admin flow sang member flow
- Có tạo dữ liệu, có xử lý dữ liệu, có xem kết quả
- Có cả CRUD-ish behavior và reporting
- Dễ nói, dễ quan sát

---

## 8. Những câu hỏi hội đồng rất dễ hỏi

Nhóm nên chuẩn bị trước.

### 8.1. Tại sao dùng C?

Gợi ý trả lời:

- Vì đây là project trong chương trình Train-C
- Nhóm muốn tập trung vào struct, file I/O, module hóa, memory-safe style cơ bản
- C phù hợp để thể hiện rõ logic hệ thống ở mức thấp hơn

### 8.2. Tại sao không dùng database?

Gợi ý trả lời:

- Requirement giới hạn dùng C standard library
- Dữ liệu của bài toán không quá lớn
- File `.dat` là đủ để đáp ứng yêu cầu lưu trữ của môn

### 8.3. Dữ liệu có bị mất khi tắt chương trình không?

Gợi ý trả lời:

- Hệ thống save sau mỗi mutation
- Có cơ chế temp file / backup file
- Có load lại khi khởi động

### 8.4. Tại sao tách `Account.role` và `Member.role`?

Gợi ý trả lời:

- `Account.role` dùng cho quyền truy cập menu
- `Member.role` dùng cho rule tính tiền phạt
- Hai việc này khác nhau nên tách ra để rõ business logic

### 8.5. Nếu member đổi role thì fine cũ thế nào?

Gợi ý trả lời:

- Hệ thống quét lại các vi phạm chưa thanh toán
- Cập nhật fine theo role mới
- Cập nhật lại `totalFine`

### 8.6. Out CLB được xử lý như thế nào?

Gợi ý trả lời:

- Hệ thống theo dõi `consecutiveAbsences`
- Khi đủ ngưỡng sẽ hiện cảnh báo / xác nhận
- Trường hợp bạo lực thì có luồng xử lý Out CLB riêng

### 8.7. Có test gì chưa?

Gợi ý trả lời:

- Login success / fail / lock
- Member CRUD
- Violation record
- Payment update
- Statistics / export / date search
- Persistence after restart

---

## 9. Những lỗi cần tránh khi làm slide

### Lỗi 1: Quá nhiều chữ

Nếu một slide có 2 đoạn văn dài, người nghe sẽ không đọc.

### Lỗi 2: Chụp nguyên code lên slide

Project C có thể nhiều code, nhưng không nên chiếu nguyên hàm dài 40-50 dòng.  
Nếu cần, chỉ chụp 5-10 dòng “đắt”.

### Lỗi 3: Dùng quá nhiều màu

Slide kỹ thuật nên sạch:

- nền sáng hoặc nền tối ổn định
- 1 màu chính
- 1 màu nhấn

### Lỗi 4: Mỗi người một style

Nếu 5 người cùng sửa slide, rất dễ:

- slide này font khác
- slide kia bullet khác
- icon khác style

Nên chốt 1 template duy nhất.

### Lỗi 5: Nói khác slide

Slide ghi 1 kiểu, demo chạy 1 kiểu, người nói lại nói kiểu khác là rất dễ mất điểm.

---

## 10. Gợi ý thiết kế hình ảnh slide

Vì đây là project kỹ thuật, nên style nên:

- sạch
- đơn giản
- chuyên nghiệp

### Gợi ý màu

- Xanh navy / xanh đậm
- Trắng / xám nhạt làm nền
- Cam hoặc xanh lá làm màu nhấn

### Gợi ý font

- Tiêu đề: rõ, đậm
- Nội dung: đơn giản, dễ đọc

### Gợi ý layout

- Title trên
- 3-5 bullet hoặc 1 sơ đồ ở giữa
- Footer nhỏ có tên nhóm / số slide

### Những gì nên chụp ảnh màn hình

- màn hình login
- menu admin
- danh sách member
- bảng violations
- report export

Không cần chụp quá nhiều, chỉ chụp những màn hình giúp người nghe hình dung hệ thống là đủ.

---

## 11. Hướng dẫn chuyển từ file này sang bộ slide thật

### Bước 1

Tạo 1 file PowerPoint / Canva / Google Slides với khoảng `12-14 slide`.

### Bước 2

Dựa vào mục **Cấu trúc slide đề xuất** ở trên để tạo khung từng slide.

### Bước 3

Lấy nội dung từ:

- report final
- demo guide
- technical highlights

để điền vào từng slide.

### Bước 4

Rút gọn câu chữ thành bullet ngắn.

### Bước 5

Chèn 1-2 sơ đồ:

- module architecture
- demo flow hoặc user role flow

### Bước 6

Tập nói theo đúng thứ tự slide.

### Bước 7

Chạy thử demo cùng slide ít nhất 2 lần.

---

## 12. Bộ khung ngắn gọn để copy vào slide

Nếu nhóm muốn làm cực nhanh, có thể dùng luôn bộ khung sau:

### Slide 1

`F-Code Club Member Violation Management System`

### Slide 2

`Problem`

- Manual tracking is inconsistent
- Hard to know who violated, who owes fines
- Hard to detect Out CLB threshold

### Slide 3

`Objectives`

- Manage members
- Record violations
- Calculate fines automatically
- Track payment status
- Generate reports

### Slide 4

`Main Features`

- Authentication
- Member management
- Violation management
- Reporting and export

### Slide 5

`User Roles`

- Member
- BCN/Admin

### Slide 6

`Architecture`

- main
- auth
- member
- violation
- report
- fileio
- utils

### Slide 7

`Data Structures`

- Account
- Member
- Violation
- AppDatabase

### Slide 8

`Core Logic`

- Fine calculation by role
- Consecutive absence tracking
- Payment update

### Slide 9

`Technical Highlights`

- Binary file storage
- Save after every mutation
- Atomic save strategy
- Rollback handling

### Slide 10

`Demo Flow`

- Admin login
- View members
- Record violation
- Mark paid
- Statistics / export
- Member login

### Slide 11

`Testing`

- Authentication
- CRUD
- Violation
- Reporting
- Persistence

### Slide 12

`Limitations & Future Work`

- CLI only
- Local file storage
- More UX/reporting can be improved

### Slide 13

`Conclusion`

- Solves a real problem
- Covers key requirements
- Demonstrates modular C implementation

---

## 13. Kết luận

Một bộ slide tốt cho project này nên giúp nhóm làm được 3 việc:

- Nói rõ bài toán
- Nói đúng những gì đã làm
- Mở đường cho phần demo và Q&A

Nếu nhóm làm đúng cấu trúc ở file này, thì bộ slide sẽ:

- không bị lan man
- không bị quá chữ
- không lệch khỏi code thật
- dễ chia người nói
- dễ bảo vệ hơn trước hội đồng
