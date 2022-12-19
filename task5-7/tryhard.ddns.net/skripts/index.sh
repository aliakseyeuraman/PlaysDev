#!/bin/bash
CPU=$(sar 1 5 | grep "Average" | sed 's/^.* //')
echo "$CPU"