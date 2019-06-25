using Sockets;
using HTTP;
using JSON;
using JSON2;

mutable struct Animal
  id::Int64
  type::String
  name::String
end

const ANIMALS = Dict{Int64, Animal}();
const NEXT_ID = Ref(0);

function getNextId()
  id = NEXT_ID[];
  NEXT_ID[] += 1;
  return id;
end

function createAnimal(req::HTTP.Request)
  animal = JSON2.read(IOBuffer(HTTP.payload(req)), Animal);
  animal.id = getNextId()
  ANIMALS[animal.id] = animal;
  return HTTP.Response(200, JSON2.write(animal))
end

ANIMAL_ROUTER = HTTP.Router()
HTTP.@register(ANIMAL_ROUTER, "POST", "/api/zoo/v1/animals", createAnimal);

HTTP.serve(ANIMAL_ROUTER, Sockets.localhost, 8081)

# HTTP.serve(; stream=true) do http::HTTP.Stream
  # @show http.message
  # @show HTTP.header(http, "Content-Type")
  # while !eof(http)
  #     println("body data: ", String(readavailable(http)))
  # end
  # HTTP.setstatus(http, 404)
  # HTTP.setheader(http, "Foo-Header" => "bar")
  # startwrite(http)
  # write(http, "response body")
  # write(http, "more response body")
#   return
# end