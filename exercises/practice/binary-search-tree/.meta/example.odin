package binary_search_tree

import "core:fmt"

Tree :: ^Node

Node :: struct {
	value: int,
	left:  Tree,
	right: Tree,
}

destroy_tree :: proc(t: Tree) {
	if t == nil { return }
	destroy_tree(t.left)
	destroy_tree(t.right)
	free(t)
}

insert :: proc(t: ^Tree, value: int) {

	if t^ == nil {
		t^ = new(Node)
		t^.value = value
		return
	}

	if value <= t^.value {
		insert(&t^.left, value)
	} else {
		insert(&t^.right, value)
	}
}

sorted_data :: proc(t: Tree) -> []int {

	if t == nil { return nil }

	acc: [dynamic]int
	collect_data(t, &acc)
	return acc[:]
}

collect_data :: proc(t: Tree, acc: ^[dynamic]int) {

	if t == nil { return }
	collect_data(t.left, acc)
	append(acc, t.value)
	collect_data(t.right, acc)
}

main :: proc() {

	data := [?]int{4, 2}
	input: Tree
	for v in data[:] {
		insert(&input, v)
	}
	result := sorted_data(input)
	defer {
		destroy_tree(input)
		delete(result)
	}
	fmt.printf("%#v\n", input)
	fmt.println(result)
}
