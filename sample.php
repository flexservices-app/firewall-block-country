How to block an IP from China
--------------------------------


$app = new COM("FlexFirewallManager.Admin");
$app->FormatOutput="json";
$app->Username="Plesk Domain User";
$app->Password="Plesk Domain Pass";
$strIP = $_SERVER['HTTP_X_FORWARDED_FOR'];
if ($strIP == ""){$strIP = $_SERVER['REMOTE_ADDR'];}

$returnstring = app->InfoIP($strIP);

$appjson = json_decode($returnstring);
if($appjson->result){
  if ($appjson->countrycode" == "CN"){
    $app->BlockIp($strIP);
  }
}
