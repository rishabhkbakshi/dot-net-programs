<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Members Information</h2>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="mid" DataSourceID="SqlDataSource1">
        <ItemTemplate>
           <table>
           <tr>
           <td  valign="top">
           <%# Eval("mname") %> 
           <br /> 
           <%# Eval("occupation") %>  
           <br />
           <%# Eval("email") %>  
           </td>
          <td valign="top">
          <img  alt="No Photo" src=photos/<%# Eval("mid") %>.jpg />
          </td> 
          </tr> 
          </table>
         </ItemTemplate>
         <SeparatorTemplate>
         <hr />
         </SeparatorTemplate> 
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
        SelectCommand="SELECT [mname], [email], [occupation], [mid] FROM [members]"></asp:SqlDataSource>
</asp:Content>

