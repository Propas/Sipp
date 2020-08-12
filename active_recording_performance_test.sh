#!/usr/bin/env bash

IPADDR=
PORT=5060
SIPP=~/sipp/sipp
DIR=~/sipp/docs/scenarios/
NEAREND_FILE=cisco_active_recording_nearend.xml
FAREND_FILE=cisco_active_recording_farend.xml
SERVICE_NUMBER=599919
CALLS_PER_SECONDS=1
RATE_PERIOD=1000
MAX_CALL_COUNT=100

usage()
{
  echo "Usage: $0: [-i|p|d|s|c|r|m|h] - sipp must by installed in ~/sipp"
  echo "  -i  IP address"
  echo "  -p  Port. Default: 5060"
  echo "  -d  Path to directory with scenarios. Default: ~/sipp/docs/scenarios/"
  echo "  -s  Service number is paste to 'to header' in sip. Default: 599919"
  echo "  -c  Calls per second. Default 1."
  echo "  -p  Rate period in milliseconds. Default: 1000ms"
  echo "  -m  Max call count. Default: 100"
  echo "  -h  Help"
}

while getopts "i:p:d:s:c:p:m:h" opt; do
	case ${opt} in
	  i)
	    IPADDR="${OPTARG}";;
	  p)
	    PORT="${OPTARG}";;
	  d)
	    DIR="${OPTARG}";;
	  s)
		  SERVICE_NUMBER="${OPTARG}";;
	  c)
		  CALLS_PER_SECONDS="${OPTARG}";;
	  r)
		  RATE_PERIOD="${OPTARG}";;
	  m)
		  MAX_CALL_COUNT="${OPTARG}";;
	  h)
		  usage
		  exit;;
	  \?)
      usage
      exit 1;;
    :)
      echo "Option -${OPTARG} requires an argument." >&2
      usage
      exit 1;;
    esac
done

sudo "${SIPP}" "${IPADDR}":"${PORT}" -sf "${DIR}""${NEAREND_FILE}" -s "${SERVICE_NUMBER}" -r "${CALLS_PER_SECONDS}" -rp "${RATE_PERIOD}" -m "${MAX_CALL_COUNT}" -bg
sudo "${SIPP}" "${IPADDR}":"${PORT}" -sf "${DIR}""${FAREND_FILE}" -s "${SERVICE_NUMBER}" -r "${CALLS_PER_SECONDS}" -rp "${RATE_PERIOD}" -m "${MAX_CALL_COUNT}" -bg



