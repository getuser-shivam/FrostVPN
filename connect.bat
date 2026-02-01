@echo off
title FrostVPN Connect - Dark Theme
color 0A
cls

echo.
echo  ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     
echo  ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     
echo     ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     
echo     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     
echo     ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗
echo     ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
echo.
echo  Connecting to FrostVPN...
echo  ========================
echo.

if not exist "client.ovpn" (
    echo [ERROR] client.ovpn not found!
    echo Please run setup.bat first and configure your client file.
    pause
    exit /b 1
)

echo [1] Checking OpenVPN installation...
openvpn --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] OpenVPN not found. Please install OpenVPN first.
    pause
    exit /b 1
)

echo [2] Starting VPN connection...
echo Press Ctrl+C to disconnect
echo.

openvpn --config client.ovpn --script-security 2

echo.
echo [DISCONNECTED] VPN connection terminated
pause
