use Rack::Static, :urls => [""], :root => 'public', :index =>
'encryption.html'

# use Rack::Static,
#   :urls => ["/images", "/js", "/css", "/apis" => "public/all_about_apis.html"],
#   :root => "public"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/encryption.html', File::RDONLY)
  ]
}
