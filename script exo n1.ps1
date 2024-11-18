# Chemin des dossiers source
$sourceDirectory1 = "C:\FolderTest1"
$sourceDirectory2 = "C:\FolderTest2"

# Chemin des nouveaux dossiers de destination
$EvenFolder = "C:\EvenFolder"
$OddFolder = "C:\OddFolder"

# Créer les dossiers de destination 
New-Item -ItemType Directory -Path $EvenFolder -Force
New-Item -ItemType Directory -Path $OddFolder -Force

# Liste des fichiers à déplacer dans chaque dossier
$EvenFiles = "file2", "file4", "file6", "file8", "file10"
$OddFiles = "file1", "file3", "file5", "file7", "file9"

# Fonction pour déplacer un fichier si il existe
function MoveFileIfExist($source, $destination, $file) { 
    $sourceFile = Join-Path $source $file
    if (Test-Path $sourceFile) 
       { Move-Item $sourceFile $destination -Force } 
 }   


# Déplacer les fichiers du dossier source vers le dossier de destination
foreach ($file in $EvenFiles) {
MoveFileIfExist $sourceDirectory1 $EvenFolder $file
MoveFileIfExist $sourceDirectory2 $EvenFolder $file 
}


foreach ($file in $OddFiles) {
MoveFileIfExist $sourceDirectory1 $OddFolder $file
MoveFileIfExist $sourceDirectory2 $OddFolder $file 
}
Get-History | Format-List | Out-String 
Get-History | Format-List | Out-String | Set-Content .\historique.txt