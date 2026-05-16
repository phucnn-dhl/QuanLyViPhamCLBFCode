| **F-CODE ACADEMIC CLUB** | FPT UNIVERSITY HO CHI MINH CITY |
| --- |

![](data:image/png;base64...)

**[PROJECT TITLE]**

| **Project Title** | *[Full project title in English]* |
| --- | --- |
| **Programming Language** | C |
| **Organizer** | Academic Board - F-Code Club, FPT University HCM |

| **Project Period** | 17 April 2026 - 17 May 2026 |
| --- | --- |
| **Mentor** | *[Mentor Full Name]* |
| **Team Name** | *[Team Name]* |
| **Submission Date** | 17 May 2026 |

*Team members*

| **No.** | **Full Name** | **Student ID** | **Role** |
| --- | --- | --- | --- |
| 1 | Nguyen Van An | SE211001 | Team Leader |
| 2 | Tran Thi Bich | SE211002 | Member |
| 3 | Le Hoang Cuong | SE211003 | Member |
| 4 | Pham Ngoc Dung | SE211004 | Member |
| 5 | Vo Thi Em | SE211005 | Member |

*Approved by* **Pham Hoang Tuan**

Academic Board Representative - F-Code Club, FPT University HCM

# Table of Contents

[**Section 1. Project Overview** 1](#_f21nm77fhcm)

1.1. Problem Statement 1

1.2. Objectives 1

1.3. Final Scope 2

[**Section 2. Functional Requirements - Final Status** 2](#_51rgy2314qe0)

[**Section 3. System Architecture** 3](#_w5ixeewurnj4)

3.1. Directory & File Structure 3

3.2. Data Structures 3

3.3. Key Algorithms & Logic 5

[**Section 4. Demo Walkthrough** 6](#_yyftg9vs3d1s)

[**Section 5. Known Issues & Limitations** 7](#_na7uvsuzwk84)

[**Section 6. Task Sheet** 7](#_7yh6rjltjqke)

[**Section 7. GitHub Repository** 8](#_pxza0x45xwjd)

[**Section 8. Leader’s Member Evaluation** 9](#_yfvi9wmf4dyo)

# Section 1. Project Overview

This section provides the final description of the project - what the team built, the problem it addresses, and how the scope evolved from the initial proposal to the delivered product.

## 1.1. Problem Statement

Describe the real-world problem your program solves. This should be the polished final version - more precise than your Midterm submission.

*Example (Parking Lot):*

FPT University HCM handles over 1,000 vehicle movements per day across its parking facilities. Prior to this project, all records were kept on paper: staff wrote license plates and entry times by hand, calculated fees with a calculator, and tallied revenue manually at end-of-shift. This approach caused frequent errors, could not support quick lookups, and made it impossible to generate reliable daily revenue reports.

The team was tasked with building a terminal-based C program to digitize this process: record vehicle entry and exit, calculate fees automatically, persist all data to disk, and generate end-of-day revenue statistics - using only the C standard library, without any graphical interface or network connectivity.

## 1.2. Objectives

By completing this project, every team member has practised:

* Modelling real-world entities with C structs and managing them in fixed-size arrays.
* Implementing file I/O using fread/fwrite for persistent binary storage.
* Decomposing a program into multiple .h/.c modules with clear single responsibilities.
* Writing and calling functions across translation units correctly (header guards, forward declarations).
* Collaborating as a team using Git - branching, merging, and resolving conflicts.

## 1.3. Final Scope

**Delivered (in scope):**

* Vehicle entry and exit management - motorcycle, car, truck - with automatic fee calculation.
* Persistent binary file storage; all data survives program restart and unexpected termination.
* License plate search (linear scan with fallback binary search on sorted snapshot).
* Daily revenue statistics filtered by date, with optional .txt export.
* Price configuration editor accessible to admin role.
* ANSI escape-code colour formatting for improved terminal readability.

**Not delivered (out of scope or attempted and excluded):**

* Admin/Staff role separation - attempted but not stable enough to include in the demo build.
* Graphical interface, network access, or external libraries.

# Section 2. Functional Requirements - Final Status

The table below is the definitive record of every planned feature and its delivery status as of the Final Report submission (17/05/2026). Replace the example rows with your team's actual list.

| **No.** | **Feature** | **Priority** | **Status** | **Notes** |
| --- | --- | --- | --- | --- |
| 1 | Record vehicle entry (license plate, type, entry time) | **Required** | **Done** |  |
| 2 | Record vehicle exit and print itemized invoice | **Required** | **Done** |  |
| 3 | View list of vehicles currently in lot | **Required** | **Done** |  |
| 4 | Search vehicle by license plate | **Required** | **Done** | *Linear scan; binary search added as optimisation* |
| 5 | Daily revenue statistics | **Required** | **Done** | *Filter by date working correctly* |
| 6 | Persist data to file - no data loss on program exit | **Required** | **Done** | *fwrite/fread on every write operation* |
| 7 | Edit price configuration per vehicle type | Advanced | **Done** | *Bonus feature implemented* |
| 8 | Admin / Staff role separation | Advanced | Not Achieved | *Attempted but not stable; excluded from demo* |
| 9 | Export revenue report to .txt | Advanced | **Done** |  |
| 10 | ANSI color console UI | Optional | **Done** |  |

**Status definitions:**

* **Done** - fully implemented, tested with multiple inputs including edge cases, and demonstrated in the demo build.
* **Not Achieved** - attempted but not stable or correct enough to include. Reason documented in Notes column.

*Do not mark a feature as Done if it crashes, produces wrong output, or only works for the happy path. The council will test it.*

# Section 3. System Architecture

## 3.1. Directory & File Structure

The final source tree is organized as follows. Every .c file has a corresponding .h that declares its public interface. No business logic lives in main.c.

| **File / Directory** | **Role & Key Functions** |
| --- | --- |
| **main.c** | Entry point. Renders main menu, reads user choice, dispatches to module functions. Contains no business logic. |
| **parking.h / .c** | Core module: addVehicle(), removeVehicle(), findByPlate(). Owns the vehicles[] array and active count. |
| **billing.h / .c** | Fee calculation: computeFee(Vehicle\*, PriceConfig\*). Reads entryTime/exitTime diff via difftime(), applies rate and minimum. |
| **fileio.h / .c** | loadData() reads all records from vehicles.dat on startup. saveData() writes full array after every mutation. Uses fread/fwrite in binary mode. |
| **report.h / .c** | printDailyRevenue() iterates exited records, filters by date, sums fees, prints formatted table. exportReport() writes same to .txt. |
| **utils.h / .c** | validatePlate(): checks length and character rules. formatTime(): returns human-readable string from time\_t. Shared by all modules. |
| **data/vehicles.dat** | Binary flat file. Each record is one Vehicle struct written with fwrite(). Loaded in full on startup. |
| **data/prices.dat** | Binary flat file storing PriceConfig array. Loaded on startup; written when admin changes rates. |

*Update this table to match your team's actual final file layout. If you combined or renamed modules, reflect that here.*

## 3.2. Data Structures

This section documents every struct defined in the project. For each struct, explain the purpose of the type and the role of each field.

### 3.2.1. Vehicle - one parking record

**Purpose:** Represents a single vehicle interaction with the parking lot. One instance is created on entry and updated on exit. History records (status = 1) are kept in the same array and used for revenue reporting.

| **Field** | **Type** | **Description** |
| --- | --- | --- |
| **licensePlate** | char[12] | Unique identifier for the vehicle. Format enforced by validatePlate() in utils.c. Example: "51A-12345". Max 11 chars + null terminator. |
| **vehicleType** | int | Encoded type: 0 = Motorcycle, 1 = Car, 2 = Truck. Used as index into the priceConfig[] array to look up the applicable rate. |
| **entryTime** | time\_t | Unix timestamp set by time(NULL) at the moment the vehicle is recorded as entered. Never modified after creation. |
| **exitTime** | time\_t | Unix timestamp set by time(NULL) when the vehicle exits. Remains 0 while the vehicle is still parked. Used in fee calculation. |
| **fee** | double | Final parking fee in Vietnamese Dong. Computed by billing.c on exit. Stored in the struct so revenue reports do not need to recalculate. |
| **status** | int | 0 = vehicle is currently parked (active record). 1 = vehicle has exited (history record). Controls which records appear in active-list vs. revenue views. |

### 3.2.2. PriceConfig - fee rate per vehicle type

**Purpose:** Decouples pricing from business logic. The priceConfig[] array has one entry per vehicle type. Rates are loaded from data/prices.dat on startup and can be updated by admin without recompiling.

| **Field** | **Type** | **Description** |
| --- | --- | --- |
| **vehicleType** | int | Matches the vehicleType field in Vehicle. Used to look up the correct entry in the config array. Must be unique per entry. |
| **typeName** | char[20] | Display name shown in menus and invoice printouts. Example: "Motorcycle", "Car", "Truck". |
| **pricePerHour** | double | Fee charged per full or partial hour. Example: 2000.0 VND for Motorcycle, 5000.0 for Car, 8000.0 for Truck. |
| **minimumFee** | double | Minimum charge regardless of duration. Prevents rounding to 0 VND for stays under one hour. Example: 2000.0 for all types. |

*Add 3.2.3, 3.2.4... if your team defined additional structs (e.g., for admin credentials, date ranges, or sorted index).*

## 3.3. Key Algorithms & Logic

This section explains the most important design decisions in the codebase. Do not paste source code - describe the approach and justify the choices made.

### 3.3.1. Vehicle entry validation

When a user submits a license plate on entry, the program calls validatePlate() (utils.c) to check length (2–11 characters) and character set (digits, uppercase letters, hyphens only). If valid, findByPlate() performs a linear scan of the active vehicles array. If a duplicate is found, the entry is rejected with an error message and no record is created. This prevents the same plate appearing twice in the active list, which would make exit matching ambiguous.

### 3.3.2. Fee calculation

On vehicle exit, computeFee() in billing.c calls difftime(exitTime, entryTime) to get elapsed seconds, then converts to hours using ceil() (partial hours are charged in full). The vehicleType field is used as a direct index into priceConfig[]: fee = max(ceil\_hours \* pricePerHour, minimumFee). The midnight-crossing edge case - where a vehicle enters before 00:00 and exits after - is handled correctly because time\_t values are absolute Unix timestamps; difftime() always returns a positive value regardless of day boundary.

### 3.3.3. File persistence strategy

saveData() writes the complete vehicles[] array and vehicleCount to data/vehicles.dat using a single fwrite() call per field. loadData() uses matching fread() calls on startup. Writing the entire array on every mutation is O(n) but acceptable at the lot's maximum capacity (3,636 vehicles). The alternative - appending individual records - would require a more complex repair procedure if the file is corrupted mid-write; full-array overwrite is simpler and safer. Data/prices.dat uses the same pattern for the priceConfig[] array.

### 3.3.4. Daily revenue aggregation

printDailyRevenue() iterates the vehicles[] array and selects records where status == 1 (exited) and the exitTime falls within the requested calendar day. It uses localtime() to decompose the timestamp and compares tm\_year, tm\_mon, and tm\_mday - not just tm\_mday - to correctly handle month-end boundaries. The matching records are counted, their fees summed, and the result printed as a formatted table.

# Section 4. Demo Walkthrough

The table below is the script the team will follow during the 10-minute demo on defence day. Each step names the action, the menu option used, and the expected output the council will see. Prepare this data in the program before the session - do not rely on typing live input.

| **Step** | **Action** | **Expected Result / What to Show** |
| --- | --- | --- |
| 1 | **Program startup** | Run ./parking. Program loads vehicles.dat and prices.dat. Displays main menu with 7 options. |
| 2 | **Add vehicle (entry)** | Select option 1. Enter plate "51A-12345", type 1 (Car). Program records entryTime = current time, saves to file immediately. |
| 3 | **View active vehicles** | Select option 3. Table lists all parked vehicles with plate, type, and entry time. Our test vehicle appears. |
| 4 | **Search by plate** | Select option 4. Enter "51A-12345". Program finds the record and prints full details including duration so far. |
| 5 | **Remove vehicle (exit)** | Select option 2. Enter "51A-12345". Program computes fee: duration = 2h 15m → ceil to 3h → 3 × 5000 = 15,000 VND. Prints invoice. Status set to exited. |
| 6 | **Revenue statistics** | Select option 5. Filter by today's date. Report shows 1 exited vehicle, total revenue 15,000 VND. |
| 7 | **Crash-safety demonstration** | Force-quit the program (Ctrl+C). Restart. Re-run option 5 - revenue data is still intact because saveData() was called after every operation. |
| 8 | **Export report** | Select option 6. File report\_2026-05-17.txt is created in the working directory with the same statistics. |

*Rehearse this script at least twice before defence day. The council may ask to run a step again or in a different order.*

# Section 5. Known Issues & Limitations

No software is perfect. This section documents every known defect or limitation in the final build. Being transparent about issues is expected and evaluated positively - hiding them and having the council discover them during the demo is not.

| **Issue** | **Description** | **Severity** | **Suggested Fix** |
| --- | --- | --- | --- |
| **Admin/Staff login is unstable** | The password comparison logic fails when the input buffer is not fully flushed between entries. Excluded from the demo build. | Medium | Flush stdin after every fgets() call and re-test. |
| **No input length guard on license plate** | A plate longer than 11 characters overflows the char[12] buffer silently. | **High** | Add a strlen() check before copying input into the struct field. |
| **Revenue filter does not handle month-end boundary** | Vehicles entering on the 31st and exiting on the 1st of the next month are excluded from both days' revenue reports. | Low | Compare full date structs (day+month+year) instead of day-only. |

*Replace or extend the example rows with your team's actual known issues. If you have no known issues, write one row explaining how you verified correctness (e.g., test cases run, edge cases covered).*

# Section 6. Task Sheet

The table below records every task performed by each team member throughout the project. Tasks must be specific and verifiable. The council may ask any member to explain or demonstrate the work listed under their name.

| **No.** | **Full Name** | **Role** | **Tasks Performed** |
| --- | --- | --- | --- |
| **1** | **Nguyen Van An** | Team Leader | • Designed overall system architecture and defined module boundaries  • Implemented main.c: menu loop, user input dispatch to modules  • Implemented parking.h / parking.c: addVehicle(), removeVehicle(), findByPlate()  • Managed Git repository: created branches, reviewed and merged pull requests  • Led integration testing and coordinated demo preparation  • Wrote README: project description, compile command, run instructions |
| **2** | **Tran Thi Bich** | Member | • Implemented billing.h / billing.c: computeFee() with difftime(), ceil(), minimumFee logic  • Handled midnight-crossing edge case in fee calculation  • Wrote unit-level tests for fee calculation with boundary inputs  • Assisted with system integration and bug fixes in billing module |
| **3** | **Le Hoang Cuong** | Member | • Implemented fileio.h / fileio.c: loadData() and saveData() using fread() / fwrite()  • Designed binary flat-file format for vehicles.dat and prices.dat  • Verified crash-safety: force-quit and restart tests to confirm data persistence  • Resolved Git merge conflicts during integration phase |
| **4** | **Pham Ngoc Dung** | Member | • Implemented report.h / report.c: printDailyRevenue() with date filtering using localtime()  • Implemented exportReport(): write revenue summary to .txt file  • Fixed month-end boundary bug in date comparison (tm\_year + tm\_mon + tm\_mday)  • Prepared demo data set and verified revenue output against manual calculation |
| **5** | **Vo Thi Em** | Member | • Implemented utils.h / utils.c: validatePlate() (length + charset check), formatTime()  • Added ANSI escape-code color formatting to terminal UI in main.c  • Implemented price configuration editor (admin feature) in parking.c  • Conducted end-to-end functional testing across all menu options |

*Replace the example rows with each member’s actual task list. Tasks must be specific and verifiable — vague entries like “helped with coding” are not acceptable.*

# Section 7. GitHub Repository

| **Repository URL** | *[https://github.com/your-org/your-repo]* |
| --- | --- |
| **Main branch** | [main / develop / master] |
| **README** | [Yes - includes: project description, how to compile, how to run, sample commands] |
| **Compile command** | *[e.g., gcc -o parking main.c parking.c billing.c fileio.c report.c utils.c -lm]* |
| **Run command** | *[e.g., ./parking]* |
| **Visibility** | [Public - or BTC account has been added as collaborator before submission deadline] |

Ensure the repository is accessible before 17/05/2026 23:59. A repository the council cannot open will be treated as not submitted.

# Section 8. Leader’s Member Evaluation

The Team Leader evaluates each member across four dimensions on a 10-point scale. This section is completed solely by the Team Leader and must reflect an honest assessment. The council may cross-reference this with the Task Sheet (Section 6) and ask individual members to justify their scores.

| **No.** | **Full Name** | **Contribution (10)** | **Attitude (10)** | **Tech Skill (10)** | **Teamwork (10)** | **Avg Score** | **Leader’s Comment** |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | **Tran Thi Bich** | **9** | **9** | **8** | **9** | **8.75/10** | *Strong ownership of the billing module. Proactively handled edge cases without being asked.* |