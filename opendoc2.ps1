#
# Open new document with the text and delete ref
#

$docFilename = "docfile.rtf"
$refFileName = "docfile.rtf.lnk"
$docText = "some text"

$path = (Get-Item -Path ".\" -Verbose).FullName
$filename = $path + "\" + $docFilename

$msWord = New-Object -Com Word.Application
$msWord.visible = $false

$wordDoc = $msWord.Documents.add()
$wordDoc.Activate()

#$selection = $msWord.selection
#$selection.typeText($docText)
#$selection.typeParagraph()
#$selection.typeText($docText)

write-verbose "Document is saved to $($filename)"
$wordDoc.SaveAs([REF]$filename)
#$msWord.visible = $true

#del $path + "\" + $refFileName

$wordDoc.Close()
$msWord.Application.Quit()