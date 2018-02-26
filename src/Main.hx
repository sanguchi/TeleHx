class Main {
    static function main() {
        var url: String = "http://www.example.com/";
        trace('Preparing to send http request to $url');
        var req = new haxe.Http(url);
        req.onData = print;
        req.request();    
    }
    static function print(data: String) {
        trace(data);
    }
}
