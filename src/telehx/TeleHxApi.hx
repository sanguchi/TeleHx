package telehx;

class TeleHxApi {
    public static var telegramAPIURL = "https://api.telegram.org/bot";
    public static function sendMessage(bot: TeleHxBot, chat_id: Int, message: String): String {
        var method = "sendMessage";
        return method;
    }
    public static function getMe(bot: TeleHxBot): haxe.Http {
        var reqURL = '${TeleHxApi.telegramAPIURL}${bot.token}/getMe';
        trace(reqURL);
        var request = new haxe.Http(reqURL);
        return request;
    }
}
