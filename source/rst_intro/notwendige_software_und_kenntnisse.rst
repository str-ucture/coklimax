Required Software and Knowledge
===============================

Jupyter Notebooks are a powerful environment for interactive programming, data analysis, and visualization. To use Jupyter Notebooks on a Windows PC, you need the appropriate software infrastructure. The following guide outlines the necessary steps to prepare your computer and provides freely available resources to acquire basic knowledge before starting the courses.

Setting up the Infrastructure for Jupyter Notebooks on Windows
--------------------------------------------------------------

During the course preparation, we will occasionally work with the Windows Command Prompt (CMD). CMD is a command-line environment that enables you to interact directly with your operating system using text commands. It allows you to start programs, manage files, and control system processes. CMD is especially useful for developers to perform installations or configure tools like Python and Jupyter. 

To open CMD, press the **Windows key**, type ``cmd`` in the search bar, and press **Enter**. For a complete reference of commands and syntax, consult the Microsoft documentation or type ``help`` in the CMD.

1. Installing Python and pip
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To begin, download Python from the official `Python Website <https://www.python.org/downloads/>`_ or the recommended version `Python 3.10 <https://www.python.org/downloads/release/python-3100/>`_. During installation, ensure that the **Add Python to PATH** option is checked.

If Python is not automatically added to the **PATH**, you can configure it manually. The **PATH** is an environment variable that specifies where the operating system can find executables like Python. To manually add Python to the **PATH**, follow these steps:

1. Open the **Start Menu**, search for **Edit Environment Variables**, and open the settings.
2. Click **Environment Variables...** at the bottom of the window.
3. Under **System Variables** or **User Variables**, locate the **Path** variable and click **Edit**.
4. Add the following directories to the **Path**:
    * ``C:/Users/Username/AppData/Local/Programs/Python/Python310`` *(for Python 3.10)*
    * ``C:/Users/Username/AppData/Local/Programs/Python/Python310/Scripts`` *(for tools like pip)*
5. Confirm the changes and restart CMD for them to take effect.

After completing these steps, you should be able to execute Python from CMD using the ``python`` or ``python3`` command. Verify the installation by typing:

.. code-block:: bash

    python --version

2. Setting Up a Python Environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are multiple ways to set up a Python environment.

**Option 1: Using resources from CoKLIMAx repository**

**Step 1:** Install `git <https://git-scm.com/downloads/win>`_ and clone the **CoKLIMAx** repository. Open CMD and navigate to the desired directory for creating a copy of the CoKLIMAx II notebooks.

.. code-block:: bash

    git clone https://github.com/str-ucture/coklimax.git
    cd "./coklimax/source/notebooks"

**Step 2:** Download the required files: `setup_env.bat` and `requirements.txt`. Use the "Save link as" option to download these files from the repository:

* `setup_env.bat <https://raw.githubusercontent.com/str-ucture/coklimax/main/make.bat>`_
* `requirements.txt <https://raw.githubusercontent.com/str-ucture/coklimax/main/requirements.txt>`_

Ensure both files are in the same directory.

**Step 3:** Run the `setup_env.bat` file and provide any necessary permissions. If Python is correctly installed, the script will create a Python environment named **cds_env** in the current folder.

.. note::

    Verify that all steps are followed correctly to ensure the environment is successfully created.

**Option 2: Using Anaconda Distribution**

If you prefer using Anaconda for managing your Python environment, follow these steps:

1. **Download and Install Anaconda**:
   * Download the latest version of `Anaconda <https://www.anaconda.com/products/distribution>`_ for Windows.
   * Follow the installation instructions and ensure you add Anaconda to the PATH (optional but recommended).

2. **Create a New Environment**:
   Open the Anaconda Prompt (search for "Anaconda Prompt" in the Start Menu) and run the following commands:

   .. code-block:: bash

       conda create -n cds_env python=3.10 -y
       conda activate cds_env

3. **Install Required Packages**:
   Navigate to the folder containing the `requirements.txt` file and run:

   .. code-block:: bash

       pip install -r requirements.txt

4. **Verify the Environment**:
   Check the installed packages and Python version to confirm the setup:

   .. code-block:: bash

       python --version
       pip list

Setting up the Infrastructure for Jupyter Notebooks on MacOS/Linux
------------------------------------------------------------------

**Work in progress**