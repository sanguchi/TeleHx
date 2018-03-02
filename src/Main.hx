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
        bot.sendMessage({chat_id: owner_id, text: "Hello! _World_?", parse_mode: 'Markdown'}, function(message: HxMessage){
            trace('Message ${message.message_id} sent!');
        });
        trace("Checking for new messages...");
        bot.getUpdates({}, function(updates: Array<HxUpdate>){
            for(update in updates) {
                trace('Update received: ${update.update_id}');
                if(update.message != null){
                    var message: HxMessage = update.message;
                    trace('New message received: ${message.text} from ${message.from.first_name}, Echoing text...');
                    bot.sendMessage({chat_id: message.chat.id, text: message.text}, function(msg: HxMessage){
                        trace('Echoed message ${message.message_id} with message ${msg.message_id}');
                    });
                }
            }
        });
    }
    static function main() {
        new Main();
    }
}
