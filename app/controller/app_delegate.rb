class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    RM::Model.set_url("http://localhost:3000/")
    RM::Model.set_username("username")
    RM::Model.set_password("password")

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = RootViewController.alloc.init
    @window.makeKeyAndVisible
    true
  end
end
