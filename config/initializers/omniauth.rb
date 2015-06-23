OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, '872565055611-f2bpvupp9kc0r8k9iutrkqtj1djuvmd0.apps.googleusercontent.com', 'H48BaGcz-zEB_UfAY7prZpQV', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
    provider :facebook, '1605250336394178','4f52b06ee45d6b6e9b6eedda812a45e8'
end
