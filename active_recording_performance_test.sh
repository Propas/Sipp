#!/usr/bin/env bash

set -e
set -u

SERVICE_NUMBER=599919
CALLS_PER_SECONDS=10
RATE_PERIOD=1
MAX_CALL_COUNT=1000

while getopts "h:" opt; do
	case ${opt} in
#	  s)
#		  SERVICE_NUMBER=${OPTARG}
#		  ;;
#	  r)
#		  CALLS_PER_SECONDS=${OPTARG}
#		  ;;
#	  rp)
#		  RATE_PERIOD=${OPTARG}
#		  ;;
#	  m)
#		  MAX_CALL_COUNT=${OPTARG}
#		  ;;
	  h)
		  usage
		  exit
		  ;;
	  \?)
      usage
      exit 1
      ;;
    :)
      error "Option -${OPTARG} requires an argument." >&2
      usage
      exit 1
      ;;
    esac
done

usage() { error "Usage: $0 -s <SERVICE_NUMBER> -r <CALLS_PER_SECONDS> -rp [-v <RATE_PERIOD>] [-m <MAX_CALL_COUNT>] [-h <HELP>]"; }

sudo ~/sipp/sipp 10.17.7.16:5060 -sf ~/projects/Sipp/Scenarios/cisco_active_recording_nearend.xml -s ${SERVICE_NUMBER} -r ${CALLS_PER_SECONDS} -rp ${RATE_PERIOD} -m ${MAX_CALL_COUNT} -bg
sudo ~/sipp/sipp 10.17.7.16:5060 -sf ~/projects/Sipp/Scenarios/cisco_active_recording_farend.xml -s ${SERVICE_NUMBER} -r ${CALLS_PER_SECONDS} -rp ${RATE_PERIOD} -m ${MAX_CALL_COUNT} -bg



