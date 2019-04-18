Dim fs, oFolder, oFiles, oSubFolders, fileCount, folderCount

sFolder = createobject("Scripting.FileSystemObject").GetFolder(".").Path
rootFolder = createobject("Scripting.FileSystemObject").GetFolder(".").Path
set fs = CreateObject("Scripting.FileSystemObject")


Function StartKeep(sFolder)
    fileCount = 0
    folderCount = 0

    set oFolder = fs.GetFolder(sFolder)     '��ȡ�ļ���
    set oSubFolders = oFolder.SubFolders    '��ȡ��Ŀ¼����
     
    for each folder in oSubFolders
        fileCount = fileCount+1
    Next

   
     
    set oFiles = oFolder.Files              '��ȡ�ļ�����
    for each file in oFiles
       folderCount = folderCount+1
    Next
    if fileCount = 0 then
        if folderCount = 0 then
             fs.CreateTextFile(sFolder+"\.gitkeep")
             Set objTextFile = fs.OpenTextFile (sFolder+"\.gitkeep", 2, True)
             objTextFile.WriteLine("# Ignore everything in this directory")
             objTextFile.WriteLine("*")
             objTextFile.WriteLine("# Except this file !.gitkeep   ")
        end if 
    end if

    for each folder in oSubFolders
        StartKeep(folder)
    Next

End Function


StartKeep(sFolder)
Msgbox "Success"