package telehx;
using telehx.TeleHxTypes;

class TeleHxMethods {
    public static var telegramAPIURL = "https://api.telegram.org/bot";

    public static function sendMessage(bot: TeleHxBot, chat_id: Int, message: String): String {
        var method = "sendMessage";
        return method;
    }

    public static function getMe(bot: TeleHxBot, callback: HxUser -> Void): Void {
        var reqURL = '${TeleHxApi.telegramAPIURL}${bot.token}/getMe';
        trace('Sending request to ${reqURL}');
        var request = new haxe.Http(reqURL);
        request.onData = function(data: String){
            trace('Received data: ${data}');
            var response: HxApiResponse<HxUser> = haxe.Json.parse(data);
            callback(response.result);
        }
        request.request();
    }


}
