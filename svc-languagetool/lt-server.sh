#!/bin/sh

PORT={LT_PORT:-8081}
CONFIG=${LT_CONFIG:-/opt/LanguageTool/server.config}

/usr/bin/java -cp /opt/LanguageTool/languagetool-server.jar org.languagetool.server.HTTPServer \
    --port ${PORT} \
    --public \
    --allow-origin '*' \
    --config ${CONFIG}