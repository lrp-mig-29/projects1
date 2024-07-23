

const int LED = 9;
const int BUTTON = 2;
int buttonPushCounter = 0;
int pressed = 0;
boolean buttonState = 0;
boolean lastButtonState = 0;
unsigned long startMillis ;
unsigned long currentMillis;
const unsigned long period = 1000;
boolean detectedButtonStatus = false;

unsigned long detectedButtonChanged = 0;

void setup() {

  Serial.begin(9600);
  pinMode(LED, OUTPUT);
  pinMode(BUTTON, INPUT);
  startMillis = millis();


}

void loop() {
  currentMillis = millis();

  buttonState = digitalRead(BUTTON);

  if (buttonState != lastButtonState && 
      millis() - detectedButtonChanged >= 50) {
    detectedButtonChanged = millis();

    
    lastButtonState = buttonState;
  }

  /*
  if (digitalRead(BUTTON) == HIGH )
  {
    pressed++;
    if (pressed >= 50)
    {
      pressed = 50;
      buttonState = true;  
    }
  }
  else if (digitalRead(BUTTON) == LOW )
  {
    pressed--;
    if (pressed <= 0)
    {
      pressed = 0;
      buttonState = false;
    }
  }

  if (buttonState != lastButtonState) {
    if (buttonState == HIGH) {
      buttonPushCounter++;
    }
    lastButtonState = buttonState;
  }
  */

  if (currentMillis - startMillis >= period) {
    Serial.print("\nNumber of button pushes: ");
    Serial.println(buttonPushCounter);
    startMillis = currentMillis;
    buttonPushCounter = 0;
  }
}
