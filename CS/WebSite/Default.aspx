<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1" Namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.1" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.1" namespace="DevExpress.Web.ASPxTreeView" tagprefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">
        function btnOk_Click() {
            lblSelectedNodes.SetText("Selected nodes: " + GetCheckedNodesText());
            popup.Hide();
        }
        function btnCancel_Click() {
            popup.Hide();
        }
        function GetCheckedNodesText(nodes) {
            var text = [ ];
            var recursion = function(node) {
                if(node.GetChecked())
                    text.push(node.GetText());
                for(var i = 0; i < node.GetNodeCount(); i++)
                   recursion(node.GetNode(i));
            };
            for(var i = 0; i < treeview.GetNodeCount(); i++)
                recursion(treeview.GetNode(i));
            return text.join(", ");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxButton ID="btnPopupElement" runat="server" AutoPostBack="false" Text="Click" Width="50" />            
            </td>
        </tr>
        <tr>
            <td style="padding-top: 20px;">
                <dx:ASPxLabel ID="lblSelectedNodes" runat="server" ClientInstanceName="lblSelectedNodes" Text="Selected nodes:" />
            </td>
        </tr>
    </table>
    <dx:ASPxPopupControl ID="popup" runat="server" ClientInstanceName="popup" PopupElementID="btnPopupElement"
        ShowFooter="true" AllowDragging="true" AllowResize="true" CloseAction="OuterMouseClick" HeaderText="Footer content template"
        ScrollBars="Vertical" Width="250" Height="250" PopupHorizontalAlign="LeftSides"
        PopupVerticalAlign="Below">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <dx:ASPxTreeView ID="treeView" ClientInstanceName="treeview" runat="server" EnableViewState="false"
                    AllowSelectNode="true" AllowCheckNodes="true">
                    <Nodes>
                        <dx:TreeViewNode Text="Home">
                            <Nodes>
                                <dx:TreeViewNode Text="News">
                                    <Nodes>
                                        <dx:TreeViewNode Text="For Developers">
                                        </dx:TreeViewNode>
                                        <dx:TreeViewNode Text="Website news">
                                        </dx:TreeViewNode>
                                    </Nodes>
                                </dx:TreeViewNode>
                                <dx:TreeViewNode Text="Our Mission">
                                </dx:TreeViewNode>
                                <dx:TreeViewNode Text="Our Customers">
                                </dx:TreeViewNode>
                            </Nodes>
                        </dx:TreeViewNode>
                        <dx:TreeViewNode Text="Products">
                            <Nodes>
                                <dx:TreeViewNode Text="Subscriptions / Packs">
                                </dx:TreeViewNode>
                                <dx:TreeViewNode Text=".NET Windows Forms Components">
                                </dx:TreeViewNode>
                                <dx:TreeViewNode Text="Reporting / Printing Suites">
                                </dx:TreeViewNode>
                                <dx:TreeViewNode Text="VCL Components and Tools">
                                </dx:TreeViewNode>
                                <dx:TreeViewNode Text="ASP.NET Components">
                                </dx:TreeViewNode>
                            </Nodes>
                        </dx:TreeViewNode>
                        <dx:TreeViewNode Text="Support">
                            <Nodes>
                                <dx:TreeViewNode Text="Knowledge Base">
                                </dx:TreeViewNode>
                                <dx:TreeViewNode Text="Documentation">
                                </dx:TreeViewNode>
                                <dx:TreeViewNode Text="Support Center">
                                </dx:TreeViewNode>
                                <dx:TreeViewNode Text="Newsgroups">
                                </dx:TreeViewNode>
                                <dx:TreeViewNode Text="Best Practicies">
                                </dx:TreeViewNode>
                            </Nodes>
                        </dx:TreeViewNode>
                    </Nodes>
                </dx:ASPxTreeView>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <FooterContentTemplate>
            <table>
                <tr>
                    <td style="width: 100%">
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnOk" runat="server" AutoPostBack="false" Text="Ok" Width="50">
                            <ClientSideEvents Click="btnOk_Click" />
                        </dx:ASPxButton>
                    </td>
                    <td style="width: 50px">
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnCansel" runat="server" AutoPostBack="false" Text="Cancel" Width="50">
                            <ClientSideEvents Click="btnCancel_Click" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </FooterContentTemplate>
    </dx:ASPxPopupControl>
    </form>
</body>
</html>