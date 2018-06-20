/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk > http://stanlepunk.xyz/
ROPE core
v 0.1.0
2017-2018
* @author Stan le Punk
* @see https://github.com/StanLepunK/Rope
*/
import java.util.Arrays;
import java.util.Iterator;
import java.util.Random;

import java.awt.image.BufferedImage;

import java.awt.Color;
import java.awt.Font; 
import java.awt.image.BufferedImage ;
import java.awt.FontMetrics;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;
import javax.imageio.IIOImage;
import javax.imageio.ImageWriter;
import javax.imageio.ImageWriteParam;
import javax.imageio.metadata.IIOMetadata;

import java.lang.reflect.Field;

import java.awt.Graphics;
import java.awt.GraphicsEnvironment;
import java.awt.GraphicsDevice;
import java.awt.Rectangle;





ROPE r ;
/**
Something weird, now it's not necessary to use the method init_rope()
to use the interface Rope_constants...
that's cool but that's very weird !!!!!
*/
public void init_rope() {
	r = new ROPE() ;
	println("Init ROPE: Romanesco Processing Environment - 2015-2018");
}

public class ROPE implements Rope_Constants {
	//need to give an access to the Rope_Constants
}












/**
event
*/
Vec2 scroll_event;
public void scroll(MouseEvent e) {
	float scroll_x = e.getCount();
	float scroll_y = e.getCount();
	if(scroll_event == null) {
		scroll_event = Vec2(scroll_x,scroll_y);
	} else {
		scroll_event.set(scroll_x,scroll_y);
	}
}

public Vec2 get_scroll() {
	if(scroll_event == null) {
		printErrTempo(120,"method get_scroll(): put method scroll(MouseEvent e) in void mouseWheel(MouseEvent e) in the main sketch tab\bor maybe there has been yet no activty with your wheel");
		return null;
	} else {
		return scroll_event;
	}
}

/**
add for the future
void mouseWheelMoved(MouseWheelEvent e) {
  println(e.getWheelRotation());
  println(e.getScrollType());
  println(MouseWheelEvent.WHEEL_UNIT_SCROLL);
  println(e.getScrollAmount());
  println(e.getUnitsToScroll());
}
*/


