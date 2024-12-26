#!/bin/bash

read input_string

reversed_string=$(echo "$input_string" | rev)

echo "$reversed_string"
