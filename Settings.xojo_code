#tag Module
Protected Module Settings
	#tag Method, Flags = &h1
		Protected Sub Load()
		  Var prefFolder As FolderItem
		  #If DebugBuild Then
		    prefFolder = SpecialFolder.Desktop.Child("XojoText")
		  #Else
		    prefFolder = SpecialFolder.ApplicationData.Child("XojoText")
		  #Endif
		  
		  If prefFolder <> Nil Then
		    Var prefFile As FolderItem = prefFolder.Child(kFilename)
		    
		    If prefFile <> Nil And prefFile.Exists Then
		      Var tis As TextInputStream
		      tis = TextInputStream.Open(prefFile)
		      
		      Var json As JSONItem
		      json = New JSONItem(tis.ReadAll)
		      tis.Close
		      
		      Settings.FontName = json.Value("FontName")
		      Settings.FontSize = json.Value("FontSize")
		      Settings.WinTop = json.Value("WinTop")
		      If Settings.WinTop <= DesktopDisplay.DisplayAt(0).AvailableTop * DesktopDisplay.DisplayAt(0).ScaleFactor Then
		        Settings.WinTop = DesktopDisplay.DisplayAt(0).AvailableTop * DesktopDisplay.DisplayAt(0).ScaleFactor
		      End If
		      
		      Settings.WinLeft = json.Value("WinLeft")
		      Settings.WinWidth = json.Value("WinWidth")
		      If Settings.WinWidth <= 500 Then Settings.WinWidth = 500
		      Settings.WinHeight = json.Value("WinHeight")
		      If Settings.WinHeight <= 300 Then Settings.WinHeight = 300
		      
		      // Load recent items
		      Var recents As JSONItem = json.Lookup("RecentFiles", Nil)
		      If recents <> Nil Then
		        For r As Integer = 0 To recents.Count - 1
		          Var file As New FolderItem(recents.ValueAt(r), FolderItem.PathModes.Native)
		          If OpenRecentMenuItem.Add(file) Then
		            RecentFiles.Add(file)
		          End If
		        Next
		      End If
		    Else
		      Settings.WinTop = 100
		      Settings.WinLeft = 100
		      Settings.WinWidth = 600
		      Settings.WinHeight = 400
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Save()
		  Var json As New JSONItem
		  json.Value("FontName") = Settings.FontName
		  json.Value("FontSize") = Settings.FontSize
		  json.Value("WinTop") = Settings.WinTop
		  json.Value("WinLeft") = Settings.WinLeft
		  json.Value("WinHeight") = Settings.WinHeight
		  json.Value("WinWidth") = Settings.WinWidth
		  
		  Var recents() As String
		  For i As Integer = 0 To RecentFiles.LastIndex
		    If i > 9 Then
		      Exit For
		    End If
		    
		    recents.Add(RecentFiles(i).NativePath)
		  Next
		  
		  If recents.LastIndex >= 0 Then
		    json.Value("RecentFiles") = recents
		  End If
		  
		  Var prefFolder As FolderItem
		  #If DebugBuild Then
		    prefFolder = SpecialFolder.Desktop.Child("XojoText")
		  #Else
		    prefFolder = SpecialFolder.ApplicationData.Child("XojoText")
		  #Endif
		  
		  If prefFolder <> Nil Then
		    If Not prefFolder.Exists Then
		      prefFolder.CreateFolder
		    End If
		    
		    Var prefFile As FolderItem = prefFolder.Child(kFileName)
		    
		    Var tos As TextOutputStream
		    tos = TextOutputStream.Create(prefFile)
		    tos.Write(json.ToString)
		    tos.Close
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected FontName As String = "Arial"
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected FontSize As Integer = 16
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RecentFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WinHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WinLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WinTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WinWidth As Integer
	#tag EndProperty


	#tag Constant, Name = kFilename, Type = String, Dynamic = False, Default = \"XojoText.settings", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
