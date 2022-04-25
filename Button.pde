//REQ: create a Button class here with the specs mentioned in the assignment document.
class Button implements Pressable{
    float x,y,w,h;
    String caption;
    color fillcolor;

    Button(){
        x=0;
        y=0;
        w=100;
        h=20;
        caption="Button";
        fillcolor=color(255);
    }
    
    Button(float x, float y, float w, float h, String caption, color fillcolor){
        this.x=x;
        this.y=y;
        this.w=w;
        this.h=h;
        this.caption=caption;
        this.fillcolor=fillcolor;
    }
    void display(){
        fill(fillcolor);
        stroke(255);
        strokeWeight(1);
        rectMode(CENTER);
        textAlign(CENTER,CENTER);
        textSize(h/2);  //hight/2
        rect(x,y,w,h);
        fill(255);
        text(caption,x,y);
    }

    boolean mouseOver(){
        if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
            return true;
        }
        return false;
    }
}
