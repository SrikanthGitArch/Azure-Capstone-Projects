
## Login to Azure CLI
az login

## Create a resource group at central us
az group create --name garikapaticentralrg --locaton centralus

## Create a resource group at Eastren us
az group create --name garikapatieastrenusrg --locaton eastus2

##deploy WebApps and App Service Plan
az webapp up --name srikanthapp1 --location centralus --resource-group garikapaticentralrg --plan srikanthapp1plan --sku S1 –html
az webapp up --name srikanthapp2 --location eastus2 --resource-group garikapatieastrenusrg --plan srikanthapp2plan --sku S1 –html

##Shell command to mount the fileshare in my file explorer

$connectTestResult = Test-NetConnection -ComputerName srikanthstorageaccnt.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"srikanthstorageaccnt.file.core.windows.net`" /user:`"localhost\srikanthstorageaccnt`" /pass:`"VgkMyxXdUqrQ7IGZKaSRduEFFLxzBSvi9TcE/hSo9q7qbo8hggWUMlVMCOPsITC05zIPWSiE0gz+UGz16pTDcg==`""
    # Mount the drive
    New-PSDrive -Name F -PSProvider FileSystem -Root "\\srikanthstorageaccnt.file.core.windows.net\srikanthfileshare" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
} 
