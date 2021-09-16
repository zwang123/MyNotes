# load('Documents/MyNotes/clifford/quaternion_algebra.sage')

QA.<ii,jj,kk> = QuaternionAlgebra(CC,-1,-1)

basis = [(.5+ii+jj+1.5*i*ii*jj), (.5+ii+jj-1.5*i*ii*jj)]
for xx in basis:
    print("Should be zero", xx * xx - xx)
    print()
    for yy in basis:
        print(xx * yy)
