#tag Module
Protected Module Extensions
	#tag Method, Flags = &h0
		Sub ResizeControlsForLinux(Extends w As DesktopWindow)
		  // Loop through all the DesktopUIControls on the Window and adjust their
		  // heights to match what the system theme says the minimum height is.
		  // Call this method in the Open event handler of a Window like this:
		  // Self.ResizeControlsForLinux
		  
		  #If TargetLinux Then
		    Declare Sub gtk_widget_get_preferred_size Lib "libgtk-3" _
		    (widget As Integer, ByRef minSize As GtkRequisition, ByRef naturalSize As GtkRequisition)
		    Var minSize, naturalSize As GtkRequisition
		    gtk_widget_get_preferred_size(widget, minSize, naturalSize)
		    
		    For iter As Integer = 0 To Window1.ControlCount - 1
		      If Window1.Control(iter) IsA DesktopUIControl Then
		        Var dc As DesktopUIControl = DesktopUIControl(Window1.Control(iter))
		        If dc.Handle = widget Then
		          dc.Width = minSize.Width
		          dc.Height = minSize.Height
		        End If
		      End If
		    Next
		  #EndIf
		End Sub
	#tag EndMethod


	#tag Structure, Name = GtkRequisition, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		Width As Int32
		Height As Int32
	#tag EndStructure


	#tag ViewBehavior
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
	#tag EndViewBehavior
End Module
#tag EndModule
