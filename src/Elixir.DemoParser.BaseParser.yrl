Terminals integer '+' '-' '*' '/'.
Nonterminals expr arith.
Rootsymbol expr.

%% -------------------------------------
%% Operators
%% -------------------------------------

Left 300 '+'.
Left 300 '-'.
Left 400 '*'.
Left 400 '/'.

%% -------------------------------------
%% Rules
%% -------------------------------------

expr -> integer : '$1'.
expr -> arith : '$1'.

arith -> expr '+' expr : {symbol('$2'), position('$2'), ['$1', '$3']}.
arith -> expr '-' expr : {symbol('$2'), position('$2'), ['$1', '$3']}.
arith -> expr '*' expr : {symbol('$2'), position('$2'), ['$1', '$3']}.
arith -> expr '/' expr : {symbol('$2'), position('$2'), ['$1', '$3']}.

Erlang code.

symbol({Category, _Position}) -> Category;
symbol({_Category, _Position, Symbol}) -> Symbol.

position({_Category, Position}) -> Position;
position({_Category, Position, _Symbol}) -> Position.
