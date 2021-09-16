def quat_mult_exe(self, lhs, rhs, **kwds):
    a, b, c, d = lhs
    w, x, y, z = rhs
    print(a,b,c,d)
    return vector([
        (d*w - c*x + b*y + a*z),
        (b*w + a*x - d*y + c*z),
        (c*w + d*x + a*y - b*z),
        (a*w - b*x - c*y - d*z),
    ])
quat_mult = function('quat_mult', nargs=2, evalf_func=quat_mult_exe)


rhs = vector([w,x,y,z])
# rhs = var('rhs', n=2**dim, latex_name='rhs')
# eq = quat_mult(vector([a,b,c,d]), rhs)==vector([0,0,0,0])
# result = solve(quat_mult([a,b,c,d],rhs)==[0,0,0,0], rhs)

# def ezf_exe(self, x, **kwds):
#     return x
# ezf = function('ezf', nargs=1, evalf_func=ezf_exe)
# print(ezf(6))

# Callable Symbolic Expressions
# https://doc.sagemath.org/html/en/tutorial/tour_algebra.html
# https://doc.sagemath.org/html/en/constructions/polynomials.html
# https://doc.sagemath.org/html/en/prep/Quickstarts/Multivariable-Calculus.html
# https://doc.sagemath.org/html/en/tutorial/tour_linalg.html
# https://paulmasson.github.io/sagemath-docs/functions/function.html
# https://doc.sagemath.org/html/en/reference/calculus/sage/symbolic/expression.html
