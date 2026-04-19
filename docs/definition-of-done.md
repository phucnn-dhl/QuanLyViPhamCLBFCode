# Definition Of Done

This checklist defines when a story can move to `Done`.

## Required For Every Story

- [ ] Story scope is still aligned with the Trello card
- [ ] Acceptance criteria are satisfied
- [ ] Code is complete, not partially stubbed
- [ ] Branch is up to date enough to review safely
- [ ] Pull request is opened
- [ ] Pull request references the correct story/card
- [ ] At least one reviewer has approved
- [ ] No unresolved review comments remain
- [ ] Pull request is merged

## Code Quality

- [ ] Project builds cleanly
- [ ] New code follows project naming and module boundaries
- [ ] No unnecessary global state was introduced
- [ ] Data validation is handled for new inputs
- [ ] Error paths are handled reasonably

## Persistence And Business Rules

Use this section when the story touches write paths or domain rules.

- [ ] File persistence works after every mutation
- [ ] Relevant `.dat` data remains readable after restart
- [ ] Member/account/violation relationships remain consistent
- [ ] Fine calculation rules are correct
- [ ] Role-based access behavior is correct
- [ ] Out CLB or lockout rules are correct if touched

## Manual Verification

- [ ] The main happy path was run manually
- [ ] At least one failure or validation scenario was checked
- [ ] CLI output is understandable enough for demo/review

## Trello State Change Rule

A card moves to `Done` only after:

1. implementation is finished
2. verification is completed
3. PR is approved
4. PR is merged

If any of those are missing, the card stays in `In Progress`, `In Review`, or `Blocked`.
