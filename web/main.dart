import 'dart:html';
import "package:CommonLib/Colours.dart";

Element falseBG1 = querySelector(".false-background1");
Element falseBG2 = querySelector(".false-background2");
Element story = querySelector("#story");

AudioElement bgMusic = new AudioElement();
AudioElement stingMusic = new AudioElement();

int yForMusicSting = 3000;
int yForMusic = 1100;
int yForBG = 400;
Colour fontColor = new Colour(0,0,0);
Colour bgColor = new Colour(255,255,255);

void main() {
    window.onScroll.listen((Event event){
        num ypos = window.scrollY; //pixels the site is scrolled down
        gradientBG(ypos);
        gradientMusic(ypos);
        musicSting(ypos);
        invertCheck(ypos);

    });
}

void invertCheck(int y) {
    double newValue = y/(3*window.outerHeight);
    if((newValue - 0.5).abs() < 0.1) {
        newValue = 0.6;
    }

    fontColor = new Colour.hsv(fontColor.hue, fontColor.saturation, newValue);
    bgColor = new Colour.hsv(fontColor.hue, fontColor.saturation, 1-newValue);
    story.style.color =fontColor.toStyleString();
    story.style.backgroundColor = bgColor.toStyleString();
}

void gradientBG(int y) {
    if(y > yForBG) {
        falseBG2.style.backgroundImage = "url(images/black-and-white-dark-marble-908283.jpg";
    }
    double opacity = y/(3*window.outerHeight);
    falseBG2.style.opacity = "${opacity}";
}

void gradientMusic(int y) {
    if(y > yForMusic && bgMusic.paused) {
        playMusic("Noirsong_Distorted");
    }else if(y < yForMusic) {
        bgMusic.pause();
    }
    bgMusic.volume = y/400000.0;
}

void musicSting(int y) {
    if(y > yForMusicSting && stingMusic.paused) {
        playSting("Noirsong_Distorted");
    }else if(y < yForMusic) {
        stingMusic.pause();
    }
}




void playMusic(String locationWithoutExtension) {
    print("starting music $locationWithoutExtension");
    bgMusic.loop  = true;
    if(bgMusic.canPlayType("audio/mpeg").isNotEmpty) bgMusic.src = "Music/${locationWithoutExtension}.mp3";
    if(bgMusic.canPlayType("audio/ogg").isNotEmpty) bgMusic.src = "Music/${locationWithoutExtension}.ogg";
    bgMusic.play();
}

void playSting(String locationWithoutExtension) {
    print("starting sting $locationWithoutExtension");
    stingMusic.loop  = true;
    if(stingMusic.canPlayType("audio/mpeg").isNotEmpty) stingMusic.src = "Music/${locationWithoutExtension}.mp3";
    if(stingMusic.canPlayType("audio/ogg").isNotEmpty) stingMusic.src = "Music/${locationWithoutExtension}.ogg";
    stingMusic.play();
}