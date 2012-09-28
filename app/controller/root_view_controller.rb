class RootViewController < UIViewController

  def viewDidLoad
    super
      Entries.all do |result|
        if result
          p result
        else
          p "error"
        end
      end
  end

end
