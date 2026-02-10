Block IP countries in Windows Firewall automatically

How to block an IP from China
---------------------------------


Set App = CreateObject("FlexFirewallManager.Admin")
App.FormatOutput="xml"
App.Username="Plesk Domain User"
App.Password="Plesk Domain Pass"

Dim strIP : strIP = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
If strIP = "" Then strIP = Request.ServerVariables("REMOTE_ADDR")

Dim returnstring : returnstring = App.InfoIP(strIP)

Set objxml = CreateObject("Msxml2.DOMDocument")
objxml.LoadXml(return_string)
if lcase(objxml.SelectSingleNode("/output/result").text) = "true" then
  if ucase(objxml.SelectSingleNode("/output/countrycode").text) = "CN" then
    App.BlockIp(strIP)
  end if
end if

