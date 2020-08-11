#!/usr/bin/env bash

LOOP_LIMIT=$1

for (( VAR = 0; VAR <= ${LOOP_LIMIT}; ++VAR )); do
    sudo ~/sipp/sipp 10.17.7.16:5060 -sf ~/projects/Sipp/Scenarios/cisco_active_recording_nearend.xml -s ${LOOP_LIMIT} -m 1 -bg
    sudo ~/sipp/sipp 10.17.7.16:5060 -sf ~/projects/Sipp/Scenarios/cisco_active_recording_farend.xml -s ${LOOP_LIMIT} -m 1 -bg
    sleep 1000;
done


