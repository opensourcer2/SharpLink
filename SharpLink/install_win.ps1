New-Item -ItemType Directory -Force -Path C:\ToxTunnel

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }

Copy-Item -Force -Path $PSScriptRoot\* -Destination C:\ToxTunnel\

$PATH = [Environment]::GetEnvironmentVariable("PATH")
$toxtunnel_path = "C:\ToxTunnel"
if( $PATH -notlike "*"+$toxtunnel_path+"*" ){
    [Environment]::SetEnvironmentVariable("PATH", "$PATH;$toxtunnel_path", "Machine")
}