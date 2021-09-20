R.<x,y> = PolynomialRing(QQ, 2)
I = (x*(x-2)^2, x^2*(y-1)) * R
# I.is_prime()
I.radical()
J = (x*(x-2)^2, x^2*(y-1), x*y-x, x^2-2*x) * R
J.radical()
K = (x*(x-2)^2, x^2*(y-1), x*y-x, x^2-2*x) * R
