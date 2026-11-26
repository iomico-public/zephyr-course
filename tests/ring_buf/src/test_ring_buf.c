#include <zephyr/ztest.h>
#include <errno.h>

#include "ring_buf.h"

static void before(void *f)
{
	ARG_UNUSED(f);
	rb_init(4);
}

/* ============================================================================
 * Test Suite: ring_buf_init
 * ============================================================================ */
ZTEST_SUITE(ring_buf_init, NULL, NULL, before, NULL, NULL);

ZTEST(ring_buf_init, test_fresh_state)
{
	zassert_true(rb_is_empty(), "Fresh buffer must be empty");
	zassert_equal(rb_count(), 0, "Fresh buffer count must be 0");
}

ZTEST(ring_buf_init, test_reinit_clears_state)
{
	zassert_equal(rb_push(99), 0, "Push before reinit must succeed");
	zassert_equal(rb_init(4), 0, "Reinit must succeed");
	zassert_true(rb_is_empty(), "Buffer must be empty after reinit");
	zassert_equal(rb_count(), 0, "Count must be 0 after reinit");
}

/* ============================================================================
 * Test Suite: ring_buf_push_pop
 * ============================================================================ */
ZTEST_SUITE(ring_buf_push_pop, NULL, NULL, before, NULL, NULL);

ZTEST(ring_buf_push_pop, test_single_push_pop)
{
	int v = 0;

	zassert_equal(rb_push(42), 0, "Push 42 must succeed");
	zassert_equal(rb_pop(&v), 0, "Pop must succeed");
	zassert_equal(v, 42, "Popped value must be 42");
	zassert_true(rb_is_empty(), "Buffer must be empty after popping single element");
}

ZTEST(ring_buf_push_pop, test_fifo_order)
{
	int v = 0;

	zassert_equal(rb_push(1), 0, "Push 1 must succeed");
	zassert_equal(rb_push(2), 0, "Push 2 must succeed");
	zassert_equal(rb_push(3), 0, "Push 3 must succeed");

	zassert_equal(rb_pop(&v), 0, "First pop must succeed");
	zassert_equal(v, 1, "First popped value must be 1");

	zassert_equal(rb_pop(&v), 0, "Second pop must succeed");
	zassert_equal(v, 2, "Second popped value must be 2");

	zassert_equal(rb_pop(&v), 0, "Third pop must succeed");
	zassert_equal(v, 3, "Third popped value must be 3");

	zassert_true(rb_is_empty(), "Buffer must be empty after popping all 3 elements");
}

ZTEST(ring_buf_push_pop, test_push_full_returns_enospc)
{
	for (int i = 1; i <= 4; i++) {
		zassert_equal(rb_push(i), 0, "Push %d into non-full buffer must succeed", i);
	}

	zassert_true(rb_is_full(), "Buffer must be full after 4 pushes");
	zassert_equal(rb_push(99), -ENOSPC, "Push into full buffer must return -ENOSPC");
	zassert_equal(rb_count(), 4, "Count must remain 4 after rejected push");
}

/* ============================================================================
 * Test Suite: ring_buf_boundaries
 * ============================================================================ */
ZTEST_SUITE(ring_buf_boundaries, NULL, NULL, before, NULL, NULL);

ZTEST(ring_buf_boundaries, test_peek_does_not_consume)
{
	int v = 0;

	zassert_equal(rb_push(7), 0, "Push 7 must succeed");

	zassert_equal(rb_peek(&v), 0, "First peek must succeed");
	zassert_equal(v, 7, "First peek must yield 7");

	v = 0;
	zassert_equal(rb_peek(&v), 0, "Second peek must succeed");
	zassert_equal(v, 7, "Second peek must yield 7");

	zassert_equal(rb_count(), 1, "Count must still be 1 after peeking");
}

ZTEST(ring_buf_boundaries, test_pop_null_returns_einval)
{
	zassert_equal(rb_pop(NULL), -EINVAL, "rb_pop(NULL) must return -EINVAL");
}

ZTEST(ring_buf_boundaries, test_is_full_after_fill)
{
	for (int i = 1; i <= 4; i++) {
		zassert_equal(rb_push(i), 0, "Push %d must succeed", i);
	}

	zassert_true(rb_is_full(), "rb_is_full() must be true after 4 pushes");
	zassert_equal(rb_count(), 4, "rb_count() must be 4 after 4 pushes");
}
