FC = gfortran 
src = ..

all:
	make tests

# Compile our standalone source
libMath.o: $(src)/libMath.f90
	$(FC) -c $(src)/libMath.f90 

# Compile standalone fruit source
naturalfruit.o: naturalfruit.f90
	$(FC) -c naturalfruit.f90

test_libMath.o: test_libMath.f90  naturalfruit.o libMath.o
	$(FC) -c test_libMath.f90 

testrunner_libMath.out: testrunner_libMath.f90 test_libMath.o naturalfruit.o
	$(FC) testrunner_libMath.f90 naturalfruit.o test_libMath.o libMath.o -o testrunner_libMath.out

tests: testrunner_libMath.out
	./testrunner_libMath.out

clean:
	rm -f *.o *.mod *.out

