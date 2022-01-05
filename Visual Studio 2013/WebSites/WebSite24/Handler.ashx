﻿<%@ WebHandler Language="C#" Class="Handler" %>

using System.Web;

public class Handler : IHttpHandler {
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        HttpPostedFile uploadFiles = context.Request.Files["Filedata"];
        string pathToSave = HttpContext.Current.Server.MapPath("~/UploadFiles/") + uploadFiles.FileName;
        uploadFiles.SaveAs(pathToSave);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
}