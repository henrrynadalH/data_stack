# Use a base image with Python and Node.js
FROM python:3.8

# Set environment variables
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install system dependencies (including Node.js, npm, Git, and Oh My Zsh)
RUN apt-get update && apt-get install -y \
    git \
    nodejs \
    npm \
    zsh \
    curl

# Install Oh My Zsh without user interaction
RUN sh -c "ZSH=$HOME/.oh-my-zsh && \
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | \
    ZSH=$ZSH ZSH_CUSTOM=$ZSH/custom sh"

# Create and activate virtual environment
RUN python -m venv $VIRTUAL_ENV

# Install JupyterLab and other dependencies
RUN jupyter labextension install @jupyterlab/git && \
    pip install --upgrade jupyterlab jupyterlab-git && \
    jupyter serverextension enable --py jupyterlab_git && \
    jupyter lab clean && jupyter lab build


# Expose the JupyterLab port
EXPOSE 8888

# Set the working directory
WORKDIR /app

# Copy your project files into the container
COPY . /app

# Copy JupyterLab config file
# COPY jupyter_lab_config.py /opt/venv/share/jupyter/lab/

# Start Zsh to make the terminal look nice, and then start JupyterLab
CMD ["zsh", "-c", "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root  --NotebookApp.token=''"]
