# redirects homepage to /my/home

module WelcomeControllerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      before_filter :forward_to_startpage, :only => :index
    end
  end

  module InstanceMethods
    def forward_to_startpage
      redirect_to( :controller => "wiki", :action => "show", :project_id => "redmine")
    end
  end
end

# Add module to Welcome Controller
WelcomeController.send(:include, WelcomeControllerPatch)
