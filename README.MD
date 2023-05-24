# Boiler plate react app deployed on AKS as helm chart with custom github actions.

I am building, pushing to Docker HUB and deploying my app with Github Actions which I build and call from this repository.
The app is React, it's using Nginx server installed on an UBI9 docker operating system. After uploaded to Docker HUB, a custom Helm Chart is made and it's deployed on my Azure AKS cluster.
