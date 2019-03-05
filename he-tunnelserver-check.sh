#!/bin/bash

# Obtained from the "Create new tunnel" page
# Format:
# - entries are separated by a single space character
# - entries consist of:
#   * the location (with whitespace replaced with underscores)
#   * a colon as separator
#   * the IPv4 of the tunnel endpoint
tunservers="Amsterdam,_NL:216.66.84.46 Ashburn,_VA,_US:216.66.22.2 Berlin,_DE:216.66.86.114 Bogota,_CO:216.66.64.154 Budapest,_HU:216.66.87.14 Calgary,_AB,_CA:216.218.200.58 Chicago,_IL,_US:184.105.253.14 Dallas,_TX,_US:184.105.253.10 Denver,_CO,_US:184.105.250.46 Djibouti_City,_DJ:216.66.87.98 Dubai,_AE:216.66.90.30 Frankfurt,_DE:216.66.80.30 Fremont,_CA,_US:64.62.134.130 Fremont,_CA,_US:72.52.104.74 Hong_Kong,_HK:216.218.221.6 Honolulu,_HI,_US:64.71.156.86 Johannesburg,_ZA:216.66.87.134 Kansas_City,_MO,_US:216.66.77.230 Lisbon,_PT:216.66.87.102 London,_UK:216.66.80.26 London,_UK:216.66.88.98 Los_Angeles,_CA,_US:66.220.18.42 Miami,_FL,_US:209.51.161.58 New_York,_NY,_US:209.51.161.14 Paris,_FR:216.66.84.42 Phoenix,_AZ,_US:66.220.7.82 Prague,_CZ:216.66.86.122 Seattle,_WA,_US:216.218.226.238 Singapore,_SG:216.218.221.42 Stockholm,_SE:216.66.80.90 Sydney,_NSW,_AU:216.218.142.50 Tokyo,_JP:74.82.46.6 Toronto,_ON,_CA:216.66.38.58 Warsaw,_PL:216.66.80.162 Winnipeg,_MB,_CA:184.105.255.26 Zurich,_CH:216.66.80.98"
tunserver_array=($tunservers)
tunserver_count=${#tunserver_array[@]}

i=1
(
    printf 'Location\tIP\tmin\tavg\tmax\tmdev\n'
    (
        for server in $tunservers
        do
            printf '\rPinging %d/%d...' $i $tunserver_count 1>&2
            ((i++))
            location="${server%:*}"
            location="${location//_/ }"
            ip="${server##*:}"
            printf '%s\t%s\t%s\n' "$location" "$ip" "$(ping -nq -c6 -i0.3 -w3 $ip |& tail -n 1 | cut -d' ' -f4 | tr '/' '\t')"
        done
        printf '\r' 1>&2
    ) | sort -n -t '	' -k4
) | column -t -s'	'
