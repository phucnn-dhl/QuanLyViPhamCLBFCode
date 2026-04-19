---
stepsCompleted: [1]
inputDocuments: []
workflowType: 'research'
lastStep: 1
research_type: 'technical'
research_topic: 'GitHub Flow, Trello, and Scrum for Project Management with a 5-Dev Team'
research_goals: 'Understand GitHub Flow workflow for branching/PRs/code review, Trello board setup for task management, Scrum framework for 5-person team, combine all three tools into effective process, best practices for small teams'
user_name: 'Admin'
date: '2026-04-19'
web_research_enabled: true
source_verification: true
---

# Research Report: Technical

**Date:** 2026-04-19
**Author:** Admin
**Research Type:** Technical - Project Management Toolchain

---

## Research Overview

Comprehensive technical research on combining GitHub Flow, Trello, and Scrum for effective project management with a team of 5 developers.

---

## Technical Research Scope Confirmation

**Research Topic:** GitHub Flow, Trello, and Scrum for Project Management with a 5-Dev Team
**Research Goals:** Understand GitHub Flow workflow for branching/PRs/code review, Trello board setup for task management, Scrum framework for 5-person team, combine all three tools into effective process, best practices for small teams

**Technical Research Scope:**

- Architecture Analysis - System design patterns, workflows, and how GitHub Flow + Trello + Scrum integrate
- Implementation Approaches - Development methodologies, task splitting strategies, progress tracking patterns
- Technology Stack - GitHub, Trello, Scrum ceremonies, and complementary tools
- Integration Patterns - How to connect GitHub Flow with Trello boards and Scrum sprints
- Performance Considerations - Scalability of the process for a 5-dev team, optimization of workflow

**Research Methodology:**

- Current web data with rigorous source verification
- Multi-source validation for critical technical claims
- Confidence level framework for uncertain information
- Comprehensive technical coverage with practical insights for a 5-dev team

**Scope Confirmed:** 2026-04-19

---

## Executive Summary

For **fcode trainc**, the most effective operating model is:

- **Scrum-lite** for planning cadence and accountability
- **Trello** for backlog, sprint execution, and progress visibility
- **GitHub Flow** for implementation, code review, and merge discipline

This combination fits the current project constraints well:

- The delivery window is short: **2026-04-17 to 2026-05-17**
- The scope is already decomposed into **4 epics**
- The architecture is defined enough to let multiple developers work in parallel
- The team size is **5 developers**, which is small enough to avoid heavy process but large enough to require explicit ownership, review, and daily synchronization

**Recommendation:** use **2-week sprints**, one Trello board for the whole project, and a strict branch-per-story / PR-per-branch GitHub Flow. Keep Scrum lightweight and enforce it mainly through Trello discipline and PR review rules.

---

## Source-Based Findings

### 1. GitHub Flow is a lightweight workflow that fits small teams

GitHub Docs defines GitHub Flow as a **lightweight, branch-based workflow**. The official flow is:

1. Create a branch
2. Make changes and commit/push incrementally
3. Open a pull request
4. Address review comments
5. Merge after approval and required checks
6. Delete the branch

Practical implications for this project:

- Each story should map to **one short-lived branch**
- Pull requests should be small enough to review quickly
- Draft PRs should be used when the dev wants early feedback
- Branch protection should block direct pushes to `main`
- Merge should happen only after review and basic build/test checks pass

This is a strong fit for a 5-dev team because it minimizes branching complexity compared with Git Flow, while still preserving review quality and a clear history.

**Sources**
- GitHub Flow: https://docs.github.com/en/get-started/using-github/github-flow
- Git workflows: https://docs.github.com/en/get-started/getting-started-with-git/git-workflows

### 2. Scrum gives the cadence and accountability model

The official Scrum Guide defines Scrum as a lightweight framework for generating value through adaptive solutions to complex problems. It centers on:

- **Roles/accountabilities**: Product Owner, Scrum Master, Developers
- **Events**: Sprint, Sprint Planning, Daily Scrum, Sprint Review, Sprint Retrospective
- **Artifacts**: Product Backlog, Sprint Backlog, Increment

The Scrum Guide also states Scrum Teams are typically **10 or fewer people**, so a 5-dev team is comfortably within the intended size range.

For this project, Scrum should not be implemented as ceremony-heavy textbook Scrum. It should be used as:

- a way to create a short planning cycle
- a way to keep the sprint goal explicit
- a way to inspect progress and adapt weekly

**Sources**
- Scrum Guide: https://scrumguides.org/scrum-guide.html
- Scrum Guide download page: https://scrumguides.org/download.html

### 3. Trello is the execution board and visibility layer

Trello is strong for:

- visualizing workflow by list/status
- assigning owners
- adding due dates, labels, checklists, attachments, and comments
- automating repetitive actions using built-in automation

Atlassian Support documents that Trello automation can trigger rules based on board events and perform actions such as moving cards, assigning members, and updating fields. That matters for a small team because it removes manual board maintenance overhead.

**Sources**
- Trello overview: https://www.atlassian.com/blog/trello/what-is-trello-used-for
- Trello automation overview: https://support.atlassian.com/trello/docs/automation-overview/
- Trello automation hub: https://support.atlassian.com/trello/docs/butler/

### 4. The three tools complement each other rather than overlap

Best operating split:

- **Scrum** answers: how often do we plan, sync, review, and improve?
- **Trello** answers: what is the current status of every task?
- **GitHub Flow** answers: how does code move safely into the main branch?

This separation is important. If Trello is used as a status board and GitHub is used as the code/change system, the team avoids the common failure mode where work exists in code but not on the planning board, or vice versa.

---

## Repo-Specific Analysis

### Project characteristics

Based on the current artifacts:

- The project is a **terminal-based C application**
- The architecture already proposes a modular structure: `main`, `auth`, `member`, `violation`, `fileio`, `report`, `utils`
- The scope is already broken into **4 epics**:
  - Epic 1: Setup & Authentication
  - Epic 2: Member Management
  - Epic 3: Violation Tracking & Enforcement
  - Epic 4: Reports & Advanced Features

This is important because the team can split work by module and by story with relatively low coupling if interfaces are agreed early.

### Current process gap

One operational risk is already visible:

- The current workspace is **not initialized as a Git repository**

Inference: before GitHub Flow can be used, the team needs a real GitHub repository, branch protection, a PR template, and a minimal CI/build check. Without that setup, Scrum + Trello will track work, but code integration quality will remain fragile.

---

## Recommended Team Operating Model

### Team structure for 5 developers

Recommended accountability model:

- **1 Product Owner / project lead**
  - owns backlog priority
  - decides sprint goal
  - accepts/rejects completed stories
- **1 rotating Scrum Master** from the dev team
  - facilitates planning, daily sync, retro
  - keeps Trello hygiene and blocker escalation honest
- **5 Developers**
  - each owns implementation tasks
  - all participate in estimation, review, and refinement

If there is no dedicated non-coding PO, use this fallback:

- 1 lead dev acts as **Product Owner**
- Scrum Master rotates each sprint among the remaining devs

### Sprint cadence

For a project window ending **2026-05-17**, use:

- **Sprint length:** 2 weeks
- **Cadence:** 2 main sprints, then 2-3 buffer/demo/fix days before final delivery

Recommended schedule:

- **Sprint 1:** 2026-04-20 to 2026-05-03
  - focus: Epic 1 + core of Epic 2
- **Sprint 2:** 2026-05-04 to 2026-05-16
  - focus: Epic 3 + Epic 4 + hardening
- **Buffer / demo prep:** 2026-05-17 or earlier if the academic schedule requires it

This is more realistic than weekly sprints because the team needs enough time to implement, review, and stabilize C modules.

### Scrum ceremonies sized for this team

Use the Scrum events, but keep them tight:

- **Sprint Planning:** 90 minutes every 2 weeks
- **Daily Scrum:** 15 minutes each workday
- **Backlog Refinement:** 30 minutes mid-sprint
- **Sprint Review / Demo:** 45 to 60 minutes at sprint end
- **Retrospective:** 30 to 45 minutes immediately after review

Reference note: Atlassian's Scrum ceremony guidance aligns with these event patterns and timeboxes for short sprints.

**Source**
- Scrum ceremonies: https://www.atlassian.com/agile/scrum/ceremonies

---

## Trello Board Design

### Recommended single-board structure

Create one Trello board: **`fcode trainc Delivery Board`**

Recommended lists:

1. `Product Backlog`
2. `Ready for Sprint`
3. `Sprint Backlog`
4. `In Progress`
5. `In Review`
6. `Blocked`
7. `Done`

Why this works:

- `Product Backlog` keeps all unscheduled work
- `Ready for Sprint` is the groomed queue
- `Sprint Backlog` represents committed sprint scope
- `In Progress` shows active development
- `In Review` separates coding from review/QA
- `Blocked` makes impediments visible immediately
- `Done` shows accepted work only, not merely "coded"

### Card structure

Use this hierarchy:

- **Epic** = Trello label or card prefix, not a giant card
- **Story** = one Trello card
- **Subtasks** = checklist items on the story card
- **PR link** = attachment on the card

Each story card should contain:

- Story ID and short title
- Epic reference
- Acceptance criteria
- Assignee
- Estimate in story points
- Due date
- Checklist of engineering tasks
- Link to relevant file/module design
- PR link once opened

### Suggested labels

Use labels consistently:

- `Epic 1`
- `Epic 2`
- `Epic 3`
- `Epic 4`
- `bug`
- `tech-debt`
- `blocked`
- `priority-high`

### Trello automation rules

Recommended Butler automations:

- When a card is moved to `In Progress`, assign the card owner and set start date
- When a card is moved to `In Review`, add checklist item `PR opened`
- When due date is within 24 hours and card is not in `Done`, mark with warning label
- When all checklist items are complete and PR is approved, move to `Done`
- When card is moved to `Blocked`, add `blocked` label automatically

These rules reduce manual updates and improve board accuracy.

---

## GitHub Flow Rules For This Project

### Required repository setup

Before the team starts parallel development:

1. Initialize a Git repository in this project folder
2. Create a GitHub repository
3. Push `main`
4. Enable branch protection on `main`
5. Require at least **1 approving review**
6. Require status checks before merge
7. Add PR template and issue template

### Branch naming convention

Use short, descriptive names:

- `feat/story-1.1-project-scaffold`
- `feat/story-2.1-add-member`
- `feat/story-3.4-record-violation`
- `fix/story-1.5-login-lockout`
- `chore/setup-ci`

### Commit convention

Use focused commits:

- `feat(auth): add login attempt lockout`
- `feat(member): add member creation flow`
- `fix(fileio): persist accounts after password reset`
- `test(report): cover unpaid fine summary`

This is consistent with GitHub's guidance that isolated, complete commits are easier to review and revert.

### Pull request rule set

Each PR should:

- map to exactly one Trello card
- include a clear summary
- include acceptance criteria checklist
- include test/build notes
- be kept small enough for same-day review when possible

Minimum merge standard:

- 1 reviewer approval
- no unresolved comments
- build passes
- formatting/static analysis passes

### Definition of Done for code

A story is not `Done` when code is merely written. It is `Done` only when:

- code is implemented
- code compiles cleanly
- required manual or automated verification is completed
- PR is approved
- merged into `main`
- Trello card moved to `Done`

---

## How To Split Work Across 5 Developers

### Recommended ownership model by sprint

Because the architecture is modular, assign temporary ownership by module, but review across module boundaries.

Example Sprint 1 ownership:

- **Dev A:** `main.c`, menu routing, app wiring
- **Dev B:** `auth.h/.c`
- **Dev C:** `types.h`, `utils.h/.c`
- **Dev D:** `fileio.h/.c`
- **Dev E:** `member.h/.c`

Example Sprint 2 ownership:

- **Dev A:** `violation.h/.c`
- **Dev B:** `report.h/.c`
- **Dev C:** search/sort/report export stories
- **Dev D:** test data, bug fixes, integration hardening
- **Dev E:** UX of terminal menus, validation, edge-case handling

### Task sizing rule

For this team, a story should generally be:

- **1 to 2 days** of work for one developer
- one PR
- one card

If a story is larger than 2 days, split it before sprint commitment.

### Review pairing rule

Do not review your own module exclusively. Pair reviews cross-functionally:

- auth reviewed by fileio or report owner
- member reviewed by violation owner
- main/menu reviewed by another dev who depends on those flows

This reduces blind spots and spreads system understanding.

---

## Progress Tracking Model

### What to track daily

At minimum, track these operational metrics:

- number of cards in `Sprint Backlog`
- number of cards in `In Progress`
- number of cards in `Blocked`
- number of cards in `Done`
- age of each blocked card
- open PR count
- PR review turnaround time

### Sprint health indicators

Healthy sprint signals:

- most cards move from `Sprint Backlog` to `In Progress` by early sprint
- `Blocked` stays low and cards do not stay blocked > 1 day
- PR review time stays under 24 hours on school days
- `Done` reflects accepted, merged work, not partial coding

Warning signals:

- too many cards in `In Progress`
- stories repeatedly moving back from `In Review`
- large end-of-sprint merges
- one dev becoming a bottleneck for multiple modules

### WIP limits

Recommended work-in-progress limits:

- each dev: max **1 primary card** in `In Progress`
- team total in `In Review`: max **3 cards**
- blocked cards must be surfaced in daily scrum immediately

This matters especially for a 5-dev team. Without WIP limits, work starts faster than it finishes, and visibility becomes misleading.

---

## Concrete Mapping From Current Epics To Trello + Sprint Plan

### Sprint 1 proposal

Commit Sprint 1 mainly to:

- Story 1.1 Project Scaffold & Build System
- Story 1.2 Data Types & Constants
- Story 1.3 Utility Functions
- Story 1.4 File I/O
- Story 1.5 Authentication
- Story 1.6 Change & Reset Password
- Story 2.1 Add Member
- Story 2.2 Edit Member

Stretch if capacity remains:

- Story 2.3 Delete Member
- Story 1.1 style/tooling hardening

### Sprint 2 proposal

Commit Sprint 2 mainly to:

- remaining Epic 2 work
- core Epic 3 features
- Epic 4 reporting features
- stabilization, demo data, and acceptance polish

### Story point guidance

Simple internal guide for this project:

- **1 point:** tiny isolated change
- **2 points:** straightforward feature in one module
- **3 points:** cross-module feature with validation or persistence impact
- **5 points:** complex flow touching multiple modules and business rules

Avoid estimating above 5 points. Split those stories instead.

---

## Recommended Weekly Routine

### Monday

- daily scrum
- grooming if needed
- review blocked items

### Midweek

- short refinement session
- ensure no stale PRs older than 24 hours

### End of week

- mini review of Trello board hygiene
- check whether sprint commitment still matches reality

### End of sprint

- demo completed stories
- retro with three prompts:
  - what helped delivery?
  - what slowed us down?
  - what one change will we adopt next sprint?

---

## Risks And Mitigations

### Risk 1: Trello and code drift apart

Mitigation:

- every PR must reference a Trello card
- no card can move to `Done` before merge
- every daily scrum updates the board live

### Risk 2: Stories are too large

Mitigation:

- enforce 1-2 day story size
- split by module boundary or acceptance criterion

### Risk 3: One dev becomes integration bottleneck

Mitigation:

- rotate reviewers
- keep module interfaces explicit in headers
- merge smaller PRs continuously

### Risk 4: End-of-project instability

Mitigation:

- reserve explicit hardening time in Sprint 2
- keep `main` always buildable
- avoid batching multiple unfinished stories in one PR

---

## Final Recommendation

For this project, the most pragmatic setup is:

- **Scrum-lite cadence**
- **Trello as the team board**
- **GitHub Flow with protected `main`**

The key operating principles should be:

1. Plan in sprint-sized batches
2. Split work into 1-2 day stories
3. Track each story as one Trello card
4. Implement each story on one Git branch
5. Merge through reviewed PRs only
6. Measure progress by accepted, merged work, not activity

If the team follows those six rules consistently, project management, task division, and progress tracking will be much more reliable than using chat messages or ad hoc coordination.

---

## Source List

- GitHub Docs, "GitHub flow"  
  https://docs.github.com/en/get-started/using-github/github-flow

- GitHub Docs, "Git workflows"  
  https://docs.github.com/en/get-started/getting-started-with-git/git-workflows

- Scrum Guides, "The 2020 Scrum Guide"  
  https://scrumguides.org/scrum-guide.html

- Scrum Guides, "Download the official Scrum Guide"  
  https://scrumguides.org/download.html

- Atlassian, "A guide to agile ceremonies and scrum meetings"  
  https://www.atlassian.com/agile/scrum/ceremonies

- Atlassian, "What is Scrum? Breaking down the Agile framework"  
  https://www.atlassian.com/agile/scrum

- Atlassian, "What is Trello used for?"  
  https://www.atlassian.com/blog/trello/what-is-trello-used-for

- Atlassian Support, "Automation overview"  
  https://support.atlassian.com/trello/docs/automation-overview/

- Atlassian Support, "Automation, Power-Ups, and integrations"  
  https://support.atlassian.com/trello/docs/butler/
