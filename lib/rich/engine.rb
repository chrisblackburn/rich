require 'paperclip'
require 'rack/raw_upload'
    
module Rich
  class Engine < Rails::Engine
    isolate_namespace Rich

    initializer "rich.add_middleware" do |app|
      app.config.assets.precompile += %w(rich/base.js rich/editor.css rich/rich_editor.css)
      app.middleware.use 'Rack::RawUpload', :paths => ['/rich/files']
    end
    
  end
end
