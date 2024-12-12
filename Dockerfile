# Use a lightweight Julia image as the base
FROM julia:1.11.2-alpine

# Set the working directory
WORKDIR /workspace

# Copy the project files
COPY . .

# Install dependencies
RUN julia -e 'using Pkg; Pkg.add("Oceananigans")'

# Expose the Jupyter Notebook server port
EXPOSE 8888

# Command to run the Jupyter Notebook server
CMD ["julia", "-e", "using Pkg; Pkg.activate(\".\"); using Jupyter; Jupyter.notebook()"]
