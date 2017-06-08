""array
syn keyword cCpp11ClassTemplate array
syn keyword cCpp11PublicMemberFunction at back begin cbegin cend crbegin crend data empty end fill front max_size rbegin rend size swap
""deque
syn keyword cCpp11PublicMemberFunction cbegin cend crbegin crend emplace emplace_back emplace_front shrink_to_fit
""forward_list
syn keyword cCpp11ClassTemplate forward_list
syn keyword cCpp11PublicMemberFunction assign before_begin begin cbefore_begin cbegin cend clear emplace_after emplace_front empty end erase_after forward_list front get_allocator insert_after max_size merge pop_front push_front remove resize reverse sort splice_after swap unique
syn keyword cCpp11PublicMemberFunctionTemplate remove_if
""list
syn keyword cCpp11PublicMemberFunction cbegin cend crbegin crend emplace emplace_back emplace_front
""map
syn keyword cCpp11PublicMemberFunction at cbegin cend crbegin crend emplace emplace_hint
""queue
syn keyword cCpp11PublicMemberFunction emplace swap
""set
syn keyword cCpp11PublicMemberFunction cbegin cend crbegin crend emplace emplace_hint
""stack
syn keyword cCpp11PublicMemberFunction emplace swap
""unordered_map
syn keyword cCpp11ClassTemplate unordered_map unordered_multimap
syn keyword cCpp11PublicMemberFunction at begin bucket bucket_count cbegin cend clear count emplace emplace_hint empty end equal_range erase find get_allocator insert load_factor max_bucket_count max_load_factor max_size rehash reserve size swap
syn keyword cCpp11PublicMemberType begin bucket_size end hash_function key_eq
""unordered_set
syn keyword cCpp11ClassTemplate unordered_multiset unordered_set
syn keyword cCpp11PublicMemberFunction bucket bucket_count cbegin cend clear count emplace emplace_hint empty equal_range erase find get_allocator insert load_factor max_bucket_count max_load_factor max_size rehash reserve size swap
syn keyword cCpp11PublicMemberType begin bucket_size cbegin cend end hash_function key_eq
""vector
syn keyword cCpp11PublicMemberFunction cbegin cend crbegin crend data emplace emplace_back shrink_to_fit
""fstream
syn keyword cCpp11Function swap
syn keyword cCpp11FunctionTemplate swap
syn keyword cCpp11PublicMemberFunction swap
""iomanip
syn keyword cCpp11Function get_money get_time put_money put_time
""ios
syn keyword cCpp11Function iostream_category
syn keyword cCpp11ProtectedMemberFunction move set_rdbuf swap
""iosfwd
""iostream
""istream
syn keyword cCpp11ProtectedMemberFunction swap
""ostream
syn keyword cCpp11ProtectedMemberFunction swap
""sstream
syn keyword cCpp11PublicMemberFunction swap
""streambuf
syn keyword cCpp11PublicMemberFunction swap
""atomic
syn keyword cCpp11Class atomic_flag
syn keyword cCpp11ClassTemplate atomic
syn keyword cCpp11Enum memory_order
syn keyword cCpp11Function atomic_compare_exchange_strong atomic_compare_exchange_strong_explicit atomic_compare_exchange_weak atomic_compare_exchange_weak_explicit atomic_exchange atomic_exchange_explicit atomic_fetch_add atomic_fetch_add_explicit atomic_fetch_and atomic_fetch_and_explicit atomic_fetch_or atomic_fetch_or_explicit atomic_fetch_sub atomic_fetch_sub_explicit atomic_fetch_xor atomic_fetch_xor_explicit atomic_flag_clear atomic_flag_clear_explicit atomic_flag_test_and_set atomic_flag_test_and_set_explicit atomic_init atomic_is_lock_free atomic_load atomic_load_explicit atomic_signal_fence atomic_store atomic_store_explicit atomic_thread_fence kill_dependency
syn keyword cCpp11Macro ATOMIC_FLAG_INIT ATOMIC_VAR_INIT
syn keyword cCpp11PublicMemberFunction atomic atomic_flag clear compare_exchange_strong compare_exchange_weak exchange fetch_add fetch_and fetch_or fetch_sub fetch_xor is_lock_free load store test_and_set
""condition_variable
syn keyword cCpp11Class condition_variable condition_variable_any
syn keyword cCpp11EnumClass cv_status
syn keyword cCpp11Function notify_all_at_thread_exit
syn keyword cCpp11PublicMemberFunction notify_all notify_one wait wait_for wait_until
""future
syn keyword cCpp11Class future_error
syn keyword cCpp11ClassTemplate future packaged_task promise shared_future
syn keyword cCpp11EnumClass future_errc future_status launch
syn keyword cCpp11Function future_category
syn keyword cCpp11FunctionTemplate async
syn keyword cCpp11PublicMemberFunction code future_error get get_future make_ready_at_thread_exit packaged_task promise reset set_exception set_exception_at_thread_exit set_value set_value_at_thread_exit share swap valid wait wait_for wait_until what
""mutex
syn keyword cCpp11Class adopt_lock_t defer_lock_t mutex once_flag recursive_mutex recursive_timed_mutex timed_mutex try_to_lock_t
syn keyword cCpp11ClassTemplate lock_guard unique_lock
syn keyword cCpp11FunctionTemplate lock try_lock
syn keyword cCpp11Object adopt_lock defer_lock try_to_lock
syn keyword cCpp11PublicMemberFunction call_once lock mutex native_handle owns_lock release swap try_lock try_lock_for try_lock_until unlock
""thread
syn keyword cCpp11Class thread
syn keyword cCpp11Function get_id sleep_for sleep_until yield
syn keyword cCpp11Namespace this_thread
syn keyword cCpp11PublicMemberFunction detach get_id join joinable native_handle swap thread
syn keyword cCpp11PublicMemberType id native_handle_type
syn keyword cCpp11PublicStaticMemberFunction hardware_concurrency
""algorithm
syn keyword cCpp11FunctionTemplate all_of any_of copy_if copy_n find_if_not is_heap is_heap_until is_partitioned is_permutation is_sorted is_sorted_until minmax minmax_element move move_backward none_of partition_copy partition_point shuffle
""bitset
syn keyword cCpp11PublicMemberFunction all to_ullong
""chrono
syn keyword cCpp11Class high_resolution_clock hours microseconds milliseconds minutes nanoseconds seconds steady_clock system_clock
syn keyword cCpp11ClassTemplate duration duration_values time_point treat_as_floating_point
syn keyword cCpp11FunctionTemplate duration_cast time_point_cast
syn keyword cCpp11PublicMemberFunction count duration time_point time_since_epoch
syn keyword cCpp11PublicStaticMemberFunction from_time_t max min now to_time_t zero
""codecvt
syn keyword cCpp11ClassTemplate codecvt_utf16 codecvt_utf8 codecvt_utf8_utf16
syn keyword cCpp11Enum codecvt_mode
""complex
syn keyword cCpp11FunctionTemplate acos acosh asin asinh atan atanh proj
""exception
syn keyword cCpp11Class nested_exception
syn keyword cCpp11Function current_exception get_terminate get_unexpected rethrow_exception rethrow_if_nested throw_with_nested
syn keyword cCpp11FunctionTemplate make_exception_ptr
syn keyword cCpp11Type exception_ptr
""functional
syn keyword cCpp11Class bad_function_call
syn keyword cCpp11ClassTemplate bit_and bit_or bit_xor function hash is_bind_expression is_placeholder reference_wrapper
syn keyword cCpp11FunctionTemplate bind cref mem_fn ref
syn keyword cCpp11Namespace placeholders
""initializer_list
syn keyword cCpp11ClassTemplate initializer_list
syn keyword cCpp11PublicMemberFunction begin end size
""iterator
syn keyword cCpp11ClassTemplate move_iterator
syn keyword cCpp11FunctionTemplate begin end make_move_iterator next prev
""limits
""locale
syn keyword cCpp11ProtectedVirtualMemberFunction do_get
syn keyword cCpp11PublicMemberFunction get
""memory
syn keyword cCpp11Class allocator_arg_t
syn keyword cCpp11ClassTemplate allocator_traits default_delete enable_shared_from_this owner_less pointer_traits shared_ptr unique_ptr weak_ptr
syn keyword cCpp11EnumClass pointer_safety
syn keyword cCpp11Function align declare_no_pointers declare_reachable get_pointer_safety undeclare_no_pointers
syn keyword cCpp11FunctionTemplate addressof allocate_shared const_pointer_cast dynamic_pointer_cast get_deleter make_shared static_pointer_cast undeclare_reachable uninitialized_copy_n
syn keyword cCpp11Object allocator_arg
""new
syn keyword cCpp11Class bad_array_new_length
syn keyword cCpp11Function get_new_handler
""numeric
syn keyword cCpp11FunctionTemplate iota
""random
syn keyword cCpp11Class bernoulli_distribution default_random_engine knuth_b minstd_rand minstd_rand0 mt19937 mt19937_64 random_device ranlux24 ranlux24_base ranlux48 ranlux48_base seed_seq
syn keyword cCpp11ClassTemplate binomial_distribution cauchy_distribution chi_squared_distribution discard_block_engine discrete_distribution exponential_distribution extreme_value_distribution fisher_f_distribution gamma_distribution geometric_distribution independent_bits_engine linear_congruential_engine lognormal_distribution mersenne_twister_engine negative_binomial_distribution normal_distribution piecewise_constant_distribution piecewise_linear_distribution poisson_distribution shuffle_order_engine student_t_distribution subtract_with_carry_engine uniform_int_distribution uniform_real_distribution weibull_distribution
syn keyword cCpp11FunctionTemplate generate_canonical
" remove one characters from: syn keyword cCpp11PublicMemberFunction a alpha b base beta densities discard entropy generate intervals k lambda m max mean min n p param probabilities reset s seed size stddev t
syn keyword cCpp11PublicMemberFunction alpha base beta densities discard entropy generate intervals lambda max mean min param probabilities reset seed size stddev
syn keyword cCpp11PublicStaticMemberFunction max min
""ratio
syn keyword cCpp11ClassTemplate ratio ratio_add ratio_divide ratio_equal ratio_greater ratio_greater_equal ratio_less ratio_less_equal ratio_multiply ratio_not_equal ratio_subtract
""regex
syn keyword cCpp11Class cmatch csub_match regex regex_error smatch ssub_match wcmatch wcsub_match wregex wsmatch wssub_match
syn keyword cCpp11ClassTemplate basic_regex match_results regex_iterator regex_token_iterator regex_traits sub_match
syn keyword cCpp11FunctionTemplate regex_match regex_replace regex_search
syn keyword cCpp11Namespace regex_constants
syn keyword cCpp11PublicMemberFunction assign begin cbegin cend compare empty end flags format get_allocator getloc imbue isctype length lookup_classname lookup_collatename mark_count max_size position prefix size str suffix swap transform transform_primary translate translate_nocase value
syn keyword cCpp11SyntaxSpecifications ECMAScript
""stdexcept
""string
syn keyword cCpp11Class u16string u32string
syn keyword cCpp11Function to_string to_wstring
syn keyword cCpp11FunctionTemplate stod stof stoi stol stold stoll stoul stoull
syn keyword cCpp11PublicMemberFunction back cbegin cend crbegin crend front pop_back shrink_to_fit
""system_error
syn keyword cCpp11AbstractClass error_category
syn keyword cCpp11Class error_code error_condition is_error_code_enum is_error_condition_enum system_error
syn keyword cCpp11EnumClass errc
syn keyword cCpp11Function generic_category make_error_code make_error_condition system_category
syn keyword cCpp11PublicMemberFunction assign category clear code default_error_condition error_code error_condition message system_error value what
syn keyword cCpp11PublicPureVirtualMemberFunction message name
syn keyword cCpp11PublicVirtualMemberFunction default_error_condition equivalent
""tuple
syn keyword cCpp11ClassTemplate tuple tuple_element tuple_size
syn keyword cCpp11FunctionTemplate forward_as_tuple get make_tuple tie tuple_cat
syn keyword cCpp11Object ignore
syn keyword cCpp11PublicMemberFunction swap tuple
""typeindex
syn keyword cCpp11Class type_index
syn keyword cCpp11PublicMemberFunction hash_code name
""typeinfo
syn keyword cCpp11PublicMemberFunction hash_code
""type_traits
syn keyword cCpp11Class false_type true_type
syn keyword cCpp11ClassTemplate  add_const add_cv add_lvalue_reference add_pointer add_rvalue_reference add_volatile aligned_storage aligned_union alignment_of common_type conditional decay enable_if extent has_virtual_destructor integral_constant is_abstract is_arithmetic is_array is_assignable is_base_of is_class is_compound is_const is_constructible is_convertible is_copy_assignable is_copy_constructible is_default_constructible is_destructible is_empty is_enum is_floating_point is_function is_fundamental is_integral is_literal_type is_lvalue_reference is_member_function_pointer is_member_object_pointer is_member_pointer is_move_assignable is_move_constructible is_nothrow_assignable is_nothrow_constructible is_nothrow_copy_assignable is_nothrow_copy_constructible is_nothrow_default_constructible is_nothrow_destructible is_nothrow_move_assignable is_nothrow_move_constructible is_object is_pod is_pointer is_polymorphic is_reference is_rvalue_reference is_same is_scalar is_signed is_standard_layout is_trivial is_trivially_assignable is_trivially_constructible is_trivially_copy_assignable is_trivially_copy_constructible is_trivially_copyable is_trivially_default_constructible is_trivially_destructible is_trivially_move_assignable is_trivially_move_constructible is_union is_void is_volatile make_signed make_unsigned rank remove_all_extents remove_const remove_cv remove_extent remove_pointer remove_reference remove_volatile result_of underlying_type
""utility
syn keyword cCpp11Constant piecewise_construct
syn keyword cCpp11FunctionTemplate declval forward move move_if_noexcept
syn keyword cCpp11PublicMemberFunction swap
syn keyword cCpp11Type piecewise_construct_t
""valarray
syn keyword cCpp11FunctionTemplate begin end swap
syn keyword cCpp11PublicMemberFunction swap

""cassert
""cctype
syn keyword cCpp11Function isblank
""cerrno
""cfloat
""ciso646
""climits
""clocale
""cmath
syn keyword cCpp11Constant HUGE_VALL INFINITY
syn keyword cCpp11Function acosh asinh atanh cbrt copysign erf erfc exp2 expm1 fdim fma fmax fmin hypot ilogb lgamma llrint llround log1p log2 logb lrint lround nan nearbyint nextafter nexttoward remainder remquo rint round scalbln scalbn tgamma trunc
syn keyword cCpp11Macro isfinite isgreater isgreaterequal isless islessequal islessgreater isunordered math_errhandling
syn keyword cCpp11MacroFunction fpclassify isinf isnan isnormal signbit
syn keyword cCpp11Type double_t
""csetjmp
""csignal
""cstdarg
syn keyword cCpp11Macro va_copy
""cstddef
syn keyword cCpp11Type max_align_t nullptr_t
""cstdio
syn keyword cCpp11Function snprintf vfscanf vscanf vsnprintf vsscanf
""cstdlib
syn keyword cCpp11Function _Exit at_quick_exit atoll llabs lldiv quick_exit strtof strtold strtoll strtoull
syn keyword cCpp11Type lldiv_t
""cstring
""ctime
""cwchar
syn keyword cCpp11Function vfwscanf vswprintf vswscanf vwscanf wcstof wcstold wcstoll wcstoull
""cwctype
syn keyword cCpp11Function iswblank
""cfenv
syn keyword cCpp11Function feclearexcept fegetenv fegetexceptflag fegetround feholdexcept feraiseexcept fesetenv fesetexceptflag fesetround feupdateenv
syn keyword cCpp11Macro FE_ALL_EXCEPT FE_DFL_ENV FE_DIVBYZERO FE_DOWNWARD FE_INEXACT FE_INVALID FE_OVERFLOW FE_TONEAREST FE_TOWARDZERO FE_UNDERFLOW FE_UPWARD
syn keyword cCpp11Pragma FENV_ACCESS
syn keyword cCpp11Type fenv_t fexcept_t
""cinttypes
""cstdbool
""cstdint
""ctgmath
""cuchar
syn keyword cCpp11Function c16rtomb c32rtomb mbrtoc16 mbrtoc32

hi def link cCpp11Macro Macro

hi def link cCpp11EnumClass cType
hi def link cCpp11Type cType
hi def link cCpp11Class cType
hi def link cCpp11ClassTemplate cType
hi def link cCpp11PublicMemberClass cType
hi def link cCpp11PublicMemberType cType

hi def link cCpp11Constant Constant

hi def link cCpp11Function Function
hi def link cCpp11FunctionTemplate Function
hi def link cCpp11MacroFunction Function
hi def link cCpp11PublicMemberFunction Function
hi def link cCpp11PublicMemberFunctionTemplate Function
hi def link cCpp11ProtectedMemberFunction Function
hi def link cCpp11ProtectedVirtualMemberFunction Function
hi def link cCpp11PublicPureVirtualMemberFunction Function
hi def link cCpp11PublicVirtualMemberFunction Function
hi def link cCpp11PublicStaticMemberFunction Function

hi def link cCpp11Object Keyword
