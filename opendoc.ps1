#
# Open new document with the text
#

$docFilename = "docfile.rtf"
$docText = "some text"

$path = (Get-Item -Path ".\" -Verbose).FullName
$filename = $path + "\" + $docFilename

$msWord = New-Object -Com Word.Application
$msWord.visible = $false

$wordDoc = $msWord.Documents.add()
$wordDoc.Activate()

$selection = $msWord.selection
$selection.typeText($docText)
$selection.typeParagraph()
$selection.typeText($docText)

$wordDoc.SaveAs([REF]$filename)
$msWord.visible = $true



#$wordDoc.Close()
#$msWord.Application.Quit()
