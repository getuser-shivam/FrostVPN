# FrostVPN 🌙

A dark-themed OpenVPN setup for secure desktop connections.

## Features

- 🔐 **Secure VPN Connection** using OpenVPN protocol
- 🌙 **Dark Theme Interface** with styled command-line tools
- 🖥️ **Cross-Platform Support** (Windows, Linux, macOS)
- ⚡ **High Performance** with AES-256 encryption
- 🛡️ **Military-Grade Security** with SHA256 authentication

## Quick Start

### Windows Setup

1. **Run the setup script:**
   ```cmd
   setup.bat
   ```

2. **Generate certificates** (Linux/WSL):
   ```bash
   chmod +x generate-keys.sh
   ./generate-keys.sh
   ```

3. **Configure client.ovpn:**
   - Replace `YOUR_SERVER_IP` with your server's IP address
   - Add the generated certificates from `keys/` folder

4. **Connect to VPN:**
   ```cmd
   connect.bat
   ```

### Server Setup (Ubuntu/Debian)

1. **Install OpenVPN:**
   ```bash
   sudo apt update
   sudo apt install openvpn easy-rsa
   ```

2. **Generate certificates:**
   ```bash
   chmod +x generate-keys.sh
   ./generate-keys.sh
   ```

3. **Configure server:**
   ```bash
   sudo cp server.conf /etc/openvpn/
   sudo cp keys/* /etc/openvpn/
   sudo systemctl start openvpn@server
   sudo systemctl enable openvpn@server
   ```

4. **Configure firewall:**
   ```bash
   sudo ufw allow 1194/udp
   sudo ufw allow OpenSSH
   sudo ufw enable
   ```

## File Structure

```
FrostVPN/
├── server.conf          # OpenVPN server configuration
├── client.ovpn          # Client configuration template
├── setup.bat           # Windows setup script (dark themed)
├── connect.bat         # Windows connection script (dark themed)
├── generate-keys.sh    # Certificate generation script
├── keys/               # Generated certificates (create after running script)
└── README.md           # This file
```

## Security Features

- **AES-256-CBC Encryption** for data protection
- **SHA256 Authentication** for secure handshake
- **TLS Crypt** for additional security layer
- **Perfect Forward Secrecy** with ECDH curve secp384r1

## Configuration Options

### Server Configuration
- Port: 1194 UDP
- Network: 10.8.0.0/24
- DNS: 8.8.8.8, 8.8.4.4 (Google DNS)
- Redirect all traffic through VPN

### Client Configuration
- Auto-reconnect on connection loss
- Certificate-based authentication
- TLS crypt protection

## Troubleshooting

### Connection Issues
1. Check server IP in `client.ovpn`
2. Verify firewall allows port 1194/udp
3. Ensure certificates are properly placed
4. Check OpenVPN logs in `/var/log/openvpn.log`

### Certificate Issues
1. Regenerate certificates using `generate-keys.sh`
2. Ensure certificate validity dates
3. Check file permissions

## Security Notes

- Keep private keys secure and never share them
- Regularly rotate certificates (recommended annually)
- Use strong passwords for certificate generation
- Monitor VPN connection logs for suspicious activity

## License

This project is open source and available under the MIT License.

---

**⚠️ Disclaimer:** This VPN setup is for educational and personal use. Ensure compliance with local laws and regulations when using VPN services.