<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlGallery.ascx.cs"
    Inherits="OnlineAuctionSystem.UserControl.ctrlGallery" %>

<div id="gallery" class="ad-gallery">
    <div class="ad-image-wrapper">
    </div>
    <div class="ad-controls">
    </div>
    <div class="ad-nav">
        <div class="ad-thumbs">
            <ul class="ad-thumb-list">
                <%
                int[] listImg = new int[5];
                for (int i = 0; i < 5; i++)
                {
                    if (System.IO.File.Exists(this.CheckImageUrl + @"\" + (i + 1) + ".jpg"))
                        listImg[i] = i + 1;
                    else
                        listImg[i] = 0;
                }
                for (int i = 0; i < 5; i++)
                {
                    if (listImg[i] != 0)
                    {
                        string strUrl = "../../ProductImg/"+this.ImageUrl+ listImg[i] + ".jpg";
                %>
                <li><a href="<%=strUrl %>">
                    <img src="<%=strUrl %>" width="100px" height="80px">
                </a></li>
                <%
                    }
                }
                %>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('.ad-gallery').adGallery();
    });
</script>
