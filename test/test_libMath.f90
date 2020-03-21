module test_libMath
  use fruit
  implicit none
  integer, parameter :: dp = kind(1.d0)

contains

  subroutine test_linspace()
    use libMath, only: linspace
    integer, parameter :: n = 5
    real(dp), dimension(n) :: res, correct

    res = linspace(0._dp, 1._dp, 5)
    correct = (/0._dp, 0.25_dp, 0.5_dp, 0.75_dp, 1._dp/)
    call assert_equals(res, correct, n)
  end subroutine test_linspace

end module test_libMath
