# Final Report Review Plan

## Mục tiêu

File này dùng để chia công việc review bản **Final Report** cho 5 thành viên của nhóm theo hướng:

- Mỗi người có phạm vi rõ ràng.
- Có phần chính và phần đọc chéo để giảm sót lỗi.
- Không chồng chéo quá nhiều nhưng vẫn có kiểm tra chéo ở các phần quan trọng.
- Tập trung vào việc làm cho báo cáo **đúng code, đúng docs, đúng demo, sạch format, sẵn sàng nộp**.

## Nguyên tắc review

Mỗi người khi review cần kiểm tra theo 4 lớp:

1. **Đúng nội dung**
   - Mô tả có đúng với code hiện tại không.
   - Chức năng ghi trong report có thực sự tồn tại trong project không.
   - Tên file, module, command, luồng demo có đúng không.

2. **Đúng theo yêu cầu môn / template**
   - Có bám cấu trúc của `Final_Report_Template.md` không.
   - Có thiếu section nào không.
   - Các bảng có đủ cột cần thiết không.

3. **Đúng về trình bày**
   - Tên người, MSSV, role, mentor, team name, repository link có chính xác không.
   - Heading, numbering, bảng biểu, chữ in đậm/in nghiêng có thống nhất không.
   - Không còn placeholder, câu ghi chú nháp, hoặc dòng “Please fill in”.

4. **Đúng để bảo vệ**
   - Nội dung có đủ cụ thể để trả lời hội đồng không.
   - Không viết quá chung chung.
   - Không tự ghi những thứ mà team không thể giải thích khi bị hỏi ngược.

## Tài liệu và file cần dùng khi review

Trong lúc review, cả nhóm nên đối chiếu với các file sau:

- `docs/reports/final report/FCode_Violation_Management_Final_Report.md`
- `docs/reports/final report/FCode_Violation_Management_Final_Report.docx`
- `docs/reports/final report/Final_Report_Template.md`
- `README.md`
- `Makefile`
- `src/main.c`
- `src/auth.c`
- `src/member.c`
- `src/violation.c`
- `src/report.c`
- `src/fileio.c`
- `src/utils.c`
- `include/types.h`
- `docs/full-project-guide.md`
- `docs/demo-and-test-guide.md`
- `docs/technical-highlights.md`
- `docs/planning/architecture.md`
- `docs/planning/epics.md`
- `docs/requirement-docs/QuanLyViPhamCLBFCode_V1.md`
- `tools/seed_data.c`

## Phân công chính

### 1. Đàm Lê Tuấn Anh

**Vai trò trong review:** điều phối bản cuối, kiểm tra tổng thể, chốt bản nộp.

**Phần phụ trách chính:**

- Toàn bộ report ở mức tổng thể.
- Kiểm tra tính nhất quán giữa các section.
- Chốt phiên bản cuối trước khi xuất/nộp.

**Công việc cụ thể:**

- Kiểm tra trang đầu:
  - tên đề tài
  - mentor
  - team name
  - submission date
  - danh sách thành viên
  - vai trò leader/member
- Kiểm tra mục lục:
  - đủ section
  - tiêu đề section khớp với nội dung thật
- Kiểm tra tính thống nhất xuyên suốt:
  - tên project có dùng cùng một cách viết không
  - tên module có thống nhất với code không
  - cách gọi BCN / Member / Leader có nhất quán không
  - các mốc ngày có hợp lý và không bị mâu thuẫn
- Kiểm tra section 6 và section 8:
  - Task Sheet không mâu thuẫn với Member Evaluation
  - vai trò từng người hợp lý
  - leader comment ổn, không quá ngắn, không quá lộ cách chia nội bộ
- Kiểm tra bản cuối trước khi nộp:
  - không còn placeholder
  - không còn câu nháp
  - không còn chỗ tiếng Anh/tiếng Việt lẫn lộn khó chịu

**Đầu ra cần bàn giao:**

- Một danh sách lỗi tổng hợp cuối.
- Một xác nhận bản nào là bản final để nộp.

### 2. Nguyễn Ngọc Phúc

**Vai trò trong review:** kiểm tra độ chính xác kỹ thuật của phần chức năng và kiến trúc.

**Phần phụ trách chính:**

- `Section 2. Functional Requirements - Final Status`
- `Section 3. System Architecture`

**Công việc cụ thể cho Section 2:**

- Kiểm tra từng dòng feature trong bảng:
  - có thật trong code không
  - status `Done` / `Not Achieved` có hợp lý không
  - note có khớp implementation không
- Đối chiếu với:
  - `docs/planning/epics.md`
  - `docs/requirement-docs/QuanLyViPhamCLBFCode_V1.md`
  - source code thực tế
- Kiểm tra kỹ các feature dễ sai:
  - login / logout / change password
  - add/edit/delete member
  - record violation
  - mark paid
  - statistics / sort / export / search

**Công việc cụ thể cho Section 3:**

- Kiểm tra bảng directory & file structure:
  - tên file đúng
  - chức năng mỗi module mô tả đúng
- Kiểm tra phần data structures:
  - `Account`, `Member`, `Violation`, `AppDatabase`
  - field name, type, meaning có đúng `include/types.h` không
- Kiểm tra phần key algorithms:
  - lock account 3 lần sai
  - fine calculation theo role
  - rollback khi save lỗi
  - atomic save / temp file / backup
  - sort bằng pointer array
  - parse date và search theo khoảng ngày

**Các lỗi cần ưu tiên bắt:**

- Báo cáo ghi có tính năng nhưng code không có.
- Báo cáo ghi sai business rule.
- Báo cáo mô tả sai field hoặc sai type.
- Báo cáo gọi sai tên module hoặc sai luồng xử lý.

**Đầu ra cần bàn giao:**

- Một danh sách các điểm sai kỹ thuật cần sửa.
- Một kết luận ngắn: section 2 và 3 đã khớp code hay chưa.

### 3. Nguyễn Văn Phú

**Vai trò trong review:** kiểm tra tính đúng đắn của demo, issue, repository info, command, và khả năng chạy thật.

**Phần phụ trách chính:**

- `Section 4. Demo Walkthrough`
- `Section 5. Known Issues & Limitations`
- `Section 7. GitHub Repository`

**Công việc cụ thể cho Section 4:**

- Đối chiếu walkthrough với:
  - `docs/demo-and-test-guide.md`
  - `tools/seed_data.c`
  - luồng menu trong `src/main.c`
- Kiểm tra từng bước demo:
  - có vào đúng menu option không
  - account demo có đúng không
  - dữ liệu seed có hỗ trợ bước đó không
  - kết quả mong đợi có hợp lý không
- Kiểm tra các account dùng demo:
  - `ADMIN / ADMIN`
  - `SV0002 / 123456`
  - các member khác có được dùng đúng mục đích không

**Công việc cụ thể cho Section 5:**

- Kiểm tra known issues có phải issue thật không.
- Đảm bảo issue không bị viết sai mức độ.
- Đảm bảo issue không tự làm project trông tệ quá mức.
- Kiểm tra suggested fix có hợp lý và ngắn gọn không.

**Công việc cụ thể cho Section 7:**

- Kiểm tra repository URL đúng.
- Kiểm tra branch đúng là `main`.
- Kiểm tra compile command đúng với `Makefile`.
- Kiểm tra run command đúng với output hiện tại.
- Kiểm tra lệnh seed/reset đúng.

**Các lỗi cần ưu tiên bắt:**

- Demo script ghi một kiểu nhưng app chạy kiểu khác.
- Menu option sai số.
- Account demo sai password.
- Command build/run/export sai thực tế.
- Issue nêu trong report không đúng code.

**Đầu ra cần bàn giao:**

- Một danh sách lỗi về demo/command/repository.
- Một xác nhận rằng report có thể dùng để thuyết trình thật.

### 4. Huỳnh Gia Bảo

**Vai trò trong review:** kiểm tra phần mở đầu, phạm vi, diễn đạt, và đọc chéo phần feature description.

**Phần phụ trách chính:**

- `Section 1. Project Overview`
- Đọc chéo `Section 2`

**Công việc cụ thể cho Section 1:**

- Kiểm tra `Problem Statement`:
  - mô tả đúng bài toán CLB F-Code
  - không bị lạc khỏi scope project
  - không viết quá dài dòng
- Kiểm tra `Objectives`:
  - phản ánh đúng mục tiêu học phần C
  - có nói đến struct, file I/O, module hóa, build, teamwork
- Kiểm tra `Final Scope`:
  - delivered có đúng không
  - not delivered / limitation có hợp lý không
  - wording rõ ràng, không mơ hồ

**Đọc chéo Section 2:**

- Xem phần feature list có đọc mượt không.
- Kiểm tra câu chữ cho dễ hiểu.
- Kiểm tra cách phân loại `Required`, `Advanced`, `Optional`.

**Các lỗi cần ưu tiên bắt:**

- Viết chung chung, thiếu ngữ cảnh.
- Lặp ý giữa Problem Statement và Final Scope.
- Câu chữ khó hiểu hoặc không tự nhiên.
- Scope ghi quá đà hơn project thật.

**Đầu ra cần bàn giao:**

- Góp ý về cách viết và độ rõ ràng.
- Danh sách câu cần rút gọn hoặc viết lại.

### 5. Võ Hiếu Thắng

**Vai trò trong review:** kiểm tra format, bảng biểu, thông tin cá nhân, lỗi trình bày, và đọc chéo phần phân công/đánh giá.

**Phần phụ trách chính:**

- `Section 6. Task Sheet`
- `Section 8. Leader’s Member Evaluation`
- Format toàn file

**Công việc cụ thể:**

- Kiểm tra tên từng thành viên:
  - đúng chính tả
  - đúng MSSV
  - đúng role
- Kiểm tra bảng task sheet:
  - câu mô tả không bị trùng quá nhiều
  - wording đủ cụ thể
  - nhìn vào vẫn hợp lý khi hội đồng đọc
- Kiểm tra bảng evaluation:
  - điểm đúng như team đã chốt
  - avg score đúng format
  - comment không mâu thuẫn với task sheet
- Kiểm tra format toàn report:
  - heading đồng đều
  - bảng không lệch
  - dấu câu nhất quán
  - in đậm/in nghiêng dùng hợp lý
  - không có dòng thừa
  - không có lỗi gõ như double space, thiếu dấu `|` trong bảng markdown

**Các lỗi cần ưu tiên bắt:**

- Sai tên, sai MSSV.
- Bảng lỗi format.
- Chữ thừa, placeholder còn sót.
- Comment và task sheet không ăn khớp.

**Đầu ra cần bàn giao:**

- Một danh sách lỗi trình bày.
- Một xác nhận rằng file đủ sạch để xuất `.docx`.

## Phân công đọc chéo

Ngoài phần chính, mỗi người cần đọc thêm một phần phụ để có kiểm tra chéo:

| Người | Đọc chéo |
| --- | --- |
| Đàm Lê Tuấn Anh | Đọc lại toàn bộ sau khi mọi người đã sửa |
| Nguyễn Ngọc Phúc | Đọc chéo Section 4 để đảm bảo demo khớp kỹ thuật |
| Nguyễn Văn Phú | Đọc chéo Section 3 để đảm bảo architecture khớp với demo và command |
| Huỳnh Gia Bảo | Đọc chéo Section 5 để kiểm tra issue viết có hợp lý không |
| Võ Hiếu Thắng | Đọc chéo Section 1 để kiểm tra tính sạch và rõ của wording mở đầu |

## Quy trình làm việc đề xuất

### Vòng 1: Review cá nhân

Mỗi người đọc phần mình phụ trách và ghi lỗi theo format:

```text
Mục:
Vấn đề:
Đề xuất sửa:
Mức độ: Cao / Trung bình / Nhẹ
```

Ví dụ:

```text
Mục: Section 4, bước demo số 8
Vấn đề: Password demo ghi chưa khớp với seed_data
Đề xuất sửa: sửa thành SV0002 / 123456
Mức độ: Cao
```

### Vòng 2: Gửi góp ý về leader

Tất cả gửi góp ý cho `Đàm Lê Tuấn Anh`.

Leader gom lỗi thành 3 nhóm:

- **Phải sửa ngay**
- **Nên sửa**
- **Có thể giữ nguyên**

### Vòng 3: Sửa file gốc

Chỉ sửa trên **1 bản gốc duy nhất**, tránh tình trạng mỗi người sửa một bản khác nhau.

Khi sửa cần ưu tiên:

1. Sai sự thật kỹ thuật.
2. Sai demo / sai command / sai info nhóm.
3. Sai format / wording.

### Vòng 4: Đọc chốt lần cuối

Sau khi leader sửa xong:

- `Phúc` kiểm tra lại phần technical correctness.
- `Phú` kiểm tra lại phần demo/run/command.
- `Hiếu Thắng` kiểm tra lại format và bảng.
- `Gia Bảo` kiểm tra lại wording.
- `Tuấn Anh` chốt final.

## Checklist review chi tiết

### Checklist chung cho tất cả mọi người

- Không còn placeholder.
- Không còn câu “Please fill in”.
- Không còn phần mâu thuẫn giữa 2 section.
- Không có feature nào bị ghi thừa so với code.
- Không có feature nào quan trọng mà report quên nhắc.
- Các lệnh command chạy hợp lý với repo hiện tại.
- Tên file, tên module, tên hàm được viết đúng ngữ cảnh.

### Checklist riêng cho phần kỹ thuật

- `Account`, `Member`, `Violation`, `AppDatabase` mô tả đúng.
- Capacity đúng: `1000 members`, `10000 violations`.
- Fine rule đúng:
  - Member: `20000`
  - Leader/BCN: `50000`
  - Violence: `0` và xử lý Out CLB
- Login sai 3 lần bị lock.
- Save/load dùng file `.dat`.
- Có nói đúng về `seed_data`.
- Date search dùng `dd/mm/yyyy`.

### Checklist riêng cho phần demo

- Menu option đúng số.
- Account demo đúng.
- Seed data đúng với các ví dụ trong report.
- Bước export report đúng với tên file output.
- Bước statistics / sort / search có thể chạy được thật.

### Checklist riêng cho phần trình bày

- Tên người không sai dấu/sai chữ.
- MSSV không sai số.
- Bảng markdown không vỡ khi mở.
- Heading đồng nhất.
- Dấu chấm, dấu hai chấm, chữ in nghiêng/in đậm hợp lý.
- Không có đoạn quá dài gây khó đọc.

## Tiêu chí hoàn thành

Kế hoạch review được xem là hoàn thành khi đạt đủ:

- Mỗi người đã review xong phần chính của mình.
- Mỗi người đã có ít nhất 1 phần đọc chéo.
- Report không còn lỗi thông tin nhóm.
- Report không còn lỗi kỹ thuật rõ ràng so với code.
- Report không còn lỗi format lớn.
- Cả bản `.md` và `.docx` đều sẵn sàng nộp.

## Kết quả mong đợi

Sau khi hoàn thành kế hoạch này, nhóm sẽ có:

- Một bản report đúng với code và docs hiện có.
- Một kịch bản demo nhất quán với project.
- Một bản trình bày gọn, sạch, ít lỗi.
- Một tài liệu mà từng thành viên biết mình cần đọc phần nào trước khi bảo vệ.
