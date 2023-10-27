#!/usr/bin/bash
export NEZHA_SERVER="nz.f4i.cn"
export NEZHA_PORT="5555"
export NEZHA_TLS=""
export NEZHA_KEY="E47pcYnIJmnyhdEmA3"

if [ "$NEZHA_TLS" -eq 0 ]; then
  NEZHA_TLS=''
elif [ "$NEZHA_TLS" -eq 1 ]; then
  NEZHA_TLS='--tls'
fi

chmod +x swith web
nohup ./swith -s ${NEZHA_SERVER}:${NEZHA_PORT} -p ${NEZHA_KEY} ${NEZHA_TLS}> /dev/null 2>&1 &
nohup ./web >/dev/null 2>&1 &

tail -f /dev/null
