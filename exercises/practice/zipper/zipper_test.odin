package zipper

import "core:testing"

@(test)
/// description = data is retained
test_data_is_retained :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"to_tree"}]}`
    result := expected_value(input)
    expected := {"type":"tree","value":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}}}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = left, right and value
test_left_right_and_value :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"right"},{"operation":"value"}]}`
    result := expected_value(input)
    expected := {"type":"int","value":3}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = dead end
test_dead_end :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"left"}]}`
    result := expected_value(input)
    expected := {"type":"zipper","value":null}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = tree from deep focus
test_tree_from_deep_focus :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"right"},{"operation":"to_tree"}]}`
    result := expected_value(input)
    expected := {"type":"tree","value":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}}}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = traversing up from top
test_traversing_up_from_top :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"up"}]}`
    result := expected_value(input)
    expected := {"type":"zipper","value":null}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = left, right, and up
test_left_right_and_up :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"up"},{"operation":"right"},{"operation":"up"},{"operation":"left"},{"operation":"right"},{"operation":"value"}]}`
    result := expected_value(input)
    expected := {"type":"int","value":3}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = test ability to descend multiple levels and return
test_test_ability_to_descend_multiple_levels_and_return :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"right"},{"operation":"up"},{"operation":"up"},{"operation":"value"}]}`
    result := expected_value(input)
    expected := {"type":"int","value":1}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = set_value
test_set_value :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"set_value","item":5},{"operation":"to_tree"}]}`
    result := expected_value(input)
    expected := {"type":"tree","value":{"value":1,"left":{"value":5,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}}}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = set_value after traversing up
test_set_value_after_traversing_up :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"right"},{"operation":"up"},{"operation":"set_value","item":5},{"operation":"to_tree"}]}`
    result := expected_value(input)
    expected := {"type":"tree","value":{"value":1,"left":{"value":5,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}}}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = set_left with leaf
test_set_left_with_leaf :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"set_left","item":{"value":5,"left":null,"right":null}},{"operation":"to_tree"}]}`
    result := expected_value(input)
    expected := {"type":"tree","value":{"value":1,"left":{"value":2,"left":{"value":5,"left":null,"right":null},"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}}}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = set_right with null
test_set_right_with_null :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"set_right","item":null},{"operation":"to_tree"}]}`
    result := expected_value(input)
    expected := {"type":"tree","value":{"value":1,"left":{"value":2,"left":null,"right":null},"right":{"value":4,"left":null,"right":null}}}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = set_right with subtree
test_set_right_with_subtree :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"set_right","item":{"value":6,"left":{"value":7,"left":null,"right":null},"right":{"value":8,"left":null,"right":null}}},{"operation":"to_tree"}]}`
    result := expected_value(input)
    expected := {"type":"tree","value":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":6,"left":{"value":7,"left":null,"right":null},"right":{"value":8,"left":null,"right":null}}}}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = set_value on deep focus
test_set_value_on_deep_focus :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"right"},{"operation":"set_value","item":5},{"operation":"to_tree"}]}`
    result := expected_value(input)
    expected := {"type":"tree","value":{"value":1,"left":{"value":2,"left":null,"right":{"value":5,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}}}

    testing.expect_value(t, result, expected)
}

@(test)
/// description = different paths to same zipper
test_different_paths_to_same_zipper :: proc(t: ^testing.T) {
    input := `{"initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"left"},{"operation":"up"},{"operation":"right"}]}`
    result := same_result_from_operations(input)
    expected := {"type":"zipper","initialTree":{"value":1,"left":{"value":2,"left":null,"right":{"value":3,"left":null,"right":null}},"right":{"value":4,"left":null,"right":null}},"operations":[{"operation":"right"}]}

    testing.expect_value(t, result, expected)
}
