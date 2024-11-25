.. _quickstartGuide:

Quick Start Guide
=================

Step 1: Download the Notebooks
------------------------------

You can either clone this repository or download the notebooks directly into your local machine.

Option 1: Clone the Repository
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    git clone https://github.com/str-ucture/coklimax.git
    cd "./coklimax/source/notebooks"

Option 2: Download the Files Manually
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- Download the desired notebook(s) for **source** directory, ``requirements.txt``, and ``setup_env.bat`` (if using Windows) from the repository to a folder on your local machine.

Step 2: Set Up the Python Environment
-------------------------------------

It's recommended to use a Python virtual environment to keep dependencies isolated.

Option 1: Use the Provided Setup Script (Windows Only)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Navigate to the folder containing the downloaded files.
2. Run the ``setup_env.bat`` file and grant any necessary permissions.
    - This script will create a virtual environment named ``cds_venv`` inside the folder.

Option 2: Manually Create a Virtual Environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Create a Virtual Environment

   Open your terminal or command prompt, navigate to the folder, and run:

   .. code-block:: bash

       python -m venv cds_venv

   To specify Python 3.10:

   .. code-block:: bash

       python3.10 -m venv cds_venv

   .. code-block:: bash

       python -3.10 -m venv cds_venv

   .. code-block:: bash

       py -3.10 -m venv cds_venv

   If any problem arises with Python version, check the Python versions installed on your system using:

   .. code-block:: bash

       py -0

2. Activate the Virtual Environment

   - On Windows:

     .. code-block:: bash

         .\cds_venv\Scripts\activate

   You should see ``(cds_venv)`` at the beginning of your command line.

3. Install Required Libraries

   Install the necessary Python libraries using ``requirements.txt``:

   .. code-block:: bash

       pip install -r requirements.txt

   If you encounter issues, install the libraries individually:

   .. code-block:: bash

       pip install cdsapi numpy netCDF4 ipywidgets matplotlib requests sentinelhub getpass4
