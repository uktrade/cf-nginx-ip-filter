#!/usr/bin/env bash

export IP_WHITELIST=${IP_WHITELIST:-127.0.0.1}
export IP_BLACKLIST=${IP_BLACKLIST:-all}

ansible-playbook scripts/main.yml
