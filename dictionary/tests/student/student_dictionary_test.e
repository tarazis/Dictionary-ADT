note
	description: "Student dictionary tests."
	author: "Sami Taazi"

frozen class
	STUDENT_DICTIONARY_TESTS

inherit

	ES_TEST
		redefine
			setup,
			teardown
		end

create
	make

feature -- Constructor(s)

	make
			-- Run application.
		do
			create {DICTIONARY [STRING, STRING]} d.make

				-- check 'count'
			check
				d.count = 0
			end

				-- add test(s)
			add_boolean_case (agent test_setup)
			add_boolean_case (agent test_model)
			add_boolean_case (agent test_get_keys)
			add_boolean_case (agent test_add)
			add_boolean_case (agent test_remove)
			add_boolean_case (agent test_iterable_dictionary)
			add_boolean_case (agent test_iteration_cursor)
		end

feature -- Setup

	d: DICTIONARY [STRING, STRING]

	setup
			-- Initialize 'd' as a 4-entry dictionary.
			-- This feature is executed in the beginning of every test feature.
		do
			d.add_entry ("A", "1")
			d.add_entry ("B", "2")
			d.add_entry ("C", "3")
			d.add_entry ("D", "4")
		end

	teardown
			-- Recreate 'd' as an empty dictionary.
			-- This feature is executed at end of every test feature.
		do
			create {DICTIONARY [STRING, STRING]} d.make
		end

feature -- Test(s)

	test_setup: BOOLEAN
		do
			comment ("test_setup: test the initial dictionary")

				-- check 'count'
			Result := d.count = 4
			check
				Result
			end

				-- check valid key(s)
			Result := d.get_value ("1") ~ "A" and then d.get_value ("2") ~ "B" and then d.get_value ("3") ~ "C" and then d.get_value ("4") ~ "D"
			check
				Result
			end

				-- check invalid key(s)
			Result := d.get_value ("0") ~ Void and then d.get_value ("5") ~ Void
			check
				Result
			end
		end

	test_model: BOOLEAN
		local
			m1, m2: FUN [STRING, STRING]
		do
			comment ("test_model: test entry insertion and its effect on model")

				-- 'm1' model before
			m1 := d.model

				-- add
			d.add_entry ("E", "6")

				-- 'm2' model after
			m2 := d.model

				-- check correctly extended
			Result := m2 ~ m1.extended (create {PAIR [STRING, STRING]}.make ("6", "E"))
			check
				Result
			end
		end

	test_add: BOOLEAN
		local
			keys, values: ARRAY [STRING]
			index: INTEGER
		do
			comment ("test_add: test entry adding")

				-- build 'keys' and 'values'

				-- 'keys'
			create {ARRAY [STRING]} keys.make_empty
			keys.compare_objects
			across
				1 |..| 5 as i
			loop
				keys.force (i.item.out, keys.upper + 1)
			end

				-- 'values'
			create {ARRAY [STRING]} values.make_empty
			values.compare_objects
			values.force ("A", values.upper + 1)
			values.force ("B", values.upper + 1)
			values.force ("C", values.upper + 1)
			values.force ("D", values.upper + 1)

				-- check 'd' before
			index := 1
			across
				d as t_i_c
			loop
				Result := (t_i_c.item [1] ~ values [index]) and then (t_i_c.item [2] ~ keys [index])
				index := index + 1
			end

				-- add not existing pair
--			d.add_entry ("E", "5")
--			keys.force ("5", keys.upper + 1)
--			values.force ("E", values.upper + 1)

				-- check 'd' after
			index := 1
			across
				d as t_i_c
			loop
				Result := (t_i_c.item [1] ~ values [index]) and then (t_i_c.item [2] ~ keys [index])
				index := index + 1
			end

				-- put pair with existing key
--			d.add_entry("Z", "1")
--			values [values.lower] := "Z"

				-- check 'd' after
			index := 1
			across
				d as t_i_c
			loop
				Result := (t_i_c.item [1] ~ values [index]) and then (t_i_c.item [2] ~ keys [index])
				index := index + 1
			end
		end

	test_remove: BOOLEAN
		do
			comment ("test_remove: test entry removal")

				-- remove existing key
			d.remove_entry ("2")

				-- check 'count'
			Result := d.count = 3
			check
				Result
			end

				-- check valid key(s)
			Result := d.get_value ("1") ~ "A" and then d.get_value ("3") ~ "C" and then d.get_value ("4") ~ "D"
			check
				Result
			end

				-- check invalid key(s)
			Result := d.get_value ("0") ~ Void and then d.get_value ("5") ~ Void
			check
				Result
			end

				-- remove not existing key
--			d.remove_entry ("0")

				-- check 'count'
			Result := d.count = 3
			check
				Result
			end

				-- check valid key(s)
			Result := d.get_value ("1") ~ "A" and then d.get_value ("3") ~ "C" and then d.get_value ("4") ~ "D"
			check
				Result
			end

				-- check invalid key(s)
			Result := d.get_value ("0") ~ Void and then d.get_value ("5") ~ Void
			check
				Result
			end
		end

	test_get_keys: BOOLEAN
		local
			keys: ARRAY [STRING]
		do
			comment ("test_get_keys: test iterable keys")

				-- add new duplicate entry
			d.add_entry ("A", "5")

				-- create and fill 'keys'
			create {ARRAY [STRING]} keys.make_empty
			across
				d.get_keys ("A") as k
			loop
				keys.force (k.item, keys.count + 1)
			end

				-- check 'count'
			Result := keys.count = 2
			check
				Result
			end

				-- check element(s)
			Result := keys [1] ~ "1" and then keys [2] ~ "5"
			check
				Result
			end
		end

	test_iterable_dictionary: BOOLEAN
		local
			tuples: ARRAY [TUPLE [STRING, STRING]]
		do
			comment ("test_iterable_dictionary: test iterating through dictionary")

				-- iterate over 'd' using across loop: automatically calling cursor feature(s)
			create {ARRAY [TUPLE [STRING, STRING]]} tuples.make_empty
			across
				d as tuple
			loop
				tuples.force (tuple.item, tuples.count + 1)
			end

				-- check 'count'
			Result := tuples.count = 4
			check
				Result
			end

				-- check 'tuples [1]'
			Result := tuples [1].item (1) ~ "A" and then tuples [1].item (2) ~ "1"
			check
				Result
			end

				-- check 'tuples [2]'
			Result := tuples [2].item (1) ~ "B" and tuples [2].item (2) ~ "2"
			check
				Result
			end

				-- check 'tuples [3]'
			Result := tuples [3].item (1) ~ "C" and tuples [3].item (2) ~ "3"
			check
				Result
			end

				-- check 'tuples [4]'
			Result := tuples [4].item (1) ~ "D" and tuples [4].item (2) ~ "4"
			check
				Result
			end
		end

	test_iteration_cursor: BOOLEAN
		local
			tic: TUPLE_ITERATION_CURSOR [STRING, STRING]
			tuples: ARRAY [TUPLE [STRING, STRING]]
		do
			comment ("test_iteration_cursor: test the returned cursor from dictionary")

				-- get 'TUPLE_ITERATION_CURSOR'
			check attached {TUPLE_ITERATION_CURSOR [STRING, STRING]} d.new_cursor as nc then
				tic := nc
			end

				-- iterate over 'd' using from loop: manually calling cursor feature(s)
			create {ARRAY [TUPLE [STRING, STRING]]} tuples.make_empty
			from
			until
				tic.after
			loop
				tuples.force (tic.item, tuples.upper + 1)
				tic.forth
			end

				-- check 'count'
			Result := tuples.count = 4
			check
				Result
			end

				-- check 'tuples [1]'
			Result := tuples [1].item (1) ~ "A" and tuples [1].item (2) ~ "1"
			check
				Result
			end

				-- check 'tuples [2]'
			Result := tuples [2].item (1) ~ "B" and tuples [2].item (2) ~ "2"
			check
				Result
			end

				-- check 'tuples [3]'
			Result := tuples [3].item (1) ~ "C" and tuples [3].item (2) ~ "3"
			check
				Result
			end

				-- check 'tuples [4]'
			Result := tuples [4].item (1) ~ "D" and tuples [4].item (2) ~ "4"
			check
				Result
			end
		end

end
