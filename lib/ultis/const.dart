class MyConst {
  static const String API_PATH = "https://api.openweathermap.org/data/2.5/weather?lat=10.771129367135972&lon=106.65882433849404&APPID=";
  static const String API_KEY = "07c743c754f9d16aac0c458df7d5c956";

  static const String API_ROOT = API_PATH + API_KEY;
} 

class MyAsset  {
  static const String link = 'assets/images/weathers/';
  static String getLinkImgWithFormat (String name) =>  '$link${name.replaceAll(' ', '').toLowerCase()}.png';
}