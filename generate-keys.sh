#!/bin/bash
# FrostVPN Certificate Generation Script
# This script generates all necessary certificates for OpenVPN

set -e

echo "🔐 FrostVPN Certificate Generator"
echo "================================="

# Create directory structure
mkdir -p keys
cd keys

# Generate CA certificate
echo "📋 Generating CA certificate..."
openssl genrsa -out ca.key 4096
openssl req -new -x509 -days 3650 -key ca.key -out ca.crt -subj "/C=US/ST=State/L=City/O=FrostVPN/OU=VPN/CN=FrostVPN-CA"

# Generate server certificate and key
echo "🖥️  Generating server certificate..."
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -subj "/C=US/ST=State/L=City/O=FrostVPN/OU=VPN/CN=server"
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 3650 -sha256

# Generate client certificate and key
echo "💻 Generating client certificate..."
openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr -subj "/C=US/ST=State/L=City/O=FrostVPN/OU=VPN/CN=client"
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 3650 -sha256

# Generate TLS crypt key
echo "🔒 Generating TLS crypt key..."
openvpn --genkey --secret tls-crypt.key

# Generate Diffie-Hellman parameters
echo "🔐 Generating DH parameters..."
openssl dhparam -out dh.pem 2048

echo "✅ All certificates generated successfully!"
echo ""
echo "Files created in ./keys/:"
echo "  - ca.crt, ca.key (Certificate Authority)"
echo "  - server.crt, server.key (Server certificate)"
echo "  - client.crt, client.key (Client certificate)"
echo "  - tls-crypt.key (TLS encryption)"
echo "  - dh.pem (Diffie-Hellman parameters)"
