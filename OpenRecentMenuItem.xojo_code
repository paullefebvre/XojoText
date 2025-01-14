#tag Class
Protected Class OpenRecentMenuItem
Inherits DesktopMenuItem
	#tag Event
		Function MenuItemSelected() As Boolean
		  // Find the topmost MainWindow and load the file into it.
		  Var file As FolderItem = FolderItem(Self.Tag)
		  If Not file.Exists Then Return True // Don't load it
		  
		  Var winCount As Integer = App.WindowCount
		  
		  For i As Integer = 0 To winCount - 1
		    Var win As DesktopWindow = App.WindowAt(i)
		    If win IsA MainWindow Then
		      Call MainWindow(win).LoadFile(file)
		      Return True
		    End If
		  Next
		  
		  // No window is open, so create one and load the file.
		  Var win As New MainWindow
		  Call win.LoadFile(file)
		  
		  Return True
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function Add(file As FolderItem) As Boolean
		  // Only add file if it is not already there
		  Var found As Boolean
		  For i As Integer = 0 To FileOpenRecent.Count - 1
		    Var menuItem As DesktopMenuItem = FileOpenRecent.MenuAt(i)
		    If menuItem IsA OpenRecentMenuItem Then
		      Var f As FolderItem = FileOpenRecent.MenuAt(i).Tag
		      If f.NativePath = file.NativePath Then
		        found = True
		        Exit For
		      End If
		    End If
		  Next
		  
		  If Not found Then
		    Var recentItem As New OpenRecentMenuItem(file.NativePath, file)
		    FileOpenRecent.AddMenuAt(0, recentItem)
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="LastRowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasCheckMark"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Shortcut"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
