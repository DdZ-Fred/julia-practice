using Genie
import Genie.Router: route
import Genie.Renderer: json!

Genie.config.run_as_server = true

struct CustomMessage
  fname:: String
  lname:: String
end

route("/") do
  (:message => CustomMessage("Frederic","Rey")) |> json!
end

Genie.startup()