# Ring Buffer Unit Test Specification

The `ring_buf` module keeps its backing array, head/tail indices, count
and capacity in a single `static` struct inside `ring_buf.c`. Tests can
only inspect state through the public API — `rb_count()`, `rb_is_empty()`,
`rb_is_full()`, `rb_peek()`. State is reset only via `rb_init()`.

> **Why the `rb_` prefix?** Zephyr's kernel exports its own `ring_buf_*`
> API in `<zephyr/sys/ring_buffer.h>`, which is transitively included by
> `<zephyr/ztest.h>`. The homework module avoids the symbol clash by
> using an `rb_` prefix while keeping the directory/file name `ring_buf`.

Shorthands used below:
- `buf` — the ring buffer (initialised with capacity 4 in the `before` hook)
- `push(N)` — `rb_push(N)`
- `pop(&v)` — `rb_pop(&v)` where `v` is a local `int` declared in the test
- `peek(&v)` — `rb_peek(&v)` where `v` is a local `int` declared in the test

**Before hook** (every suite):
`rb_init(4)`

---

## Suite `ring_buf_init`

| #   | Scenario                 | Precondition       | Input                                 | Expected    |
| --- | ------------------------ | ------------------ | ------------------------------------- | ----------- |
| 1   | Fresh state *(provided)* | None (before hook) | `rb_is_empty()`, `rb_count()`         | `true`, `0` |
| 2   | Reinit clears state      | `push(99)`         | `rb_init(4)` then the same two checks | `true`, `0` |

**Verify #1 (provided):** `rb_is_empty() == true` and `rb_count() == 0`.

**Verify #2:** after the second `rb_init(4)`, `rb_is_empty() == true`
and `rb_count() == 0` (the previous push is fully discarded).

---

## Suite `ring_buf_push_pop`

| #   | Scenario             | Precondition            | Input                                          | Expected                       |
| --- | -------------------- | ----------------------- | ---------------------------------------------- | ------------------------------ |
| 1   | Single push then pop | None (before hook)      | `push(42)`, `pop(&v)`                          | both return `0`; `v == 42`     |
| 2   | FIFO order preserved | None (before hook)      | `push(1)`, `push(2)`, `push(3)`, `pop(&v)` × 3 | three pops yield `1`, `2`, `3` |
| 3   | Push past capacity   | `push(1..4)` (buf full) | `push(99)`                                     | `-ENOSPC`                      |

**Verify #1:** `push(42) == 0`; `pop(&v) == 0`; `v == 42`; after the pop
`rb_is_empty() == true`.

**Verify #2:** all three `push(...)` calls return `0`; the three `pop(&v)`
calls yield `1`, then `2`, then `3` (use `zassert_equal` per pop). After
the third pop `rb_is_empty() == true`.

**Verify #3:** the four initial pushes all return `0`; `rb_is_full() == true`;
the fifth `push(99)` returns exactly `-ENOSPC`; `rb_count() == 4`
(rejected push did not consume a slot).

---

## Suite `ring_buf_boundaries`

| #   | Scenario              | Precondition       | Input                  | Expected                            |
| --- | --------------------- | ------------------ | ---------------------- | ----------------------------------- |
| 1   | Peek does not consume | `push(7)`          | `peek(&v)`, `peek(&v)` | both return `0`; `v == 7` each time |
| 2   | `pop(NULL)`           | None (before hook) | `rb_pop(NULL)`         | `-EINVAL`                           |
| 3   | `is_full` after fill  | `push(1..4)`       | `rb_is_full()`         | `true`                              |

**Verify #1:** the first and second `peek(&v)` both return `0` and write
`7` into `v`. After the two peeks `rb_count() == 1` (peek must not
consume).

**Verify #2:** `rb_pop(NULL)` returns exactly `-EINVAL`.

**Verify #3:** all four pushes return `0`; `rb_is_full() == true`;
`rb_count() == 4`.
