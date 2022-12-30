function int
    if test (count $argv) -gt 1
        python -c "from sympy import *; from sympy.parsing.sympy_parser import parse_expr; b = $argv[3]; a = $argv[2]; x = Symbol('x'); expression = integrate(parse_expr('$argv[1]')); print(expression.subs(x, b) - expression.subs(x, a))"
    else
        python -c "from sympy import *; from sympy.parsing.sympy_parser import parse_expr; expression = integrate(parse_expr('$argv[1]')); print(expression)"
    end
end
