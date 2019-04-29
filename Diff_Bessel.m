function diff_bessel = Diff_Bessel(n, x)
    diff_bessel = 1/2*(besselj(n-1, x) - besselj(n+1, x));
    