
## Run example
?- use(X).
false.

?- move(X).
X = elevator2.

## Listing facts and rules
?- listing(elevator).
elevator(elevator1).
elevator(elevator2).

true.

## Listing all
?- listing().

move(Elevator) :-
    elevator(Elevator),
    floor(Elevator, Position),
    Position>=0,
    \+ ( floor(_, OtherPosition),
         OtherPosition>=0,
         OtherPosition<Position
       ).

use(Elevator) :-
    floor(Elevator, 0).

:- thread_local thread_message_hook/3.
:- dynamic thread_message_hook/3.
:- volatile thread_message_hook/3.


:- dynamic prolog_file_type/2.
:- multifile prolog_file_type/2.

prolog_file_type(pl, prolog).
prolog_file_type(prolog, prolog).
prolog_file_type(qlf, prolog).
prolog_file_type(qlf, qlf).
prolog_file_type(A, executable) :-
    system:current_prolog_flag(shared_object_extension, A).
prolog_file_type(dylib, executable) :-
    system:current_prolog_flag(apple, true).

:- multifile prolog_list_goal/1.


:- dynamic message_hook/3.
:- multifile message_hook/3.


:- dynamic prolog_exception_hook/4.
:- multifile prolog_exception_hook/4.

prolog_exception_hook(error(E, context(Ctx0, Msg)), error(E, context(prolog_stack(Stack), Msg)), Fr, GuardSpec) :-
    prolog_stack:
    (   current_prolog_flag(backtrace, true),
        \+ is_stack(Ctx0, _Frames),
        (   atom(GuardSpec)
        ->  debug(backtrace,
                  'Got uncaught (guard = ~q) exception ~p (Ctx0=~p)',
                  [GuardSpec, E, Ctx0]),
            stack_guard(GuardSpec),
            Guard=GuardSpec
        ;   prolog_frame_attribute(GuardSpec,
                                   predicate_indicator,
                                   Guard),
            debug(backtrace,
                  'Got exception ~p (Ctx0=~p, Catcher=~p)',
                  [E, Ctx0, Guard]),
            stack_guard(Guard)
        ),
        (   current_prolog_flag(backtrace_depth, Depth)
        ->  Depth>0
        ;   Depth=20
        ),
        get_prolog_backtrace(Depth,
                             Stack0,
                             [frame(Fr), guard(Guard)]),
        debug(backtrace, 'Stack = ~p', [Stack0]),
        clean_stack(Stack0, Stack1),
        join_stacks(Ctx0, Stack1, Stack)
    ).

:- dynamic prolog_load_file/2.
:- multifile prolog_load_file/2.


:- dynamic expand_query/4.
:- multifile expand_query/4.


floor(elevator1, 4).
floor(elevator2, 2).

:- dynamic file_search_path/2.
:- multifile file_search_path/2.

file_search_path(library, Dir) :-
    library_directory(Dir).
file_search_path(swi, A) :-
    system:current_prolog_flag(home, A).
file_search_path(swi, A) :-
    system:current_prolog_flag(shared_home, A).
file_search_path(library, app_config(lib)).
file_search_path(library, swi(library)).
file_search_path(library, swi(library/clp)).
file_search_path(foreign, swi(A)) :-
    system:
    (   current_prolog_flag(apple_universal_binary, true),
        A='lib/fat-darwin'
    ).
file_search_path(foreign, swi(A)) :-
    system:
    (   \+ current_prolog_flag(windows, true),
        current_prolog_flag(arch, B),
        atom_concat('lib/', B, A)
    ).
file_search_path(foreign, swi(A)) :-
    system:
    (   (   current_prolog_flag(windows, true)
        ->  A=bin
        ;   A=lib
        )
    ).
file_search_path(path, A) :-
    system:
    (   getenv('PATH', B),
        (   current_prolog_flag(windows, true)
        ->  atomic_list_concat(C, ;, B)
        ;   atomic_list_concat(C, :, B)
        ),
        '$member'(A, C)
    ).
file_search_path(user_app_data, A) :-
    system:'$xdg_prolog_directory'(data, A).
file_search_path(common_app_data, A) :-
    system:'$xdg_prolog_directory'(common_data, A).
file_search_path(user_app_config, A) :-
    system:'$xdg_prolog_directory'(config, A).
file_search_path(common_app_config, A) :-
    system:'$xdg_prolog_directory'(common_config, A).
file_search_path(app_data, user_app_data('.')).
file_search_path(app_data, common_app_data('.')).
file_search_path(app_config, user_app_config('.')).
file_search_path(app_config, common_app_config('.')).
file_search_path(app_preferences, user_app_config('.')).
file_search_path(user_profile, app_preferences('.')).
file_search_path(autoload, swi(library)).
file_search_path(autoload, pce(prolog/lib)).
file_search_path(autoload, app_config(lib)).
file_search_path(pack, app_data(pack)).
file_search_path(library, PackLib) :-
    '$pack':pack_dir(_Name, prolog, PackLib).
file_search_path(foreign, PackLib) :-
    '$pack':pack_dir(_Name, foreign, PackLib).

:- dynamic resource/2.
:- multifile resource/2.


:- dynamic expand_answer/2.
:- multifile expand_answer/2.


:- dynamic resource/3.
:- multifile resource/3.


:- dynamic exception/3.
:- multifile exception/3.


:- dynamic portray/1.
:- multifile portray/1.


:- dynamic goal_expansion/4.
:- multifile goal_expansion/4.


:- multifile prolog_predicate_name/2.


:- multifile prolog_clause_name/2.


:- dynamic term_expansion/4.
:- multifile term_expansion/4.


:- dynamic term_expansion/2.
:- multifile term_expansion/2.


:- dynamic library_directory/1.
:- multifile library_directory/1.


elevator(elevator1).
elevator(elevator2).

:- multifile message_property/2.


:- dynamic goal_expansion/2.
:- multifile goal_expansion/2.

true.
