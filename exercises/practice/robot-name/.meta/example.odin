package robotname

import "core:math/rand"

Robot_Storage :: struct {
	available_ids: []uint,
}

Robot :: struct {
	name: string,
}

Error :: enum {
	None,
	Could_Not_Create_Name,
	Unimplemented,
}

make_storage :: proc() -> Robot_Storage {
	ids := make([]uint, MAX_INT, context.temp_allocator)
	for i in uint(0) ..< MAX_INT {
		ids[i] = i
	}
	rand.shuffle(ids[:])
	return Robot_Storage{available_ids = ids[:]}
}

delete_storage :: proc(storage: ^Robot_Storage) {
	free_all(context.temp_allocator)
}

new_robot :: proc(storage: ^Robot_Storage) -> (Robot, Error) {
	name, e := create_name(storage)
	return Robot{name}, e
}

reset :: proc(storage: ^Robot_Storage, r: ^Robot) {
	count := len(storage.available_ids)
	// We have exhausted all the names, can't change it.
	if count == 0 { return }
	// Swap the current id with a new one.
	new_id := storage.available_ids[count - 1]
	storage.available_ids[count - 1] = name_to_id(r.name)
	r.name = id_to_name(new_id)
}

create_name :: proc(storage: ^Robot_Storage) -> (string, Error) {
	count := len(storage.available_ids)
	if count == 0 { return "", .Could_Not_Create_Name }
	id := storage.available_ids[count - 1]
	storage.available_ids = storage.available_ids[:count - 1]
	return id_to_name(id), .None
}

MAX_INT :: 26 * 26 * 10 * 10 * 10

id_to_name :: proc(n: uint) -> string {

	assert(n >= 0 && n < MAX_INT)
	buf := make([]u8, 5, allocator = context.temp_allocator)

	encoding := n
	buf[4] = u8(encoding % 10 + '0')
	encoding /= 10
	buf[3] = u8(encoding % 10 + '0')
	encoding /= 10
	buf[2] = u8(encoding % 10 + '0')
	encoding /= 10
	buf[1] = u8(encoding % 26 + 'A')
	encoding /= 26
	buf[0] = u8(encoding % 26 + 'A')

	return string(buf)
}

name_to_id :: proc(name: string) -> uint {

	assert(len(name) == 5)

	digit5 := uint(name[0] - 'A')
	digit4 := uint(name[1] - 'A')
	digit3 := uint(name[2] - '0')
	digit2 := uint(name[3] - '0')
	digit1 := uint(name[4] - '0')
	return digit1 + 10 * (digit2 + 10 * (digit3 + 10 * (digit4 + 26 * digit5)))
}
