import telehx.TeleHxBot;
using telehx.TeleHxApi;

class Main {
    public function new() {
        trace("Testing bot");
        var token: String = "TESTTOKEN";
        var bot = new TeleHxBot(token);
        var req: haxe.Http = bot.getMe();
        req.onData = print;
        req.onError = print;
        req.request();
    }
    static function main() {
        new Main();
    }
    function print(data: String): Void {
        trace(data);
    }
}
