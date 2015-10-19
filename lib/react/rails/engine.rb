module React
  module Rails
    class Engine < ::Rails::Engine
      initializer "react_rails.setup_engine", :group => :all do |app|
        sprockets_env = app.assets || Sprockets # Sprockets 3.x expects this in a different place
        sprockets_env.register_mime_type 'text/jsx', extensions: ['.jsx']
        sprockets_env.register_transformer 'text/jsx', 'application/jsx', React::JSX::Processor
      end
    end
  end
end
