# Ring Buffer Module Unit Test Homework — Lecture 08

## Overview

Write unit tests for the `ring_buf` module — a tiny circular FIFO buffer.

The exact test cases to implement are specified in `TEST_SPEC.md`. The
skeleton in `src/test_ring_buf.c` already provides one complete test
(`test_fresh_state`) as a worked example, and declares the remaining 7
stubs with `ztest_test_skip()` so the binary builds cleanly from the start.

**Reference**: lecture 08 slides for `ZTEST_SUITE`, `ZTEST`, `before` hook,
and the three assertion families (`zassert_*`, `zexpect_*`, `zassume_*`).

## Module Under Test

```text
app/modules/ring_buf/
├── include/ring_buf.h     # public API
└── src/ring_buf.c         # implementation (static circular buffer)
```

The `ring_buf` module provides a fixed-capacity circular buffer of `int`s with the following API:
```c
int rb_init(size_t capacity);
int rb_pop(int *value);
int rb_peek(int *value);
bool rb_is_empty(void);
bool rb_is_full(void);
size_t rb_count(void);
```

> Before starting homework, read the full API reference in `include/ring_buf.h`. The implementation 
> in `src/ring_buf.c` is under 100 lines of code, so you can read it in its entirety if you like.
> The tests will be black-box, so you don't need to understand the implementation to write them, 
> but reading the code may help you understand the expected behavior and edge cases.

## Provided Infrastructure

`src/test_ring_buf.c` already contains:

- All required `#include`s (`zephyr/ztest.h`, `errno.h`, `ring_buf.h`)
- A shared `before` hook that calls `rb_init(4)` before every test
- Three `ZTEST_SUITE` registrations (`ring_buf_init`, `ring_buf_push_pop`,
  `ring_buf_boundaries`)
- One complete test (`test_fresh_state`) as a worked example
- Seven `ZTEST` stubs, each with a `// TODO(l8-task1)` comment pointing at
  the matching entry in `TEST_SPEC.md`

Each stub currently calls `ztest_test_skip()`. Replace that line with the
actual test body.

## Running the Tests

> **Platform note**
> - **Linux / WSL** — use `native_sim`.
> - **Windows (without WSL)** — `native_sim` is not supported on Windows, use `qemu_x86` instead.

Run from the workspace root, or `cd tests/ring_buf` and use `-T .`:

**Linux / WSL**
```bash
# Build and run
west twister -T tests/ring_buf -p native_sim

# Verbose per-test output
west twister -T tests/ring_buf -p native_sim -v

# Build only (fastest way to find compile errors)
west twister -T tests/ring_buf -p native_sim -b
```

**Windows**
```bash
# Build and run
west twister -T tests/ring_buf -p qemu_x86

# Verbose per-test output
west twister -T tests/ring_buf -p qemu_x86 -v

# Build only (fastest way to find compile errors)
west twister -T tests/ring_buf -p qemu_x86 -b
```

---

## Task 1 — Implement the Tests  `git tag l8-task1`

Open `src/test_ring_buf.c` and fill in each stub `ZTEST` body according to
`TEST_SPEC.md`. Study `test_fresh_state` first — it shows the pattern.
Seven tests to write across three suites:

- `ring_buf_init`: 1 test (reinit clears state)
- `ring_buf_push_pop`: 3 tests (single push/pop, FIFO order, full buffer push)
- `ring_buf_boundaries`: 3 tests (peek non-consuming, `pop(NULL)`, `is_full` after fill)

For each test:
1. Read the matching row in `TEST_SPEC.md`.
2. Remove `ztest_test_skip()` from the stub.
3. Write the test body using `zassert_*` assertions to verify the expected behavior.
4. Re-run Twister and confirm the test passes.

**Acceptance:** all 8 tests pass.

**Linux / WSL**
```bash
west twister -T tests/ring_buf -p native_sim
```

**Windows**
```bash
west twister -T tests/ring_buf -p qemu_x86
```

### Tag `l8-task1`

After every test passes, tag the commit `l8-task1`.

---

## Task 2 — Coverage Analysis  `git tag l8-task2`

**Linux / WSL**
```bash
west twister -T tests/ring_buf -p native_sim \
    --coverage --coverage-tool gcovr \
    --coverage-basedir app/modules/ring_buf
```

**Windows**
```bash
west twister -T tests/ring_buf -p qemu_x86 \
    --coverage --coverage-tool gcovr \
    --coverage-basedir app/modules/ring_buf \
    --gcov-tool <ZEPHYR_SDK_PATH>/x86_64-zephyr-elf/bin/x86_64-zephyr-elf-gcov
```

> Replace `<ZEPHYR_SDK_PATH>` with the full path to your SDK root (e.g. `C:/zephyr-sdk-0.17.4`).
> Alternatively, set the `ZEPHYR_SDK_INSTALL_DIR` environment variable to your SDK root and omit
> `--gcov-tool` — Twister will locate the tool automatically.
> See [Zephyr SDK setup](https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html)
> for details about `ZEPHYR_SDK_INSTALL_DIR`.

1. Run the command above to generate the coverage report.
2. Open `twister-out/coverage/index.html` in a browser and click into `ring_buf.c`.
3. After a correct Task 1 implementation, the expected numbers are:
```
Lines:     81.4%  (35/43)
Functions: 100.0%  (7/7)
Branches:  64.3%  (9/14)
```
   If your numbers are lower, a test body is likely still calling `ztest_test_skip()`,
   eventually tests where not implemented according to the spec. Go back and check each
   test body against the spec to find the missing one(s).
4. Look at the red lines. Think about **why** those paths are not exercised by the spec.
   Ask yourself: *what test case(s) would be needed to cover those lines?* (no need to 
   implement them, just think about it).

### Tag `l8-task2`

Include the `twister-out/coverage/` directory in the commit and tag it
`l8-task2`.
