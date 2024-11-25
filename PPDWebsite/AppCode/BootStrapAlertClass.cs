using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Web.UI.WebControls;

namespace PPDWebsite.AppCode
{
    public class BootAlert
{
	public enum BootstrapAlertType
	{
		Plain,
		Success,
		Information,
		Warning,
		Danger,
		Primary
	}

	public static void BootstrapAlert(Label MsgLabel, string Message, BootstrapAlertType MessageType = BootstrapAlertType.Plain, bool Dismissable = false)
	{
		string style = null;
		string icon = null;
		switch (MessageType) {
			case BootstrapAlertType.Plain:
				style = "default";
				icon = "";
				break;
			case BootstrapAlertType.Success:
				style = "success";
				icon = "check";
				break;
			case BootstrapAlertType.Information:
				style = "info";
				icon = "info-circle";
				break;
			case BootstrapAlertType.Warning:
				style = "warning";
				icon = "warning";
				break;
			case BootstrapAlertType.Danger:
				style = "danger";
				icon = "remove";
				break;
			case BootstrapAlertType.Primary:
				style = "primary";
				icon = "info";
				break;
		}

		if ((!MsgLabel.Page.IsPostBack | MsgLabel.Page.IsPostBack) & Message == null) {
			MsgLabel.Visible = false;
		} else {
			MsgLabel.Visible = true;
			MsgLabel.CssClass = "alert alert-" + style + (Dismissable == true ? " alert-dismissible fade in font2" : "");
			MsgLabel.Text = "<i class='fa fa-" + icon + "'></i>" + Message;
			if (Dismissable == true) {
				MsgLabel.Text += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
			}
			MsgLabel.Focus();
			Message = "";
		}
	}


}
}