class Timer {
    PFont font;
    int time;
    int interval;
    int startTime;
    int currentTime;

    Timer(int countdown) {
        interval = countdown;
        textSize(100);
        font = createFont("Waree", 24);
        textFont(font);
        fill(0);
        startTime = millis();
    }

    void run() {
        currentTime = millis();
        time = round((currentTime - startTime) / 1000);
        if (interval - time > 0) {
            text(nf(interval - time, 2), 270, 60);
        }
    }
    
    void stop() {
        // still keeps track of time to make sure a few seconds have passed
        // before screen switches back to the main menu
        currentTime = millis();
        time = round((currentTime - startTime) / 1000);
        text("00", width / 2, 100);        
        font = loadFont("ShowcardGothic-Reg-48.vlw");
        textFont(font);
        textSize(100);
        fill(#2EB73D);
        text("GAME OVER", width / 2, height / 2);
    }
    
    void reset() {
        startTime = millis();
    }
}