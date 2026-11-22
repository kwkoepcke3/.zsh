#!/usr/bin/env bash

function newest() {
    ls -t $1* | head -n 1
}
