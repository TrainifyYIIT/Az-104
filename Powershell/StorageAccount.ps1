#Check and Create Azure Resource Group
$RGName = "RG-0206"
$Location = "West Europe"

$CheckRG = Get-AzResourceGroup -Name $RGName -ErrorAction SilentlyContinue

if($CheckRG)
{
    Write-Host "Resource Group Already Exists"
    Write-Host "Resource Group Name is" $CheckRG.ResourceGroupName
}
else
{
    $NewRG = New-AzResourceGroup -Name $RGName -Location $Location
    Write-Host "Resource Group Created"
    Write-Host "Resource Group Name is" $NewRG.ResourceGroupName

}

#Check and Create Storage Account
$storageAccountName = "stortrfy010201"

$CheckSA = Get-AzStorageAccount -Name $storageAccountName -ResourceGroupName $RGName -ErrorAction SilentlyContinue

if($CheckSA)
{
    Write-Host "Storage Account Already Exists"
    Write-Host "Storage Account Name is" $CheckSA.StorageAccountName
}
else
{
    $NewSA = New-AzStorageAccount -Name $storageAccountName -Location $Location -ResourceGroupName $RGName -SkuName Standard_LRS -Kind StorageV2 -AccessTier Hot
    Write-Host "Storage Account Created"
    Write-Host "Storage Account Name is" $NewSA.StorageAccountName

}