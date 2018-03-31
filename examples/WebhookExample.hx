import telehx.TeleHxTypes;
import telehx.TeleHxBot;
import neko.Web;
using telehx.TeleHxMethods;

class WebhookExample {
    static function main() {
        var token :String = sys.io.File.getContent('../token.txt');
        var owner_id: String = sys.io.File.getContent('../owner.txt');
        var bot: TeleHxBot = new TeleHxBot(token);
        var data: String = Web.getPostData();
        
        bot.addHandler(function(update: HxUpdate): Bool {
            switch update {
                case {message: {text: text}} if(text != null): {
                    bot.sendMessage({chat_id: update.message.chat.id, text: text});
                    return false;
                }
                case _ : {
                    return true;
                }
            }
        });
        
        if(data != null) {
            var update: HxUpdate = haxe.Json.parse(data);
            bot.notifyPlugins(update);
            Web.setReturnCode(200);
        }
        
    }
}
