# RecSys2025
Supporting resources for a recommender systems workshop at the Stellenbosch AI Society.

## Topic
Recommender Systems at Takealot.com

## Presenter
Stefan Dominicus (Senior Machine Learning Software Engineer at Takealot.com)

# Getting Started
```sh
# build the Docker image
docker build -t rec-sys-2025 .

# run the Docker container
docker run --mount type=bind,src="$(pwd)"/recommender_systems,dst=/usr/local/ai/rec-sys-2025/recommender_systems --publish 8888:8888 rec-sys-2025

# find the URL including a token
# e.g: http://127.0.0.1:8888/lab?token=<token>
```
