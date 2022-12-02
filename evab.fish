function evab
    python -c "from sympy import *; from sympy.parsing.sympy_parser import parse_expr; b = $argv[3]; a = $argv[2]; x = Symbol('x'); expression = parse_expr('$argv[1]'); print(expression.subs(x, b) - expression.subs(x, a))"
end
