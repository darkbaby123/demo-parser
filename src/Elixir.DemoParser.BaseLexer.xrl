Definitions.

INTEGER = [0-9]+
WHITESPACE = [\s\t\n\r]

Rules.

{INTEGER}     : {token, {integer, TokenLoc, to_integer(TokenChars)}}.
\+            : {token, {'+', TokenLoc}}.
\-            : {token, {'-', TokenLoc}}.
\*            : {token, {'*', TokenLoc}}.
\/            : {token, {'/', TokenLoc}}.
{WHITESPACE}+ : skip_token.

Erlang code.

to_integer(TokenChars) ->
  list_to_integer(TokenChars, 10).
