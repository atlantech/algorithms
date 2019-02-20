-module(binary_search).
-export([search/2, at/2]).

at(_, []) -> {result, null};
at(Pos, List) when Pos >= erlang:length(List) -> {result, null};
at(Pos, List) ->
    at(Pos, List, 0).
at(Pos, [H|_], Acc) when Pos =:= Acc -> {result, H};
at(Pos, [_|T], Acc) -> at(Pos, T, Acc + 1).

search([], _) -> {result, null};
search(List, Find) ->
    search(List, Find, 0, erlang:length(List)).
search(List, Find, Min, Max) ->
    Index = erlang:list_to_integer(erlang:float_to_list(Min + (Max - Min) / 2, [{decimals, 0}])),
    {result, Value} = binary_search:at(Index, List),
    if  
        Value > Find -> search(List, Find, Min, Index - 1);
        Value < Find -> search(List, Find, Index + 1, Max);
        true -> {result, Index}
    end.
