HE.net tunnelserver check
=========================

Pings all [tunnelbroker.net](https://tunnelbroker.net/) tunnel servers to find
the one closest to you.

This can actually produce wildly different results than you might expect based
on your location — see this test result from a server in Roubaix, France:

    $ bash he-tunnelserver-check.sh 
    Location             IP               min      avg      max      mdev
    Amsterdam, NL        216.66.84.46     6.022    6.161    6.498    0.160
    London, UK           216.66.80.26     8.340    8.379    8.407    0.108
    London, UK           216.66.88.98     8.433    11.025   23.476   5.569
    Frankfurt, DE        216.66.80.30     11.930   13.344   19.640   2.819
    Paris, FR            216.66.84.42     13.780   13.953   14.064   0.149
    Zurich, CH           216.66.80.98     14.413   14.474   14.591   0.165
    Berlin, DE           216.66.86.114    20.078   20.137   20.194   0.123
    Prague, CZ           216.66.86.122    20.054   20.842   23.845   1.346
    Warsaw, PL           216.66.80.162    28.871   28.919   28.983   0.173
    Budapest, HU         216.66.87.14     29.658   29.755   29.929   0.167
    Stockholm, SE        216.66.80.90     29.902   30.634   33.635   1.364
    New York, NY, US     209.51.161.14    77.256   77.300   77.360   0.032
    Ashburn, VA, US      216.66.22.2      80.362   81.635   87.541   2.656
    Toronto, ON, CA      216.66.38.58     87.848   87.974   88.179   0.313
    Chicago, IL, US      184.105.253.14   97.422   97.641   97.755   0.208
    Kansas City, MO, US  216.66.77.230    108.595  108.817  109.016  0.363
    Miami, FL, US        209.51.161.58    111.484  111.665  111.901  0.306
    Winnipeg, MB, CA     184.105.255.26   112.701  112.819  112.982  0.295
    Dallas, TX, US       184.105.253.10   117.472  117.601  117.847  0.363
    Denver, CO, US       184.105.250.46   119.902  119.955  120.037  0.349
    Phoenix, AZ, US      66.220.7.82      140.230  140.262  140.320  0.218
    Los Angeles, CA, US  66.220.18.42     141.739  142.784  147.220  2.044
    Fremont, CA, US      64.62.134.130    142.693  142.838  143.014  0.390
    Fremont, CA, US      72.52.104.74     142.723  142.848  142.959  0.445
    Seattle, WA, US      216.218.226.238  150.157  150.368  150.529  0.122
    Singapore, SG        216.218.221.42   189.345  189.401  189.488  0.439
    Tokyo, JP            74.82.46.6       248.004  248.086  248.139  0.501

Note: The list of tunnel servers is hardcoded in the script, so it might not
reflect what servers are currently online and have free capacity.
