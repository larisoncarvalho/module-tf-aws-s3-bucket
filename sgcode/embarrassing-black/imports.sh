#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.artifact_registry_repository.google_artifact_registry_repository.this' 'projects/stackguardian-nonprod/locations/us-central1/repositories/rome-registry'