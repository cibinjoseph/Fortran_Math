module lib_rk4
    implicit none
    integer, parameter :: dp = kind(1.d0)

contains

function rk4(y0,tspan) result(y)
    ! RK4 solver for y'=f(t,y)
    ! with initial condition y0 over tspan
    ! assumed constant step size

    real(dp), intent(in), dimension(:) :: y0
    real(dp), intent(in), dimension(:) :: tspan
    real(dp), dimension(size(y0),size(tspan)) :: y

    real(dp) :: dt
    real(dp), dimension(size(y0)) :: k1,k2,k3,k4,w0
    integer :: i

    dt = tspan(2)-tspan(1)
    ! Initial condition
    y(:,1) = y0

    do i=2,size(tspan)
        w0=y(:,i-1)

        k1=dt*func(tspan(i-1),w0)
        k2=dt*func(tspan(i-1)+dt*0.5_dp,w0+k1*0.5_dp)
        k3=dt*func(tspan(i-1)+dt*0.5_dp,w0+k2*0.5_dp)
        k4=dt*func(tspan(i-1)+dt,w0+k3)
        y(:,i)=w0+(k1+2._dp*k2+2._dp*k3+k4)/6._dp
    end do

end function rk4

function func(t,y) result(fout)
    ! Function to be used for rk4 evaluation
    ! Should be of the form y'=f(t,y)
    real(dp), intent(in), dimension(2) :: y
    real(dp), intent(in) :: t
    real(dp), dimension(size(y)) :: fout

    fout(1)=y(1)-t*t+1._dp
    fout(2)=y(2)-t*t+1._dp

end function func

end module lib_rk4
