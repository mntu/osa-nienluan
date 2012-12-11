<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewCardType.ascx.cs" Inherits="OnlineAuctionSystem.Admin.AdminControl.ViewCardType" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<div>
    <table>
        <tr>
            <td>
                <dx:ASPxTextBox ID="txtTypeName" runat="server" NullText="Nhập tên loại thẻ..." 
                    Width="200px">
                    <ValidationSettings Display="Dynamic" 
                        SetFocusOnError="True" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="Vui lòng nhập tên loại thẻ!" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td valign="top">
                <dx:ASPxButton ID="btnAdd" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    onclick="btnAdd_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                    Text="Thêm Loại Thẻ">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
</div>
<div>
<asp:GridView ID="gvCardType" runat="server" AutoGenerateColumns="False" 
        Width="100%" onrowdeleting="gvCardType_RowDeleting" 
        onrowediting="gvCardType_RowEditing" 
        EmptyDataText="Xin lỗi, hiện tại không có loại thẻ tín dụng nào!" 
        onrowcancelingedit="gvCardType_RowCancelingEdit" 
        onrowupdating="gvCardType_RowUpdating">
    <Columns>
        <asp:BoundField DataField="TypeId" HeaderText="Mã Loại Thẻ" ReadOnly="True">
        <ItemStyle HorizontalAlign="Center" Width="100px" />
        </asp:BoundField>
        <asp:BoundField DataField="TypeName" HeaderText="Tên Loại Thẻ" >
        <ControlStyle Width="200px" />
        </asp:BoundField>
        <asp:CommandField ButtonType="Image" CancelImageUrl="~/Admin/images/Cancel.png" 
            EditImageUrl="~/Admin/images/edit.png" HeaderText="Sửa" ShowEditButton="True" 
            UpdateImageUrl="~/Admin/images/Save.png">
        <ControlStyle Height="18px" Width="18px" />
        <ItemStyle HorizontalAlign="Center" Width="65px" />
        </asp:CommandField>
        <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                    CommandName="Delete" ImageUrl="~/Admin/images/Delete.png" Text="Delete" />
            </ItemTemplate>
            <ControlStyle Height="16px" Width="16px" />
            <ItemStyle HorizontalAlign="Center" Width="50px" />
        </asp:TemplateField>
    </Columns>
    <EmptyDataRowStyle HorizontalAlign="Center" />
</asp:GridView>
</div>

