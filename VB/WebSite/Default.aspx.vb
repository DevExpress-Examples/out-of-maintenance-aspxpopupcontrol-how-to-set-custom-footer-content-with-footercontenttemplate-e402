Imports Microsoft.VisualBasic
Imports System

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		treeView.ExpandAll()
	End Sub
End Class