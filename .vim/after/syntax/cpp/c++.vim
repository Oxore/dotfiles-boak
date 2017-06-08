runtime! after/syntax/c/gcc.vim
runtime! after/syntax/c/mysettings.vim

""array(C++11)
""deque
syn keyword cCppClassTemplate deque
syn keyword cCppFunctionTemplate swap
syn keyword cCppPublicMemberFunction assign at back begin cbegin cend clear crbegin crend emplace emplace_back emplace_front empty end erase front get_allocator insert max_size pop_back pop_front push_back push_front rbegin rend resize size swap
""forward_list(C++11)
""list
syn keyword cCppClassTemplate list
syn keyword cCppPublicMemberFunction assign back begin cbegin cend clear crbegin crend emplace emplace_back emplace_front empty end erase front get_allocator insert list max_size merge pop_back pop_front push_back push_front rbegin remove rend resize reverse size sort splice swap unique
syn keyword cCppPublicMemberFunctionTemplate remove_if
""map
syn keyword cCppClassTemplate map multimap
syn keyword cCppPublicMemberFunction begin cbegin cend clear count crbegin crend emplace emplace_hint empty end equal_range erase find get_allocator insert key_comp lower_bound max_size rbegin rend size swap upper_bound value_comp
""queue
syn keyword cCppClassTemplate priority_queue queue
syn keyword cCppPublicMemberFunction back empty front pop push size top
""set
syn keyword cCppClassTemplate multiset
syn match cCppClassTemplate "set\{1}[^(]"me=e-1,he=e-1
syn match cCppClassTemplate "set$"
syn keyword cCppPublicMemberFunction begin cbegin cend clear count crbegin crend emplace emplace_hint empty end equal_range erase find get_allocator insert key_comp lower_bound max_size rbegin rend size swap upper_bound value_comp
""stack
syn keyword cCppClassTemplate stack
syn keyword cCppPublicMemberFunction empty pop push size top
""unordered_map(C++11)
""unordered_set(C++11)
""vector
syn keyword cCppClassTemplate vector
syn keyword cCppFunctionTemplate swap
syn keyword cCppPublicMemberFunction assign at back begin capacity cbegin cend clear crbegin crend emplace emplace_back empty end erase front get_allocator insert max_size pop_back push_back rbegin rend reserve resize shrink_to_fit size swap
""fstream
syn keyword cCppClass filebuf fstream ifstream ofstream wfilebuf wfstream wifstream wofstream
syn keyword cCppClassTemplate basic_filebuf basic_fstream basic_ifstream basic_ofstream
syn keyword cCppProtectedVirtualMemberFunction imbue overflow pbackfail seekoff seekpos setbuf showmanyc sync uflow underflow
syn keyword cCppPublicMemberFunction close is_open open rdbuf showmanyc
""iomanip
syn keyword cCppFunction get_money get_time put_money put_time resetiosflags setbase setfill setiosflags setprecision setw
""ios
syn keyword cCppClass ios ios_base wios
syn keyword cCppClassTemplate basic_ios fpos
syn keyword cCppEnumClass io_errc
syn keyword cCppFunction boolalpha dec fixed hex internal iostream_category left noboolalpha noshowbase noshowpoint noshowpos noskipws nounitbuf nouppercase oct right scientific showbase showpoint showpos skipws unitbuf uppercase
syn keyword cCppProtectedMemberFunction init
syn keyword cCppPublicMemberClass Init failure
syn keyword cCppPublicMemberFunction bad clear copyfmt eof exceptions fail fill flags getloc good imbue iword narrow precision pword rdbuf rdstate register_callback setf setstate tie unsetf widen width
syn keyword cCppPublicMemberType event event_callback fmtflags iostate openmode seekdir
syn keyword cCppPublicStaticMemberFunction sync_with_stdio xalloc
syn keyword cCppType streamoff streampos streamsize wstreampos
""iosfwd
""iostream
syn keyword cCppObject cerr cin clog cout wcerr wcin wclog wcout
""istream
syn keyword cCppClass iostream istream wiostream wistream
syn keyword cCppClassTemplate basic_iostream basic_istream
syn keyword cCppFunction ws
syn keyword cCppPublicMemberClass sentry
syn keyword cCppPublicMemberFunction gcount get getline ignore peek putback read readsome seekg sync tellg unget
""ostream
syn keyword cCppClass basic_ostream ostream wostream
syn keyword cCppFunction endl ends flush
syn keyword cCppPublicMemberClass sentry
syn keyword cCppPublicMemberFunction flush put seekp tellp write
""sstream
syn keyword cCppClass istringstream ostringstream stringbuf stringstream wistringstream wostringstream wstringbuf wstringstream
syn keyword cCppClassTemplate basic_istringstream basic_ostringstream basic_stringbuf basic_stringstream
syn keyword cCppFunctionTemplate swap
syn keyword cCppProtectedVirtualMemberFunction overflow pbackfail seekoff seekpos setbuf underflow
syn keyword cCppPublicMemberFunction rdbuf str
""streambuf
syn keyword cCppClass streambuf wstreambuf
syn keyword cCppClassTemplate basic_streambuf
syn keyword cCppProtectedMemberFunction eback egptr epptr gbump gptr pbase pbump pptr setg setp
syn keyword cCppProtectedVirtualMemberFunction imbue overflow pbackfail seekoff seekpos setbuf showmanyc sync uflow underflow xsgetn xsputn
syn keyword cCppPublicMemberFunction getloc in_avail pubimbue pubseekoff pubseekpos pubsetbuf pubsync sbumpc sgetc sgetn snextc sputbackc sputc sputn sungetc xsputn
""atomic(C++11)
""condition_variable(C++11)
""future(C++11)
""mutex(C++11)
""thread(C++11)
""algorithm
syn keyword cCppFunctionTemplate adjacent_find all_of any_of binary_search copy copy_backward count count_if equal equal_range fill fill_n find find_end find_first_of find_if find_if_not for_each generate generate_n includes inplace_merge is_heap is_heap_until is_partitioned is_sorted is_sorted_until iter_swap lexicographical_compare lower_bound make_heap max max_element merge min min_element minmax minmax_element mismatch move move_backward next_permutation none_of nth_element partial_sort partial_sort_copy partition partition_point pop_heap prev_permutation push_heap random_shuffle remove remove_copy remove_copy_if remove_if replace replace_copy replace_copy_if replace_if reverse reverse_copy rotate rotate_copy search search_n set_difference set_intersection set_symmetric_difference set_union sort sort_heap stable_partition stable_sort swap swap_ranges transform unique unique_copy upper_bound
""bitset
syn keyword cCppClassTemplate bitset
syn keyword cCppFunction applicable
syn keyword cCppPublicMemberClass reference
"syn keyword cCppPublicMemberFunction any bitset count flip none reset set size test to_string to_ulong
syn keyword cCppPublicMemberFunction any bitset count flip none reset size test to_string to_ulong
syn match cCppPublicMemberFunction "\v(set\()"me=e-1,he=e-1
""chrono(C++11).
""codecvt(C++11)
""complex
syn keyword cCppClassTemplate complex
syn keyword cCppFunction complex
syn keyword cCppFunctionTemplate abs acos acosh arg asin asinh atan atanh conj cos cosh exp imag log log10 norm polar pow real sin sinh sqrt tan tanh
syn keyword cCppPublicMemberFunction complex imag real
""exception
syn keyword cCppClass bad_exception exception nested_exception
syn keyword cCppFunction current_exception get_terminate nested_ptr rethrow_exception rethrow_if_nested set_terminate set_unexpected terminate throw_with_nested uncaught_exception unexpected
syn keyword cCppFunctionTemplate make_exception_ptr
syn keyword cCppPublicMemberFunction rethrow_nested
syn keyword cCppType exception_ptr terminate_handler unexpected_handler
""functional
syn keyword cCppClassTemplate binary_function binary_negate binder1st binder2nd const_mem_fun1_ref_t const_mem_fun1_t const_mem_fun_ref_t const_mem_fun_t divides equal_to greater greater_equal less less_equal logical_and logical_not logical_or mem_fun1_ref_t mem_fun1_t mem_fun_ref_t mem_fun_t minus modulus multiplies negate not_equal_to plus pointer_to_binary_function pointer_to_unary_function unary_function unary_negate
syn keyword cCppFunctionTemplate bind1st bind2nd mem_fun mem_fun_ref not1 not2 ptr_fun
""initializer_list(C++11)
""iterator
syn keyword cCppClass bidirectional_iterator_tag forward_iterator_tag input_iterator_tag output_iterator_tag random_access_iterator_tag
syn keyword cCppClassTemplate back_insert_iterator front_insert_iterator insert_iterator istream_iterator istreambuf_iterator iterator iterator_traits move_iterator ostream_iterator ostreambuf_iterator reverse_iterator
syn keyword cCppFunctionTemplate advance back_inserter begin distance end front_inserter inserter make_move_iterator next prev
syn keyword cCppPublicMemberFunction base
""limits
syn keyword cCppClassTemplate numeric_limits
syn keyword cCppType float_denorm_style float_round_style
""locale
syn keyword cCppClass codecvt_base ctype_base locale money_base time_base
syn keyword cCppClassTemplate codecvt codecvt_byname collate collate_byname ctype ctype_byname messages messages_byname money_get money_put moneypunct moneypunct_byname num_get num_put numpunct numpunct_byname time_get time_get_byname time_put time_put_byname
syn keyword cCppFunctionTemplate has_facet use_facet
syn keyword cCppProtectedVirtualMemberFunction do_always_noconv do_close do_compare do_curr_symbol do_date_order do_decimal_point do_encoding do_falsename do_frac_digits do_get do_get_date do_get_monthname do_get_time do_get_weekday do_get_year do_grouping do_hash do_in do_is do_max_length do_narrow do_neg_format do_negative_sign do_open do_out do_pos_format do_positive_sign do_put do_scan_is do_scan_not do_thousands_sep do_tolower do_toupper do_transform do_truename do_unshift do_widen
syn keyword cCppPublicMemberClass facet id
syn keyword cCppPublicMemberFunction always_noconv close combine compare curr_symbol date_order decimal_point do_length encoding falsename frac_digits get get_date get_monthname get_time get_weekday get_year grouping hash in is length max_length name narrow neg_format negative_sign open out pos_format positive_sign put scan_is scan_not table thousands_sep tolower toupper transform truename unshift widen
syn keyword cCppPublicMemberType category
syn keyword cCppPublicStaticMemberFunction classic classic_table global
""memory
syn keyword cCppClassTemplate allocator allocator_traits auto_ptr auto_ptr_ref default_delete owner_less raw_storage_iterator shared_ptr weak_ptr
syn keyword cCppEnumClass pointer_safety
syn keyword cCppFunction declare_no_pointers declare_reachable get_pointer_safety undeclare_no_pointers
syn keyword cCppFunctionTemplate allocate_shared const_pointer_cast dynamic_pointer_cast get_deleter get_temporary_buffer make_shared return_temporary_buffer static_pointer_cast swap undeclare_reachable uninitialized_copy uninitialized_fill uninitialized_fill_n
syn keyword cCppPublicMemberFunction address allocate construct deallocate destroy expired get get_deleter lock max_size release reset shared_from_this shared_ptr swap unique use_count
syn keyword cCppPublicMemberFunctionTemplate owner_before
syn keyword cCppPublicStaticMemberFunction allocate construct deallocate destroy max_size pointer_to select_on_container_copy_construction
""new
syn keyword cCppClass bad_alloc
syn keyword cCppConstant nothrow
syn keyword cCppFunction set_new_handler
syn keyword cCppType new_handler nothrow_t
""numeric
syn keyword cCppFunctionTemplate accumulate adjacent_difference inner_product partial_sum
""random(C++11)
""ratio(C++11)
""regex(C++11)
""stdexcept
syn keyword cCppClass domain_error invalid_argument length_error logic_error out_of_range overflow_error range_error runtime_error underflow_error
""string
syn keyword cCppClass string wstring
syn keyword cCppClassTemplate basic_string char_traits
syn keyword cCppFunction getline swap to_string to_wstring
syn keyword cCppFunctionTemplate getline stod stof stoi stol stold stoll stoul stoull swap
syn keyword cCppPublicMemberFunction append assign at begin c_str capacity clear compare copy data empty end erase find find_first_not_of find_first_of find_last_not_of find_last_of get_allocator insert length max_size push_back rbegin rend replace reserve resize rfind size substr swap
syn keyword cCppPublicStaticMemberConstant npos
syn keyword cCppPublicStaticMemberFunction assign compare copy eof eq eq_int_type find length lt move not_eof to_char_type to_int_type
""system_error(C++11)
""tuple(C++11)
""typeindex(C++11)
""typeinfo
syn keyword cCppClass bad_cast bad_typeid type_info
syn keyword cCppPublicMemberFunction before name
""type_traits(C++11)
""utility
syn keyword cCppClassTemplate pair
syn keyword cCppConstant piecewise_construct
syn keyword cCppFunctionTemplate forward make_pair move swap
syn keyword cCppNamespace rel_ops
"syn keyword cCppPublicMemberFunction pair
""valarray
syn keyword cCppClass gslice slice
syn keyword cCppClassTemplate gslice_array indirect_array mask_array slice_array valarray
syn keyword cCppFunction valarray
syn keyword cCppFunctionTemplate abs acos asin atan atan2 cos cosh exp log log10 pow sin sinh sqrt tan tanh
syn keyword cCppPublicMemberFunction apply cshift max min resize shift size start stride sum

hi def link cCppClass cType
hi def link cCppClassTemplate cType
hi def link cCppPublicMemberClass cType
hi def link cCppPublicMemberType cType

hi def link cCppConstant Constant

hi def link cCppFunction Function
hi def link cCppFunctionTemplate Function
hi def link cCppPublicMemberFunction Function
hi def link cCppPublicMemberFunctionTemplate Function
hi def link cCppProtectedMemberFunction Function
hi def link cCppProtectedVirtualMemberFunction Function

hi def link cCppObject Keyword
