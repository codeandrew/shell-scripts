#!/bin/bash

echo "Test GET REQUEST"
curl -w "@curl-format.txt" -o /dev/null -s example.com

echo "Test POST REQUEST"
curl -w "@curl-format.txt" -o /dev/null -X POST https://url.com

