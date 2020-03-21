! Copyright (c) 2005-2010, 2012-2013, Andrew Hang Chen and contributors,
! All rights reserved.
! Licensed under the 3-clause BSD license.

program runtests
  use fruit
  use test_libMath
  call init_fruit 
  call test_linspace()
  call fruit_summary
  call fruit_finalize
end program runtests
