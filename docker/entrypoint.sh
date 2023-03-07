#!/bin/bash
sed -i "s/MONGO_HOST/$MONGO_HOST/" config/database.js && sed -i "s/MONGO_PORT/$MONGO_PORT/" config/database.js && exec "$@"
