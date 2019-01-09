import 'dart:html';

Element falseBG = querySelector("#false-background");
AudioElement bgMusic = new AudioElement();
AudioElement stingMusic = new AudioElement();

int yForMusicSting = 2900;
int yForMusic = 1000;
int yForBG = 300;
void main() {
    window.onScroll.listen((Event event){
        num ypos = window.scrollY; //pixels the site is scrolled down
        gradientBG(ypos);
        gradientMusic(ypos);
        musicSting(ypos);

    });
}

void gradientBG(int y) {

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