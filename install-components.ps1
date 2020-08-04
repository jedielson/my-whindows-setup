### PASSO 1 - Efetua liberação de acesso ao powershell.
#######################################################
Set-ExecutionPolicy Bypass -Scope Process

# ##############################################################################################
### PASSO 2 - Efetua um teste de conexão com a internet para garantir os recursos necessários.
###     ALERTA: O Windows tem comandos diferentes de acordo com a sua versão, se os comandos abaixo
###             não funcionarem, verifique: https://peter.hahndorf.eu/blog/WindowsFeatureViaCmd.html
# ##############################################################################################
Write-Host "Verificando se ha conexao com a internet..."
$hasInternet = (Test-Connection google.com -Count 3 -Quiet);
if ($hasInternet -eq $false) {
  Write-Host "Concluido teste de internet com FALHA..."
  return $false
}
Write-Host "Concluido teste de internet com sucesso..."

## Instalando chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


## Instalando programas básicos
& cinst microsoft-windows-terminal
& cinst notepadplusplus.install -Y
& cinst winrar -Y

## desenvolvimento
& cinst dotnetcore-sdk -y
& cinst git -y
& cinst nodejs -y
& cinst vscode -Y
## Help
## https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community?view=vs-2019
## https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio?view=vs-2019
& cinst visualstudio2019community -y  --package-parameters "--add Microsoft.VisualStudio.Workload.CoreEditor;Microsoft.VisualStudio.Workload.NetWeb;Microsoft.VisualStudio.Workload.NetCoreTools;Microsoft.VisualStudio.Workload.NetCrossPlat --passive --locale en-US"

## Meus Programas
& cinst slack -y
## & cinst microsoft-windows-terminal -Y

## Container
& cinst docker -y
& cinst docker-compose -y
& cinst docker-machine -y
& cinst docker-desktop -y
