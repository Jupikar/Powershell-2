# Dossiers sources
$sourceDirectory1 = "C:\FolderTest1"
$sourceDirectory2 = "C:\FolderTest2"

# Dossiers de destination
$evenFolder = "C:\EvenFolder"
$oddFolder = "C:\OddFolder"

# Créer les dossiers de destination si nécessaire
New-Item -ItemType directory -Path $evenFolder -Force
New-Item -ItemType directory -Path $oddFolder -Force

# Trier les fichiers dans le premier dossier
foreach ($file in Get-ChildItem -Path $sourceDirectory1) {
    # Extraire le dernier chiffre du nom de fichier
    if ($file.BaseName -match '\d+$') {
        $lastDigit = $matches[0]
        if ([int]$lastDigit % 2 -eq 0) {
            # Déplacer vers EvenFolder
            Move-Item $file.FullName (Join-Path $evenFolder $file.Name) -Force
        } else {
            # Déplacer vers OddFolder
            Move-Item $file.FullName (Join-Path $oddFolder $file.Name) -Force
        }
    } else {
        Write-Host "Le fichier $($file.Name) n'a pas de chiffre en fin de nom"
    }
}

# Trier les fichiers dans le deuxième dossier
# (Même logique que pour le premier dossier)
foreach ($file in Get-ChildItem -Path $sourceDirectory2) {
    # Extraire le dernier chiffre du nom de fichier
    if ($file.BaseName -match '\d+$') {
        $lastDigit = $matches[0]
        if ([int]$lastDigit % 2 -eq 0) {
            # Déplacer vers EvenFolder
            Move-Item $file.FullName (Join-Path $evenFolder $file.Name) -Force
        } else {
            # Déplacer vers OddFolder
            Move-Item $file.FullName (Join-Path $oddFolder $file.Name) -Force
        }
    } else {
        Write-Host "Le fichier $($file.Name) n'a pas de chiffre en fin de nom"
    }
}