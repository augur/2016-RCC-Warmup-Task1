#!/bin/bash
echo "Ruby base solution (with diff):" &&
time diff <( cat data/output.txt ) <( ruby solutions/solution1.rb < data/input.txt ) &&
echo "Ruby base solution (> dev/null):" &&
time ruby solutions/solution1.rb < data/input.txt > /dev/null

