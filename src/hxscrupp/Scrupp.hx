package hxscrupp;

import haxe.extern.EitherType;
import haxe.extern.Rest;
import haxe.Constraints.Function;

typedef ScruppMain = {
    var ?render: Float->Void;
    var ?resized: Int->Int->Void;
    var ?keypressed: String->Void;
    var ?keyreleased: String->Void;
    var ?mousepressed: Float->Float->String->Void;
    var ?mousereleased: Float->Float->String->Void;
};


@:native("_G")
extern class Global {
    public function new();
    public static function require(modname: String): Dynamic;
    public static function dofile(modname: String): Dynamic;
}

@:multiReturn
extern class ScruppSize {
    var width: Int;
    var height: Int;
}

@:multiReturn
extern class ImageColor {
    var r: Int;
    var g: Int;
    var b: Int;
}

@:multiReturn
extern class ScruppPos {
    var x: Float;
    var y: Float;
}

@:multiReturn
extern class ScruppRect {
    var x: Float;
    var y: Float;
    var w: Int;
    var h: Int;
}

typedef RectTable = {
    var x: Float;
    var y: Float;
    var ?centerX: Float;
    var ?centerY: Float;
    var ?scaleX: Float;
    var ?scaleY: Float;
    var ?rotate: Int;
    var ?rect: Array<Float>;
    var ?color: Array<Int>;
};

extern class ScruppImage {
    public function new();
    public function getWidth(): Int;
    public function getHeight(): Int;
    public function getSize(): ScruppSize;
    public function isTransparent(x: Float, y: Float): Bool;
    public function setAlpha(alpha: Int): Void;
    public function getAlpha(): Int;
    public function setColor(r: Int, g: Int, b: Int): Void;
    public function getColor(): ImageColor;
    public function clearColor(): Void;
    public function setCenterX(cx: Float): Void;
    public function setCenterY(cx: Float): Void;
    public function setCenter(cx: Float, cy: Float): Void;
    public function getCenterX(): Float;
    public function getCenterY(): Float;
    public function getCenter(): ScruppPos;
    public function setScaleX(sx: Float): Void;
    public function setScaleY(sy: Float): Void;
    public function setScale(sx: Float, sy: Float): Void;
    public function getScaleX(): Float;
    public function getScaleY(): Float;
    public function getScale(): ScruppPos;
    public function setRotation(degrees: Int): Void;
    public function getRotation(): Int;
    public function setRect(x: Float, y: Float, w: Float, w: Float): Void;
    public function getRect(): ScruppRect;
    public function clearRect(): Void;
    public function render(?x_or_table: EitherType<Float, RectTable>, ?y: Float): Void;
}

typedef ScruppFontInfo = {
    var text: String;
    var ?color: Array<Int>;
};

extern class ScruppFont {
    public function new();
    public function getTextSize(text: String): ScruppSize;
    public function getHeight(): Float;
    public function getLineSkip(): Float;
    public function generateImage(?text_or_table: EitherType<String, ScruppFontInfo>, ?color: Array<Int>): ScruppImage;
}

extern class ScruppSound {
    public function new();
    public function setVolume(volume: Int): Void;
    public function getVolume(): Int;
    public function play(?loops: Int = 1): Void;
    public function pause(): Void;
    public function resume(): Void;
    public function stop(): Void;
    public function isPlaying(): Bool;
    public function isPaused(): Bool;
}

extern class ScruppMusic {
    public function new();
    public function play(?loops: Int = 0, ?fade_in_time: Int = 0): Void;
}

typedef ScruppMovieInfo = {
    var hasAudio: Bool;
    var hasVideo: Bool;
    var currentFrame: Int;
    var currentFPS: Float;
    var audioString: String;
    var currentAudioFrame: Int;
    var currentOffset: Int;
    var totalSize: Int;
    var currentTime: Float;
    var totalTime: Float;
}

extern class ScruppMovie {
    public function new();
    public function play(?loop: Bool): Void;
    public function pause(): Void;
    public function resume(): Void;
    public function rewind(): Void;
    public function stop(): Void;
    public function getWidth(): Int;
    public function getHeight(): Int;
    public function getSize(): ScruppSize;
    public function getInfo(): ScruppMovieInfo;
    public function isPlaying(): Bool;
    public function setAlpha(alpha: Int): Void;
    public function getAlpha(): Int;
    public function loadFirstFrame(): Void;
    public function render(?x_or_table: EitherType<Float, RectTable>, ?y: Float): Void;
    public function remove(): Void;
}

// Mouse buttons: http://scrupp.sourceforge.net/manuals/0.4/manual.html#mouse
// Keyboard keys: http://scrupp.sourceforge.net/manuals/0.4/manual.html#keyboard

@:native("Animation")
extern class Animation {
    public function new() {
        return untyped __lua__("Animation()");
    }
    public function addFrame(image: EitherType<String, ScruppImage>, x: Float, y: Float, width: Int, height: Int, delay: Int): Void;
    public function addFrames(image: EitherType<String, ScruppImage>, sizex: Float, sizey: Float, width: Int, height: Int, sep: Int, delay: Int): Void;
    public function getWidth(): Int;
    public function getHeight(): Int;
    public function getSize(): ScruppSize;
    public function isTransparent(x: Float, y: Float): Bool;
    public function copy(): Animation;
    public function stop(): Void;
    public function render(x: Float, y: Float, delta: Float): Void;
}

@:native("color")
extern class Color {
    public function new();
    extern public static var white(default, null): Dynamic;
    extern public static var black(default, null): Dynamic;
    extern public static var gray(default, null): Dynamic;
    extern public static var silver(default, null): Dynamic;
    extern public static var maroon(default, null): Dynamic;
    extern public static var red(default, null): Dynamic;
    extern public static var green(default, null): Dynamic;
    extern public static var lime(default, null): Dynamic;
    extern public static var olive(default, null): Dynamic;
    extern public static var yellow(default, null): Dynamic;
    extern public static var navy(default, null): Dynamic;
    extern public static var blue(default, null): Dynamic;
    extern public static var purple(default, null): Dynamic;
    extern public static var fuchsia(default, null): Dynamic;
    extern public static var teal(default, null): Dynamic;
    extern public static var aqua(default, null): Dynamic;
}

@:native("Font")
extern class Font {
    public function new(filename: String, size: Float);
    public function getTextSize(text: String): Float;
    public function getHeight(): Float;
    public function getLineSkip(): Float;
    public function generateImage(?text_or_table: EitherType<String, Dynamic>): ScruppImage;
    public function setColor(color: Array<Int>): Void;
    public function cache(?str: String): Void;
    public function print(x: Float, y: Float, args: Rest<Dynamic>): Void;
}

@:native("Timer")
extern class Timer {
    public function new(duration: Int, callback: haxe.Constraints.Function);
    public function start(): Void;
    public function stop(): Void;
    public function reset(): Void;
    public function update(): Void;
}

@:native("scrupp")
extern class Scrupp {
    public function new();
    extern public static var VERSION(default, null): String;
    extern public static var PLATFORM(default, null): String;

    @:luaDotMethod public static function getSearchPath(): Array<String>;
    @:luaDotMethod public static function setSearchPath(array: Array<String>): Void;
    @:luaDotMethod public static function fileExists(filename: String): Bool;
    @:luaDotMethod public static function isDirectory(path: String): Bool;
    @:luaDotMethod public static function isSymbolicLink(filename: String): Bool;

    @:luaDotMethod public static function init(title: String, width: Int, height: Int, bit_depth: Int, fullscreen: Bool, ?resizable: Bool): Void;
    @:luaDotMethod public static function getWindowWidth(): Int;
    @:luaDotMethod public static function getWindowHeight(): Int;
    @:luaDotMethod public static function getWindowSize(): ScruppSize;
    @:luaDotMethod public static function getTicks(): Int;
    @:luaDotMethod public static function setDelta(delta: Float): Void;
    @:luaDotMethod public static function showCursor(?show: Bool): Bool;
    @:luaDotMethod public static function exit(): Void;

    @:luaDotMethod public static function translateView(x: Float, y: Float): Void;
    @:luaDotMethod public static function scaleView(sx: Float, sy: Float): Void;
    @:luaDotMethod public static function rotateView(degrees: Int): Void;
    @:luaDotMethod public static function saveView(): Void;
    @:luaDotMethod public static function restoreView(): Void;
    @:luaDotMethod public static function resetView(): Void;

    @:luaDotMethod public static function draw(table: Dynamic): Void;
    
    @:luaDotMethod public static function addImage(filename: String): ScruppImage;
    @:luaDotMethod public static function addImageFromString(str: String): ScruppImage;
    @:luaDotMethod public static function addImageFromCairo(surface: Dynamic): ScruppImage;
    @:luaDotMethod public static function addFont(filename: String, size: Int): ScruppFont;
    @:luaDotMethod public static function addSound(filename: String): ScruppSound;

    @:luaDotMethod public static function addMusic(filename: String): ScruppMusic;
    @:luaDotMethod public static function setMusicVolume(volume: Int): Void;
    @:luaDotMethod public static function getMusicVolume(): Int;
    @:luaDotMethod public static function pauseMusic(): Void;
    @:luaDotMethod public static function resumeMusic(): Void;
    @:luaDotMethod public static function stopMusic(?fade_out_time: Int = 0): Void;
    @:luaDotMethod public static function rewindMusic(): Void;
    @:luaDotMethod public static function musicIsPlaying(): Bool;
    @:luaDotMethod public static function musicIsPaused(): Bool;

    @:luaDotMethod public static function addMovie(filename: String): ScruppMovie;

    @:luaDotMethod public static function getMouseX(): Float;
    @:luaDotMethod public static function getMouseY(): Float;
    @:luaDotMethod public static function getMousePos(): ScruppPos;
    @:luaDotMethod public static function mouseButtonIsDown(button: String): Bool;
    @:luaDotMethod public static function keyIsDown(key: String): Bool;

    // For networking, Use sys.net.Socket or sys.ssl.Socket
    // Shall we write OOCairo externs?
}
