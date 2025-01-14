#tag DesktopWindow
Begin DesktopWindow MainWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   True
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1321598088
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "XojoText"
   Type            =   0
   Visible         =   True
   Width           =   600
   Begin DesktopTextArea EditArea
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   380
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   245
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   355
   End
   Begin DesktopListBox FileList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   400
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Currently Open Documents"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   True
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   242
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopCanvas ResizeCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   400
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   242
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   3
   End
   Begin DesktopLabel StatsLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   254
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kStats"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   380
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   342
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Function CancelClosing(appQuitting As Boolean) As Boolean
		  For fc As Integer = 0 To FileList.LastRowIndex
		    Var doc As Document = DocumentAt(fc)
		    If doc.Changed Then
		      If Not AskSaveChanges(doc) Then
		        Return True
		      End If
		    End If
		  Next
		  
		  Settings.WinTop = Self.Top
		  Settings.WinLeft = Self.Left
		  Settings.WinHeight = Self.Height
		  Settings.WinWidth = Self.Width
		  
		  // Remove from the Window menu
		  
		  // Search for the specified window and close it.
		  Var count As Integer
		  Var w As WindowMenuItem
		  
		  count = WindowMenu.Count - 1
		  
		  For i As Integer = 0 To count
		    If WindowMenu.MenuAt(i) IsA WindowMenuItem Then // Ensure the menu is a WindowMenuItem
		      w = WindowMenuItem(WindowMenu.MenuAt(i))
		      
		      // Check if the window referenced in the menu is the window to close
		      If w.IsWindow(Self) Then
		        // Remove the MenuItem from Recent Items
		        WindowMenu.RemoveMenuAt(i)
		        Exit
		      End If
		    End If
		  Next
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  SetFont(Settings.FontName)
		  SetFontSize(Settings.FontSize)
		  
		  UpdateStats
		  UpdateTitle
		  
		  Var t As Integer = Settings.WinTop
		  
		  Self.Top = Settings.WinTop
		  Self.Left = Settings.WinLeft
		  Self.Height = Settings.WinHeight
		  Self.Width = Settings.WinWidth
		  
		  Var winMenu As New WindowMenuItem(Self)
		  MainMenuBar.Child("WindowMenu").AddMenu(winMenu)
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseDocument() As Boolean Handles FileCloseDocument.Action
		  Var row As Integer = FileList.SelectedRowIndex
		  
		  CloseDocument(row)
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
		  Self.Close
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
		  Var f As FolderItem = FolderItem.ShowOpenFileDialog("")
		  
		  If Not LoadFile(f) Then
		    MessageBox("Could not load " + f.Name + ".")
		  End If
		  
		  Return True
		  
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSave() As Boolean Handles FileSave.Action
		  Var doc As Document = DocumentAt(FileList.SelectedRowIndex)
		  
		  If doc Is Nil Then
		    Return False
		  ElseIf doc.File Is Nil Then
		    SaveFileAs
		  Else
		    SaveFile(doc)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveAs() As Boolean Handles FileSaveAs.Action
		  SaveFileAs
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function Newfromselection() As Boolean Handles Newfromselection.Action
		  Var selText As String
		  selText = EditArea.SelectedText
		  
		  NewFile
		  
		  EditArea.AddText(selText)
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NewNewTextDocument() As Boolean Handles NewNewTextDocument.Action
		  NewFile
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NewusingClipboard() As Boolean Handles NewusingClipboard.Action
		  NewFile
		  LoadClipboardContents
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Function AskSaveChanges(doc As Document) As Boolean
		  // Save changes to 'untitled' before closing?
		  // If you don't save, your changes will be lost.
		  // Don't Save, Cancel, Save
		  
		  Var msg As New MessageDialog
		  msg.Message = Replace("Save changes to '%file' before closing?", "%file", doc.DefaultName)
		  msg.Explanation = "If you don't save, your changes will be lost."
		  msg.ActionButton.Caption = "Save"
		  msg.CancelButton.Caption = "Cancel"
		  msg.CancelButton.Visible = True
		  msg.AlternateActionButton.Caption = "Don't Save"
		  msg.AlternateActionButton.Visible = True
		  
		  Var button As MessageDialogButton = msg.ShowModal(Self)
		  
		  Select Case button
		  Case msg.ActionButton
		    SaveFileAs
		    Return True
		  Case msg.CancelButton
		    Return False
		  Case msg.AlternateActionButton
		    Return True
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CloseDocument(row As Integer)
		  Var doc As Document = DocumentAt(row)
		  If doc Is Nil Then Return
		  
		  // If the file has been changed, prompt to save changes.
		  If doc.Changed Then
		    If Not AskSaveChanges(doc) Then
		      Return
		    End If
		  End If
		  
		  // Remove the file from the list.
		  FileList.RemoveRowAt(row)
		  
		  Var currRow As Integer = FileList.SelectedRowIndex
		  If currRow >= 0 Then
		    FileList.SelectedRowIndex = currRow
		  Else
		    EditArea.Text = ""
		    EditArea.ReadOnly = True
		    Self.Changed = False
		    UpdateStats
		    UpdateTitle
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DocumentAt(row As Integer) As Document
		  If row >= 0 And row <= FileList.LastRowIndex Then
		    Var doc As Document = Document(FileList.RowTagAt(row))
		    Return doc
		  End If
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadClipboardContents()
		  Var c As New Clipboard
		  
		  EditArea.AddText(c.Text)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadFile(f As FolderItem) As Boolean
		  If f <> Nil Then
		    // Only load the file if it is not already loaded.
		    For i As Integer = 0 To FileList.LastRowIndex
		      Var doc As Document = FileList.RowTagAt(i)
		      If doc.File.NativePath = f.NativePath Then
		        // Switch to the file and don't load anything
		        FileList.SelectedRowIndex = i
		        Return True
		      End If
		    Next
		    
		    Try
		      Var input As TextInputStream
		      input = TextInputStream.Open(f)
		      
		      FileList.AddRow(f.Name)
		      
		      Var doc As New Document
		      doc.File = f
		      doc.Contents = input.ReadAll
		      FileList.RowTagAt(FileList.LastAddedRowIndex) = doc
		      
		      input.Close
		      
		      FileList.SelectedRowIndex = FileList.LastAddedRowIndex
		      
		      doc.Changed = False
		      Self.Changed = doc.Changed
		      
		      UpdateStats
		      UpdateTitle
		      
		      If OpenRecentMenuItem.Add(f) Then
		        Settings.RecentFiles.Add(f)
		      End If
		      
		    Catch e As IOException
		      Return False
		    End Try
		    
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewFile()
		  Var doc As New Document
		  NewCount = NewCount + 1
		  doc.DefaultName = "untitled" + NewCount.ToString
		  
		  FileList.AddRow(doc.DefaultName)
		  FileList.RowTagAt(FileList.LastAddedRowIndex) = doc
		  FileList.SelectedRowIndex = FileList.LastAddedRowIndex
		  
		  UpdateTitle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveFile(doc As Document)
		  If doc Is Nil Then Return
		  If doc.File Is Nil Then SaveFileAs
		  
		  Var output As TextOutputStream
		  output = TextOutputStream.Create(doc.File)
		  output.Write(EditArea.Text)
		  output.Close
		  
		  FileList.SelectedRowValue = doc.File.Name
		  
		  doc.Changed = False
		  Self.Changed = False
		  
		  UpdateTitle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveFileAs()
		  Var doc As Document = DocumentAt(FileList.SelectedRowIndex)
		  If doc Is Nil Then Return
		  
		  Var f As FolderItem = FolderItem.ShowSaveFileDialog("", "untitled.txt")
		  
		  If f <> Nil Then
		    doc.File = f
		    SaveFile(doc)
		    
		    If OpenRecentMenuItem.Add(f) Then
		      Settings.RecentFiles.Add(f)
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFont(fontName As String)
		  EditArea.FontName = fontName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFontSize(size As Integer)
		  EditArea.FontSize = size
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateStats()
		  Var wc As Integer = WordCount
		  Var chars As Integer = EditArea.Text.Length
		  Var lines As Integer = EditArea.Text.CountFields(EndOfLine)
		  
		  Var stats As String = kStats
		  stats = stats.Replace("%W", wc.ToString)
		  stats = stats.Replace("%C", chars.ToString)
		  stats = stats.Replace("%L", lines.ToString)
		  
		  StatsLabel.Text = stats
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateTitle()
		  Var doc As Document = DocumentAt(FileList.SelectedRowIndex)
		  If doc Is Nil Then
		    Self.Title = "XojoText"
		    Return
		  End If
		  
		  Var modified As String
		  If Self.Changed Then
		    modified = " (Edited)"
		  End If
		  
		  If doc.File <> Nil Then
		    Self.Title = doc.File.Name + modified
		  Else
		    Self.Title = doc.DefaultName + modified
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function WordCount() As Integer
		  Var wc As Integer
		  
		  Var words() As String
		  words = EditArea.Text.Split("")
		  
		  Var wordValues As String = "abcdedfghijklmnopqrstuvwxyz1234567890"
		  Var isWord As Boolean
		  
		  For i As Integer = 0 To words.LastIndex
		    If wordValues.IndexOf(words(i)) >= 0 Then
		      isWord = True
		    Else
		      If isWord Then wc = wc + 1
		      isWord = False
		    End If
		    
		  Next
		  
		  Return wc
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Shared NewCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ResizeStartX As Integer
	#tag EndProperty


	#tag Constant, Name = kStats, Type = String, Dynamic = False, Default = \"Words: %W / Characters: %C / Lines: %L", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events EditArea
	#tag Event
		Sub TextChanged()
		  If FileList.SelectedRowIndex >= 0 Then
		    Var doc As Document = Document(FileList.RowTagAt(FileList.SelectedRowIndex))
		    doc.Changed = True
		    doc.Contents = Me.Text
		    
		    Self.Changed = doc.Changed
		    
		    UpdateStats
		    UpdateTitle
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FileList
	#tag Event
		Sub SelectionChanged()
		  If Me.SelectedRowIndex < 0 Then Return
		  
		  Var doc As Document = DocumentAt(Me.SelectedRowIndex)
		  Var wasChanged As Boolean = doc.Changed
		  Var txt As String = doc.Contents
		  EditArea.Text = txt
		  doc.Changed = wasChanged
		  Self.Changed = doc.Changed
		  
		  UpdateTitle
		  
		  EditArea.ReadOnly = False
		  EditArea.SetFocus
		End Sub
	#tag EndEvent
	#tag Event
		Function PaintCellText(g as Graphics, row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  // Draw a "Close" indicator to the right of the file name.
		  Const kMargin = 2
		  
		  Var p As New Picture(g.Height, g.Height)
		  Var pg As Graphics = p.Graphics
		  p.Graphics.DrawingColor = Color.Gray
		  p.Graphics.FillOval(kMargin, kMargin, pg.Height - kMargin * 2, pg.Height - kMargin * 2)
		  
		  Const kXMargin = kMargin * 2
		  p.Graphics.DrawingColor = Color.White
		  p.Graphics.PenSize = 2
		  p.Graphics.DrawLine(kXMargin, kXMargin, pg.Width - kXMargin * 1.5, pg.Height - kXMargin * 1.5)
		  p.Graphics.DrawLine(kXMargin, pg.Height - kXMargin * 1.5, pg.Width - kXMargin * 1.5, kXMargin)
		  
		  g.DrawPicture(p, g.Width - g.Height, 0)
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  If Me.SelectedRowIndex >= 0 And Me.SelectedRowIndex <= Me.LastRowIndex Then
		    base.AddMenu(New DesktopMenuItem("Close"))
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  If selectedItem.Text = "Close" Then
		    CloseDocument(Me.SelectedRowIndex)
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function CellPressed(row As Integer, column As Integer, x As Integer, y As Integer) As Boolean
		  If x > Me.Width - Me.RowHeight Then
		    If Row >= 0 And Row <= Me.LastRowIndex Then
		      CloseDocument(Row)
		    End If
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ResizeCanvas
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  ResizeStartX = X
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  g.DrawingColor = Color.DarkTingeColor
		  g.FillRectangle(0, 0, g.Width, g.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(x As Integer, y As Integer)
		  Var offset As Integer
		  offset = X - ResizeStartX
		  
		  If Me.Left < 100 And offset < 0 Then Return
		  If Me.Left > Self.Width / 2 And offset > 0 Then Return
		  
		  // Adjust size of FileList, EditArea and StatsLabel
		  FileList.Width = FileList.Width + offset
		  EditArea.Left = EditArea.Left + offset
		  EditArea.Width = EditArea.Width - offset
		  StatsLabel.Left = StatsLabel.Left + offset
		  StatsLabel.Width = StatsLabel.Width - offset
		  
		  // Move the splitter
		  Me.Left = Me.Left + offset
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.ArrowEastWest
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
