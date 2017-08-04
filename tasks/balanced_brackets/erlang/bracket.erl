-module(bracket).

-export([analyze/1]).

is_opening(Bracket) ->
    case Bracket of
        "[" -> true;
        "(" -> true;
        "{" -> true;
        _ -> false
    end.

is_opposite(Opening, Closing) ->
    case {Opening, Closing} of
        {"[", "]"} -> true;
        {"(", ")"} -> true;
        {"{", "}"} -> true;
        _ -> false
    end.

analyze([], []) -> balanced;
analyze([], L) when is_list(L) -> unbalanced;
analyze([Bracket|Rest], Acc) ->
    io:fwrite("~p~n", [{[Bracket], Rest, Acc}]),
    case is_opening([Bracket]) of
        true ->
            io:fwrite("opening~n"),
            analyze(Rest, [Bracket|Acc]);
        false ->
            io:fwrite("closing~n"),
            [Opening|_Acc] = Acc,
            case is_opposite([Opening], [Bracket]) of
                true -> analyze(Rest, _Acc);
                false -> unbalanced
            end
    end.

analyze(L) -> analyze(L, []).

