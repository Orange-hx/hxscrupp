# hxscrupp

Haxe externs for [Scrupp](http://scrupp.sourceforge.net) game engine!

### Usage

1. Grab Scrupp from [here](http://scrupp.sourceforge.net/download.html)
2. Use `haxelib install hxscrupp` to install the externs!
3. In your Haxe code import externs via `import hxscrupp.Scrupp;`
4. In your HXML targeting Lua define the main class and `-D lua_vanilla` and add library via `-L hxscrupp`
5. Build in directory and make sure output to be `main.slua` in that directory, Then `scrupp <slua-file>`

### Example

```haxe
package;
import hxscrupp.Scrupp;

class Main {
    public static function main() {
        Scrupp.init("Scrupp", 640, 480, 32, false);
        function render_func(dt: Float) {
          trace(dt);
        }
        
        untyped __lua__("
          main = {
            render = render_func
          }
        ");
    }
}

```

### Changes

1. `scrupp` changed to `Scrupp` to comply with Haxe.
2. For callbacks you need to use some lines of `untyped __lua__` stuff to assign callbacks (Haxe functions) into Scrupp's main table.

### License

```
This is free and unencumbered software released into the public domain.
Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
```
