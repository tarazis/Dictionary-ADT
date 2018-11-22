note
	description: "A Dictionary ADT mapping from keys to values"
	author: "Jackie and You"
	date: "$Date$"
	revision: "$Revision$"

class
	-- Constrained genericity because V and K will be used
	-- in the math model class FUN, which require both to be always
	-- attached for void safety.
	DICTIONARY[V -> attached ANY, K -> attached ANY]
inherit
	ITERABLE[TUPLE[V, K]]

create
	make
feature -- Do not modify this export status!
	values: LINKED_LIST[V]
	keys: ARRAY[K]

feature -- Abstraction function
	model: FUN[K, V] -- Do not modify the type of this query.
			-- Abstract the dictionary ADT as a mathematical function.
		local
--			pair: PAIR[K, V]
		do
			create Result.make_empty
			across
				keys.lower |..| keys.upper as c1
			loop
				Result.extend (create {PAIR[K, V]}.make (keys[c1.item].deep_twin, values[c1.item].deep_twin))

			end
			-- Your Task
		ensure
			consistent_model_imp_counts: True
				-- Your Task: sizes of model and implementations the same
			consistent_model_imp_contents: True
				-- Your Task: applying the model function on each key gives back the corresponding value
		end

feature -- feature required by ITERABLE
	new_cursor: TUPLE_ITERATION_CURSOR[V, K] -- Do not change this return type.
		do
			create Result.make (values, keys)
			-- Your Task
		end

feature -- Constructor
	make
			-- Initialize an empty dictionary.
		do
			-- Your Task: add more code here
			create {LINKED_LIST[V]} values.make
			create {ARRAY[K]} keys.make_empty
			values.compare_objects
			keys.compare_objects


		ensure
			empty_model: True
				-- Your Task.
			object_equality_for_keys:
				-- Do not modify this.
				keys.object_comparison
			object_equality_for_values:
				-- Do not modify this.
				values.object_comparison
		end

feature -- Commands

	add_entry (v: V; k: K)
		require
			non_existing_key_in_model: True
				-- Your Task.
		do
			-- Your Task.
			keys.force (k, keys.upper + 1)
			values.force (v)
		ensure
			entry_added_to_model: True
				-- Your Task.
				-- Hint: Look at feature 'test_add' in class 'EXAMPLE_DICTIONARY_TESTS'.
		end

	add_entries (entries: SET[TUPLE[k: K; v: V]])
		require
			non_existing_keys_in_model: True
				-- Your Task.
		do
			-- Your Task.
		across
			entries as entry_tuple
		loop
			if attached {K} entry_tuple.item.at(1) as k_ and attached {V} entry_tuple.item.at(2) as v_ then


			keys.force (k_, keys.upper + 1)
			values.force (v_)
			end

		end
		ensure
			entries_added_to_model: True
				-- Your Task.
				-- Hint: Look at feature 'test_add' in class 'EXAMPLE_DICTIONARY_TESTS'.
		end

	remove_entry (k: K)
		require
			existing_key_in_model:
				-- Your Task.
		local
			new_keys: ARRAY[K]
			new_values: LINKED_LIST[V]
			i: INTEGER
		do
			-- Your Task.
			create new_keys.make_empty
			create new_values.make
			i:= 1

			across
				keys.lower |..| keys.upper as key_index
			loop
				if keys[key_index.item] /~ k then
					new_values.force (values[key_index.item].deep_twin)
					new_keys.force (keys[key_index.item].deep_twin, new_keys.upper + 1)

				end

			end

			keys:= new_keys
			values:= new_values
		ensure
			entry_removed_from_model: True
				-- Your Task.
				-- Hint: Look at feature 'test_remove' in class 'EXAMPLE_DICTIONARY_TESTS'.
		end

	remove_entries(ks: SET[K])
		require
			existing_keys_in_model:
				-- Your Task.
		do
			-- Your Task.

			across
				ks as set_element
			loop
				Current.remove_entry (set_element.item)

			end

		ensure
			entries_removed_from_model:
				-- Your Task.
				-- Hint: Look at feature 'test_add' in class 'EXAMPLE_DICTIONARY_TESTS'.
		end

feature -- Queries

	count: INTEGER
			-- Number of keys in dictionary.
		do
			-- Your Task
			Result:= keys.count
		ensure
			correct_result: True
				-- Your Task
		end

	get_keys (v: V): ITERABLE[K]
			-- Keys that are associated with value 'v'.
		local
			ks: ARRAY[K]
--			counter: INTEGER
		do
			-- Your Task.
			create {ARRAY[K]} ks.make_empty

			across
				1 |..| keys.upper as c1
			loop
				if values[c1.item] ~ v then
					ks.force (keys[c1.item], ks.upper + 1)
				end

			end
			Result:= ks
		ensure
			correct_result: True
				-- Your Task: Every key in the result has the right corresponding value in model
		end

	get_value (k: K): detachable V
			-- Assocated value of 'k' if it exists.
			-- Void if 'k' does not exist.
		do
			-- Your task.
			across
				keys.lower |..| keys.upper as key_index
			loop
				if keys[key_index.item] ~ k then
					Result:= values[key_index.item]

				end

			end
		ensure
			case_of_void_result: True
				-- Your Task: void result means the key does not exist in model
			case_of_non_void_result: True
				-- Your Task: void result means the key exists in model
		end
invariant
	-- Do not modify these two invariants.
	consistent_keys_values_counts:
		keys.count = values.count
	consistent_imp_adt_counts:
		keys.count = count
end
