module MyButtons

using Poptart.Desktop # Application Windows put!
using Poptart.Controls # Button Label Slider didClick

export win;

win = Windows.Window(
  frame=(x=10, y=190, width=400, height=50)
);

button7 = Button(title="7", frame=(width=30, height=25));
button8 = Button(title="8", frame=(width=30, height=25));
put!(win, button7);

end