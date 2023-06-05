while ($true) {
    $administrators = Get-LocalGroupMember -Group "Administrateurs"

    Write-Host "Membres du groupe Administrateurs :"
    foreach ($admin in $administrators) {
        Write-Host $admin.Name
    }

    Write-Host "Options :"
    Write-Host "1. Ajouter un nouvel administrateur"
    Write-Host "2. Modifier le mot de passe d'un administrateur"
    Write-Host "3. Supprimer un administrateur via son nom d'utilisateur"
    Write-Host "4. Quitter le programme"

    $option = Read-Host "Entrez le numéro de l'option choisie"

    switch ($option) {
        1 {
            $Username = Read-Host "Entrez le nom d'utilisateur"
            $Password = Read-Host "Entrez le mot de passe" -AsSecureString

            # Créer le nouvel utilisateur
            New-LocalUser -Name $Username -Password $Password -FullName $Username -Description "Nouvel utilisateur"

            # Ajouter l'utilisateur au groupe Administrateurs
            Add-LocalGroupMember -Group "Administrateurs" -Member $Username

            Write-Host "Nouvel administrateur ajouté avec succès."
        }
        2 {
            $Username = Read-Host "Entrez le nom d'utilisateur de l'administrateur à modifier"
            $Password = Read-Host "Entrez le nouveau mot de passe" -AsSecureString

            # Modifier le mot de passe de l'administrateur
            Set-LocalUser -Name $Username -Password $Password

            Write-Host "Mot de passe de l'administrateur modifié avec succès."
        }
        3 {
            $Username = Read-Host "Entrez le nom d'utilisateur de l'administrateur à supprimer"

            # Supprimer l'administrateur
            Remove-LocalUser -Name $Username

            Write-Host "Administrateur supprimé avec succès."
        }
        4 {
            # Quitter le programme
            exit
        }
        default {
            Write-Host "Option invalide."
        }
    }
}
