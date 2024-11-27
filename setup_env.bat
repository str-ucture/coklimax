@echo off

echo Setting up Python environment...

REM Check if virtual environment exists, if not create one
if not exist cds_venv (
    echo Attempting to create virtual environment with 'python'
    python -m venv cds_venv || (
        echo 'python' command failed, trying 'python3'
        python3 -m venv cds_venv || (
            echo 'python3' command failed, trying 'py'
            py -m venv cds_venv || (
                echo Failed to create virtual environment. Please check Python installation.
                exit /b 1
            )
        )
    )
)

echo Virtual environment created successfully (or it already exists).

REM Activate the virtual environment
call cds_venv\Scripts\activate

REM Install dependencies from requirements.txt
pip install -r requirements.txt

echo Python environment set up successfully.

pause