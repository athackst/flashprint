FROM ubuntu:jammy

RUN echo "Flashbprint flashforge/title note "|debconf-set-selections

RUN apt-get update

# Install necessary dependencies
RUN apt-get install --yes --no-install-recommends \
    wget \
    python3 \
    python3-pip \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libegl1-mesa \
    mesa-utils 

# Install gdown for downloading files from Google Drive
RUN pip install gdown

# Flashprint software
# https://flashforge.com/pages/software-flashprint
# Local copy added here for convenience
COPY flashprint5_5.8.7_amd64.deb /tmp/flashprint.deb

# FlashPrint itself finds info about version updates here:
# http://www.ishare3d.com/3dapp/public/FlashPrint-ii/appInfo1
# You'll get a link to the changelog in the introUrl field

# You can also find later versions here, but FlashForge doesn't always update the page:
# http://www.flashforge.com/support-center/flashprint-support/

# Download the file from Google Drive
# Replace the `file_id` with the correct ID from the Google Drive URL
# RUN gdown 'https://drive.google.com/uc?id=1Ztpt0CueKa1w100QCZbpG5FMtacuOSqb' -O /tmp/flashprint.deb

# Install the .deb package
RUN apt-get install --yes /tmp/flashprint.deb

# Create a symbolic link to make 'flashprint' globally accessible
RUN ln -s /usr/share/FlashPrint5/FlashPrint /usr/local/bin/flashprint

# Cleanup
RUN rm -rf /tmp/flashprint.deb /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get clean
