#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.kms_key_ring["arunim-gcp-bucket-2"].google_kms_key_ring.this' 'projects/stackguardian-nonprod/locations/us/keyRings/arunim-gcp-bucket-2'
