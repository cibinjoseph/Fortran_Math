module test_libMath
  use naturalfruit
  implicit none
  integer, parameter :: dp = kind(1.d0)

contains

  subroutine test_linspace()
    use libMath, only: linspace
    use naturalfruit
    integer, parameter :: n = 5
    real(dp), dimension(n) :: res, correct

    call testcase_initialize('test_linspace')
    res = linspace(0._dp, 1._dp, 5)
    correct = (/0._dp, 0.25_dp, 0.5_dp, 0.75_dp, 1._dp/)
    call assert_equal(res, correct)
    call testcase_finalize()
  end subroutine test_linspace

  subroutine test_trapz()
    use libMath, only: linspace, trapz
    use naturalfruit
    integer, parameter :: n = 25
    real(dp), dimension(n) :: x, y
    real(dp) :: correct

    call testcase_initialize('test_trapz')
    x = linspace(0._dp, 1._dp, n)
    y = x*x
    ! Compared against numpy.trapz()
    correct = 0.3336226851851851_dp
    call assert_equal(trapz(y, x), correct)
    call testcase_finalize()
  end subroutine test_trapz

  subroutine test_interp1()
    use libMath, only: interp1
    use naturalfruit
    real(dp), dimension(5) :: x
    real(dp), dimension(5) :: y

    x = (/1._dp, 2._dp, 3._dp, 4._dp, 5._dp/)
    y = x*10._dp

    call assert_equal(interp1(2.9_dp, x, y, 1), 29._dp)
    call assert_equal(interp1(5.0_dp, x, y, 1), 50._dp)

  end subroutine test_interp1
end module test_libMath
