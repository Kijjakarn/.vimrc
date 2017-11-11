if exists("b:current_syntax")
    syntax clear
endif

runtime! syntax/c.vim
unlet b:current_syntax

syn keyword cppIdentifier      this
syn keyword cppKeyword         new delete friend using
syn keyword cppKeyword         inline virtual explicit export template
syn keyword cppAccess          public protected private
syn keyword cppType            bool wchar_t auto
syn keyword cppException       throw try catch
syn keyword cppOperator        operator typeid
syn keyword cppOperator        and bitor or xor compl bitand and_eq
syn keyword cppOperator        or_eq xor_eq not not_eq
syn keyword cppStorageClass    mutable constexpr override
syn keyword cppNumber          NPOS
syn keyword cppBoolean         true false
syn keyword cppStructure       namespace
syn keyword cppConstant        nullptr
syn keyword cppStructure       class typename

syn match cppTemplateOperator  "[=,*]"

syn match cppTemplate          "<\S.*\S>"     contains=ALL
syn match cppTemplate          "<\(\h\|\d\)>" contains=ALL
syn match cppTemplate          "<>"
syn match cppAngleBracket      "[<>]"     contained containedin=cppTemplate
syn match cppFunction          "\w\+\(<>\|<\(\h\|\d\)>\|<\S.*\S>\)\?\s*\ze("
    \ contains=cppTemplate
syn match cppOperator          "\s\+\zs<<\ze\s\+"
syn match cppOperator          "\s\+\zs>>\ze\s\+"
syn match cppOperator          "\s\+\zs<\(=\)\ze\s\+"
syn match cppOperator          "\s\+\zs>\(=\)\ze\s\+"
syn match cppDoubleColon       "::"

syn match cppClassScope        "\w\+\ze::\w\+" contains=cppDoubleColon

syn region cppParentheses matchgroup=cParenthesis
    \ contains=ALLBUT,cParenthesis,cppAngleBracket
    \ start="(" end=")"

syn match cppCast              "\<\w\+_cast\s*\ze<"

syn keyword cppSTLType numeric_limits allocator auto_ptr basic_filebuf
syn keyword cppSTLType basic_fstream basic_ifstream basic_iostream basic_istream
syn keyword cppSTLType basic_istringstream basic_ofstream basic_ostream
syn keyword cppSTLType basic_ostringstream basic_streambuf basic_string
syn keyword cppSTLType basic_stringbuf basic_stringstream binary_compose
syn keyword cppSTLType binder1st binder2nd bitset char_traits char_type
syn keyword cppSTLType const_mem_fun1_t const_mem_fun_ref1_t const_mem_fun_ref_t
syn keyword cppSTLType const_mem_fun_t const_pointer const_reference deque
syn keyword cppSTLType difference_type div_t double_t filebuf first_type
syn keyword cppSTLType float_denorm_style float_round_style float_t fstream
syn keyword cppSTLType gslice_array ifstream imaxdiv_t indirect_array int_type
syn keyword cppSTLType ios_base iostream istream istringstream istrstream
syn keyword cppSTLType iterator_traits key_compare key_type ldiv_t list lldiv_t
syn keyword cppSTLType map mapped_type mask_array mem_fun1_t mem_fun_ref1_t
syn keyword cppSTLType mem_fun_ref_t mem_fun_t multimap multiset nothrow_t
syn keyword cppSTLType off_type ofstream ostream ostringstream ostrstream pair
syn keyword cppSTLType pointer pointer_to_binary_function
syn keyword cppSTLType pointer_to_unary_function pos_type priority_queue queue
syn keyword cppSTLType reference second_type sequence_buffer set sig_atomic_t
syn keyword cppSTLType size_type slice_array stack stream streambuf string
syn keyword cppSTLType stringbuf stringstream strstream strstreambuf
syn keyword cppSTLType temporary_buffer test_type time_t tm traits_type
syn keyword cppSTLType type_info u16string u32string unary_compose unary_negate
syn keyword cppSTLType valarray value_compare value_type vector wfilebuf
syn keyword cppSTLType wfstream wifstream wiostream wistream wistringstream
syn keyword cppSTLType wofstream wostream wostringstream wstreambuf wstring
syn keyword cppSTLType wstringbuf wstringstream mbstate_t wctrans_t wctype_t
syn keyword cppSTLType wint_t nullptr_t max_align_t type_index

" Type traits
syn keyword cppSTLType is_void is_integral is_floating_point is_array
syn keyword cppSTLType is_enum is_union is_class is_function is_pointer
syn keyword cppSTLType is_lvalue_reference is_rvalue_reference
syn keyword cppSTLType is_member_object_pointer is_member_function_pointer
syn keyword cppSTLType is_fundamental is_arithmetic is_scalar is_object
syn keyword cppSTLType is_compound is_reference is_member_pointer is_const
syn keyword cppSTLType is_volatile is_trivial is_trivially_copyable
syn keyword cppSTLType is_standard_layout is_pod is_literal_type is_empty
syn keyword cppSTLType is_polymorphic is_abstract is_signed is_unsigned
syn keyword cppSTLType is_constructible is_trivially_constructible
syn keyword cppSTLType is_nothrow_constructible is_default_constructible
syn keyword cppSTLType is_trivially_default_constructible
syn keyword cppSTLType is_nothrow_default_constructible is_copy_constructible
syn keyword cppSTLType is_trivially_copy_constructible
syn keyword cppSTLType is_nothrow_copy_constructible is_move_constructible
syn keyword cppSTLType is_trivially_move_constructible
syn keyword cppSTLType is_nothrow_move_constructible is_assignable
syn keyword cppSTLType is_trivially_assignable is_nothrow_assignable
syn keyword cppSTLType is_copy_assignable is_trivially_copy_assignable
syn keyword cppSTLType is_nothrow_copy_assignable is_move_assignable
syn keyword cppSTLType is_trivially_move_assignable is_nothrow_move_assignable
syn keyword cppSTLType is_destructible is_trivially_destructible alignment_of
syn keyword cppSTLType rank extent is_same is_base_of is_convertible remove_cv
syn keyword cppSTLType remove_const remove_volatile add_cv add_const
syn keyword cppSTLType add_volatile remove_reference add_lvalue_reference
syn keyword cppSTLType add_rvalue_reference remove_pointer add_pointer
syn keyword cppSTLType make_signed make_unsigned remove_extent
syn keyword cppSTLType remove_all_extents aligned_storage aligned_union decay
syn keyword cppSTLType enable_if conditional common_type underlying_type
syn keyword cppSTLType result_of integral_constant true_type false_type ion
syn keyword cppSTLType piecewise_construct_t

" Memory
syn keyword cppSTLType unique_ptr shared_ptr weak_ptr owner_less
syn keyword cppSTLType enable_shared_from_this default_delete allocator_traits
syn keyword cppSTLType allocator_type allocator_arg_t uses_allocator
syn keyword cppSTLType scoped_allocator_adaptor pointer_safety pointer_traits

" Function object
syn keyword cppSTLType is_bind_expression is_placeholder reference_wrapper

" Date and time
syn keyword cppSTLType duration system_clock steady_clock
syn keyword cppSTLType high_resolution_clock time_point

" Tuple
syn keyword cppSTLType tuple_size tuple_element tuple

" Container
syn keyword cppSTLType array forward_list unordered_map unordered_set
syn keyword cppSTLType unordered_multimap unordered_multiset tuple

" Unordered
syn keyword cppSTLType hash hasher key_equal

" Random
syn keyword cppSTLType linear_congruential_engine mersenne_twister_engine
syn keyword cppSTLType subtract_with_carry_engine discard_block_engine
syn keyword cppSTLType independent_bits_engine shuffle_order_engine
syn keyword cppSTLType random_device default_random_engine minstd_rand0
syn keyword cppSTLType minstd_rand mt19937 mt19937_64 ranlux24_base
syn keyword cppSTLType ranlux48_base ranlux24 ranlux48 knuth_b
syn keyword cppSTLType uniform_int_distribution uniform_real_distribution
syn keyword cppSTLType bernoulli_distribution binomial_distribution
syn keyword cppSTLType negative_binomial_distribution geometric_distribution
syn keyword cppSTLType poisson_distribution exponential_distribution
syn keyword cppSTLType gamma_distribution weibull_distribution
syn keyword cppSTLType extreme_value_distribution normal_distribution
syn keyword cppSTLType lognormal_distribution chi_squared_distribution
syn keyword cppSTLType cauchy_distribution fisher_f_distribution
syn keyword cppSTLType student_t_distribution discrete_distribution
syn keyword cppSTLType piecewise_constant_distribution
syn keyword cppSTLType piecewise_linear_distribution seed_seq

" Locale
syn keyword cppSTLType wstring_convert wbuffer_convert codecvt_utf8
syn keyword cppSTLType codecvt_utf16 codecvt_utf8_utf16 codecvt_mode

" Regular expressions
syn keyword cppSTLType basic_regex sub_match match_results regex_traits
syn keyword cppSTLType regex_match regex_search regex_replace syntax_option_type
syn keyword cppSTLType match_flag_type error_type

" Atomic
syn keyword cppSTLType atomic atomic_flag atomic_bool atomic_char atomic_schar
syn keyword cppSTLType atomic_uchar atomic_short atomic_ushort atomic_int
syn keyword cppSTLType atomic_uint atomic_long atomic_ulong atomic_llong
syn keyword cppSTLType atomic_ullong atomic_char16_t atomic_char32_t
syn keyword cppSTLType atomic_wchar_t atomic_int_least8_t atomic_uint_least8_t
syn keyword cppSTLType atomic_int_least16_t atomic_uint_least16_t
syn keyword cppSTLType atomic_int_least32_t atomic_uint_least32_t
syn keyword cppSTLType atomic_int_least64_t atomic_uint_least64_t
syn keyword cppSTLType atomic_int_fast8_t atomic_uint_fast8_t
syn keyword cppSTLType atomic_int_fast16_t atomic_uint_fast16_t
syn keyword cppSTLType atomic_int_fast32_t atomic_uint_fast32_t
syn keyword cppSTLType atomic_int_fast64_t atomic_uint_fast64_t atomic_intptr_t
syn keyword cppSTLType atomic_uintptr_t atomic_size_t atomic_ptrdiff_t
syn keyword cppSTLType atomic_intmax_t atomic_uintmax_t memory_order

" Thread
syn keyword cppSTLType thread mutex timed_mutex recursive_mutex shared_mutex
syn keyword cppSTLType recursive_timed_mutex lock_guard unique_lock defer_lock_t
syn keyword cppSTLType shared_lock try_to_lock_t adopt_lock_t once_flag
syn keyword cppSTLType condition_variable condition_variable_any promise
syn keyword cppSTLType packaged_task future shared_future future_error

" Ratio
syn keyword cppSTLType ratio yocto zepto atto femto pico nano micro milli centi
syn keyword cppSTLType deci deca hecto kilo mega giga tera peta exa zetta yotta
syn keyword cppSTLType ratio_add ratio_subtract ratio_multiply ratio_divide
syn keyword cppSTLType ratio_equal ratio_not_equal ratio_less ratio_less_equal
syn keyword cppSTLType ratio_greater ratio_greater_equal

" Cinttypes
syn keyword cppSTLType nanoseconds microseconds milliseconds
syn keyword cppSTLType seconds minutes hours

" Dynamic array
syn keyword cppSTLType dynarray

" Iterator types
syn keyword cppSTLIterator back_insert_iterator
syn keyword cppSTLIterator bidirectional_iterator
syn keyword cppSTLIterator const_iterator
syn keyword cppSTLIterator const_reverse_iterator
syn keyword cppSTLIterator forward_iterator
syn keyword cppSTLIterator front_insert_iterator
syn keyword cppSTLIterator input_iterator
syn keyword cppSTLIterator insert_iterator
syn keyword cppSTLIterator istreambuf_iterator
syn keyword cppSTLIterator istream_iterator
syn keyword cppSTLIterator iterator
syn keyword cppSTLIterator ostream_iterator
syn keyword cppSTLIterator output_iterator
syn keyword cppSTLIterator random_access_iterator
syn keyword cppSTLIterator raw_storage_iterator
syn keyword cppSTLIterator reverse_bidirectional_iterator
syn keyword cppSTLIterator reverse_iterator
syn keyword cppSTLIterator move_iterator
syn keyword cppSTLIterator local_iterator
syn keyword cppSTLIterator const_local_iterator
syn keyword cppSTLIterator regex_iterator
syn keyword cppSTLIterator regex_token_iterator

syn keyword cppSTLIterator_tag bidirectional_iterator_tag
syn keyword cppSTLIterator_tag forward_iterator_tag
syn keyword cppSTLIterator_tag input_iterator_tag
syn keyword cppSTLIterator_tag output_iterator_tag
syn keyword cppSTLIterator_tag random_access_iterator_tag

hi link cppKeyword              Keyword
hi link cppCast                 Statement
hi link cppAccess               StorageClass
hi link cppSTLType              Type
hi link cppSTLIterator          Type
hi link cppType                 Type
hi link cppException            Exception
hi link cppOperator             Operator
hi link cppTemplateOperator     Operator
hi link cppStorageClass         StorageClass
hi link cppStructure            Structure
hi link cppNumber               Number
hi link cppBoolean              Boolean
hi link cppFunction             Function
hi link cppAngleBracket         Brace
hi link cppIdentifier           Identifier
hi link cppDoubleColon          Type
hi link cppClassScope           Type
hi link cppDoubleColon          Type

let b:current_syntax = "cpp"
