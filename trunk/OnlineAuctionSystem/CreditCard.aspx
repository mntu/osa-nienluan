<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="CreditCard.aspx.cs" Inherits="OnlineAuctionSystem.CreditCard" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="panel" runat="server" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        GroupBoxCaptionOffsetY="-28px" HeaderText="Thẻ thanh toán" 
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <asp:GridView ID="gvCreditCard" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" OnPageIndexChanging="gvCreditCard_PageIndexChanging" 
                    OnRowDeleting="gvCreditCard_RowDeleting" 
                    OnSelectedIndexChanging="gvCreditCard_SelectedIndexChanging" PageSize="2" 
                    Width="100%">
                    <Columns>
                        <asp:BoundField DataField="CardNum" HeaderText="Mã Thẻ" 
                            SortExpression="CardNum" >
                        </asp:BoundField>
                        <asp:BoundField DataField="ExpireDate" DataFormatString="{0:MM/yyyy}" 
                            HeaderText="Ngày Hết Hạn" SortExpression="ExpireDate" >
                        </asp:BoundField>
                        <asp:BoundField DataField="TypeName" HeaderText="Loại Thẻ" 
                            SortExpression="TypeName" >
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/edit.png" 
                            ShowSelectButton="True" HeaderText="Sủa">
                        <ControlStyle Width="16px" />
                        </asp:CommandField>
                        <asp:TemplateField ShowHeader="False" HeaderText="Xóa">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete" ImageUrl="~/images/Delete.png" Text="Delete" OnClientClick="return confirm('Bạn có chắc muốn xóa thẻ này?')"/>
                            </ItemTemplate>
                            <ControlStyle Width="16px" />
                        </asp:TemplateField>
                    </Columns>
                    
                </asp:GridView>
                <div style="margin-top:5px">
                <dx:ASPxButton ID="btnAdd" runat="server" Text="Thêm Thẻ Mới" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="120px" 
                        OnClick="btnAdd_Click">
                </dx:ASPxButton>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
