# n8n stable (recommended)
FROM docker.n8n.io/n8nio/n8n:2.0.2

USER root

# ---- System deps (Alpine) ----
RUN apk add --no-cache \
  python3 \
  py3-virtualenv \
  bash

# ---- Create a venv and install pdf libs into it ----
RUN python3 -m venv /opt/venv \
  && /opt/venv/bin/pip install --upgrade pip \
  && /opt/venv/bin/pip install --no-cache-dir pdfplumber

# Make the venv Python + pip available everywhere (including Execute Command node)
ENV PATH="/opt/venv/bin:${PATH}"

USER node
