import telehx.TeleHxBot;
using telehx.TeleHxApi;
import telehx.TeleHxTypes;
class Main {
    public function new() {
        trace("Testing bot");
        var token: String = "552941561:AAEobCNRD5owHIN56CGLowNcNg6zr_VXtA8";
        var bot = new TeleHxBot(token);
        bot.getMe2(function(me: HxUser){
            trace('Bot info: @${me.username}: ${me.id}.');
        });
    }
    static function main() {
        new Main();
    }
    function print(data: String): Void {
        trace(data);
    }
}
