#!/usr/bin/env bash
# Run V1 of kxsystems/docs under Docker on port 9000
docker run --rm -it -v $(pwd):/docs -p 9000:9000 -e PORT=9000 kxsys/docs
