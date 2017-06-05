#!/bin/bash

sh io/import.sh
Rscript transform/transform.R
sh io/export.sh
