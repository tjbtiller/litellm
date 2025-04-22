#!/bin/sh
if [ "$USE_DDTRACE" = "true" ]; then
    export DD_TRACE_OPENAI_ENABLED="False"
    exec ddtrace-run litellm --config /app/config.yaml "$@"
else
    exec litellm --config /app/config.yaml "$@"
fi
