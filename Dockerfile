FROM docker.n8n.io/n8nio/n8n:1.59.3

USER root

# Install system deps for Python + PDFs
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    libffi-dev \
    poppler-utils

# Allow pip installs (PEP 668 fix)
RUN python3 -m pip install --upgrade pip \
    && pip3 install --no-cache-dir --break-system-packages \
       pdfplumber pandas

# Create working dirs for n8n file ops
RUN mkdir -p /tmp/n8n \
    && chown -R node:node /tmp/n8n

USER node
