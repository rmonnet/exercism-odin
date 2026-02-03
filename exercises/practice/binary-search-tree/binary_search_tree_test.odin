package binary_search_tree

import "core:fmt"
import "core:testing"

@(test)
/// description = can sort data -> can sort single number
test_can_sort_data___can_sort_single_number :: proc(t: ^testing.T) {

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
test_can_sort_data___can_sort_if_second_number_is_smaller_than_first :: proc(t: ^testing.T) {

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
test_can_sort_data___can_sort_if_second_number_is_same_as_first :: proc(t: ^testing.T) {

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
test_can_sort_data___can_sort_if_second_number_is_greater_than_first :: proc(t: ^testing.T) {

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
test_can_sort_data___can_sort_complex_tree :: proc(t: ^testing.T) {

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
expect_slices :: proc(t: ^testing.T, actual, expected: []$E, loc := #caller_location) {

	result := fmt.aprintf("%v", actual)
	exp_str := fmt.aprintf("%v", expected)
	defer {
		delete(result)
		delete(exp_str)
	}

	testing.expect_value(t, result, exp_str, loc = loc)
}
