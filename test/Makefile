FC = ifort
src = ..

all:
	make tests

# Compile our standalone source
libMath.o: $(src)/libMath.f90
	$(FC) -c $(src)/libMath.f90 

# Compile standalone fruit source
fruit.o: fruit.f90
	$(FC) -c fruit.f90

test_libMath.o: test_libMath.f90  fruit.o libMath.o
	$(FC) -c test_libMath.f90 

runtests.out: runtests.f90 test_libMath.o fruit.o
	$(FC) runtests.f90 fruit.o test_libMath.o libMath.o -o runtests.out

tests: runtests.out
	./runtests.out

clean:
	rm -f *.o *.mod *.out

