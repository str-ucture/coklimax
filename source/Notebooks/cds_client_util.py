import cdsapi

def initialize_cds_client(cdsapirc_path="../Secrets/.cdsapirc"):
    """
    Initialize the CDS API client using the .cdsapirc file.
    
    Args:
        cdsapirc_path (str): Path to the .cdsapirc file. Defaults to '../Secrets/.cdsapirc'.
    
    Returns:
        cdsapi.Client: An initialized CDS API client instance.
    
    Raises:
        FileNotFoundError: If the .cdsapirc file does not exist.
        ValueError: If 'url' or 'key' are missing in the .cdsapirc file.
    """
    import os
    
    # Check if the file exists
    if not os.path.exists(cdsapirc_path):
        raise FileNotFoundError(f"The .cdsapirc file was not found at {cdsapirc_path}.")
    
    # Read and parse the .cdsapirc file
    with open(cdsapirc_path, "r") as file:
        lines = file.readlines()
        api_url = None
        api_key = None
        for line in lines:
            if line.startswith("url:"):
                api_url = line.split("url:")[1].strip()
            elif line.startswith("key:"):
                api_key = line.split("key:")[1].strip()
    
    # Validate that both url and key are found
    if not api_url or not api_key:
        raise ValueError("The .cdsapirc file is missing the 'url' or 'key'.")
    
    # Initialize and return the CDS API client
    return cdsapi.Client(url=api_url, key=api_key)

# Example Usage
try:
    client = initialize_cds_client()
    print("CDS API Client initialized successfully!")
except (FileNotFoundError, ValueError) as e:
    print(f"Error: {e}")
