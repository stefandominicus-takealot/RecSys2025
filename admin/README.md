# RecSys2025: Admin
These steps are only useful for initial setup, and may rely on Takealot employee credentials.

## Environment
```sh
# Create a Python virtual environment
make pyenv

# Compile and install Python dependencies
make update
```

Make sure that any updates to `requirements.txt` are committed. Others will not be expected to re-compile the necessary Python dependencies.

## Data
```sh
# Fetch datasets from BigQuery, and persist locally as CSV files
python -m admin.fetch_data
```
