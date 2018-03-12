using StringTools;
import haxe.io.Path;

class CodeGenerator {
  
  var basicTypes: Map<String, String> = [
  "Integer" => "Int", 
  "String" => "String",
  "Boolean" => "Bool",
  "Float number" => "Float",
  "True" => "Bool",
  "Float" => "Float"];

  static function main() {
    new CodeGenerator();
  }
  
  public function new() {
    var template_text = haxe.Resource.getString("TeleHxTypes");
    var type_data = haxe.Json.parse(haxe.Resource.getString("JSONTypes"));
    var template = new haxe.Template(template_text);
    var output = template.execute({"type_data": type_data}, {"appendHx": appendHx, "getBaseType": getBaseType, "buildArrayDefinition": buildArrayDefinition});
    // trace(output);
    var path = new Path("../src/telehx/TeleHxTypes.hx");
    // trace('Current path: ${path}');
    // trace(sys.FileSystem.absolutePath("."));
    trace('Saving types to ${path.toString()}');
    sys.io.File.saveContent(path.toString(),output);
  }
  
  function appendHx(resolve: String->Dynamic, name: String): String {
    return "Hx" + name;
  }
  
  function getBaseType(resolve: String->Dynamic, name: String): String {
    if(basicTypes.exists(name)) {
      return basicTypes[name];
    }
    else {
      if(name.split(" ")[0] == "Array") {
        return buildArrayDefinition(resolve, name);
      }
      else {
        return appendHx(resolve, name);
      }
    }
  }
  
  function buildArrayDefinition(resolve: String->Dynamic, name: String): String {
    var current_word: String = name.replace("of", "").trim().split(" ")[0];
    trace('Building array definition for $name');
    trace('Current word: $current_word');
    if(current_word == "Array") {
      return "Array<" + buildArrayDefinition(resolve, name.replace("of", "").trim().split(" ").slice(1).join(" ")) + ">";
    }
    else {
      if(basicTypes.exists(current_word)) {
        return basicTypes[current_word];
      }
      else {
        return appendHx(resolve, current_word);
      }
    }
  }
}