#!/usr/bin/env bash

function log {
    echo "[$(date)]: $*"
}

log "Start Redis Cluster builder"
sleep 5

log "Connect all Redis containers"
redis-cli \
    --cluster-replicas 1 \
    --cluster-yes \
    --cluster create \
        $(host mas-redis|awk '{print $4}'):6379 \
        $(host mas-redis-1|awk '{print $4}'):6379 \
        $(host mas-redis-2|awk '{print $4}'):6379 \
        $(host mas-redis-3|awk '{print $4}'):6379 \
        $(host mas-redis-4|awk '{print $4}'):6379 \
        $(host mas-redis-5|awk '{print $4}'):6379
