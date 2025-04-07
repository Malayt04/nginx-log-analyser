#!/bin/bash

# Check for log file argument
LOG_FILE="$1"

if [ -z "$LOG_FILE" ] || [ ! -f "$LOG_FILE" ]; then
  echo "Usage: $0 <nginx-access-log-file>"
  exit 1
fi

echo ""
echo "==============================="
echo "📊 Top 5 IP addresses with the most requests:"
echo "==============================="
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{printf "%s - %s requests\n", $2, $1}'
echo ""

echo "==============================="
echo "📊 Top 5 most requested paths:"
echo "==============================="
awk -F\" '{print $2}' "$LOG_FILE" | awk '{print $2}' | sort | uniq -c | sort -nr | head -n 5 | awk '{printf "%s - %s requests\n", $2, $1}'
echo ""

echo "==============================="
echo "📊 Top 5 response status codes:"
echo "==============================="
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{printf "%s - %s requests\n", $2, $1}'
echo ""

echo "==============================="
echo "📊 Top 5 user agents:"
echo "==============================="
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $0}' | sed 's/^ *//'
echo ""
