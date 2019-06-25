using Poptart.Desktop # Application Windows put!
using Poptart.Controls # Button Label Slider didClick
using MyButtons

window1 = Windows.Window(title="Results", frame=(x=10,y=20,width=400,height=100))
window2 = Windows.Window(title="Current operation", frame=(x=10,y=130,width=400,height=50))
app = Application(
  windows=[window1, window2, win],
  title="App",
  frame=(width=420,height=190),
  closenotify=closenotify
)


# button = Button(title="Hello", frame=(width=80, height=30))
# put!(window1, button)

# label = Label(text="Range:")
# slider1 = Slider(range=1:10, value=Ref{Cint}(5))
# slider2 = Slider(range=1.0:10.0, value=Ref{Cfloat}(2.0))
# put!(window2, label, slider1, slider2)

# didClick(button) do event
#     @info :didClick event
# end

# didClick(slider1) do event
#     @info :didClick (event, slider1.value[])
# end