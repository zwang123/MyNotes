
var('w x y z a b c d', domain='complex')
a = 0
b = 1
c = i
d = 0
result = solve(
[
(a*w - b*x - c*y - d*z) == 0,
(b*w + a*x - d*y + c*z) == 0,
(c*w + d*x + a*y - b*z) == 0,
(d*w - c*x + b*y + a*z) == 0,
],
w, x,y,z)

a = w
b = x
c = y
d = z

result = solve(
[
(a*w - b*x - c*y - d*z) == w,
(b*w + a*x - d*y + c*z) == x,
(c*w + d*x + a*y - b*z) == y,
(d*w - c*x + b*y + a*z) == z,
],
w, x,y,z)

# basis = [1, (1+i*ii)*.5, (1+i*jj)*.5, (1+i*ii*jj)*.5, (.5+ii+jj-1.5*i*ii*jj)]
basis = [(.5+ii+jj+1.5*i*ii*jj), (.5+ii+jj-1.5*i*ii*jj)]
for xx in basis:
    print("Should be zero", xx * xx - xx)
    print()
    for yy in basis:
        print(xx * yy)
