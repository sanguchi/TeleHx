package telehx;
// NOT IMPLEMENTED
class WebhookServer extends neko.net.ThreadServer<{
    private var server: neko.net.ThreadServer;
    public function new(){
        server = new neko.net.ThreadServer();
    }
}
