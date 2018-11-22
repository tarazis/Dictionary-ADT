note
	description: "Iteration Cursor Class to implement an iterative DICTIONARY"
	author: "Sami Tarazi"
	date: "November 21, 2018"
	revision: "$Revision$"

class
	TUPLE_ITERATION_CURSOR[V -> attached ANY, K -> attached ANY]
	inherit
		ITERATION_CURSOR[TUPLE[V,K]]

create
	make

feature{NONE} -- attributes
	values: LINKED_LIST[V]
	keys: ARRAY[K]
	cursor_pos: INTEGER

feature -- constructor
	make(v: LINKED_LIST[V]; k:ARRAY[K])
	do
		values:= v
		keys:= k
		cursor_pos:= keys.lower

	end

feature
	item: TUPLE[V,K]
	local
		value: V
		key: K
	do
		value:= values.at (cursor_pos)
		key:= keys.at (cursor_pos)

		create Result

		Result:= [value, key]


	end

	after: BOOLEAN
	do
		Result:= cursor_pos > keys.upper

	end

	forth
	do
		cursor_pos:= cursor_pos + 1

	end

end
