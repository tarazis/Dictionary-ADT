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
		do
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
			-- Your Task
		end

feature -- Constructor
	make
			-- Initialize an empty dictionary.
		do
			-- Your Task: add more code here
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
		ensure
			entries_added_to_model: True
				-- Your Task.
				-- Hint: Look at feature 'test_add' in class 'EXAMPLE_DICTIONARY_TESTS'.
		end

	remove_entry (k: K)
		require
			existing_key_in_model:
				-- Your Task.
		do
			-- Your Task.
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
		ensure
			correct_result: True
				-- Your Task
		end

	get_keys (v: V): ITERABLE[K]
			-- Keys that are associated with value 'v'.
		do
			-- Your Task.
		ensure
			correct_result: True
				-- Your Task: Every key in the result has the right corresponding value in model
		end

	get_value (k: K): detachable V
			-- Assocated value of 'k' if it exists.
			-- Void if 'k' does not exist.
		do
			-- Your task.
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
