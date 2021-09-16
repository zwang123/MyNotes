# load('Documents/MyNotes/clifford/cliff.sage')
# prec = 200
# RR = RealField(prec)
# CC = RR.complex_field()

dim = 2
K = CC
# K.<x> = FunctionField(K)
K.<a,b,c,d,w,x,y,z> = PolynomialRing(K)

Q =  DiagonalQuadraticForm(K, dim * [-1])
Cl.<ii,jj> = CliffordAlgebra(Q)
kk = ii*jj


# R.<a,b,c,d,w,x,y,z> = PolynomialRing(K)

# a=1
# b=2
# c=3
# d=4
# w=5
# # x=6
# y=7
# z=8

# a = 0
# b = 1
# c = i
# d = 0

quat = a+b*ii+c*jj+d*ii*jj
quat2 = w+x*ii+y*jj+z*ii*jj
quat * quat2
# result = solve(quat * quat2 == 0, w,x,y,z)


def quat_mult_eq(lhs, rhs, prod):
    a, b, c, d = lhs
    w, x, y, z = rhs
    # print(a,b,c,d)
    return [
        (a*w - b*x - c*y - d*z) == prod[0],
        (b*w + a*x - d*y + c*z) == prod[1],
        (c*w + d*x + a*y - b*z) == prod[2],
        (d*w - c*x + b*y + a*z) == prod[3],
    ]

var('a,b,c,d,w,x,y,z')


def solve_quat_rhs(lhs, rhs, prod):
    return solve(quat_mult_eq(lhs, rhs, prod), *rhs)

lhs = [a,b,c,d]
rhs = [w,x,y,z]
prod = [0,0,0,0]
print(solve_quat_rhs(lhs, rhs, prod))
print(solve_quat_rhs(rhs, rhs, rhs))

# https://ask.sagemath.org/question/48220/creating-a-vector-of-indexed-variables/
idx = range(2)

eqns = []
vars = []
zero = [0,0,0,0]

if True:
    fac = i/sqrt(12)
    a0 = [1/2, fac, fac, fac]
    a10 = [1/2, -fac, fac, fac]
    a11 = [1/2, fac, -fac, fac]
    a12 = [1/2, fac, fac, -fac]
    a21 = [1/2, fac, -fac, -fac]
    a3 = [1/2, -fac, -fac, -fac]
    # print(quat_mult_eq(a21, a10, a0))
    # print(quat_mult_eq(a10, a21, a0))
    rhs = [1/2] + list(var('rhs', n=3))
    print(quat_mult_eq(a0, a3, a0))
    print(quat_mult_eq(a3, a0, a0))
    eqns = quat_mult_eq(a0, rhs, zero) + quat_mult_eq(rhs, rhs, rhs)[:1]
    print(eqns)
    print('solved')
    print(solve(eqns, *rhs[1:]))
    
    # print(quat_mult_eq(a00, a00, a00))
    # print(quat_mult_eq(a00, a01, a01))
    # print(quat_mult_eq(a10, a01, a11))
    # print(quat_mult_eq(a01, a10, a11))
    # for yy in range(3):
    #     print(quat_mult_eq(a21, eval('a1{}'.format(yy)), a0))
    #     print(quat_mult_eq(eval('a1{}'.format(yy)), a21, a0))
    

elif False:
    a00 = [1/2] + list(var('a00', n=3))
    a01 = [1/2] + list(var('a01', n=3))
    a10 = [1/2] + list(var('a10', n=3))
    a11 = [1/2] + list(var('a11', n=3))
    for xx in idx:
        for yy in idx:
            aa = eval('a{}{}'.format(xx, yy))
            vars += aa[1:]
            for rr in idx:
                for ss in idx:
                    bb = eval('a{}{}'.format(rr, ss))
                    cc = yy == rr
                    dd = eval('a{}{}'.format(xx, ss))
                    print(aa, bb, dd if cc else [0,0,0,0])
                    if xx == rr and yy == ss:
                        eqns += quat_mult_eq(aa, bb, dd if cc else [0,0,0,0])[:1]
                    else:
                        eqns += quat_mult_eq(aa, bb, dd if cc else [0,0,0,0])
elif False:
    a00 = var('a00', n=4)
    a01 = var('a01', n=4)
    a10 = var('a10', n=4)
    a11 = var('a11', n=4)
    for xx in idx:
        for yy in idx:
            aa = eval('a{}{}'.format(xx, yy))
            vars += aa
            for rr in idx:
                for ss in idx:
                    bb = eval('a{}{}'.format(rr, ss))
                    cc = yy == rr
                    dd = eval('a{}{}'.format(xx, ss))
                    print(aa, bb, dd if cc else [0,0,0,0])
                    eqns += quat_mult_eq(aa, bb, dd if cc else [0,0,0,0])

# print(eqns)
# print(vars)
# print(len(eqns))
# solve(eqns, *vars)
# # print(a)
# # print(solve_quat_rhs(a, rhs, rhs))
