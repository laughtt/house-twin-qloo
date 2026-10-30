#!/bin/bash
# web/ → qloo.adtomic.co (Caddy serves /opt/qloo-site on the House Twin server).
set -e
cd "$(dirname "$0")"
rsync -az --delete --exclude deploy.sh -e "ssh -i ~/.ssh/castle-fight.pem" ./ ubuntu@52.87.11.155:/tmp/qloo-site/
ssh -i ~/.ssh/castle-fight.pem ubuntu@52.87.11.155 'sudo rsync -a --delete /tmp/qloo-site/ /opt/qloo-site/ && sudo chmod -R a+rX /opt/qloo-site'
