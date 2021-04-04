class Sentence
  attr_reader :side1, :side2

  def initialize(arg)
    @side1 = arg.fetch(:side1)
    @side2 = arg.fetch(:side2)
  end

  def create
    post(side1, side2)
  end

  private

  def post(front, back)
    uri = URI('http://localhost:8765')
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json; charset=utf-8')

    req.body = {
      "action" => "addNote",
      "version" => 6,
      "params" => {
        "note" => {
          "deckName" => "自動詞・他動詞",
          "modelName" => "Basic (and reversed card)",
          "fields" => {
            "Front" => front,
            "Back" => back
          },
          "options" => { "allowDuplicate" => false },
          "tags" => ["ruby"]
        }
      }
    }.to_json

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    res
  end
end
