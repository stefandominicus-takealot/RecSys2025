# keep Python version in sync with Makefile
FROM python:3.10.17

WORKDIR /usr/local/ai/rec-sys-2025

# sources
COPY recommender_systems recommender_systems
COPY tfx_tfrs tfx_tfrs

# install/update python dependencies
COPY pyproject.toml requirements.txt ./
RUN pip install -r requirements.txt

CMD [ "jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0" ]
