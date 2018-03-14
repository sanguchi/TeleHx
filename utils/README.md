## _Utils folder_  
Handy folder to quickly create api wrappers using templates.  


### _How to use:_
**create a virtualenv and install requirements**  
```
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
```
**fetch api methods and types from Telegram API docs**
```
python updates_types.py
```
_optional: add interactively the return type for methods_  
```
python build_known_return_types.py
```

### **Now you can generate the templates:**

**Option A:** Use python and jinja to build the templates.
```
python generate_templates.py
```  

**Option B:** Use Haxe and Neko to build the templates.
```
haxe build.hxml
neko CodeGenerator.n
```
> Both methods outputs `TeleHxMethods.hx` and `TeleHxTypes.hx` to `src/telehx` folder.