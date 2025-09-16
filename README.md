# RecSys2025
Supporting resources for a recommender systems workshop at the Stellenbosch AI Society.

### Topic
Recommender Systems at Takealot.com.

### Presenter
Stefan Dominicus (Senior Machine Learning Software Engineer at Takealot.com).

### Slides
[Recommender Systems @ Takealot.com](Recommender%20Systems%20@%20Takealot.com.pdf)

## Getting Started

### [Optional] Using a GCP virtual machine
Tensorflow doesn't officially support the new Apple Silicon CPU/GPU architecture. The easiest way around this limitation is to run your Tensorflow code on a Linux VM.
#### Install the `gcloud` CLI
Follow the installation and configuration instructions at https://cloud.google.com/sdk/docs/install-sdk.
#### Create a VM
- Ask us to create a VM instance for you. Find your VM at https://console.cloud.google.com/compute/instances?project=tal-recsys-workshop.
- Ask us to add you to the Google Group at https://groups.google.com/a/takealot.com/g/tal-recsys-workshop/members.
#### Get the gcloud SSH command
From your instance's SSH context menu, click `View gcloud command`.
#### Connect to your instance
Substitute your instance name below:
```sh
gcloud compute ssh --zone "europe-west1-b" "YOUR_INSTANCE_NAME" --tunnel-through-iap --project "tal-recsys-workshop" -- -L 8888:localhost:8888
```
#### Install `git`
```sh
sudo apt-get install git
```
#### Install `docker`
See https://docs.docker.com/engine/install/debian/#installation-methods.


### Build and run using Docker
TIP: If you get permission errors when running `docker` commands, try using `sudo docker ...`
```sh
# clone this repo
git clone https://github.com/stefandominicus-takealot/RecSys2025.git
cd RecSys2025

# build the Docker image
docker build -t rec-sys-2025 .

# run the Docker container
docker run --mount type=bind,src="$(pwd)"/recommender_systems,dst=/usr/local/ai/rec-sys-2025/recommender_systems --publish 8888:8888 rec-sys-2025

# find the URL including a token
# e.g: http://127.0.0.1:8888/lab?token=<token>
```
