#!/usr/bin/env bash

SERVICE_NUMBER=599919
CALLS_PER_SECONDS=10
RATE_PERIOD=1000
MAX_CALL_COUNT=1000

usage()
{
  echo "Usage: $0: [-s|c|p|m|h] - Default -s 599919 -c 10 -p 1000 -m 100. 10 calls every 1 sec up to 100 calls"
  echo "  -s  service number is paste to 'to header' in sip"
  echo "  -c  calls per second"
  echo "  -p  rate period in milliseconds"
  echo "  -m  max call count"
  echo "  -h  help"
}

while getopts "s:c:p:m:h" opt; do
	case ${opt} in
	  s)
		  SERVICE_NUMBER="${OPTARG}";;
	  c)
		  CALLS_PER_SECONDS="${OPTARG}";;
	  p)
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

sudo ~/sipp/sipp 10.17.7.16:5060 -sf ~/projects/Sipp/Scenarios/cisco_active_recording_nearend.xml -s "${SERVICE_NUMBER}" -r "${CALLS_PER_SECONDS}" -rp "${RATE_PERIOD}" -m "${MAX_CALL_COUNT}" -bg
sudo ~/sipp/sipp 10.17.7.16:5060 -sf ~/projects/Sipp/Scenarios/cisco_active_recording_farend.xml -s "${SERVICE_NUMBER}" -r "${CALLS_PER_SECONDS}" -rp "${RATE_PERIOD}" -m "${MAX_CALL_COUNT}" -bg



