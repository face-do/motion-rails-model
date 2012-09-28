class RootViewController < UIViewController

  def viewDidLoad
    super
    begin
      Entries.all do |result|
        p result
      end
    rescue => e
      Alert(e)
    end
  end

end
