import telehx.TeleHxTypes;
import telehx.TeleHxBot;
import tink.http.containers.*;
import tink.http.Request;
import tink.http.Response;
using tink.CoreApi;
using telehx.TeleHxMethods;

class WebhookExample {
    static function main() {
        var token :String = sys.io.File.getContent('../token.txt');
        var owner_id: String = sys.io.File.getContent('../owner.txt');
        var webhook_url: String = sys.io.File.getContent('../webhook.txt');
        
        var bot: TeleHxBot = new TeleHxBot(token);
        bot.setWebhook({url: webhook_url});
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
        
        var container: TcpContainer = new TcpContainer(8080);
        container.run(function(request: IncomingRequest){
            // var update: HxUpdate = haxe.Json.parse(request.body.toString());
            // bot.notifyPlugins(update);
           //  trace(request.body);
            switch request.body {
                case Plain(src): {
                    src.all().map(function(o){
                        switch(o) {
                            case Success(data): {
                                // trace('data: ${data.toString()}');
                                var update: HxUpdate = haxe.Json.parse(data.toString());
                                bot.notifyPlugins(update);
                            }
                            case Failure(e): {
                                trace('Error: $e');
                            }
                        }
                    });
                }
                case Parsed(parts): {
                    trace(parts);
                }
            }
            return Future.sync(('':OutgoingResponse));
        });
    }
}
