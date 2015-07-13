class AmazonAPI
  # include HTTParty

  Key = Figaro.env.aws_access_key
  Secret = Figaro.env.aws_secret_key
  Tag = Figaro.env.aws_associate_tag

  def book_lookup author, title
    request = Vacuum.new
    request.configure(
      aws_access_key_id: Key,
      aws_secret_access_key: Secret,
      associate_tag: Tag
    )
    response = request.item_search(
      query: {
        "SearchIndex" => "Books",
        "Author" => author,
        "Title" => title,
        "ResponseGroup" => "Medium, Reviews"
      }
      )
    display_results response
  end

  def display_results response
    full_results_obj = response.to_h
    @books = full_results_obj["ItemSearchResponse"]["Items"]["Item"]
  end
end