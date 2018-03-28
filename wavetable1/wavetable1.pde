//wavetable
float[] sine = new float [256];
float[] triangle = new float [256];
float[] ramp = new float [256];
float[] square = new float [256];

int sampleLength = 256;
int amp = 64;
int index;

void setup() {
  //sine wave
  for (int i =0; i<sampleLength; i++) {
    sine[i]=sin(2*PI/sampleLength*i)*amp;
  }
  //triangle wave
  for (int i =0; i<sampleLength; i++) {
    if (i<sampleLength/4) {
      triangle[i]=i*(amp/(sampleLength/4));
    }
    if (sampleLength/4 <= i && i <3*sampleLength/4) {
      triangle[i]=amp+(i-sampleLength/4)*(-amp/(sampleLength/4));
    }
    if (3 * sampleLength/4 <= i) {
      triangle[i]=-amp+(i-3*sampleLength/4)*(amp/(sampleLength/4));
    }
  }
  //ramp wave
  for (int i =0; i<sampleLength; i++) {
    if (i<sampleLength/2) {
      ramp[i]=-amp+i*2*amp/(sampleLength/2);
    }
    if (sampleLength/2 <= i) {
      ramp[i]=-amp+(i-sampleLength/2)*2*amp/(sampleLength/2);
    }
  }
  //square wave
  for (int i =0; i<sampleLength; i++) {
    if (i<sampleLength/2) {
      square[i]=amp;
    }
    if (sampleLength/2<=i) {
      square[i]=-amp;
    }
  }
  size(256, 600);
}

void draw() {
  background(0);
  stroke(255,0,0);
  strokeWeight(5);
  for(int index=0;index<256;index++){
  point(index,amp - sine[index]);
  point(index,10+3*amp - triangle[index]);
  point(index,20+5*amp - ramp[index]);
  point(index,30+7*amp - square[index]);
  }
}
