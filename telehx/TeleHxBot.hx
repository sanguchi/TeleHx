package telehx;
import telehx.TeleHxTypes;
import telehx.TeleHxMethods;

class TeleHxBot {
    public var token(default, null): String;
    public var plugins: Array<UpdateHandler> = new Array();
    private var running: Bool = false;
    public function new(token: String) {
        this.token = token;
    }

    public function notifyPlugins(update: HxUpdate): Void {
        for(plugin in plugins) {
            if(!plugin.handle(update)) {
                #if debug
                trace('Plugin ${plugins.indexOf(plugin)} handled update ${update.update_id}');
                #end
                return;
            }
        }
        #if debug
        trace('No plugin handled update ${update.update_id}');
        #end
    }
    public function addHandler(func: HxUpdate -> Bool){
        this.addPlugin(new UpdateHandler(func));
    }
    public function addPlugin(plugin: UpdateHandler): Void {
        plugins.push(plugin);
    }

    public function stopPolling(): Void {
        this.running = false;
    }

    public function removePlugin(plugin: UpdateHandler): Bool {
        return plugins.remove(plugin);
    }

    public function startPolling(): Void {
        this.running = true;
        var update_offset: Int = 0;
        while(this.running) {
            TeleHxMethods.getUpdates(this, {offset: update_offset, timeout: 60}, function(updates: Array<HxUpdate>){
                for(update in updates) {
                    if(update.update_id > update_offset) {
                        update_offset = update.update_id;
                        #if debug
                        trace('[polling]: update_offset now is $update_offset');
                        #end
                        this.notifyPlugins(update);
                    }
                }
            });
        }
    }
}

class UpdateHandler {
    public var handle: HxUpdate -> Bool;
    public function new(func: HxUpdate -> Bool) {
        this.handle = func;
    }


}

