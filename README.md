
# fcode-trainc-violation-management-system

Hệ thống quản lý vi phạm thành viên của CLB F-Code, được phát triển bằng ngôn ngữ C và chạy trên môi trường terminal/CLI.

## Tổng quan

Dự án giải quyết bài toán theo dõi thành viên CLB F-Code vi phạm nội quy, ghi nhận mức phạt, theo dõi công nợ và hỗ trợ Ban Chủ Nhiệm xử lý minh bạch, nhất quán hơn.

Theo tài liệu yêu cầu, hệ thống hướng tới các chức năng chính:

- Đăng nhập, đăng xuất, đổi mật khẩu
- Quản lý thành viên: thêm, sửa, xóa, xem danh sách
- Ghi nhận lịch sử vi phạm và tính mức phạt theo vai trò
- Theo dõi trạng thái đã thu/chưa thu tiền phạt
- Cảnh báo ngưỡng Out CLB và xuất báo cáo ra file
- Lưu dữ liệu xuống file để tránh mất dữ liệu khi thoát chương trình

Hiện tại, repo đang ở giai đoạn scaffold ban đầu: đã có `Makefile`, cấu trúc thư mục cơ bản, công cụ format/tidy và `src/main.c` tối thiểu để xác nhận luồng build.

## Công nghệ và ràng buộc

- Ngôn ngữ: `C17`
- Compiler mục tiêu: `gcc`
- Loại ứng dụng: CLI / Terminal
- Cơ chế lưu trữ: file `.dat`
- Không sử dụng cơ sở dữ liệu, GUI hoặc thư viện ngoài C standard library

## Cấu trúc thư mục

```text
.
|-- Makefile
|-- src/
|   `-- main.c
|-- include/
|-- data/
|-- build/
|-- bin/
|-- docs/
|   |-- planning/
|   |-- requirement-docs/
|   |-- stories/
|   |-- guidelines/
|   `-- support/
`-- CONTRIBUTING.md
````

## Yêu cầu môi trường

Môi trường khuyến nghị cho Windows là `MSYS2 UCRT64`.

Nếu máy chưa cài gì, làm theo các bước sau:

1. Cài `MSYS2` vào đường dẫn ngắn, không dấu, không khoảng trắng, ví dụ `C:\msys64`
2. Mở terminal `MSYS2 UCRT64`
3. Chạy cập nhật hệ thống 2 lần:

```bash
pacman -Suy
pacman -Suy
```

4. Cài toolchain và công cụ cần cho repo:

```bash
pacman -S mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-make mingw-w64-ucrt-x86_64-clang mingw-w64-ucrt-x86_64-clang-tools-extra
```

Sau khi cài xong, môi trường sẽ có:

* `gcc`
* `make`
* `clang-format`
* `clang-tidy`

Lưu ý quan trọng trên Windows:

* Nên chạy project trong terminal `MSYS2 UCRT64`
* Nếu thêm PATH thủ công, chỉ nên ưu tiên `C:\msys64\ucrt64\bin`
* Không nên để `C:\msys64\usr\bin\make.exe` đứng trước toolchain UCRT64, vì dễ gây lỗi khi chạy `make`

## Cách build và chạy

Khuyến nghị mở terminal `MSYS2 UCRT64` tại thư mục repo rồi chạy:

```bash
make
```

Nếu bạn đang chạy từ PowerShell/cmd bên ngoài MSYS2 và chưa map được `make`, có thể dùng:

```powershell
mingw32-make
```

Sau khi build thành công, file output sẽ nằm tại một trong các đường dẫn sau:

```text
bin/fcode-trainc
bin/fcode-trainc.exe
```

Chạy chương trình trên Windows:

```powershell
.\bin\fcode-trainc.exe
```

## Các lệnh hỗ trợ

Build project:

```bash
make
```

Xóa các file/thư mục sinh ra khi build:

```bash
make clean
```

Format source code:

```bash
make format
```

Phân tích tĩnh bằng `clang-tidy`:

```bash
make tidy
```

Nếu chạy ngoài terminal `MSYS2 UCRT64`, có thể thay `make` bằng `mingw32-make` tùy theo PATH của máy.

## Tài liệu liên quan

* Yêu cầu nghiệp vụ: `docs/requirement-docs/QuanLyViPhamCLBFCode_V1.md`
* Kiến trúc và định hướng module: `docs/planning/architecture.md`
* Danh sách story: `docs/stories/`
* Quy trình làm việc nhóm: `CONTRIBUTING.md`
* Các guideline bổ sung: `docs/guidelines/`

## Định hướng kiến trúc

Theo thiết kế hiện tại, dự án dự kiến tách thành các module sau:

* `main`: điều hướng menu và vòng lặp chính của chương trình
* `auth`: đăng nhập, đăng xuất, đổi/reset mật khẩu
* `member`: CRUD thành viên
* `violation`: ghi nhận vi phạm, tính mức phạt, cảnh báo Out CLB
* `fileio`: đọc/ghi `members.dat`, `violations.dat`, `accounts.dat`
* `report`: thống kê và xuất báo cáo
* `utils`: validate và các hàm dùng chung
