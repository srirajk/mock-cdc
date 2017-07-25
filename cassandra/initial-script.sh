#!/bin/bash

echo "executing the ddl script."

cqlsh -f scripts/create.cql

exit
