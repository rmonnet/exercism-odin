package binary_search_tree

import "core:testing"

@(test)
/// description = data is retained
test_data_is_retained :: proc(t: ^testing.T) {
    input := `{"treeData":["4"]}`
    result := data(input)
    expected := {"data":"4","left":null,"right":null}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = insert data at proper node -> smaller number at left node
test_insert_data_at_proper_node___smaller_number_at_left_node :: proc(t: ^testing.T) {
    input := `{"treeData":["4","2"]}`
    result := data(input)
    expected := {"data":"4","left":{"data":"2","left":null,"right":null},"right":null}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = insert data at proper node -> same number at left node
test_insert_data_at_proper_node___same_number_at_left_node :: proc(t: ^testing.T) {
    input := `{"treeData":["4","4"]}`
    result := data(input)
    expected := {"data":"4","left":{"data":"4","left":null,"right":null},"right":null}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = insert data at proper node -> greater number at right node
test_insert_data_at_proper_node___greater_number_at_right_node :: proc(t: ^testing.T) {
    input := `{"treeData":["4","5"]}`
    result := data(input)
    expected := {"data":"4","left":null,"right":{"data":"5","left":null,"right":null}}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = can create complex tree
test_can_create_complex_tree :: proc(t: ^testing.T) {
    input := `{"treeData":["4","2","6","1","3","5","7"]}`
    result := data(input)
    expected := {"data":"4","left":{"data":"2","left":{"data":"1","left":null,"right":null},"right":{"data":"3","left":null,"right":null}},"right":{"data":"6","left":{"data":"5","left":null,"right":null},"right":{"data":"7","left":null,"right":null}}}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = can sort data -> can sort single number
test_can_sort_data___can_sort_single_number :: proc(t: ^testing.T) {
    input := `{"treeData":["2"]}`
    result := sorted_data(input)
    expected := ["2"]

    testing.expect_value(t, result, expected)
}

@(test)
/// description = can sort data -> can sort if second number is smaller than first
test_can_sort_data___can_sort_if_second_number_is_smaller_than_first :: proc(t: ^testing.T) {
    input := `{"treeData":["2","1"]}`
    result := sorted_data(input)
    expected := ["1","2"]

    testing.expect_value(t, result, expected)
}

@(test)
/// description = can sort data -> can sort if second number is same as first
test_can_sort_data___can_sort_if_second_number_is_same_as_first :: proc(t: ^testing.T) {
    input := `{"treeData":["2","2"]}`
    result := sorted_data(input)
    expected := ["2","2"]

    testing.expect_value(t, result, expected)
}

@(test)
/// description = can sort data -> can sort if second number is greater than first
test_can_sort_data___can_sort_if_second_number_is_greater_than_first :: proc(t: ^testing.T) {
    input := `{"treeData":["2","3"]}`
    result := sorted_data(input)
    expected := ["2","3"]

    testing.expect_value(t, result, expected)
}

@(test)
/// description = can sort data -> can sort complex tree
test_can_sort_data___can_sort_complex_tree :: proc(t: ^testing.T) {
    input := `{"treeData":["2","1","3","6","7","5"]}`
    result := sorted_data(input)
    expected := ["1","2","3","5","6","7"]

    testing.expect_value(t, result, expected)
}
