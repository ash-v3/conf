def solve [eq] {
    python -c $"from sympy import solve; print\(solve\('($eq)'))"
}