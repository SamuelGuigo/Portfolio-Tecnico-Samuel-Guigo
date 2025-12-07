#requires -version 5.1
<#!
.SYNOPSIS
    Assistente gráfico de backup para copiar arquivos e pastas para um destino (ex.: pendrive) com barra de progresso.

.DESCRIPTION
    Permite selecionar diversos arquivos ou pastas, escolher o destino do backup, acompanhar o progresso com estimativa de tempo
    restante e visualizar itens que falharam. Copia o que for possível e lista separadamente o que não pôde ser copiado.

.NOTES
    Execute com PowerShell em Windows ("powershell.exe -ExecutionPolicy Bypass -File .\\BackupAssistant.ps1").
!>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Estado compartilhado
$backupItems = New-Object System.Collections.Generic.List[Hashtable]
$errors = New-Object System.Collections.Generic.List[string]

function Add-ItemToListView {
    param(
        [System.Windows.Forms.ListView]$ListView,
        [string]$Path,
        [string]$Kind
    )

    $item = New-Object System.Windows.Forms.ListViewItem($Path)
    $item.SubItems.Add($Kind) | Out-Null
    $ListView.Items.Add($item) | Out-Null
}

function Get-FilesForItem {
    param(
        [string]$Path
    )

    if (Test-Path -LiteralPath $Path -PathType Leaf) {
        return ,@(Get-Item -LiteralPath $Path)
    }
    elseif (Test-Path -LiteralPath $Path -PathType Container) {
        return Get-ChildItem -LiteralPath $Path -File -Recurse
    }
    else {
        throw "Caminho inválido: $Path"
    }
}

function Build-CopyPlan {
    param(
        [System.Collections.Generic.List[Hashtable]]$Items,
        [string]$Destination
    )

    $plan = @()

    foreach ($entry in $Items) {
        $sourcePath = $entry.Path
        $baseName = Split-Path -Path $sourcePath -Leaf
        $files = Get-FilesForItem -Path $sourcePath

        foreach ($file in $files) {
            $relative = Resolve-Path -LiteralPath $file.FullName | Split-Path -NoQualifier
            if ($entry.Kind -eq 'Arquivo') {
                $target = Join-Path -Path $Destination -ChildPath $baseName
            }
            else {
                $trimmed = $file.FullName.Substring($sourcePath.Length).TrimStart('\','/')
                $target = Join-Path -Path $Destination -ChildPath (Join-Path -Path $baseName -ChildPath $trimmed)
            }
            $plan += [pscustomobject]@{
                Source      = $file.FullName
                Destination = $target
                Length      = $file.Length
            }
        }
    }

    return $plan
}

function Calculate-TotalBytes {
    param([object[]]$Plan)
    return ($Plan | Measure-Object -Property Length -Sum).Sum
}

function Ensure-Destination {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

function Copy-Plan {
    param(
        [object[]]$Plan,
        [System.ComponentModel.BackgroundWorker]$Worker
    )

    $totalBytes = Calculate-TotalBytes -Plan $Plan
    $copiedBytes = 0
    $sw = [System.Diagnostics.Stopwatch]::StartNew()

    foreach ($file in $Plan) {
        $percent = if ($totalBytes -gt 0) { [math]::Round(($copiedBytes / $totalBytes) * 100) } else { 0 }
        $elapsed = $sw.Elapsed
        $eta = if ($copiedBytes -gt 0) {
            $remaining = $totalBytes - $copiedBytes
            $rate = $copiedBytes / $elapsed.TotalSeconds
            if ($rate -gt 0) {
                [TimeSpan]::FromSeconds($remaining / $rate)
            }
        }

        $Worker.ReportProgress($percent, [pscustomobject]@{
            CurrentFile = $file.Source
            CopiedBytes = $copiedBytes
            TotalBytes  = $totalBytes
            Elapsed     = $elapsed
            ETA         = $eta
        })

        try {
            Ensure-Destination -Path (Split-Path -Path $file.Destination -Parent)
            Copy-Item -LiteralPath $file.Source -Destination $file.Destination -Force -ErrorAction Stop
        }
        catch {
            $errors.Add($file.Source) | Out-Null
        }
        finally {
            $copiedBytes += $file.Length
        }
    }

    $Worker.ReportProgress(100, [pscustomobject]@{
        CurrentFile = 'Concluído'
        CopiedBytes = $totalBytes
        TotalBytes  = $totalBytes
        Elapsed     = $sw.Elapsed
        ETA         = [TimeSpan]::Zero
    })

    $sw.Stop()
}

# --- Interface gráfica ---
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Assistente de Backup'
$form.Size = New-Object System.Drawing.Size(820, 520)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false

$labelDesc = New-Object System.Windows.Forms.Label
$labelDesc.Text = 'Selecione arquivos ou pastas para copiar para seu backup. O que não for copiado será listado.'
$labelDesc.AutoSize = $true
$labelDesc.Location = New-Object System.Drawing.Point(10, 10)
$form.Controls.Add($labelDesc)

$listView = New-Object System.Windows.Forms.ListView
$listView.Location = New-Object System.Drawing.Point(10, 40)
$listView.Size = New-Object System.Drawing.Size(780, 200)
$listView.View = 'Details'
$listView.FullRowSelect = $true
$listView.Columns.Add('Caminho', 650) | Out-Null
$listView.Columns.Add('Tipo', 100) | Out-Null
$form.Controls.Add($listView)

$btnAddFile = New-Object System.Windows.Forms.Button
$btnAddFile.Text = 'Adicionar Arquivo'
$btnAddFile.Location = New-Object System.Drawing.Point(10, 250)
$form.Controls.Add($btnAddFile)

$btnAddFolder = New-Object System.Windows.Forms.Button
$btnAddFolder.Text = 'Adicionar Pasta'
$btnAddFolder.Location = New-Object System.Drawing.Point(140, 250)
$form.Controls.Add($btnAddFolder)

$btnRemove = New-Object System.Windows.Forms.Button
$btnRemove.Text = 'Remover Selecionado'
$btnRemove.Location = New-Object System.Drawing.Point(270, 250)
$form.Controls.Add($btnRemove)

$labelDest = New-Object System.Windows.Forms.Label
$labelDest.Text = 'Destino do backup (ex.: pendrive):'
$labelDest.AutoSize = $true
$labelDest.Location = New-Object System.Drawing.Point(10, 290)
$form.Controls.Add($labelDest)

$txtDestination = New-Object System.Windows.Forms.TextBox
$txtDestination.Location = New-Object System.Drawing.Point(10, 310)
$txtDestination.Size = New-Object System.Drawing.Size(650, 25)
$form.Controls.Add($txtDestination)

$btnChooseDest = New-Object System.Windows.Forms.Button
$btnChooseDest.Text = 'Escolher'
$btnChooseDest.Location = New-Object System.Drawing.Point(670, 308)
$form.Controls.Add($btnChooseDest)

$progress = New-Object System.Windows.Forms.ProgressBar
$progress.Location = New-Object System.Drawing.Point(10, 350)
$progress.Size = New-Object System.Drawing.Size(780, 25)
$progress.Minimum = 0
$progress.Maximum = 100
$form.Controls.Add($progress)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(10, 380)
$statusLabel.Text = 'Aguardando início do backup.'
$form.Controls.Add($statusLabel)

$btnStart = New-Object System.Windows.Forms.Button
$btnStart.Text = 'Iniciar Backup'
$btnStart.Location = New-Object System.Drawing.Point(10, 410)
$btnStart.Size = New-Object System.Drawing.Size(120, 30)
$form.Controls.Add($btnStart)

$errorLabel = New-Object System.Windows.Forms.Label
$errorLabel.Text = 'Itens não copiados:'
$errorLabel.AutoSize = $true
$errorLabel.Location = New-Object System.Drawing.Point(150, 415)
$form.Controls.Add($errorLabel)

$errorList = New-Object System.Windows.Forms.ListBox
$errorList.Location = New-Object System.Drawing.Point(270, 410)
$errorList.Size = New-Object System.Drawing.Size(520, 70)
$form.Controls.Add($errorList)

$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFolderDialog = New-Object System.Windows.Forms.FolderBrowserDialog
$destFolderDialog = New-Object System.Windows.Forms.FolderBrowserDialog

$worker = New-Object System.ComponentModel.BackgroundWorker
$worker.WorkerReportsProgress = $true

# --- Eventos ---
$btnAddFile.Add_Click({
    if ($openFileDialog.ShowDialog() -eq 'OK') {
        $path = $openFileDialog.FileName
        $backupItems.Add(@{ Path = $path; Kind = 'Arquivo' }) | Out-Null
        Add-ItemToListView -ListView $listView -Path $path -Kind 'Arquivo'
    }
})

$btnAddFolder.Add_Click({
    if ($openFolderDialog.ShowDialog() -eq 'OK') {
        $path = $openFolderDialog.SelectedPath
        $backupItems.Add(@{ Path = $path; Kind = 'Pasta' }) | Out-Null
        Add-ItemToListView -ListView $listView -Path $path -Kind 'Pasta'
    }
})

$btnRemove.Add_Click({
    foreach ($selected in @($listView.SelectedItems)) {
        $index = $selected.Index
        $listView.Items.Remove($selected)
        $backupItems.RemoveAt($index)
    }
})

$btnChooseDest.Add_Click({
    if ($destFolderDialog.ShowDialog() -eq 'OK') {
        $txtDestination.Text = $destFolderDialog.SelectedPath
    }
})

$worker.DoWork += [System.ComponentModel.DoWorkEventHandler]{
    param($sender, $e)
    $plan = Build-CopyPlan -Items $backupItems -Destination $txtDestination.Text
    Copy-Plan -Plan $plan -Worker $sender
}

$worker.ProgressChanged += [System.ComponentModel.ProgressChangedEventHandler]{
    param($sender, $e)
    $progress.Value = [math]::Min($e.ProgressPercentage, 100)
    $state = $e.UserState

    $etaText = if ($state.ETA) { ' – ETA: ' + $state.ETA.ToString('hh\:mm\:ss') } else { '' }
    $statusLabel.Text = "Copiando: $($state.CurrentFile) ($([math]::Round(($state.CopiedBytes/1MB),2)) MB de $([math]::Round(($state.TotalBytes/1MB),2)) MB)$etaText"
}

$worker.RunWorkerCompleted += [System.ComponentModel.RunWorkerCompletedEventHandler]{
    param($sender, $e)
    foreach ($err in $errors) {
        $errorList.Items.Add($err) | Out-Null
    }
    if ($errors.Count -eq 0) {
        [System.Windows.Forms.MessageBox]::Show('Backup concluído sem falhas.', 'Pronto') | Out-Null
    }
    else {
        [System.Windows.Forms.MessageBox]::Show('Backup finalizado. Alguns itens falharam. Confira a lista.', 'Atenção') | Out-Null
    }
}

$btnStart.Add_Click({
    if ($backupItems.Count -eq 0) {
        [System.Windows.Forms.MessageBox]::Show('Adicione pelo menos um arquivo ou pasta.', 'Aviso') | Out-Null
        return
    }
    if ([string]::IsNullOrWhiteSpace($txtDestination.Text)) {
        [System.Windows.Forms.MessageBox]::Show('Escolha o destino do backup.', 'Aviso') | Out-Null
        return
    }

    $errors.Clear()
    $errorList.Items.Clear()
    $progress.Value = 0
    $statusLabel.Text = 'Preparando plano de cópia...'

    $worker.RunWorkerAsync()
})

[void]$form.ShowDialog()
