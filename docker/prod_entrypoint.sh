#!/bin/sh
# Add debug to verify config file exists
echo "Checking for config file..."
ls -la /app/config.yaml || echo "Config file not found!"
cat /app/config.yaml | head -5 || echo "Cannot read config file!"

if [ "$USE_DDTRACE" = "true" ]; then
    export DD_TRACE_OPENAI_ENABLED="False"
    exec ddtrace-run litellm --config /app/config.yaml "$@"
else
    exec litellm --config /app/config.yaml "$@"
fi
