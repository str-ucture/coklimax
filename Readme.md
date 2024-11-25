# Climate Data Store (CDS) Data Downloader

This repository provides Jupyter Notebooks that enable users to download climate data directly from the [Climate Data Store (CDS)](https://cds.climate.copernicus.eu/) and work with them.

## Prerequisities (For a better experience)

Before you begin, make sure that you have the following:
* **Python 3.7 or higher**. ([Python 3.10](https://www.python.org/downloads/release/python-31015/) is recommended)
* An **Integrated Development Environment (IDE)**. (e.g., Visual Studio Code)
* **Jupyter Notebook** is installed and accessible within your IDE.
* An active **CDS Account** with API credentials.
    * If you don't have one, register at [CDS Registration Page](https://cds.climate.copernicus.eu/).

## Quick Start Guide

### Step 1: Download the Notebooks

You can either clone this repository or download the notebooks directly into your local machine.

#### Option 1: Clone this Repository

```bash
git clone https://github.com/str-ucture/coklimax.git
cd "./coklimax/source/notebooks"
```

#### Option 2: Download the Files Manually
* Download the desired notebook(s) for **source** directory, `requirements.txt`, and `setup_env.bat` (if using Windows) from the repository to a folder on your local machine.

### Setup 2: Set Up the Python Environment

It's recommended to use a Python virtual environment to keep dependencies isolated.

#### Option 1: Use the Provided Setup Script (Windows Only)
1. Navigate to the folder containing the downloaded files.
2. Run the `setup_env.bat` file and grant any necessary permissions.
    * This script will create a virtual environment named `cds_venv` inside the folder.

#### Option 2: Manually Create a Virtual Environment

1. Create a Virtual Environment
Open your terminal or command prompt, nagivate to the folder, and run:
```
python -m venv cds_venv
```

To specify Python3.10:
```
python3.10 -m venv cds_venv
or
python -3.10 -m venv cds_venv
or
py -3.10 -m venv cds_venv
```

If any problem arises, check the python versions installed on your system using

```
py -0
```

2. Activate the Virtual Environment
* On Windows:
```
.\cds_venv\Scripts\activate
```

* On macOS\Linux:
```
source cds_venv/bin/activate
```

You should see `(cds_venv)` at the beginning of your command line.

3. Install Required Libraries
Install the necessary Python libraries using `requirements.txt`:

```
pip install -r requirements.txt
```

If you encounter issues, install the libraries individually:

```
pip install cdsapi numpy netCDF4 ipywidgets matplotlib requests sentinelhub getpass4
```

### Setup 3: Configure CDS API Credentials

#### Option 1: Utilizing the .cdsapirc file
1. Obtain Your API Key
    * Log in to your **CDS account**.
    * Go to **Your Profile**.
    * Find your API key under **Personal Access Token**. It should look like:

```
Personal Access Token: 8f65d1a3-2b9c-4a8d-a0fe-b32d7b0f1234
```
2. Set Up the API Credentials
    * Create a file named `.cdsapirc` in your home directory:
        * **On Windows**: `C:\Users\YourUsername\.cdsapirc`
        * **On macOS/Linux**: `/home/YourUsername/.cdsapirc`
    * Add the following content to the file, replacing with your actual URL and API key:
```
url: https://cds.climate.copernicus.eu/api
key: 8f65d1a3-2b9c-4a8d-a0fe-b32d7b0f1234
```

#### Option 2.1: Utilizing API key directly in the Notebook
You can directly add these lines of code within the notebook to set up the API. Before your run the code, make sure to replace the API key with your own CDS API key (Personal Access Token).
```
api_key = "8f65d1a3-2b9c-4a8d-a0fe-b32d7b0f1234"
api_url = https://cds.climate.copernicus.eu/api
clinet: cdsapi.Client(url=api_url, key=api_key)
```

Example code,
```
import cdsapi

api_key = "8f65d1a3-2b9c-4a8d-a0fe-b32d7b0f1234"
api_url = "https://cds.climate.copernicus.eu/api"
client= cdsapi.Client(url=api_url, key=api_key)

dataset = "reanalysis-era5-land-monthly-means"
request = {
    "product_type": ["monthly_averaged_reanalysis"],
    "variable": ["2m_temperature"],
    "year": ["1950"],
    "month": ["01"],
    "time": ["00:00"],
    "data_format": "netcdf",
    "download_format": "unarchived",
    "area": [56, 5.8, 47.2, 15],
}
target = 'download.nc'
client.retrieve(dataset, request, target)
```

#### Option 2.2 Utilizing the API key as a passkey

The current version of Notebook (e.g. ERA5_Land_Hourly_Data.ipynb) is prepared such that the API key does not need to be kept inside the notebook for security purpose. The API key can be entered once the **CDS API key and authentication** cell is executed.

![API key and Authentication](./Data/gif/api_key_authentication.gif)

This code will download the dataset (`download.nc`) in the current folder.

### Step 4: Open and Run the Notebooks
1. Open the Notebook
    * Launch your IDE.
    * Open the folder containing the notebooks.
    * Open the desired `.ipynb` file.
2. Run the Notebook
    * Ensure that your virtual environment is activated.
    * Run each cell in the notebook sequentially.
    * Follow any additional instructions provided within the notebook.


### Additional Information
* **Assistance**: If you are new to Jupyter Notebooks, you can learn more about how to use them [here](https://jupyter.org/documentation).
* **CDS API Documentation**: For more details on the CDS API, visit the [official documentation](https://cds.climate.copernicus.eu/user-guide)

### License
[MIT license](./LICENSE)