# Story 1.4: File I/O - Load/Save with First-Run Init

Status: done

## Story

As a developer,
I want all data persistence handled by a single fileio module,
so that data is saved to binary `.dat` files on every mutation and loaded on startup.

## Acceptance Criteria

1. **Given** the program starts and `data/*.dat` files do not exist  
   **When** `fileio_load_all()` is called  
   **Then** empty `.dat` files are created with header `(record count = 0)`  
   **And** a default BCN account `ADMIN/ADMIN` is created in `accounts.dat`
2. **Given** `.dat` files exist with data  
   **When** `fileio_load_all()` is called  
   **Then** all `Member`, `Violation`, and `Account` records are loaded into `AppDatabase`
3. **Given** any mutation occurs  
   **When** `fileio_save_*()` is called  
   **Then** the entire file is rewritten `(count header + all records)`  
   **And** data is protected using the architecture's temp-file replace strategy

## Tasks / Subtasks

- [x] Create `include/fileio.h` and `src/fileio.c`
- [x] Implement startup load entrypoint (AC: 1, 2)
  - [x] create missing `.dat` files
  - [x] create first-run admin account if `accounts.dat` is empty
  - [x] clean up crash-residue `.tmp` files on startup
  - [x] load all data into `AppDatabase`
- [x] Implement save functions for each store (AC: 3)
  - [x] `members.dat`
  - [x] `violations.dat`
  - [x] `accounts.dat`
- [x] Apply atomic-write temp-file flow from architecture (AC: 3)
- [x] Handle corruption and startup edge cases

## Dev Notes

- File format is binary with a 4-byte `int` record count header, then fixed-size records. [Source: _bmad-output/planning-artifacts/architecture.md#Binary-Format-dat]
- Save flow must use temp file -> close -> replace old file. Do not overwrite partially in place. [Source: _bmad-output/planning-artifacts/architecture.md#ReadWrite-Strategy]
- On first run:
  - create empty files if missing
  - create default BCN account `ADMIN/ADMIN`
- If `.tmp` files exist on startup, clean them up before normal load.
- If files exist but cannot be read as valid format, fail clearly instead of guessing.

## Post-Implementation Fixes

### Fix #1: Backup-based replace for Windows safety
- **Problem:** `replaceStoreFile()` gọi `remove(dataFile)` rồi `rename(tmp, dataFile)`. Nếu `rename()` fail trên Windows (file bị lock), data bị mất hoàn toàn.
- **Fix:** Dùng `.bak` file — rename `.dat` → `.bak` trước, rồi `.tmp` → `.dat`. Nếu rename fail thì restore từ `.bak`.

### Fix #2: Generic `saveStore()` — bỏ code duplication
- **Problem:** `fileioSaveMembers`, `fileioSaveViolations`, `fileioSaveAccounts` gần như identical (~90 dòng duplicated).
- **Fix:** Extract `saveStore()` static generic nhận buffer + itemSize + count. 3 public functions thành thin wrappers (~15 dòng mỗi cái).

### Fix #3: Tách `fileioLoadAll()` thành helper functions
- **Problem:** `fileioLoadAll()` dài 85 dòng, xử lý cả tmp recovery + load accounts + init admin + load members + load violations.
- **Fix:** Tách thành `loadAccounts()`, `loadMembers()`, `loadViolations()`. `fileioLoadAll()` chỉ còn ~15 dòng gọi 3 helpers.

### Fix #6: Explicit `fflush()` trước `fclose()`
- **Problem:** `closeFileChecked()` chỉ gọi `fclose()` không có `fflush()` trước. Trên một số platform cũ, data có thể chưa được flush xuống disk.
- **Fix:** Thêm `fflush(fp)` trước `fclose(fp)` trong `closeFileChecked()`.

### References

- Story definition: [Source: _bmad-output/planning-artifacts/epics.md#Story-14-File-IO--LoadSave-with-First-Run-Init]
- File I/O architecture: [Source: _bmad-output/planning-artifacts/architecture.md#File-IO-Architecture]
- First-run admin rule: [Source: _bmad-output/planning-artifacts/architecture.md#First-Run-Admin-Account-Implementation-Decision]
- Startup cleanup and corruption behavior: [Source: _bmad-output/planning-artifacts/architecture.md#ReadWrite-Strategy]

## Dev Agent Record

### Agent Model Used

gpt-5

### Completion Notes List

- File persistence is centralized in `fileio` with dedicated save functions for members, violations, and accounts
- Startup load handles missing `.dat` files, crash-residue `.tmp` recovery, and first-run `ADMIN/ADMIN` initialization
- Load/save paths now fail clearly on invalid counts, short reads, or temp-file write/close failures
- Account persistence is routed through `fileio` instead of ad-hoc writes in feature modules

### File List

- `_bmad-output/implementation-artifacts/1-4-file-io-load-save-first-run-init.md`
- `include/fileio.h`
- `src/fileio.c`
