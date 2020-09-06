! Copyright (c) 2005-2010, 2012-2013, Andrew Hang Chen and contributors,
! All rights reserved.
! Licensed under the 3-clause BSD license.

program testrunner_libMath
  use naturalfruit
  use test_libMath

  call testsuite_initialize()
  call test_linspace()
  call test_trapz()
  call testsuite_summary()
  call testsuite_finalize()
end program testrunner_libMath
