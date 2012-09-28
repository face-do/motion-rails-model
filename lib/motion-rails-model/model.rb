module RM
  class Model
    attr_accessor :id
    @@url = ""
    @@username = ""
    @@password = ""

    def initialize(json={})
      attributes_update(json)
    end

    def self.find(id, &block)
      x = self.new
      x.fetch("#{x.class.to_s.downcase}/#{id}") do |y|
        block.call(y)
      end
    end

    def self.all(&block)
      x = self.new
      x.fetch("#{x.class.to_s.downcase}") do |y|
        block.call(y)
      end
    end

    def save(url="#{self.class.to_s.downcase}#{('/' + self.id.to_s) if self.id}", &block)
      type = (self.id.nil?)? "post": "put"
      data = {"_method" => type}
      keys = {}
      self.instance_variables.map do |x|
        y = x.to_s.sub(/@/, "")
        z = self.send(y)
        keys.merge!({ y => z}) unless z.nil?
     end
      data.merge!(self.class.to_s.downcase => keys)
      connect(url, data, type) do |result|
        block.call(result)
      end
    end

    def destory(url="#{self.class.to_s.downcase}/#{self.id}", &block)
      data = { credentials: {username: @@username, password: @@password}}
      connect(url, data, :delete) do |result|
        block.call(result)
      end
    end

    def self.set_url(url)
      @@url = url
    end

    def self.set_username(username)
      @@username = username
    end
    
    def self.set_password(password)
      @@password = password
    end

    def fetch(url="#{self.class.to_s.downcase}/#{self.id}", &block)
      data = { credentials: {username: @@username, password: @@password}}
      connect(url, data, :get) do |result|
        block.call(result)
      end
    end

    private

    def attributes_update(json)
      @id = json['id']
    end

    def connect(url, data, http_verb, &block)
      BW::HTTP.send(http_verb, "#{@@url}#{url}", data) do |response|
        if response.ok?
          if response.body.nil?
            block.call(response.status_code)
          else
            json = BW::JSON.parse(response.body.to_str)
            if json.instance_of?(Array)
              block.call(json.map {|y| self.class.new(y) })
            else
              block.call(self.class.new(json))
            end
          end
        else
          block.call(nil)
        end
      end
    end

  end
end