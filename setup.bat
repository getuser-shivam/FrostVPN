@echo off
title FrostVPN Setup - Dark Theme
color 0A
echo.
echo  ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     
echo  ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     
echo     ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     
echo     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     
echo     ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗
echo     ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
echo.
echo  Dark VPN Setup using OpenVPN
echo  ================================
echo.

echo [1] Checking for OpenVPN installation...
openvpn --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] OpenVPN is not installed or not in PATH
    echo Please install OpenVPN from https://openvpn.net/community-downloads/
    pause
    exit /b 1
)

echo [SUCCESS] OpenVPN found
echo.

echo [2] Creating necessary directories...
if not exist "config" mkdir config
if not exist "logs" mkdir logs
echo [SUCCESS] Directories created
echo.

echo [3] Setup complete! 
echo To connect to FrostVPN:
echo 1. Replace YOUR_SERVER_IP in client.ovpn with your server IP
echo 2. Add your certificates to client.ovpn
echo 3. Run: openvpn --config client.ovpn
echo.

pause
