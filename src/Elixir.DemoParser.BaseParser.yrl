Terminals integer '+' '-' '*' '/'.
Nonterminals expr unary arith.
Rootsymbol expr.

%% -------------------------------------
%% Operators
%% -------------------------------------

Left 300 '+'.
Left 300 '-'.
Left 400 '*'.
Left 400 '/'.
Unary 500 unary.

%% -------------------------------------
%% Rules
%% -------------------------------------

expr -> integer : '$1'.
expr -> arith : '$1'.
expr -> unary : '$1'.

unary -> '-' expr : {symbol('$1'), position('$1'), ['$2']}.
unary -> '+' expr : {symbol('$1'), position('$1'), ['$2']}.

arith -> expr '+' expr : {symbol('$2'), position('$2'), ['$1', '$3']}.
arith -> expr '-' expr : {symbol('$2'), position('$2'), ['$1', '$3']}.
arith -> expr '*' expr : {symbol('$2'), position('$2'), ['$1', '$3']}.
arith -> expr '/' expr : {symbol('$2'), position('$2'), ['$1', '$3']}.

Erlang code.

symbol({Category, _Position}) -> Category;
symbol({_Category, _Position, Symbol}) -> Symbol.

position({_Category, Position}) -> Position;
position({_Category, Position, _Symbol}) -> Position.
