#!/bin/bash

# Function to check xwayland value
check_xwayland() {
  
  local text="$1" 
  local xwayland_line
  local class_line 
  local title_line

  # Extract the line containing "xwayland:"
  xwayland_line=$(echo "$text" | grep "xwayland:")
  class_line=$(echo "$text" | grep -P "^\t*class:" | sed -e 's/^[ \t]*//')
  title_line=$(echo "$text" | grep -P "^\t*title:" | sed -e 's/^[ \t]*//')
  echo "bruh"
  local test=$(echo "$text" | grep "title:")
  echo "$test"
  echo "unbruh"

  # Extract the value (assuming the format is "xwayland: <value>")
  local xwayland_value=$(echo "$xwayland_line" | awk '{print $2}')
  local wayland
  if [[ "$xwayland_value" == "0" ]]; then
    wayland="wayland" 
  else
    wayland="xwayland" 
  fi

  notify-send -a "Window info" "
$wayland
$class_line
$title_line"
}

output=$(hyprctl activewindow)
echo "$output"
# Call the function with the example text
check_xwayland "$output"
