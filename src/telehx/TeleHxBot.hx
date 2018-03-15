package telehx;
using TeleHxMethods;

// TODO: Haxe switch to redirect the type to the correct handler
interface TeleHxTypeHandler<T> {
    public function typeHandler(sender: TeleHxBot, object: T);
}
interface TeleHxUpdateHandler implements TeleHxTypeHandler {
    public function updateHandler(sender: TeleHxBot, update: HxUpdate): Bool;
}

interface TeleHxMessageHandler implements TeleHxTypeHandler {
    public function messageHandler(sender: TeleHxBot, message: HxMessage): Bool;
}

interface TeleHxInlineQueryHandler implements TeleHxTypeHandler {
    public function inlineQueryHandler(sender: TeleHxBot, inlineQuery: HxInlineQuery): Bool;
}

interface TeleHxChosenInlineResultHandler implements TeleHxTypeHandler {
    public function chosenInlineResultHandler(sender: TeleHxBot, chosenInlineQueryResult: HxChosenInlineResult): Bool;
}

interface TeleHxCallbackQueryHandler implements TeleHxTypeHandler {
    public function callbackQueryHandler(sender: TeleHxBot, callbackQuery: HxCallbackQuery): Bool;
}

interface TeleHxShippingQueryHandler implements TeleHxTypeHandler {
    public function shippingQueryHandler(sender: TeleHxBot, shippingQuery: HxShippingQuery): Bool;
}

interface TeleHxPreCheckoutQuery implements TeleHxTypeHandler {
    public function preCheckoutQuery(sender: TeleHxBot, checkoutQuery: HxPreCheckoutQuery): Bool;
}

class TeleHxBot {
    public var token(default, null): String;
    public var plugins(default, null): Map<TeleHxTypeHandler> = [];
    private var running: Bool = false;
    public function new(token: String) {
        this.token = token;
    }

    public function notifyPlugins(message: String): Void {
        for(plugin in plugins) {
            if(!plugin.messageHandler(this, message)) {
                break;
            }
        }
    }
    
    public function addPlugin(plugin: TeleHxPlugin): Void {
        plugins.push(plugin);
    }
    
    public function stopPolling(): Void {
        this.running = false;
    }
    
    public function startPolling(): Void {
        this.running = true;
        var update_offset: Int = 0;
        while(this.running) {
            this.getUpdates({offset: update_offset}, function(updates: Array<HxUpdate>){
                for(update in updates) {
                    update_offset = update.update_id;
                    
                }
            });
        }
    }
}
