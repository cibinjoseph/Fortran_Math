program rk45
use lib_rk4

real(dp), dimension(2) :: y0
real(dp), dimension(5) :: tspan
real(dp), dimension(size(y0),size(tspan)) :: yout

y0 = (/0.5,0.5/)
tspan=(/0.,0.5,1.,1.5,2.0/)

yout=rk4(y0,tspan)

print*,yout(:,5)

end program rk45
