import telehx.TeleHxBot;
import telehx.TeleHxTypes;
using telehx.TeleHxMethods;

class Main {
    public function new() {
        trace("Testing bot");
        var token :String = sys.io.File.getContent('../token.txt');
        var owner_id: String = sys.io.File.getContent('../owner.txt');
        trace('Using token [$token] and user_id [$owner_id]');
        var bot = new TeleHxBot(token);
        bot.getMe(function(user: HxUser){
            trace('Bot id: ${user.id}, username: @${user.username}');
        });
        trace("Sending message...");
        bot.sendMessage({chat_id: owner_id, text: "Hello! _World_? 😌...", parse_mode: 'Markdown'}, function(message: HxMessage){
            trace('Message ${message.message_id} sent!');
        });
        bot.addHandler(function(update: HxUpdate): Bool {
            switch update {
                case {message: {text: text}} if(text != null): {
                    trace('Echoing message [${text}]');
                    bot.sendMessage({chat_id: update.message.chat.id, text: text});
                    return false;
                }
                case _ : {
                    return true;
                }
            }
        });
        trace('Entering idle mode.');
        bot.startPolling();
    }

    static function main() {
        new Main();
    }
}
