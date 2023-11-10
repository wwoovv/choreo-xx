#!/usr/bin/bash
export UUID="c2a713bc-122c-4603-b516-87da2d6712f4"
export NEZHA_SERVER="nz.f4i.cn"
export NEZHA_PORT="5555"
export NEZHA_KEY="N9BVoBfucVIrIzCBt8"
export SERVER_PORT="8080"

if [ "$NEZHA_PORT"="443" ]; then
      NEZHA_TLS="--tls"
else
      NEZHA_TLS=""
fi

chmod +x swith server
nohup ./swith -s ${NEZHA_SERVER}:${NEZHA_PORT} -p ${NEZHA_KEY} ${TLS}> /dev/null 2>&1 &
nohup ./server -p ${SERVER_PORT} -u ${UUID} > /dev/null 2>&1 &

tail -f /dev/null
