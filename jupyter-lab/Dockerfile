# Use a base image with Python and Node.js
FROM python:3.8

# Set environment variables
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install system dependencies (including Node.js, npm, Git, and Oh My Zsh)
RUN apt-get update && apt-get install -y \
    git=1:2.39.2-1.1 \
    nodejs=18.19.0+dfsg-6~deb12u1 \
    npm=9.2.0~ds1-1 \
    zsh=5.9-4+b2 \
    curl=7.88.1-10+deb12u5

# Install Oh My Zsh without user interaction
RUN sh -c "ZSH=$HOME/.oh-my-zsh && \
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | \
    ZSH=$ZSH ZSH_CUSTOM=$ZSH/custom sh"

# Create and activate virtual environment
RUN python -m venv $VIRTUAL_ENV

COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && \
    pip install -r /app/requirements.txt



# Install JupyterLab and other dependencies
RUN pip install --upgrade jupyterlab==4.1.4 jupyterlab-git && \
    jupyter labextension install @jupyterlab/git && \
    jupyter labextension enable --py jupyterlab_git && \
    jupyter lab clean && jupyter lab build


# Expose the JupyterLab port
EXPOSE 8888

# Set the working directory
WORKDIR /app/my_data

# Copy your project files into the container
COPY . /app

# Start Zsh to make the terminal look nice, and then start JupyterLab
CMD ["zsh", "-c", "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root  --NotebookApp.token=''"]
