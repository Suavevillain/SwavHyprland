#!/bin/bash

# Number of total headlines to show
TOTAL_HEADLINES=20

# These must match the exact feed URLs shown in your Newsboat cache
FEEDS=(
  "https://www.news4jax.com/arc/outboundfeeds/rss/category/news/?outputType=xml&size=10"
  "https://www.reddit.com/r/linux.rss"
)

NUM_FEEDS=${#FEEDS[@]}
HEADLINES_PER_FEED=$((TOTAL_HEADLINES / NUM_FEEDS))
OUTPUT="/tmp/hyprlock_rss_output.txt"
> "$OUTPUT"

for FEED in "${FEEDS[@]}"; do
  # Optional emoji by source
  if [[ "$FEED" == *"news4jax"* ]]; then
    ICON="📰"
  elif [[ "$FEED" == *"linux.rss"* ]]; then
    ICON="🐧"
  else
    ICON="•"
  fi

  sqlite3 ~/.newsboat/cache.db "
    SELECT title FROM rss_item 
    WHERE feedurl = '$FEED' 
    ORDER BY pubDate DESC 
    LIMIT $HEADLINES_PER_FEED;
  " | sed "s/^/${ICON} /" >> "$OUTPUT"
  
  echo "" >> "$OUTPUT"
done

cat "$OUTPUT"

