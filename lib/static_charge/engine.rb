module StaticCharge
  class Engine < ::Rails::Engine
    isolate_namespace StaticCharge 

    config.static_charge = StaticCharge
  end
end
