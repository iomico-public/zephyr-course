/*
 * Ring Buffer Module - Homework Test Skeleton
 *
 * test_fresh_state is provided as a worked example. Fill in the remaining
 * 7 ZTEST bodies according to TEST_SPEC.md. Stubs call ztest_test_skip()
 * so the binary builds and runs cleanly before each test is implemented.
 *
 * Run:
 *   west twister -T tests/ring_buf -p native_sim
 */

#include <zephyr/ztest.h>
#include <errno.h>

#include "ring_buf.h"

/*
 * Shared before hook: every suite reinitialises the ring buffer with a
 * capacity of 4 so tests start from a clean, known state. Capacity 4 is
 * enough to exercise FIFO order (push 1, 2, 3) and overflow (full at 4).
 */
static void before(void *f)
{
	ARG_UNUSED(f);
	rb_init(4);
}

/*
 * ============================================================================
 * Test Suite: ring_buf_init
 *
 * Initial state and re-initialization behaviour.
 * ============================================================================
 */
ZTEST_SUITE(ring_buf_init, NULL, NULL, before, NULL, NULL);

/* PROVIDED — study this test before writing the rest. */
ZTEST(ring_buf_init, test_fresh_state)
{
	zassert_true(rb_is_empty(), "Fresh buffer must be empty");
	zassert_equal(rb_count(), 0, "Fresh buffer count must be 0");
}

ZTEST(ring_buf_init, test_reinit_clears_state)
{
	rb_push(99);
	zassume_false(rb_push(99), "Pushing a single value after reset shouldn't fail");
	zassume_equal(rb_count(), 1, "We can assume the buffer is not empty after a push");
	rb_init(4);
	zassert_true(rb_is_empty(), "Fresh buffer must be empty");
	zassert_equal(rb_count(), 0, "Fresh buffer count must be 0");
}

/*
 * ============================================================================
 * Test Suite: ring_buf_push_pop
 *
 * Single push/pop round-trip, FIFO order, full error path.
 * ============================================================================
 */
ZTEST_SUITE(ring_buf_push_pop, NULL, NULL, before, NULL, NULL);

ZTEST(ring_buf_push_pop, test_single_push_pop)
{
	/* TODO(l8-task1): rb_push(42), rb_pop(&v) -> v == 42, buffer empty after.
	 * See TEST_SPEC.md "Suite ring_buf_push_pop" #1.
	 */
	int v;
	zassert_false(rb_push(42), "Normal push");
	zassert_false(rb_pop(&v),  "Normal pop");
	zassert_equal(42, v, "Pushed value must be retrievable by pop");
}

ZTEST(ring_buf_push_pop, test_fifo_order)
{

        const int PUSH_VALUES[] = {1, 2, 3};
	const int N_VALUES = sizeof(PUSH_VALUES)/sizeof(PUSH_VALUES[0]);
	int v;

	for(int i=0; i<N_VALUES; i++) {
		zexpect_true(rb_push(PUSH_VALUES[i]) == 0, "Push command did not return 0 when it should"); 
	}
	for(int i=0; i<N_VALUES; i++) {
		rb_pop(&v);
		zassert_equal(PUSH_VALUES[i], v, "FIFO order not preserved: expected [%d] but got [%d]", PUSH_VALUES[i], v);
	}
	zassert_true(rb_is_empty(), "Ring Buff not reporting empty after emptying it");
}

ZTEST(ring_buf_push_pop, test_push_full_returns_enospc)
{
	for (int i = 1; i <= 4; i++) {
		zassert_equal(rb_push(i), 0, "Push %d should succeed", i);
	}
	zassert_true(rb_is_full(), "Buffer must be full after 4 pushes");
	zassert_equal(rb_push(99), -ENOSPC, "Push into full buffer must return -ENOSPC");
	zassert_equal(rb_count(), 4, "Count must still be 4 after rejected push");
}

/*
 * ============================================================================
 * Test Suite: ring_buf_boundaries
 *
 * Peek semantics and NULL-pointer boundary conditions.
 * ============================================================================
 */
ZTEST_SUITE(ring_buf_boundaries, NULL, NULL, before, NULL, NULL);

ZTEST(ring_buf_boundaries, test_peek_does_not_consume)
{
	int v;

	zassume_equal(rb_push(7), 0, "Push should succeed");

	zassert_equal(rb_peek(&v), 0, "First peek must return 0");
	zassert_equal(v, 7, "First peek must yield 7");

	zassert_equal(rb_peek(&v), 0, "Second peek must return 0");
	zassert_equal(v, 7, "Second peek must still yield 7");

	zassert_equal(rb_count(), 1, "Peek must not consume the element");
}

ZTEST(ring_buf_boundaries, test_pop_null_returns_einval)
{
	zassert_equal(rb_pop(NULL), -EINVAL, "rb_pop(NULL) must return -EINVAL");
}

ZTEST(ring_buf_boundaries, test_is_full_after_fill)
{
	for (int i = 1; i <= 4; i++) {
		zassert_equal(rb_push(i), 0, "Push %d should succeed", i);
	}
	zassert_true(rb_is_full(), "Buffer must report full after 4 pushes");
	zassert_equal(rb_count(), 4, "Count must be 4 after filling the buffer");
}

ZTEST(ring_buf_boundaries, test_peek_null_returns_einval)
{
	zassert_equal(rb_peek(NULL), -EINVAL, "rb_peek(NULL) must return -EINVAL");
}


/*
 * ============================================================================
 * Test Suite: l8-task2 suite 
 *
 * Invalid operations on empty buffers and ill-formed requests 
 * ============================================================================
 */

ZTEST_SUITE(l8_task2_suite, NULL, NULL, before, NULL, NULL);

ZTEST(l8_task2_suite, test_peek_and_pop_on_empty_buffer) {
	int v;
	zassert_equal(rb_pop(&v), -ENODATA, "Popping an empty buffer should return -ENODATA");
	zassert_equal(rb_peek(&v), -ENODATA, "Peeking an empty bufer should return -ENODATA");
}

ZTEST_SUITE(l8_task2_suite_b, NULL, NULL, NULL, NULL, NULL);

ZTEST(l8_task2_suite, test_incorrect_buffer_initialization) {
	zassert_equal(rb_init(0), -EINVAL, "Can't initialize buffer with no capacity");
	zassert_equal(rb_init(RING_BUF_MAX_CAPACITY+1), -EINVAL, "Can't initialize buffer with more than RING_BUF_MAX_CAPACITY elements");
}
