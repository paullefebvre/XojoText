#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Closing()
		  Settings.Save
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  Settings.Load
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditPreferences() As Boolean Handles EditPreferences.Action
		  Var settings As New SettingsWindow
		  settings.ShowModal
		  
		  UpdateFontSettings
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
		  Var f As FolderItem
		  f = FolderItem.ShowOpenFileDialog("")
		  
		  Var w As New MainWindow
		  
		  If Not w.LoadFile(f) Then
		    MessageBox("Could not load " + f.Name + ".")
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
		  #If TargetMacOS Then
		    Declare Function NSClassFromString Lib "Cocoa" (aClassName As CFStringRef) As Ptr
		    Declare Function SharedApplication Lib "Cocoa" Selector "sharedApplication" (receiver As Ptr) As Ptr
		    
		    Var sA As Ptr = NSClassFromString("NSApplication")
		    sA = SharedApplication(sA)
		    
		    Declare Sub OrderFrontStandardAboutPanel Lib "Cocoa" Selector "orderFrontStandardAboutPanel:" _
		    (receiver As Ptr, iD As Ptr)
		    
		    OrderFrontStandardAboutPanel(sA, Nil)
		  #Else
		    Var about As New AboutWindow
		    about.ShowModal
		  #Endif
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NewNewTextDocument() As Boolean Handles NewNewTextDocument.Action
		  Var editor As New MainWindow
		  editor.Show
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NewNewTextWindow() As Boolean Handles NewNewTextWindow.Action
		  Var win As New MainWindow
		  win.Show
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NewusingClipboard() As Boolean Handles NewusingClipboard.Action
		  Var win As New MainWindow
		  win.Show
		  win.LoadClipboardContents
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function OpenRecentClear() As Boolean Handles OpenRecentClear.Action
		  // Loop through all items and remove anything
		  // that is a OpenRecentMenuItem
		  
		  For i As Integer = FileOpenRecent.Count - 1 DownTo 0
		    If FileOpenRecent.MenuAt(i) IsA OpenRecentMenuItem Then
		      FileOpenRecent.RemoveMenuAt(i)
		    End If
		  Next
		  
		  Settings.RecentFiles.ResizeTo(-1)
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub UpdateFontSettings()
		  // Update the font info on all windows.
		  For i As Integer = 0 To WindowCount - 1
		    If Window(i) IsA MainWindow Then
		      MainWindow(Window(i)).SetFont(Settings.FontName)
		      MainWindow(Window(i)).SetFontSize(Settings.FontSize)
		    End If
		  Next
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
