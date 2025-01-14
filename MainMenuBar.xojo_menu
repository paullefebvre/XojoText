#tag Menu
Begin Menu MainMenuBar
   Begin DesktopMenuItem FileMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&File"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem UntitledItem1
         SpecialMenu = 0
         Index = -2147483648
         Text = "New"
         AutoEnabled = True
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin DesktopMenuItem NewNewTextDocument
            SpecialMenu = 0
            Index = -2147483648
            Text = "New Text Document"
            ShortcutKey = "N"
            Shortcut = "Cmd+N"
            MenuModifier = True
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
         Begin DesktopMenuItem NewusingClipboard
            SpecialMenu = 0
            Index = -2147483648
            Text = "     (using Clipboard)"
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
         Begin DesktopMenuItem Newfromselection
            SpecialMenu = 0
            Index = -2147483648
            Text = "     (from selection)"
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
         Begin DesktopMenuItem UntitledSeparator2
            SpecialMenu = 0
            Index = -2147483648
            Text = "-"
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
         Begin DesktopMenuItem NewNewTextWindow
            SpecialMenu = 0
            Index = -2147483648
            Text = "New Text Window"
            ShortcutKey = "N"
            Shortcut = "Cmd+Shift+N"
            MenuModifier = True
            AltMenuModifier = True
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
      End
      Begin DesktopMenuItem FileOpen
         SpecialMenu = 0
         Index = -2147483648
         Text = "Open..."
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem FileOpenRecent
         SpecialMenu = 0
         Index = -2147483648
         Text = "Open Recent"
         AutoEnabled = True
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin DesktopMenuItem UntitledSeparator4
            SpecialMenu = 0
            Index = -2147483648
            Text = "-"
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
         Begin DesktopMenuItem OpenRecentClear
            SpecialMenu = 0
            Index = -2147483648
            Text = "Clear"
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
      End
      Begin DesktopMenuItem UntitledSeparator3
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem FileCloseDocument
         SpecialMenu = 0
         Index = -2147483648
         Text = "Close Document"
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem FileCloseWindow
         SpecialMenu = 0
         Index = -2147483648
         Text = "Close Window"
         ShortcutKey = "W"
         Shortcut = "Cmd+Shift+W"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem UntitledSeparator
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem FileSave
         SpecialMenu = 0
         Index = -2147483648
         Text = "Save"
         ShortcutKey = "S"
         Shortcut = "Cmd+S"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem FileSaveAs
         SpecialMenu = 0
         Index = -2147483648
         Text = "Save As..."
         ShortcutKey = "S"
         Shortcut = "Cmd+Shift+S"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem UntitledSeparator0
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopQuitMenuItem FileQuit
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kFileQuit"
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin DesktopMenuItem EditMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&Edit"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem EditUndo
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Undo"
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditSeparator1
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditCut
         SpecialMenu = 0
         Index = -2147483648
         Text = "Cu&t"
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditCopy
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Copy"
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditPaste
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Paste"
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditClear
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kEditClear"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditSeparator2
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditSelectAll
         SpecialMenu = 0
         Index = -2147483648
         Text = "Select &All"
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem UntitledSeparator1
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopPreferencesMenuItem EditPreferences
         SpecialMenu = 0
         Index = -2147483648
         Text = "Preferences..."
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin DesktopMenuItem WindowMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "Window"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
   End
   Begin DesktopMenuItem HelpMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&Help"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopApplicationMenuItem HelpAbout
         SpecialMenu = 0
         Index = -2147483648
         Text = "&About XojoText"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu
