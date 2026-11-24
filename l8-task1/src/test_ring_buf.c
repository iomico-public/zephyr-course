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
	/* TODO(l8-task1): Push a value, call rb_init(4) again, then
	 * verify the buffer is empty and count is 0.
	 * See TEST_SPEC.md "Suite ring_buf_init" #2.
	 */
	zassert_ok(rb_push(99), "push(99) failed");
	zassert_ok(rb_init(4),"reinit failed");
	
	zassert_true(rb_is_empty(),"Buffer must be empty after reinit");
	zassert_equal(rb_count(), 0, "Buffer count must be 0 after reinit");
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
	int v =0;

	zassert_ok(rb_push(42),"push(42) failed");
	zassert_ok(rb_pop(&v), "pop(&v) failed");
	zassert_equal(v, 42,"Popped value must be 42");
	zassert_true(rb_is_empty(),"Buffer must be empty after pop");
}

ZTEST(ring_buf_push_pop, test_fifo_order)
{
	/* TODO(l8-task1): rb_push(1), rb_push(2), rb_push(3); pop three times
	 * and verify the values come out as 1, 2, 3 in that order.
	 * See TEST_SPEC.md "Suite ring_buf_push_pop" #2.
	 */
	int v =0;
	zassert_ok(rb_push(1),"push(1) failed");
	zassert_ok(rb_push(2),"push(2) failed");
	zassert_ok(rb_push(3),"push(3) failed");

	zassert_ok(rb_pop(&v), "first pop failed");
	zassert_equal(v,1,"First popped value must be 1");

	zassert_ok(rb_pop(&v), "second pop failed");
	zassert_equal(v,2,"Second popped value must be 2");

	zassert_ok(rb_pop(&v), "third pop failed");
	zassert_equal(v,3,"Third popped value must be 3");

	zassert_true(rb_is_empty(), "Buffer must be empty after three pops");
}

ZTEST(ring_buf_push_pop, test_push_full_returns_enospc)
{
	/* TODO(l8-task1): Fill the buffer to its capacity of 4, then push
	 * one more value -> -ENOSPC.
	 * See TEST_SPEC.md "Suite ring_buf_push_pop" #3.
	 */
	zassert_ok(rb_push(1),"push(1) failed");
	zassert_ok(rb_push(2),"push(2) failed");
	zassert_ok(rb_push(3),"push(3) failed");
	zassert_ok(rb_push(4),"push(4) failed");
	
	zassert_true(rb_is_full(),"Buffer must be full at capacity 4");
	zassert_equal(rb_push(99), -ENOSPC, "Push past capacity must return -ENOSPC");
	zassert_equal(rb_count(),4,"Count must remain 4 after failed push");
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
	/* TODO(l8-task1): rb_push(7); rb_peek(&v) -> v == 7; rb_peek(&v) again
	 * -> v == 7; rb_count() still == 1.
	 * See TEST_SPEC.md "Suite ring_buf_boundaries" #1.
	 */
	
	 int v = 0;
	 zassert_ok(rb_push(7), "push(7) failed");

	 zassert_ok(rb_peek(&v),"first peek failed");
	 zassert_equal(v,7,"First peek value must be 7");

	 v =0;
	 zassert_ok(rb_peek(&v),"second peek failed");
	 zassert_equal(v,7,"Second peek must return 7");
	 
	 zassert_equal(rb_count(),1,"Count must remain 1 after peeks");
}

ZTEST(ring_buf_boundaries, test_pop_null_returns_einval)
{
	/* TODO(l8-task1): rb_pop(NULL) -> -EINVAL.
	 * See TEST_SPEC.md "Suite ring_buf_boundaries" #2.
	 */
	zassert_equal(rb_pop(NULL), -EINVAL, "rb_pop(NULL) must return -EINVAL");

}

ZTEST(ring_buf_boundaries, test_is_full_after_fill)
{
	/* TODO(l8-task1): push 4 values -> rb_is_full() == true, rb_count() == 4.
	 * See TEST_SPEC.md "Suite ring_buf_boundaries" #3.
	 */
	zassert_ok(rb_push(1), "push(1) failed");
	zassert_ok(rb_push(2), "push(2) failed");
	zassert_ok(rb_push(3), "push(3) failed");
	zassert_ok(rb_push(4), "push(4) failed");
	
	zassert_true(rb_is_full(), "Buffer must be full after pushing 4 values");
	zassert_equal(rb_count(), 4, "Count must be 4 after pushing 4 values");
}
