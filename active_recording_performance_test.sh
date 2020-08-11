#!/usr/bin/env bash

sudo ~/sipp/sipp 10.17.7.16:5060 -sf ~/projects/Sipp/Scenarios/cisco_active_recording_nearend.xml -s 599919 -m 1 -bg
sudo ~/sipp/sipp 10.17.7.16:5060 -sf ~/projects/Sipp/Scenarios/cisco_active_recording_farend.xml -s 599919 -m 1 -bg
