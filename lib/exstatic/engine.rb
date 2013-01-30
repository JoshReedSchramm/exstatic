module Exstatic
  class Engine < ::Rails::Engine
    isolate_namespace Exstatic 

    config.exstatic = Exstatic
  end
end
