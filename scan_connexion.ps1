$eventLog = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} -MaxEvents 50

Write-Host "Tentatives de connexion avec erreur de mot de passe :"
foreach ($event in $eventLog) {
    $timeCreated = $event.TimeCreated
    $user = $event.Properties[5].Value
    $clientAddress = $event.Properties[18].Value

    Write-Host "Heure de création : $timeCreated"
    Write-Host "Utilisateur : $user"
    Write-Host "Adresse du client : $clientAddress"
    Write-Host "-------------------------"
}
