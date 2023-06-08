# Fonction pour scanner les ports sur une adresse IP
function Scan-IPPorts($ipAddress) {
    # Fonction pour v�rifier l'�tat d'un port
    function Test-Port($ip, $port) {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        try {
            $tcpClient.Connect($ip, $port)
            $tcpClient.Close()
            return "Ouvert"
        }
        catch {
            return "Ferm�"
        }
    }

    # Liste des ports � scanner
    $ports = @(80, 443, 3389, 22, 21, 25)

    # Scanner les ports et afficher le r�sultat
    Write-Host "Scan en cours pour l'adresse IP $ipAddress..."
    foreach ($port in $ports) {
        $portStatus = Test-Port $ipAddress $port
        Write-Host "Port $port : $portStatus"
    }
}

$ipAddress = Read-Host "Entrez l'adresse IP � scanner"
Scan-IPPorts $ipAddress
