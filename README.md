# What is this ?
This is a fork from [this](https://github.com/MGasiorowskii/CryptoCurrencyExchange) repository. I have made some changes to the original code so that it can be deployed on a kubernetes cluster using helm charts.

[**More information**](https://docs.google.com/document/d/1m6ifYHMOcdHvpaKTzs24tSwqfCIZsxKzsyjxKr4g2Jc/edit?usp=sharing)

## Code base
The code base moved under `src/` directory. The original code is untouched(just some settings like `ALLOWED_HOST` has been changed).

## Deployment
The deployment files are under `deployment/` directory. It contains helm charts to deploy the application and monitoring stack alongside it. read the [readme](./deployment/README.md) file under `deployment/` directory for more information about how to deploy the stack.

## How to contribute
You can change the code under `src/` directory. After making changes, you just need to draft a new release with tag `vX.Y.Z` and the github action will build new docker image and push it to docker hub. 
> Make sure to change the image tag in `deployment/application/values.yaml` file to the new tag in your own infrastruce.

