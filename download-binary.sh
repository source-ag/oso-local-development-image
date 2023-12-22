#!/bin/bash

# Determine the architecture from the TARGETARCH environment variable
ARCH=$TARGETARCH

# Set the download URL based on the architecture
if [ "$ARCH" = "amd64" ]; then
    URL="https://oso-local-development-binary.s3.amazonaws.com/oso-local-development-binary-linux-x86_64.tar.gz"
elif [ "$ARCH" = "arm64" ]; then
    URL="https://oso-local-development-binary.s3.amazonaws.com/dev/oso-local-development-binary-linux-arm64.tar.gz"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

# Define the output file name
OUTPUT_FILE="oso-local-development-binary.tar.gz"

# Download the binary
echo "Downloading binary for $ARCH..."
curl -L $URL -o $OUTPUT_FILE

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download complete. Decompressing the binary..."

    # Decompress the binary
    tar -xzf $OUTPUT_FILE

    # Check if the decompression was successful
    if [ $? -eq 0 ]; then
        echo "Binary decompressed successfully."
        # Here you might want to move or use the binary.
    else
        echo "Failed to decompress the binary."
        exit 1
    fi
else
    echo "Failed to download the binary."
    exit 1
fi
