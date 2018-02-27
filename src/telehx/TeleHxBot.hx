package telehx;

interface TeleHxPlugin {
    public function messageHandler(sender: TeleHxBot, message: String): Bool;
}

class TeleHxBot {
    public var token(default, null): String;
    public var plugins(default, null): Array<TeleHxPlugin> = [];

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
}