#!/bin/bash

if [ -f {path}/output/risk.txt -o -f {path}/output/output.txt ]; then
  rm -f {path}/output/risk.txt
  rm -f {path}/output/output.txt
fi

docker_opts="--read-only --cap-drop all --rm"

image="jumanjiman/ssllabs-scan:latest"

scan_opts="-grade -usecache --json-flat -quiet"

output=$(docker run -v {path}/hosts:/tmp:ro ${docker_opts} ${image} -hostfile /tmp/targets.txt ${scan_opts})

while IFS= read -r line; do
  if [[ $line == HostName:* ]]; then
    hostname=$(echo $line | awk -F '"' '{print $2}')
    read -r grade_line
    grade=$(echo $grade_line | awk -F '"' '{print $4}')
    echo "HostName: $hostname"
    echo "Grade: $grade"

    if ! grep -q "A\|A+" <<< "$grade"; then
      if [ -z "$grade" ]; then
        echo "$hostname: Failed to scan" >> {path}/output/risk.txt
      else
        echo "$hostname: $grade" >> {path}/output/risk.txt
      fi
    fi
  fi
done <<< "$output" >> {path}/output/output.txt
