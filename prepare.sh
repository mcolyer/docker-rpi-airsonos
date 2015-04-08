#!/bin/bash

# Fix a Debianism of the nobody's uid being 65534
/usr/sbin/usermod -u 99 nobody
/usr/sbin/usermod -g 100 nobody
