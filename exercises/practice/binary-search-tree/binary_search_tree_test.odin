package binary_search_tree

import "core:fmt"
import tt "core:testing"

@(test)
/// description = data is retained
test_data_is_retained :: proc(t: ^tt.T) {

	data := [?]int{4}
	tree: Tree
	for v in data[:] {
		insert(&tree, v)
	}
	defer destroy_tree(tree)

	tt.expect(t, tree != nil, "didn't expect tree to be null")
	if tree == nil { return }
	tt.expectf(t, tree.value == 4, "expected tree.value to be 4 but got %d", tree.value)
	tt.expect(t, tree.left == nil, "expected tree.left to be nil")
	tt.expect(t, tree.right == nil, "expected tree.right to be nil")
}

@(test)
/// description = insert data at proper node -> smaller number at left node
test_insert_data_at_proper_node___smaller_number_at_left_node :: proc(t: ^tt.T) {

	data := [?]int{4, 2}
	tree: Tree
	for v in data[:] {
		insert(&tree, v)
	}
	defer destroy_tree(tree)

	tt.expect(t, tree != nil, "didn't expect tree to be null")
	if tree == nil { return }
	tt.expectf(t, tree.value == 4, "expected tree.value to be 4 but got %d", tree.value)
	tt.expect(t, tree.left != nil, "didn't expect tree.left to be nil")
	if tree.left == nil { return }
	tt.expectf(t, tree.left.value == 2, "expected tree.left.value to be 2 but got %d", tree.value)
	tt.expect(t, tree.left.left == nil, "expected tree.left.left to be nil")
	tt.expect(t, tree.left.right == nil, "expected tree.left.right to be nil")
	tt.expect(t, tree.right == nil, "expected tree.right to be nil")
}

@(test)
/// description = insert data at proper node -> same number at left node
test_insert_data_at_proper_node___same_number_at_left_node :: proc(t: ^tt.T) {

	data := [?]int{4, 4}
	tree: Tree
	for v in data[:] {
		insert(&tree, v)
	}
	defer destroy_tree(tree)

	tt.expect(t, tree != nil, "didn't expect tree to be null")
	if tree == nil { return }
	tt.expectf(t, tree.value == 4, "expected tree.value to be 4 but got %d", tree.value)
	tt.expect(t, tree.left != nil, "didn't expect tree.left to be nil")
	if tree.left == nil { return }
	tt.expectf(t, tree.left.value == 4, "expected tree.left.value to be 4 but got %d", tree.value)
	tt.expect(t, tree.left.left == nil, "expected tree.left.left to be nil")
	tt.expect(t, tree.left.right == nil, "expected tree.left.right to be nil")
	tt.expect(t, tree.right == nil, "expected tree.right to be nil")
}

@(test)
/// description = insert data at proper node -> greater number at right node
test_insert_data_at_proper_node___greater_number_at_right_node :: proc(t: ^tt.T) {

	data := [?]int{4, 5}
	tree: Tree
	for v in data[:] {
		insert(&tree, v)
	}
	defer destroy_tree(tree)

	tt.expect(t, tree != nil, "didn't expect tree to be null")
	if tree == nil { return }
	tt.expectf(t, tree.value == 4, "expected tree.value to be 4 but got %d", tree.value)
	tt.expect(t, tree.left == nil, "expected tree.left to be nil")
	tt.expect(t, tree.right != nil, "didn't expect tree.right to be nil")
	if tree.right == nil { return }
	tt.expectf(
		t,
		tree.right.value == 5,
		"expected tree.right.value to be 5 but got %d",
		tree.value,
	)
	tt.expect(t, tree.right.right == nil, "expected tree.right.right to be nil")
	tt.expect(t, tree.right.right == nil, "expected tree.left.right to be nil")
}

@(test)
/// description = can create complex tree
test_can_create_complex_tree :: proc(t: ^tt.T) {

	data := [?]int{4, 2, 6, 1, 3, 5, 7}
	tree: Tree
	for v in data[:] {
		insert(&tree, v)
	}
	defer destroy_tree(tree)

	tt.expect(t, tree != nil, "didn't expect tree to be null")
	if tree == nil { return }
	tt.expectf(t, tree.value == 4, "expected tree.value to be 4 but got %d", tree.value)
	tt.expect(t, tree.left != nil, "didn't expect tree.left to be nil")
	if tree.left == nil { return }
	tt.expectf(t, tree.left.value == 2, "expected tree.right.value to be 2 but got %d", tree.value)
	tt.expect(t, tree.left.left != nil, "didn't expect tree.left.left to be nil")
	if tree.left.left == nil { return }
	tt.expectf(
		t,
		tree.left.left.value == 1,
		"expected tree.left.left.value to be 1 but got %d",
		tree.value,
	)
	tt.expect(t, tree.left.left.left == nil, "expected tree.left.left.left to be nil")
	tt.expect(t, tree.left.left.right == nil, "expected tree.left.left.right to be nil")
	tt.expect(t, tree.left.right != nil, "didn't expect tree.left.right to be nil")
	if tree.left.right == nil { return }
	tt.expectf(
		t,
		tree.left.right.value == 3,
		"expected tree.left.right.value to be 3 but got %d",
		tree.value,
	)
	tt.expect(t, tree.left.right.left == nil, "expected tree.left.right.left to be nil")
	tt.expect(t, tree.left.right.right == nil, "expected tree.left.right.right to be nil")
	tt.expectf(t, tree.right != nil, "didn't expect tree.right to be nil")
	if tree.right == nil { return }
	tt.expectf(
		t,
		tree.right.value == 6,
		"expected tree.right.value to be 6 but got %d",
		tree.value,
	)
	tt.expect(t, tree.right.left != nil, "didn't expect tree.right.left to be nil")
	if tree.right.left == nil { return }
	tt.expectf(
		t,
		tree.right.left.value == 5,
		"expected tree.right.left.value to be 5 but got %d",
		tree.value,
	)
	tt.expect(t, tree.right.left.left == nil, "expected tree.right.left.left to be nil")
	tt.expect(t, tree.right.left.right == nil, "expected tree.right.left.right to be nil")
	tt.expect(t, tree.right.right != nil, "didn't expect tree.right.right to be nil")
	if tree.right.right == nil { return }
	tt.expectf(
		t,
		tree.right.right.value == 7,
		"expected tree.right.right.value to be 7 but got %d",
		tree.value,
	)
	tt.expect(t, tree.right.right.left == nil, "expected tree.right.right.left to be nil")
	tt.expect(t, tree.right.right.right == nil, "expected tree.right.right.right to be nil")
}

@(test)
/// description = can sort data -> can sort single number
test_can_sort_data___can_sort_single_number :: proc(t: ^tt.T) {

	data := [?]int{2}
	input: Tree
	for v in data[:] {
		insert(&input, v)
	}
	result := sorted_data(input)
	defer {
		destroy_tree(input)
		delete(result)
	}
	expect_slices(t, result, []int{2})

}

@(test)
/// description = can sort data -> can sort if second number is smaller than first
test_can_sort_data___can_sort_if_second_number_is_smaller_than_first :: proc(t: ^tt.T) {

	data := [?]int{2, 1}
	input: Tree
	for v in data[:] {
		insert(&input, v)
	}
	result := sorted_data(input)
	defer {
		destroy_tree(input)
		delete(result)
	}
	expect_slices(t, result, []int{1, 2})
}

@(test)
/// description = can sort data -> can sort if second number is same as first
test_can_sort_data___can_sort_if_second_number_is_same_as_first :: proc(t: ^tt.T) {

	data := [?]int{2, 2}
	input: Tree
	for v in data[:] {
		insert(&input, v)
	}
	result := sorted_data(input)
	defer {
		destroy_tree(input)
		delete(result)
	}
	expect_slices(t, result, []int{2, 2})
}

@(test)
/// description = can sort data -> can sort if second number is greater than first
test_can_sort_data___can_sort_if_second_number_is_greater_than_first :: proc(t: ^tt.T) {

	data := [?]int{2, 3}
	input: Tree
	for v in data[:] {
		insert(&input, v)
	}
	result := sorted_data(input)
	defer {
		destroy_tree(input)
		delete(result)
	}
	expect_slices(t, result, []int{2, 3})
}

@(test)
/// description = can sort data -> can sort complex tree
test_can_sort_data___can_sort_complex_tree :: proc(t: ^tt.T) {

	data := [?]int{4, 2, 1, 3, 6, 7, 5}
	input: Tree
	for v in data[:] {
		insert(&input, v)
	}
	result := sorted_data(input)
	defer {
		destroy_tree(input)
		delete(result)
	}
	expect_slices(t, result, []int{1, 2, 3, 4, 5, 6, 7})
}

// Helper function to compare two slices and provide meaningful error messages.
expect_slices :: proc(t: ^tt.T, actual, expected: []$E, loc := #caller_location) {

	result := fmt.aprintf("%v", actual)
	exp_str := fmt.aprintf("%v", expected)
	defer {
		delete(result)
		delete(exp_str)
	}

	tt.expect_value(t, result, exp_str, loc = loc)
}
