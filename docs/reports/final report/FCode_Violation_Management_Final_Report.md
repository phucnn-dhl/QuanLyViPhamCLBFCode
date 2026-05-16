# F-CODE ACADEMIC CLUB

**F-Code Club Member Violation Management System**

| **Project Title** | *F-Code Club Member Violation Management System* |
| --- | --- |
| **Programming Language** | C |
| **Organizer** | Academic Board - F-Code Club, FPT University HCM |
| **Project Period** | 17 April 2026 - 16 May 2026 |
| **Mentor** | *Nguyen Khoa* |
| **Team Name** | *mid* |
| **Submission Date** | 16 May 2026 |

*Team members*

| **No.** | **Full Name** | **Student ID** | **Role** |
| --- | --- | --- | --- |
| 1 | Dam Le Tuan Anh | SE204111 | Team Leader |
| 2 | Nguyen Ngoc Phuc | SE203055 | Member |
| 3 | Nguyen Van Phu | SE210043 | Member |
| 4 | Huynh Gia Bao | SE204913 | Member |
| 5 | Vo Hieu Thang | SE200932 | Member |

*Approved by* **Pham Hoang Tuan**

Academic Board Representative - F-Code Club, FPT University HCM

# Section 1. Project Overview

This final report documents the completed version of the F-Code Club Member Violation Management System. The project is a terminal-based C application used by the club's Academic Board and members to manage club discipline records, member profiles, fines, payment status, warnings, and reporting in a consistent and persistent way.

## 1.1. Problem Statement

F-Code Club needs a reliable way to track member violations such as absence, not wearing the club jacket, not joining club activities, and violent behavior. Before digitization, these records are easy to lose, difficult to audit, and inconvenient to summarize when the board needs to review discipline history or collect outstanding fines.

The delivered solution is a CLI application written in standard C that centralizes:

- Authentication and session-based access control.
- Member management with add, edit, delete, list, and profile view.
- Violation recording with automatic fine calculation.
- Consecutive-absence tracking and Out CLB warnings.
- Payment status management for fines.
- Statistics, sorting, report export, and date-range search.
- Binary file persistence so data is preserved across program restarts.

## 1.2. Objectives

By completing this project, the implementation practises the following core technical objectives:

- Model real business entities with C structs and fixed-capacity arrays.
- Separate the codebase into multiple `.h` and `.c` modules with clear responsibilities.
- Use binary file I/O with `fread`/`fwrite` for persistence.
- Implement role-based menus and module interaction through a shared `AppDatabase`.
- Apply defensive programming techniques such as validation, rollback, account lockout, and safer file replacement.
- Build, format, and statically analyze the project through a structured `Makefile`.

From the club-operation perspective, the delivered system also targets these practical objectives:

- Replace informal tracking through chat messages or memory with a reproducible record system.
- Help BCN enforce discipline rules consistently across the four club teams.
- Allow members to self-check their profile, violation history, and outstanding fines without asking BCN manually.
- Provide repeatable export and demo flows for final defense and internal handover.

## 1.3. Final Scope

**Delivered (in scope):**

- Login, logout, change password, and BCN password reset.
- Member CRUD operations with automatic account creation.
- Member self-service profile view, own violation view, own fine view, and member list view.
- Violation recording with rule-based fine calculation by role.
- Consecutive-absence warning flow and Out CLB enforcement confirmation.
- Marking fines as paid and recalculating outstanding debt.
- Filtered violation list for administrators.
- Statistics by team.
- Sorting members by violation count.
- Exporting a `.txt` report.
- Searching violations by date range.
- Persistent storage in `accounts.dat`, `members.dat`, and `violations.dat`.
- Demo seed data generator for repeatable presentations.

**Not fully delivered / limited versus the requirement intent:**

- When recording a violation, the implementation searches members by `studentId` only. The requirement wording allows selecting by `MSSV/tên`, but name-based lookup is not implemented in the current build.
- Final administrative metadata for mentor, team roster, task ownership, and leader evaluation is not stored in the repository and must be completed manually before submission.
- The requirement document and architecture discussion contain a threshold ambiguity for Out CLB due to absences. The current code follows the interpretation implemented in the project logic: warning at 3 consecutive absences and confirm Out CLB from the 4th absence onward.

# Section 2. Functional Requirements - Final Status

The table below records the final implementation status as of **16 May 2026**.

| **No.** | **Feature** | **Priority** | **Status** | **Notes** |
| --- | --- | --- | --- | --- |
| 1 | Login with role-based menu routing | **Required** | **Done** | Locks account after 3 failed attempts |
| 2 | Logout and in-memory session handling | **Required** | **Done** | Session stored in `auth.c` as module-private state |
| 3 | Change own password | **Required** | **Done** | Requires current password confirmation |
| 4 | BCN reset member password | Advanced | **Done** | Resets password and unlocks account |
| 5 | Add new member and auto-create account | **Required** | **Done** | Default password is generated on creation |
| 6 | Edit member information | **Required** | **Done** | Changing role recalculates unpaid fines |
| 7 | Delete member with cascade delete | **Required** | **Done** | Removes member, violations, and account |
| 8 | View own profile and member list | **Required** | **Done** | Member list supports pagination |
| 9 | Record violation and calculate fine automatically | **Required** | **Done** | Supports four violation reasons |
| 10 | Consecutive-absence warning and Out CLB handling | **Required** | **Done** | Warning at 3 absences, confirm at 4+ |
| 11 | Member view own violations and outstanding fines | **Required** | **Done** | Separate self-service menu entries |
| 12 | BCN mark fine as paid | **Required** | **Done** | Updates both `violations.dat` and `members.dat` |
| 13 | View all violations with filters | **Required** | **Done** | Filters by team, reason, payment status |
| 14 | Statistics by team | Advanced | **Done** | Shows collected, outstanding, and total fines |
| 15 | Sort members by violation count | Advanced | **Done** | Uses pointer-array selection sort |
| 16 | Export report to `.txt` | Advanced | **Done** | Writes report beside the executable |
| 17 | Search violations by date range | Advanced | **Done** | Uses normalized day boundaries |
| 18 | Persistent binary storage with first-run initialization | **Required** | **Done** | Auto-creates `ADMIN/ADMIN` on first run |
| 19 | Crash-safe temporary-file recovery | Advanced | **Done** | `.tmp` and `.bak` strategy in `fileio.c` |
| 20 | Select member when recording violation | Optional | **Done** | Member selection is supported in the current admin violation-recording flow |

Implementation traceability by project epic:

- **Epic 1 - Project Setup & Authentication**: stories `1.1` to `1.6`, implemented mainly in `main.c`, `auth.c`, `fileio.c`, `utils.c`, and `types.h`.
- **Epic 2 - Member Management**: stories `2.1` to `2.4`, implemented mainly in `member.c`.
- **Epic 3 - Violation Tracking & Enforcement**: stories `3.1` to `3.4`, implemented mainly in `violation.c`.
- **Epic 4 - Reports & Advanced Features**: stories `4.1` to `4.4`, implemented mainly in `report.c` and `violation.c`.

**Status definitions:**

- **Done**: implemented in the current build, reachable from the application flow, and supported by the codebase and demo documents.
- **Not Achieved**: planned or implied by the requirement set, but not implemented in the current shipped interaction flow.

# Section 3. System Architecture

## 3.1. Directory & File Structure

The final source tree is organized as follows.

| **File / Directory** | **Role & Key Functions** |
| --- | --- |
| **src/main.c** | Program entry point. Loads data, handles login loop, and routes to member or BCN menus. |
| **src/auth.c / include/auth.h** | Authentication, logout, session access, password change, BCN password reset. |
| **src/member.c / include/member.h** | Member CRUD, profile view, member listing, validation, cascade delete, role-change fine recalculation. |
| **src/violation.c / include/violation.h** | Record violation, calculate fine, absence threshold checks, mark paid, self-service violation/fine views, filtered admin views, date-range search. |
| **src/report.c / include/report.h** | Team statistics, sorting members by violation count, export report to `.txt`. |
| **src/fileio.c / include/fileio.h** | Load and save `accounts.dat`, `members.dat`, `violations.dat`; first-run bootstrap; temporary-file recovery. |
| **src/utils.c / include/utils.h** | Safe string/int input, validation, date parsing, time formatting, display-name mapping, executable-path helpers. |
| **include/types.h** | Central definitions for `Account`, `Member`, `Violation`, `AppDatabase`, constants, and capacity limits. |
| **tools/seed_data.c** | Standalone generator for predictable demo data and reset flow. |
| **data/** | Repository-level binary seed data copies. |
| **bin/** | Compiled application, compiled seed tool, and runtime `bin/data/` storage used by the executable. |
| **docs/** | Requirement documents, architecture notes, demo guide, technical highlights, stories, and reports. |
| **Makefile** | Build automation for compile, clean, format, and `clang-tidy` analysis. |

The architecture follows a simple modular CLI design. Business logic is distributed across dedicated modules instead of being embedded in `main.c`.

Additional structural observations from the codebase:

- The application keeps one in-memory `AppDatabase` instance for the whole runtime.
- Runtime data is read from the `data` directory located beside the compiled executable, not from a remote service or external database.
- The repository includes both engineering documents (`architecture.md`, `epics.md`, story files) and operational documents (`demo-and-test-guide.md`, `technical-highlights.md`) that support implementation and defense.

## 3.2. Data Structures

This section documents the main structs defined in `include/types.h`.

### 3.2.1. Account - authentication record

**Purpose:** Stores credentials and login control state for one user account.

| **Field** | **Type** | **Description** |
| --- | --- | --- |
| **role** | int | Login role: `ACCOUNT_ROLE_MEMBER` or `ACCOUNT_ROLE_BCN`. Determines which menu is shown after login. |
| **isLocked** | int | Persistent lock flag. Set after 3 consecutive failed login attempts. |
| **failCount** | int | Number of consecutive failed password attempts that have been recorded. |
| **studentId** | char[MAX_MSSV_LEN] | Login identifier used as username. Example: `SV0002`, `BCN001`, `ADMIN`. |
| **password** | char[MAX_PASS_LEN] | Plain-text password stored in the current implementation. |

### 3.2.2. Member - club member profile

**Purpose:** Represents one club member, including identity, organization placement, discipline counters, and current outstanding debt.

| **Field** | **Type** | **Description** |
| --- | --- | --- |
| **totalFine** | double | Sum of unpaid fines currently owed by the member. Recalculated when needed. |
| **team** | int | Team code: Academic, Planning, HR, or Media. |
| **role** | int | Club role: member, leader/vice leader, or BCN. |
| **isActive** | int | Membership state: active or Out CLB. |
| **consecutiveAbsences** | int | Running counter of consecutive absence violations used for warning logic. |
| **violationCount** | int | Number of violations associated with the member. |
| **studentId** | char[MAX_MSSV_LEN] | Unique member identifier. Used to join with `Account` and `Violation`. |
| **fullName** | char[MAX_NAME_LEN] | Member full name. |
| **email** | char[MAX_EMAIL_LEN] | Email address. |
| **phone** | char[MAX_PHONE_LEN] | Phone number. |

### 3.2.3. Violation - discipline event

**Purpose:** Stores a single violation instance for a member with timestamp, reason, money value, and handling status.

| **Field** | **Type** | **Description** |
| --- | --- | --- |
| **violationTime** | time_t | Unix timestamp for when the violation is recorded. |
| **fine** | double | Monetary fine for the violation. Can be `0.0` for violence cases handled as Out CLB only. |
| **reason** | int | Violation type: no jacket, absent, no activity, or violence. |
| **isPaid** | int | Payment state for fine-based violations. `1` means collected, `0` means not yet collected. |
| **penalty** | int | Handling mode: monetary fine or Out CLB. |
| **studentId** | char[MAX_MSSV_LEN] | Identifier of the member who committed the violation. |
| **note** | char[MAX_NOTE_LEN] | Optional admin note attached to the record. |

### 3.2.4. AppDatabase - in-memory system state

**Purpose:** Central container that holds all loaded arrays and counts in one place so each module can operate on the same shared state.

| **Field** | **Type** | **Description** |
| --- | --- | --- |
| **members** | Member[MAX_MEMBERS] | Fixed-capacity array of all member records. |
| **violations** | Violation[MAX_VIOLATIONS] | Fixed-capacity array of all violation records. |
| **accounts** | Account[MAX_MEMBERS] | Fixed-capacity array of account records. |
| **memberCount** | int | Number of active entries currently stored in `members`. |
| **violationCount** | int | Number of active entries currently stored in `violations`. |
| **accountCount** | int | Number of active entries currently stored in `accounts`. |

### 3.2.5. Domain constants and business encoding

The project uses integer constants rather than enums for portability and simplicity in plain C. Key encodings include:

| **Category** | **Values** | **Meaning** |
| --- | --- | --- |
| **Member status** | `STATUS_ACTIVE = 1`, `STATUS_OUT_CLB = 0` | Whether the member is still active in the club |
| **Violation reason** | `REASON_NO_JACKET`, `REASON_ABSENT`, `REASON_NO_ACTIVITY`, `REASON_VIOLENCE` | Four supported discipline reasons |
| **Team** | `TEAM_ACADEMIC`, `TEAM_PLANNING`, `TEAM_HR`, `TEAM_MEDIA` | The four functional teams of the club |
| **Penalty type** | `PENALTY_FINE`, `PENALTY_OUT_CLB` | Monetary handling or forced removal from the club |
| **Account role** | `ACCOUNT_ROLE_MEMBER`, `ACCOUNT_ROLE_BCN` | Menu authorization role after login |
| **Member role** | `MEMBER_ROLE_MEMBER`, `MEMBER_ROLE_LEADER`, `MEMBER_ROLE_BCN` | Business role used in fine calculation |

This separation between `Account.role` and `Member.role` is an important design point. A leader still uses the member menu, but their violations are fined at the higher rate.

## 3.3. Key Algorithms & Logic

### 3.3.1. Authentication and account lockout

`authLogin()` loops until successful login or lockout. For each failed password attempt, it increments `failCount`, writes the updated state back to `accounts.dat`, and permanently locks the account when the counter reaches 3. This makes the lock survive restarts because the state is persisted immediately.

### 3.3.2. Fine calculation by role

The project uses a simple rule: regular members are fined `20,000 VND`, while leaders and BCN are fined `50,000 VND` for standard financial violations. `violation.c` determines the amount through `calculateFine(member->role)`. Violence is treated differently: the record is created with `fine = 0.0` and `penalty = PENALTY_OUT_CLB`.

### 3.3.3. Consecutive absence threshold logic

Absence violations increment `consecutiveAbsences`. Other non-absence presence-related violations reset the counter to zero because they imply the member attended. The system:

- Tracks members after 2 consecutive absences.
- Shows a warning at 3.
- Prompts BCN for Out CLB confirmation at 4 or more.

This is implemented through `handleAbsent()` and `violationCheckOutThreshold()`.

### 3.3.4. Transaction-style rollback on multi-file updates

Some operations change both member and violation state at the same time. For example, recording a violation mutates `violations[]`, `member->violationCount`, and `member->totalFine`. The code snapshots the previous state before writing, then restores memory and, when possible, restores files if one save succeeds and a later save fails. This keeps the three stores closer to a consistent transaction model even without a database engine.

### 3.3.5. Crash-safe file persistence

`fileio.c` does not overwrite data files directly. Instead it:

1. Writes a full new image to a `.tmp` file.
2. Renames the old `.dat` file to `.bak`.
3. Promotes `.tmp` to `.dat`.
4. Removes the backup after success.

At startup, the loader also checks for leftover `.tmp` files and recovers or discards them depending on whether a valid `.dat` file already exists.

### 3.3.6. Sort without mutating the original member array

`reportSortMembersByViolations()` builds an array of `const Member *` pointers and sorts those pointers with a selection-sort implementation. This preserves the original `members[]` order while still displaying sorted results. The comparison count is acceptable because the system only supports up to 1,000 members.

### 3.3.7. Date-range search with normalized boundaries

`parseDate()` maps a start date to `00:00:00` and an end date to `23:59:59`, so a search like `01/03/2026` to `31/03/2026` includes the entire last day instead of only midnight. `violationSearchByDate()` then compares `violationTime` inclusively against the generated time range.

### 3.3.8. Cascade delete and referential cleanup

Deleting a member is not just a single-row operation. The code removes:

1. The related account first, so the user loses system access immediately.
2. All violations belonging to that `studentId`.
3. The member record itself.

Because the system uses static arrays, deletion is implemented by shifting later elements left in place and decrementing the corresponding count.

### 3.3.9. First-run bootstrap and demo-data workflow

The project supports two startup scenarios:

- **First run without data files**: `fileioLoadAll()` creates empty stores and auto-creates a default `ADMIN/ADMIN` BCN account.
- **Prepared demo run**: `tools/seed_data.c` writes a repeatable dataset used in `docs/demo-and-test-guide.md`, including members, accounts, and violation history.

This gives the project both a usable empty-start path and a deterministic presentation path for defense day.

# Section 4. Demo Walkthrough

The walkthrough below is aligned with `docs/demo-and-test-guide.md` and the current seeded data flow.

| **Step** | **Action** | **Expected Result / What to Show** |
| --- | --- | --- |
| 1 | **Build and seed data** | Run `mingw32-make`, then run `bin\\seed_data.exe`. Show that demo data is created in `bin\\data\\`. |
| 2 | **Program startup** | Run `bin\\violation-management-system.exe`. The program loads members, violations, and accounts successfully. |
| 3 | **Admin login** | Login with `ADMIN / ADMIN`. The system routes to the BCN menu with 15 functions. |
| 4 | **View member list** | Choose option `13`. Show the club member table, team names, roles, and status values. The seeded dataset contains 14 members plus the synthetic `ADMIN` account. |
| 5 | **Add a new member** | Choose option `1`, enter a test member such as `SV0099`, and show automatic account creation plus immediate file save. |
| 6 | **Record a normal violation** | Choose option `4`, enter `SV0099` or `SV0005`, choose a reason such as `Khong mac ao CLB`, and show automatic fine assignment, timestamp capture, and updated totals. |
| 7 | **Check Out CLB threshold** | Choose option `8`. Show members near or beyond the absence threshold, especially `SV0008` and `SV0011` from the seeded data. |
| 8 | **Filtered violation list** | Choose option `6`, then filter by unpaid status. Show that unpaid records are isolated correctly. |
| 9 | **Mark fine as paid** | Choose option `5`, enter a member with unpaid debt such as `SV0002`, select one unpaid record, and show the updated remaining debt. |
| 10 | **Statistics by team** | Choose option `7`. Show the collected, outstanding, and total fine amounts for the four teams. |
| 11 | **Sort by violation count** | Choose option `9`, then descending. Show the ranking of members with the highest number of violations first. |
| 12 | **Export report** | Choose option `10`. Show the generated file path `violation_report_YYYYMMDD_HHMMSS.txt` near the executable and open the file if needed. |
| 13 | **Search by date range** | Choose option `11`, enter a valid date interval such as `01/03/2026` to `30/04/2026`, and show the filtered rows. |
| 14 | **Member self-service flow** | Logout and login as a member account such as `SV0002 / 123456`, then show profile, own violations, and own outstanding fines. |
| 15 | **Persistence check** | Exit the program and reopen it. Confirm that previously saved changes remain because data is persisted in `.dat` files. |

Recommended seeded accounts for the live defense:

| **Account** | **Password** | **Purpose in Demo** |
| --- | --- | --- |
| `ADMIN` | `ADMIN` | Primary BCN login for menu-wide walkthrough |
| `SV0002` | `123456` | Demonstrate member-side violation and outstanding-fine view |
| `SV0011` | `123456` | Demonstrate high-violation / high-absence member state |

Seeded dataset summary from `tools/seed_data.c` and `docs/demo-and-test-guide.md`:

- `14` member records.
- `15` accounts in total when including the synthetic `ADMIN` account.
- `16` violation records.
- Multiple paid and unpaid violations spread across all four teams.
- Preconfigured absence thresholds for warning and over-threshold demo cases.

# Section 5. Known Issues & Limitations

The current build is functional, but the following issues or limitations remain.

| **Issue** | **Description** | **Severity** | **Suggested Fix** |
| --- | --- | --- | --- |
| **Admin self-profile mismatch** | The auto-created `ADMIN` login account is not backed by a `Member` record. If the operator uses admin menu option `12` after logging in as `ADMIN`, `memberViewProfile()` cannot find matching member data. | Medium | Either create a linked admin member record on first run or hide that menu option for the synthetic `ADMIN` account. |
| **Invalid calendar dates may be normalized instead of rejected** | `parseDate()` uses `mktime()` after parsing `dd/mm/yyyy`. Inputs like `31/02/2026` can be normalized by the C runtime into a different valid date instead of being rejected explicitly. | Medium | Validate day/month/year combinations before calling `mktime()`, or verify that the normalized `struct tm` still matches the original input. |
| **Violation record lookup is MSSV-only** | The requirement wording allows selecting a member by `MSSV/tên`, but `violationRecord()` currently asks only for `studentId`. | Low | Add search helpers that support partial or exact name matching and a selection menu when multiple matches exist. |
| **Member self-view does not special-case Out CLB penalties** | In self-service violation history, status is derived only from `isPaid`. If a violence violation exists, the member-facing table can display it as unpaid instead of `OUT CLB`. | Low | Reuse the same status mapping logic used by the admin-side violation table. |
| **Requirement ambiguity around absence threshold** | The requirement table mentions warning logic from `>= 2` and Out CLB at `= 3`, while the broader requirement narrative says “quá 3 buổi liên tiếp”. The code implements warning at `3` and Out CLB confirmation at `4+`. | Low | Align the requirement wording and implementation in one final accepted rule, then update code and report consistently. |
| **Demo-data default password differs from normal creation flow** | Real member creation uses default password = MSSV, but `seed_data.c` initializes demo member passwords as `123456`. This is practical for demoing but not perfectly consistent with normal business flow. | Low | Change seed accounts to use MSSV as password, or document clearly that demo data uses a custom convenience password. |

Verification evidence available in the repository:

- Functional flow coverage in `docs/demo-and-test-guide.md`.
- Story-to-feature decomposition in `docs/planning/epics.md`.
- Architecture decisions and rationale in `docs/planning/architecture.md`.
- Technical implementation highlights in `docs/technical-highlights.md`.

# Section 6. Task Sheet

| **No.** | **Full Name** | **Role** | **Tasks Performed** |
| --- | --- | --- | --- |
| 1 | **Dam Le Tuan Anh** | Team Leader | Thiết kế cấu trúc tổng thể project (`types.h`, `Makefile`, sơ đồ module). Phối hợp phân công story theo từng epic. Tham gia triển khai các luồng nghiệp vụ chính trong `main.c` (menu BCN/menu thành viên, routing theo role). Tổng hợp tích hợp các module riêng lẻ thành bản build hoàn chỉnh. Review code tổng thể, điều phối testing, chuẩn bị demo và chốt báo cáo nộp. |
| 2 | **Nguyen Ngoc Phuc** | Member | Triển khai module xác thực (`auth.c`): login/logout, session management bằng static variable, khóa tài khoản sau 3 lần sai, đổi/reset mật khẩu. Triển khai module lưu trữ (`fileio.c`): load/save 3 file `.dat`, atomic save qua `.tmp`/`.bak`, first-run bootstrap tự tạo ADMIN/ADMIN, crash recovery. Thiết kế cấu trúc dữ liệu trong `types.h` (Account, Member, Violation, AppDatabase). Hỗ trợ integration testing và debug các luồng chính. |
| 3 | **Nguyen Van Phu** | Member | Triển khai module quản lý thành viên (`member.c`): thêm thành viên mới với auto-create account, sửa thông tin với rollback, cascade delete (xóa account + violations + member), xem profile và danh sách phân trang. Triển khai validation (`utils.c`): kiểm tra email, số điện thoại, MSSV. Xử lý logic tính lại tiền phạt khi đổi chức vụ thành viên (`recalcFines`). Kiểm thử CRUD flows và edge cases. |
| 4 | **Huynh Gia Bao** | Member | Triển khai module vi phạm (`violation.c`): ghi nhận vi phạm với 4 lý do, tính phạt tự động theo role (20k/50k/0), đếm vắng liên tiếp và ngưỡng Out CLB (cảnh báo 3, xác nhận từ 4), xử lý bạo lực (Out CLB không phạt tiền). Triển khai mark paid với tính lại totalFine, self-service view cho thành viên, lọc vi phạm theo ban/ly do/trạng thái, tìm kiếm theo khoảng ngày với chuẩn hóa boundary. |
| 5 | **Vo Hieu Thang** | Member | Triển khai module báo cáo (`report.c`): thống kê tiền phạt theo 4 ban (đã thu/còn nợ/tổng), sắp xếp thành viên theo số vi phạm bằng pointer-array selection sort, xuất báo cáo ra file `.txt` có timestamp. Triển khai seed data tool (`tools/seed_data.c`) tạo dữ liệu demo nhất quán. Hỗ trợ viết documentation (`docs/`), chuẩn bị demo script, và kiểm tra chất lượng tổng thể trước nộp. |

Evidence sources:

- Module ownership: `src/` and `include/` (mỗi file `.c` tương ứng với 1 thành viên chính).
- Story files: `docs/stories/` (1.1–4.4).
- Architecture: `docs/planning/architecture.md` and `docs/planning/epics.md`.
- Git history: commits on `main` branch.

# Section 7. GitHub Repository

| **Repository URL** | *https://github.com/phucnn-dhl/QuanLyViPhamCLBFCode* |
| --- | --- |
| **Main branch** | `main` |
| **README** | Yes - includes project overview, environment setup, build/run commands, and supporting commands |
| **Compile command** | `mingw32-make` |
| **Run command** | `bin\\violation-management-system.exe` |
| **Visibility** | Repository remote is configured and should be verified by the team before submission |

Repository notes:

- The compiled executable name is defined in `Makefile` as `bin/violation-management-system`.
- The project also includes a demo-data helper built separately as `bin/seed_data.exe`.
- The current Git branch in the working copy is `main`.
- The repository is structured to support both development (`src/`, `include/`, `docs/`) and defense/demo preparation (`tools/`, seeded data, report templates).

Supporting commands used by the project:

| **Purpose** | **Command** |
| --- | --- |
| Build application | `mingw32-make` |
| Clean build outputs | `mingw32-make clean` |
| Format source | `mingw32-make format` |
| Static analysis | `mingw32-make tidy` |
| Build demo seed tool | `gcc -std=c17 -m64 -Wall -Iinclude tools/seed_data.c -o bin/seed_data.exe` |
| Generate demo data | `bin\\seed_data.exe` |
| Reset demo data | `bin\\seed_data.exe clear` |

# Section 8. Leader's Member Evaluation

This section must be completed manually by the actual team leader because the repository does not contain the official final peer-assessment data.

Leader review guidance:

- Base the score on concrete ownership visible in commits, stories, and delivered modules.
- Keep the comments specific, for example: “implemented member CRUD and handled rollback bug” is stronger than “helped with coding”.
- Ensure this section is consistent with the final Task Sheet above; the council may compare both sections during defense.

| **No.** | **Full Name** | **Contribution (10)** | **Attitude (10)** | **Tech Skill (10)** | **Teamwork (10)** | **Avg Score** | **Leader's Comment** |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | **Nguyen Ngoc Phuc** | **10** | **10** | **10** | **10** | **10.00/10** | *Contributed strongly across shared implementation tasks, coordinated well with the team, and supported integration and refinement effectively.* |
| 2 | **Nguyen Van Phu** | **10** | **10** | **10** | **10** | **10.00/10** | *Maintained strong contribution quality, supported feature completion and testing, and worked consistently during the project.* |
| 3 | **Huynh Gia Bao** | **10** | **10** | **10** | **10** | **10.00/10** | *Contributed well across shared implementation tasks, supported debugging and integration, and maintained good coordination with the team throughout the project.* |
| 4 | **Vo Hieu Thang** | **10** | **10** | **10** | **10** | **10.00/10** | *Contributed well across shared development and support work, cooperated effectively with teammates, and helped the group complete the final product successfully.* |
